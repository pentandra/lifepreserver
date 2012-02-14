require "vpim/vcard"

class VcardFilter < Nanoc3::Filter

  identifier :build_vcard

  def run(content, params = {})

    vcard = ""
    @item[:teammembers].each do |member|
      card = Vpim::Vcard::Maker.make2 do |maker|

        maker.add_name do |name|
          name.given = member[:first_name]
          name.family = member[:last_name]
        end

        maker.add_email(member[:email]) { |e| e.location = 'work' }

        maker.add_tel(member[:phone]) do |tel|
          tel.location = 'work'
          tel.capability = 'voice'
        end

      end

      vcard += card.to_s
    end

    vcard
  end

end
