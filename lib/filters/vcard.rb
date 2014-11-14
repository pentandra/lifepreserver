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

    vcard = VCardigan.create

    vcard.fullname escape(full_name)

    if @site.config[:base_url]
      vcard.source @site.config[:base_url] + @item_rep.path
    end

    vcard.kind kind

    if kind == 'individual'
      vcard.name [ last_name, first_name ].map { |x| escape x }
    end

    vcard.nickname nick_name unless nick_name.nil?

    unless email.nil?
      vcard.email email, :type => 'work'
    end

    vcard.org escape(org) unless org.nil?
    vcard.url escape(url) unless url.nil?

    unless tel.nil?
      tel_uri = "tel:" + tel.gsub(/[\s\.-]/, '') + (ext.nil? ? "" : ";ext=" + ext)
      vcard.tel tel_uri, :type => 'voice,work', :value => 'uri'
    end

    vcard.to_s
  end

  private

  def escape(str)
    escaped = str.gsub(",", "\\,")
  end

end
