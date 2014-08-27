# From https://gist.github.com/fracai/1597618

module Nanoc::Filters

    class AbsolutizePaths < Nanoc::Filter
        
        identifier :absolutize_paths
        
        require 'nanoc/helpers/link_to'
        include Nanoc::Helpers::LinkTo
        
        def unstack(current, target)
            if target =~ /^\//
                return target
            end
            p = current.gsub(/[^\/]*$/,'') + target
            p = p.gsub(/\/+/,'/')
            p = p.gsub(/[^\/]*\/\.\.\//,'') while (p =~ /\.\.\//)
            p
        end
        
        def absolute_path_to(target, params={})
            abs_path = target.is_a?(String) ? target : target.path
            abs_path = unstack(@item_rep.item.path, abs_path)
            
            if params[:style] == :absolute
                abs_path = @site.config[:base_url] + abs_path
            end
            
            abs_path
        end
        
        def run(content, params={})
            # Check attributes
            if params[:style] == :absolute and @site.config[:base_url].nil?
                raise RuntimeError.new('Cannot build absolute path: site configuration has no base_url')
            end

            # Set assigns so helper function can be used
            @item_rep = assigns[:item_rep] if @item_rep.nil?
            
            # Filter
            case params[:type]
            when :html
                content.gsub(/(<[^>]+\s+(src|href))=(['"]?)([^:]*?)\3([ >])/) do
                    $1 + '=' + $3 + absolute_path_to($4, params) + $3 + $5
                end
            when :css
                content.gsub(/url\((['"]?)([^:]*?)\1\)/) do
                    'url(' + $1 + absolute_path_to($2, params) + $1 + ')'
                end
            else
                raise RuntimeError.new(
                    "The relativize_paths needs to know the type of content to " +
                    "process. Pass :type => :html for HTML or :type => :css for CSS."
                )
            end
        end
        
    end
end
