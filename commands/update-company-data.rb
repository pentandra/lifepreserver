#frozen_string_literal: true

usage     'update-company-data'
aliases   :ucd
summary   'Updates company data from LDAP'
description <<~DESCRIPTION
  Fetches selected company data from LDAP to be used later on as input to the
  'company' data source.

  The LDIF response is sent to STDOUT unless the the '--output' option is
  given, in which case the response will be written to file.
DESCRIPTION
option :h, :host, 'the LDAP host to connect to',
  default: 'leschetizky.id.pentandra.com', argument: :required
option :p, :port, 'the port through which to connect',
  default: '389', argument: :required, transform: Nanoc::CLI::Transform::Port
option :b, :base, 'the base of the LDAP tree for searches',
  default: 'dc=id,dc=pentandra,dc=com', argument: :required
option :u, :user,
  'the user RDN (appended to the active users and base subsequences) to bind to the LDAP server',
  default: 'uid=admin', argument: :required
option :os, :organizations,
  'the RDN subsequence (appended to the base) at which to locate organizations',
  default: 'cn=organizations', argument: :required
option :au, :active_users,
  'the RDN subsequence (appended to base) at which to locate active users',
  default: 'cn=users,cn=accounts', argument: :required
option :du, :deleted_users,
  'the RDN subsequence (appended to base) at which to locate deleted users',
  default: 'cn=deleted users,cn=accounts,cn=provisioning', argument: :required
option :m, :member,
  'the DN of the group (appended to base) that people should be a member of to be included',
  default: 'cn=employees,cn=groups,cn=accounts', argument: :required
option :o, :output, 'output LDIF into this file', argument: :required
no_params

require 'net/ldap'

class UpdateCompanyData < ::Nanoc::CLI::CommandRunner

  ORGANIZATION_FILTER = Net::LDAP::Filter.eq('objectClass', 'organization')
  ORGANIZATION_ATTRS = %w[c l postalCode st street]

  EMPLOYEE_ATTRS = %w[
    eduPersonOrcid employeeNumber employeeType generationQualifier givenName
    inetUserHttpURL initials jpegPhoto manager mobile personalTitle
    preferredLanguage preferredTimeZone sn title userCertificate
  ]

  COMMON_ATTRS = %w[
    cn createTimestamp description displayName labeledURI mail modifyTimestamp
    o ou telephoneNumber
  ]

  def run

    ldif_out = String.new(<<~LDIF_PREAMBLE)

    # Company LDAP data describing organizations and employees.
    #
    # This file is generated from the 'update-company-data' Nanoc command. Any
    # changes made to this file will be overwritten when this command is run.

    version: 1
    LDIF_PREAMBLE

    #bind_dn = options.fetch_values(:user, :active_users, :base).join(',')
    bind_dn = [options[:user], options[:active_users], options[:base]].join(',')
    auth = { method: :simple, username: bind_dn, password: prompt_password }

    employee_filter =
      Net::LDAP::Filter.eq('objectClass', 'inetOrgPerson') &
      Net::LDAP::Filter.eq('memberOf', [options[:member], options[:base]].join(','))

    ldap = Net::LDAP.new(host: options[:host],
                         port: options[:port],
                         base: options[:base],
                         auth: auth,
                         encryption: options[:port] == 636 ? :simple_tls : nil)

    $stderr.puts
    $stderr.print "Opening connection to #{options[:host]} and searching directory… "

    ldap.open do |ldap|
      ldap.search(
        #base: options.fetch_values(:organizations, :base).join(','),
        base: [options[:organizations], options[:base]].join(','),
        scope: Net::LDAP::SearchScope_SingleLevel,
        filter: ORGANIZATION_FILTER,
        attributes: COMMON_ATTRS | ORGANIZATION_ATTRS) do |entry|
        ldif_out << "\n"
        ldif_out << entry.to_ldif
      end

      ldap.search(
        #base: options.fetch_values(:active_users, :base).join(','),
        base: [options[:active_users], options[:base]].join(','),
        scope: Net::LDAP::SearchScope_SingleLevel,
        filter: employee_filter,
        attributes: COMMON_ATTRS | EMPLOYEE_ATTRS) do |entry|
        entry[:inetuserstatus] = 'active'
        ldif_out << "\n"
        ldif_out << entry.to_ldif
      end

      ldap.search(
        #base: options.fetch_values(:deleted_users, :base).join(','),
        base: [options[:deleted_users], options[:base]].join(','),
        scope: Net::LDAP::SearchScope_SingleLevel,
        filter: employee_filter,
        attributes: EMPLOYEE_ATTRS) do |entry|
        entry[:inetuserstatus] = 'deleted'
        ldif_out << "\n"
        ldif_out << entry.to_ldif
      end
    end

    $stderr.puts 'done'

    result = ldap.get_operation_result
    if result.code == Net::LDAP::ResultCodeSuccess
      if options[:output]
        $stderr.print 'Updating company data… '
        write(options[:output], ldif_out)
        $stderr.puts 'done'
      else
        $stdout.puts ldif_out
      end
    else
      $stderr.puts "Error: #{result.inspect}"
    end
  end

  protected

  def prompt_password
    require 'io/console'
    $stderr.print 'Bind Password: '
    $stdin.noecho(&:gets).chomp
  end

  def write(filename, content)
    File.write(filename, content)
    Nanoc::Core::NotificationCenter.post(:file_created, filename)
  end
end

runner UpdateCompanyData
