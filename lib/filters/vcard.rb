require 'vcardigan'

class VcardFilter < Nanoc::Filter

  identifier :vcard

  def run(content, params = {})

    # Check attributes
    if params[:full_name].nil?
      raise Nanoc::Errors::GenericTrivial.new('Cannot build vCard: the full_name parameter MUST be present')
    end

    # Extract params
    full_name = params[:full_name]
    kind = params[:kind] || 'individual'
    first_name = params[:first_name]
    last_name = params[:last_name]
    nick_name = params[:nick_name]
    email = params[:email]
    tel = params.key?(:extension) ? params[:phone] + ";ext=" + params[:extension] : params[:phone]
    url = params[:url]
    org = params[:org]
    photo_uri = params[:photo_uri]
    logo_uri = params[:logo_uri]

    vcard = VCardigan.create(version: '3.0')

    vcard.rev(Time.now.strftime('%F'))

    vcard.fullname(full_name)

    vcard.source(@config[:base_url] + @item_rep.path) if @config[:base_url]

    if kind == 'individual'
      vcard.name(last_name, first_name)
    end

    vcard.nickname nick_name unless nick_name.nil?

    vcard.email(email, type: 'work') unless email.nil?

    vcard.org(org) unless org.nil?
    vcard.url(url) unless url.nil?

    vcard.tel(tel, type: 'voice,work,msg') unless tel.nil?

    vcard.photo(photo_uri, value: 'uri') unless photo_uri.nil?

    vcard.logo(logo_uri, value: 'uri') unless logo_uri.nil?

    vcard.to_s
  end

end
