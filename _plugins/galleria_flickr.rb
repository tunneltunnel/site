module Jekyll
  class GalleriaFlickr < Liquid::Tag
    def initialize(tag_name, opts, tokens)
      super
      @config = Jekyll.configuration({})['galleria'] || {}
      @setId = opts.strip
    end
    def render(context)
      html = "<div class=\"gallery\"><div class=\"galleria\">&nbsp;</div>"
      html << "<script type=\"text/javascript\">"
      html << "$(document).ready(function(){Galleria.loadTheme('#{@config['theme']}');"
      html << "Galleria.run('.galleria',{flickr:'set:#{@setId}',flickrOptions:{max:0,sort:'date-posted-asc'}});});</script>"
      html << "<p><a href=\"//www.flickr.com/photos/#{@config['user_id']}/sets/#{@setId}\" target=\"_blank\">Click here to go to the flickr gallery...</a></p></div>"
      return html
    end
  end
end
Liquid::Template.register_tag('galleria_flickr', Jekyll::GalleriaFlickr)
