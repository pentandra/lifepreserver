# frozen_string_literal: true

require 'data_sources/company'

RSpec.describe LifePreserver::DataSources::Company, site: true do
  let(:data_source) { described_class.new(site.config, nil, nil, params) }
  let(:params) { {} }
  let(:site) { Nanoc::Core::SiteLoader.new.new_from_cwd }

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
end
