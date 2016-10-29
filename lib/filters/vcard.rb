class VcardFilter < Nanoc::Filter

  identifier :vcard

  requires 'vcardigan'

  def run(content, params = {})

    validate params

    # Extract params
    full_name = params[:full_name] || @item[:full_name] || "#{@item[:first_name]} #{@item[:last_name]}"
    kind = params[:kind] || @item[:kind] || 'individual'
    first_name = params[:first_name] || @item[:first_name]
    last_name = params[:last_name] || @item[:last_name]
    nick_name = params[:nick_name] || @item[:nick_name]

    email = params[:email] || @item[:email]

    ext = params[:extension] || @item[:extension]
    tel = params[:phone] || @item[:phone]
    tel = "#{tel};ext=#{ext}" if ext

    url = params[:url] || @item[:url] || @config[:base_url]
    org = params[:org] || @item[:org]
    photo_uri = params[:photo_uri] || @item[:photo_uri]
    logo_uri = params[:logo_uri] || @item[:logo_uri]

    vcard = VCardigan.create(version: '3.0')

    vcard.rev(Time.now.strftime('%F'))

    vcard.fullname(full_name)

    vcard.source(@config[:base_url] + @item_rep.path)

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
    if params[:full_name].nil? && @item[:full_name].nil? && "#{@item[:first_name]} #{@item[:last_name]}".empty?
      raise Nanoc::Errors::GenericTrivial.new('Cannot build vCard: the full_name parameter MUST be present in either the params hash or item rep metadata')
    end
  end

end
