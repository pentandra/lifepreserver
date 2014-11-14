require "vcardigan"

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
    tel = params[:phone]
    ext = params[:extension]
    url = params[:url]
    org = params[:org]
    photo_uri = params[:photo_uri]

    vcard = VCardigan.create(:version => '3.0')

    vcard.rev DateTime.now.strftime(format='%F')

    vcard.fullname full_name

    if @site.config[:base_url]
      vcard.source @site.config[:base_url] + @item_rep.path
    end

    #vcard.kind kind

    if kind == 'individual'
      vcard.name [ last_name, first_name ]
    end

    vcard.nickname nick_name unless nick_name.nil?

    unless email.nil?
      vcard.email email, :type => 'work'
    end

    vcard.org org unless org.nil?
    vcard.url url unless url.nil?

    unless tel.nil?
      vcard.tel tel.gsub(/[\s\.-]/, ''), :type => 'voice,work,msg'
    end

    unless photo_uri.nil?
      vcard.photo photo_uri, :value => 'uri'
    end

    vcard.to_s
  end

end
