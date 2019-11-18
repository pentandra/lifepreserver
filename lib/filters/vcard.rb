# frozen_string_literal: true

require_relative '../helpers/link_to'
require_relative '../helpers/company'
require_relative '../helpers/text'

module LifePreserver
  module Filters
    class Vcard < Nanoc::Filter
      include LifePreserver::Helpers::LinkTo
      include LifePreserver::Helpers::Company
      include LifePreserver::Helpers::Text

      identifier :vcard

      requires 'vcardigan', 'time'

      # Create a vCard from the given metadata.
      #
      # @see https://tools.ietf.org/html/rfc6350
      #
      # @param [String] _content Ignored. All structured data is pulled from
      #   the params first and then, if not found, from the item metadata.
      # @param [Hash] params The options for the vCard.
      # @option params [String] :kind ('individual') The kind of object the
      #   vCard represents. Must be one of the following: "individual", "group",
      #   "org", "location", an x-name, or an iana-token.
      # @option params [String] :full_name  The full name of the object the
      #   vCard represents.
      # @option params [String] :givenname The first name of the object the
      #   vCard represents.
      # @option params [String] :sn The last name of the object the
      #   vCard represents.
      # @option params [String] :nick_name The nick-name of the object the
      #   vCard represents.
      # @option params [String] :gender ('U') The gender of the
      #   object the vCard represents. According to RFC6350, M stands
      #   for "male", F stands for "female", O stands for "other", N
      #   stands for "none or not applicable", U stands for "unknown".
      # @option params [String] :mail The email of the object the vCard
      #   represents.
      # @option params [String] :phone The phone number of the object
      #   the vCard represents.
      # @option params [String] :uid A globally unique identifier
      #   corresponding to the entity associated with the vCard.
      # @option params [String] :url A uniform resource locator
      #   associated with the object to which the vCard refers.
      # @option params [String] :org The organization name
      #   associated with the object to which the vCard refers.
      # @option params [String] :ou The organizational unit name
      #   associated with the object to which the vCard refers.
      # @option params [String] :title The title or position
      #   on the bus of the object to which the vCard refers.
      # @option params [String] :photo_uri The URI of a photo of
      #   the object the vCard represents.
      # @option params [String] :logo_uri The URI of an image of
      #   the logo associated with the object the vCard represents.
      # @option params [Time] :rev To specify revision information
      #   about the current vCard.
      def run(_content, params = {})
        validate params

        # Extract params
        kind = params[:kind] || @item[:kind] || 'individual'
        full_name = params[:full_name] || @item[:name]
        givenname = params[:givenname] || @item[:givenname]
        sn = params[:sn] || @item[:sn]
        nick_name = params[:nick_name] || @item[:nick_name]
        gender = params[:gender] || @item[:gender] || 'U'

        email = params[:mail] || @item[:mail]

        tel = params[:phone] || @item[:telephonenumber] || company[:telephonenumber]

        uid = params[:uid] || @item[:uid] || @item[:web_id]
        url = params[:url] || @item[:url] || @config[:base_url]

        org = params[:org] || @item[:o] || company[:o]
        ou = params[:ou] || @item[:ou]
        title = params[:title] || @item[:title]

        photo_uri = params[:photo_uri] || @item[:photo_uri]
        logo_uri = params[:logo_uri] || @item[:logo_uri] || path_to_logo(absolute: true)

        rev = params[:rev] || @item[:rev] || @item[:mtime] || Time.now

        vcard = VCardigan.create

        vcard.rev(rev.iso8601)
        vcard.kind(kind)
        vcard.source(path_to(@item_rep, absolute: true))

        vcard.fullname(full_name)

        if kind.to_s == 'individual'
          vcard.name(sn, givenname)
          vcard.gender(gender.to_s.capitalize.chr)
          vcard.org(org, ou)
          vcard.title(title)

          # Last chance property setting for individuals
          photo_uri ||= path_to(@item, rep: :photo, absolute: true)
        end

        vcard.nickname(nick_name) unless nick_name.nil?

        vcard.email(email, type: 'work') unless email.nil?

        vcard.url(url) unless url.nil?
        vcard.uid(uid) unless uid.nil?

        vcard.tel("tel:#{tel.strftel(:full_e164)}", type: 'voice,work,text', value: 'uri') unless tel.nil?

        vcard.photo(photo_uri, value: 'uri') unless photo_uri.nil?
        vcard.logo(logo_uri, value: 'uri') unless logo_uri.nil?

        vcard.to_s
      end

      private

      def validate(params)
        validate_config
        validate_required_parameters(params)
      end

      def validate_config
        if @config[:base_url].nil?
          raise Nanoc::Errors::GenericTrivial.new('Cannot build vCard: site configuration has no base_url')
        end
      end

      def validate_required_parameters(params)
        if params[:full_name].nil? && @item[:name].nil?
          raise Nanoc::Errors::GenericTrivial.new('Cannot build vCard: the full_name parameter MUST be present in either the params hash or item rep metadata')
        end
      end
    end
  end
end
