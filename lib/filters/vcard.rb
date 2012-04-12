require "vpim/vcard"

class VcardFilter < Nanoc::Filter

  identifier :vcard

  def run(content, params = {})

    # Extract params
    first_name = params[:first_name]
    last_name = params[:last_name] || params[:name] || ''

    card = Vpim::Vcard::Maker.make2 do |maker|

      maker.add_name do |name|
        name.given = first_name unless first_name.nil?
        name.family = last_name unless last_name.nil?
      end

      unless params[:org].nil?
        maker.org = params[:org]
      end

      unless params[:email].nil?
        maker.add_email(params[:email]) { |e| e.location = 'work' }
      end

      unless params[:phone].nil?
        maker.add_tel(params[:phone].gsub(/[\s\.-]/, "")) do |tel|
          tel.location = 'work'
          tel.capability = 'voice'
        end
      end

      unless params[:url].nil?
        maker.add_url(params[:url])
      end
    end

    card.to_s
  end

end
