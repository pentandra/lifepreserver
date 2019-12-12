# frozen_string_literal: true

require 'helpers/company'

RSpec.describe LifePreserver::Helpers::Company, helper: true do
  describe '#service_profile' do
    subject(:service_profile) { helper.service_profile(profile_class, item) }

    let(:profile_class) { 'service' }

    before do
      company_attrs = {
        kind: 'organization',
        service_profiles: [
          {
            uri: 'https://service.profile/company_account',
            account_name: 'company_account',
            service_homepage: 'https://service.profile/',
            class: 'service',
          },
        ],
      }

      member_attrs = {
        kind: 'member',
        service_profiles: [
          {
            uri: 'https://service.profile/my_account',
            account_name: 'my_account',
            service_homepage: 'https://service.profile/',
            class: 'service',
          },
        ],
      }

      ctx.create_item('', company_attrs, '/biz/orgs/pentandra')
      ctx.create_item('', member_attrs, '/biz/peeps/member-one')

      ctx.config[:company_root] = '/biz'
      ctx.config[:orgs_root] = '/orgs'
      ctx.config[:people_root] = '/peeps'
    end

    context 'with company item' do
      let(:item) { ctx.items['/biz/orgs/company'] }

      it 'finds the service profile' do
        expect(service_profile).not_to be_nil
      end

      it "finds the company's service profile" do
        expect(service_profile[:account_name]).to eql('company_account')
      end
    end

    context 'with nil item' do
      let(:item) { nil }

      it 'finds a service profile' do
        expect(service_profile).not_to be_nil
      end

      it "finds the company's service profile" do
        expect(service_profile[:account_name]).to eql('company_account')
      end
    end

    context 'with member item' do
      let(:item) { ctx.items['/biz/peeps/member-one'] }

      it 'finds the service profile' do
        expect(service_profile).not_to be_nil
      end

      it "finds the member's service profile" do
        expect(service_profile[:account_name]).to eql('my_account')
      end
    end
  end
end
