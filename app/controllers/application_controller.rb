require 'rss'
require 'open-uri'

class ApplicationController < ActionController::API
    def scrap_rss(rss_link)
        if Author.find_by_link(rss_link)
            author = Author.find_by_link(rss_link)
            URI.open(rss_link) do |rss|
                feed = RSS::Parser.parse(rss)
        
                items = feed.feed_type === 'atom' ? feed.entries : feed.channel.items
                latest_index = items.find_index { |item| (get_title(item, feed.feed_type).include?(author.articles.last.title))}
                
                if !latest_index.nil? && latest_index > 0
        
                    items[0 .. latest_index - 1].each do |item|
                    author.articles.create(title: get_title(item, feed.feed_type).strip, link: get_link(item, feed.feed_type).strip)
                    end
                end
            end
        else
            URI.open(rss_link) do |rss|
                feed = RSS::Parser.parse(rss)
                if feed
                    author_name = feed.feed_type === 'atom' ? feed.title.content.strip : feed.channel.title.strip
                    author = Author.create(name: author_name, rss_link: rss_link)
                    items = feed.feed_type === 'atom' ? feed.entries : feed.channel.items
                    author.articles.create(title: get_title(items[0], feed.feed_type), link: get_link(items[0], feed.feed_type))
                end
            end
        end
    end

    def index
        render json: {
            data: Author.all.map do |author| 
                {
                    author: author,
                    articles: author.articles
                }
            end
        }
    end
    
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
end
    