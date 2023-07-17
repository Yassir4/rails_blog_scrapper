require_relative '../config/environment' # Load Rails environment
require_relative '../app/controllers/application_controller'

application_controller = ApplicationController.new
rss_items = [
    {
        url: 'https://martinfowler.com/feed.atom',
        latest_article: "Linking Modular Architecture to Development Teams",
    },
    {
        url: 'http://www.aaronsw.com/2002/feeds/pgessays.rss',
        latest_article: "How to Get New Ideas",
    },
    {
        url: 'https://www.developerway.com/rss.xml',
        latest_article: 'Refs in React: from access to DOM to imperative API'
    },
    {
        url: 'https://world.hey.com/jason/feed.atom',
        latest_article: 'Rescuing a project in progress'
    },
    {
        url: 'https://world.hey.com/dhh/feed.atom',
        latest_article: 'Staying in the arena'
    },
    {
        url: 'https://www.joelonsoftware.com/feed/',
        latest_article: 'Kinda a big announcement'
    },
    {
        url: 'https://sive.rs/en.atom',
        latest_article: 'Curve into the target'
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

