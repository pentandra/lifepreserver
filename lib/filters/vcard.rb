require "vpim/vcard"

class VcardFilter < Nanoc3::Filter

  identifier :vcard

  def run(content, params = {})

    # Extract params
    first_name = params[:first_name] || ''
    last_name = params[:last_name] || params[:name] || ''
    email = params[:email] || ''
    phone = params[:phone].gsub(/[\s\.-]/, "") || ''

    card = Vpim::Vcard::Maker.make2 do |maker|

      maker.add_name do |name|
        name.given = first_name
        name.family = last_name
      end

      maker.add_email(email) { |e| e.location = 'work' }

      maker.add_tel(phone) do |tel|
        tel.location = 'work'
        tel.capability = 'voice'
      end
    end

    card.to_s
  end

end
