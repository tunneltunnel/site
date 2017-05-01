require 'liquid'
require 'fleakr'

Fleakr.api_key       = "edfac20f6422216a30ce56359714910a"
Fleakr.shared_secret = "e5e940256c041580"
Fleakr.auth_token    = "72157679423020804-987ee22dfd765f2a"

CACHED_IMAGES = {}

module Flickr
  def flickr_image(url)
    "<img alt='#{image_object(url).title}' src='#{image_object(url).large.url}'>"
  end

  def flickr_medium_image(url)
    "<img alt='#{image_object(url).title}' src='#{image_object(url).medium.url}'>"
  end

  private

  def image_object(url)
    CACHED_IMAGES[url] ||= Fleakr.resource_from_url(url)
  end
end

Liquid::Template.register_filter(Flickr)
