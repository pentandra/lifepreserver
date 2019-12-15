# frozen_string_literal: true

require 'active_support/core_ext/numeric/time'

require 'data_sources/company'

RSpec.describe LifePreserver::DataSources::Company, site: true do
  let(:data_source) { described_class.new(site.config, nil, nil, params) }
  let(:params) { {} }
  let(:site) { Nanoc::Core::SiteLoader.new.new_from_cwd }

  describe '#ldap_time' do
    subject { data_source.ldap_time(arg) }

    let(:around_dinner_time_local) { Time.local(2019, 12, 9, 18, 49, 24) }
    let(:around_dinner_time_utc) { around_dinner_time_local + around_dinner_time_local.utc_offset }

    context 'with unqualified LDAP Generalized Time string' do
      let(:arg) { '20191209184924' }

      it { is_expected.to eql(around_dinner_time_local) }
    end

    context 'with UTC LDAP Generalized Time string' do
      let(:arg) { '20191209184924Z' }

      it { is_expected.to eql(around_dinner_time_utc) }
    end

    context 'with RFC3339 time string' do
      let(:arg) { '2019-12-09T18:49:24Z' }

      it { is_expected.to eql(around_dinner_time_utc) }
    end
  end

  describe '#compose_service_profile' do
    subject(:service_profile) { data_source.compose_service_profile(labeleduri) }

    context 'with a labeledURI without a label' do
      let(:labeleduri) { 'https://service.profile/cd_chapman' }

      it 'will return nil' do
        expect(service_profile).to be_nil
      end
    end

    context 'with a labeledURI without "profile" in the label' do
      let(:labeleduri) { 'https://home.page My Home Page' }

      it 'will return nil' do
        expect(service_profile).to be_nil
      end
    end

    context 'with a labeledURI representing a service profile' do
      let(:labeleduri) { 'https://service.profile/cd_chapman Service Profile' }

      it 'has the correct class' do
        expect(service_profile[:class]).to eql('service')
      end

      it 'has the correct URI' do
        expect(service_profile[:uri]).to eql('https://service.profile/cd_chapman')
      end

      it 'has the correct service homepage' do
        expect(service_profile[:service_homepage]).to eql('https://service.profile/')
      end

      it 'has the correct account name' do
        expect(service_profile[:account_name]).to eql('cd_chapman')
      end
    end

    context 'with a labeledURI representing a CamelCase profile' do
      let(:labeleduri) { 'https://service.profile/mine CamelCase profile' }

      it 'has a snake case class' do
        expect(service_profile[:class]).to eql('camel_case')
      end
    end
  end

  describe '#extract_pkey' do
    subject(:pkey) { data_source.extract_pkey(raw_cert) }

    let(:issuer) { 'CN=WebID, O=Test Org' }
    let(:subject) { 'O=bob.company, OU=cert creation, CN=Bob (business)' }
    let(:not_valid_before) { Time.now }
    let(:not_valid_after) { not_valid_before + 2.fortnights }
    let(:key_usage) { 'digitalSignature' }
    let(:ext_key_usage) { 'clientAuth' }
    let(:san) { 'URI:https://example.site/card#id' }

    let(:raw_cert) do
      key = OpenSSL::PKey::RSA.new(2048)
      cert = OpenSSL::X509::Certificate.new
      cert.version = 2 # x.509v3
      cert.serial = 1
      cert.subject = OpenSSL::X509::Name.parse(subject)
      cert.issuer = OpenSSL::X509::Name.parse(issuer)
      cert.public_key = key
      cert.not_before = not_valid_before
      cert.not_after = not_valid_after
      ef = OpenSSL::X509::ExtensionFactory.new
      ef.subject_certificate = cert
      ef.issuer_certificate = cert
      cert.add_extension(ef.create_extension('keyUsage', key_usage, false)) if key_usage
      cert.add_extension(ef.create_extension('extendedKeyUsage', ext_key_usage, false)) if ext_key_usage
      cert.add_extension(ef.create_extension('subjectKeyIdentifier', 'hash', false))
      cert.add_extension(ef.create_extension('subjectAltName', san, true)) if san
      cert.sign(key, OpenSSL::Digest::SHA256.new)
      cert.to_s
    end

    let(:last_month) { Time.now - 4.weeks }

    before do
      site.config[:base_url] = 'https://example.site'
    end

    context 'with a valid subjectAltName WebID' do
      it 'returns a valid pkey hash' do
        expect(pkey).not_to be_nil
      end

      it 'returns the same subjectAltName' do
        expect(pkey[:id]).to eql('https://example.site/card#id')
      end
    end

    context 'with a valid subjectAltName WebID for a different site' do
      let(:san) { 'URI:https://different.site/card#id' }

      it 'returns nil' do
        expect(pkey).to be_nil
      end
    end

    context 'with no subjectAltName' do
      let(:san) { nil }

      it 'returns nil' do
        expect(pkey).to be_nil
      end
    end

    context 'with an expired certificate' do
      let(:not_valid_before) { last_month }
      let(:not_valid_after) { last_month }

      it 'returns nil' do
        expect(pkey).to be_nil
      end
    end

    context 'with multiple subjectAltNames, one valid' do
      let(:san) do
        [
          'URI:https://different.site/card#id',
          'URI:https://example.site/card#id',
          'IP:127.0.0.1',
          'DNS:one.example.site',
        ].join(',')
      end

      it 'returns a valid pkey hash' do
        expect(pkey).not_to be_nil
      end
    end

    context 'with multiple subjectAltNames, none valid' do
      let(:san) do
        [
          'URI:https://different.site/card#id',
          'email:bob@example.site',
          'IP:127.0.0.1',
          'DNS:one.example.site',
        ].join(',')
      end

      it 'returns nil' do
        expect(pkey).to be_nil
      end
    end

    xcontext 'with unspecified key usage' do
      let(:key_usage) { nil }

      it 'returns nil' do
        expect(pkey).to be_nil
      end
    end

    xcontext 'without the correct key usage' do
      let(:key_usage) { 'keyCertSign' }

      it 'returns nil' do
        expect(pkey).to be_nil
      end
    end
  end

  describe '#default_web_id' do
    subject(:web_id) { data_source.default_web_id(name) }

    before do
      site.config[:base_url] = 'https://example.site'
      data_source.config[:people_root] = '/peeps'
    end

    context 'with regular member name' do
      let(:name) { 'Chris Chapman' }

      it 'returns default WebID' do
        expect(web_id).to eql('https://example.site/peeps/chris-chapman/#me')
      end
    end

    context 'with parameterized member name' do
      let(:name) { 'chris-chapman' }

      it 'returns default WebID' do
        expect(web_id).to eql('https://example.site/peeps/chris-chapman/#me')
      end
    end

    context 'with nil name' do
      let(:name) { nil }

      it 'raises' do
        expect { web_id }.to raise_error(ArgumentError)
      end
    end

    context 'with nil base_url' do
      let(:name) { 'Sly Fox' }

      before do
        site.config[:base_url] = nil
      end

      it 'raises' do
        expect { web_id }.to raise_error(Nanoc::Error)
      end
    end
  end
end
