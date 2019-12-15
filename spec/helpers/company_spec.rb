# frozen_string_literal: true

require 'helpers/company'

RSpec.describe LifePreserver::Helpers::Company, helper: true do
  let(:company_attrs) { { kind: 'organization' } }

  before do
    ctx.create_item('', company_attrs, '/biz/orgs/company-one')

    ctx.config[:company_root] = '/biz'
    ctx.config[:orgs_root] = '/orgs'
    ctx.config[:people_root] = '/peeps'
    ctx.config[:site] = { name: 'Company One' }
  end

  describe '#company' do
    subject(:company) { helper.company }

    context 'with proper config set' do
      it 'is not nil' do
        expect(company).not_to be_nil
      end

      it 'returns a company attributes' do
        expect(company[:kind]).to eql('organization')
      end
    end
  end

  describe '#path_to_logo' do
    subject(:logo) { helper.path_to_logo(absolute: absolute) }

    let(:absolute) { false }

    before do
      ctx.config[:base_url] = 'https://example.site'
      ctx.config[:images_root] = '/images'

      logo_content = Nanoc::Core::Content.create('/one/some_dir/company-logo.png', binary: true)
      ctx.create_item(logo_content, {}, '/images/company-one-logo.png')
      ctx.create_rep(ctx.items['/images/company-one-logo.png'], '/img/company_1.png')
    end

    context 'with property config set' do
      it 'returns the path to the logo item' do
        expect(logo).to eql('/img/company_1.png')
      end
    end

    context 'with absolute flag set' do
      let(:absolute) { true }

      it 'returns the absolute path to the logo item' do
        expect(logo).to eql('https://example.site/img/company_1.png')
      end
    end
  end

  describe '#path_to_logotype' do
    subject(:logotype) { helper.path_to_logotype(absolute: absolute) }

    let(:absolute) { false }

    before do
      ctx.config[:base_url] = 'https://example.site'
      ctx.config[:images_root] = '/images'

      ctx.create_item('', {}, '/images/company-one-logotype.png')
      ctx.create_rep(ctx.items['/images/company-one-logotype.png'], '/img/company_1_wide.png')
    end

    context 'with property config set' do
      it 'returns the path to the logo item' do
        expect(logotype).to eql('/img/company_1_wide.png')
      end
    end

    context 'with absolute flag set' do
      let(:absolute) { true }

      it 'returns the absolute path to the logo item' do
        expect(logotype).to eql('https://example.site/img/company_1_wide.png')
      end
    end
  end

  describe '#members' do
    subject(:members) { helper.members }

    let(:member_attrs) { { kind: 'member' } }

    before do
      ctx.create_item('', member_attrs, '/biz/peeps/member-1')
      ctx.create_item('', member_attrs, '/biz/peeps/member-2')
      ctx.create_item('', member_attrs, '/biz/peeps/member-3')
    end

    context 'with three members' do
      it 'returns all members' do
        expect(members.length).to be(3)
      end
    end
  end

  describe '#sorted_members' do
    subject(:members) { helper.sorted_members }

    let(:name1) { { givenname: 'Zelf', sn: 'Zwickau' } }
    let(:name2) { { givenname: 'Hubert', sn: 'Bean' } }
    let(:name3) { { givenname: 'Alfonso', sn: 'Bechus' } }

    before do
      ctx.create_item('', name1, '/biz/peeps/member-1')
      ctx.create_item('', name2, '/biz/peeps/member-2')
      ctx.create_item('', name3, '/biz/peeps/member-3')
    end

    context 'with three members' do
      it 'returns members sorted' do
        expect(members).to contain_exactly(ctx.items['/biz/peeps/member-3'],
                                           ctx.items['/biz/peeps/member-1'],
                                           ctx.items['/biz/peeps/member-2'])
      end
    end
  end

  describe '#service_profile' do
    subject(:service_profile) { helper.service_profile(profile_class, item) }

    let(:profile_class) { 'service' }
    let(:company_attrs) do
      {
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
    end

    context 'with company item' do
      let(:item) { ctx.items['/biz/orgs/company-one'] }

      it 'finds the company item' do
        expect(item).not_to be_nil
      end

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
      let(:item) { ctx.items['/biz/peeps/member-1'] }
      let(:member_attrs) do
        {
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
      end

      before do
        ctx.create_item('', member_attrs, '/biz/peeps/member-1')
      end

      it 'finds the service profile' do
        expect(service_profile).not_to be_nil
      end

      it "finds the member's service profile" do
        expect(service_profile[:account_name]).to eql('my_account')
      end
    end
  end
end
