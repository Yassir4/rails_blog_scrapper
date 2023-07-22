require_relative '../config/environment' # Load Rails environment
require_relative '../app/controllers/application_controller'

application_controller = ApplicationController.new
rss_items = [
    {
        url: 'https://martinfowler.com/feed.atom',
    },
    {
        url: 'http://www.aaronsw.com/2002/feeds/pgessays.rss',
    },
    {
        url: 'https://www.developerway.com/rss.xml',
    },
    {
        url: 'https://world.hey.com/jason/feed.atom',
    },
    {
        url: 'https://world.hey.com/dhh/feed.atom',
    },
    {
        url: 'https://www.joelonsoftware.com/feed/',
    },
    {
        url: 'https://sive.rs/en.atom',
    }
]

# to exclude the string from item title or link
def get_title(item, feed_type)
    if feed_type == 'atom'
        item.title.content
    else
        item.title
    end
end

def get_link(item, feed_type)
    if feed_type == 'atom'
        item.link.href
    else
        item.link
    end
end

rss_items.each do |rss_item|
    application_controller.scrap_rss(rss_item[:url])
end

