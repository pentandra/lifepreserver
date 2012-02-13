require "vpim/vcard"

class VcardFilter < Nanoc3::Filter

  identifier :build_vcard

  def run(content, params = {})

    vcard = ""
    puts @item[:teammembers].to_slug
    @item[:teammembers].each do |member|
      card = Vpim::Vcard::Maker.make2 do |maker|

        maker.add_name do |name|
          name.given = member[:name]
        end

        maker.add_email(member[:email]) { |e| e.location = 'work' }

      end

      vcard += card.to_s
    end

    vcard
  end

end
