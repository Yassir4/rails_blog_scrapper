
## Description
This a ruby on rails API app for scrapping rss articles of my favorites writers.

## Setup

> docker-compose build && docker-compose up

When the app is now up and running, go ahead and open `http://localhost:3000/data` where you can see all the articles data as JSON.

## Fetching latest articles
To fetch the latest articles you can either do that by docker-compose build or by `ruby ./bin/scrapper.rb`, you can also add and remove the authors rss links from `scrapper.rb` file

## UI
To see the UI you can checkout this JS repo https://github.com/Yassir4/vite_blogs_rss_scrapper

