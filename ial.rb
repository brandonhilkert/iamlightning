require 'bundler'
require 'open-uri'
Bundler.require

get '/' do
  rss = SimpleRSS.parse open("http://iamlightning.blogspot.com/feeds/posts/default")
    @title = rss.entries.first.title
    @content = HTMLEntities.new.decode(rss.entries.first.content.split('&lt;div class="blogger-post-footer"').first)
  erb :index
end