#!/usr/bin/env ruby
#
# Quick + Dirty script to parse RSS feed from musicforprogramming.net and pull
# down any un-downloaded files along with a basic track list for the mix
# scraped from the website
#
# Author: Richard Clark <richard@fohnet.co.uk>
#
require 'feedzirra'
require 'trollop'
require 'nokogiri'
require 'open-uri'

def_feed_url = 'http://musicforprogramming.net/rss.php'

# parse command line args
opts = Trollop::options do
  opt :url,        'Feed URL to use', :default => def_feed_url, :type => String
  opt :dir,        'Directory to store output in', :required => true, :type => String
end

# pull feed (no reasonable errors to rescue available so just use title, assume
# that we're ok if so)
feed = Feedzirra::Feed.fetch_and_parse(opts[:url])
res = feed.title.nil? rescue true
raise LoadError, "Could not return title from #{opts[:url]}" if res
# check directory exists
raise IOError, "#{opts[:dir]} not found" unless File.directory?(opts[:dir])

puts "Pulling #{feed.title} feed from #{feed.feed_url}"
puts "Last modified: #{feed.last_modified}"

feed.entries.each do |e|
  puts 'Searching for title: ' + e.title
  # pull filenames from last part of id (url to mp3)
  mp3_fn = e.id.sub(/^.*\/([^\/]+)$/, '\1')
  txt_fn = mp3_fn.sub(/mp3$/, 'txt')
  unless File.exist?("#{opts[:dir]}/#{mp3_fn}")
    puts "#{mp3_fn} does not exist locally - downloading"
    open("#{opts[:dir]}/#{mp3_fn}", "wb") do |mp3|  
      mp3.print open(e.id).read
    end
  end
  # search for txt playlist file
  unless File.exist?("#{opts[:dir]}/#{txt_fn}")
    puts "#{txt_fn} does not exist locally - downloading"
    # pull page 
    puts "Opening #{e.url}"
    page = Nokogiri::HTML(open(e.url))
    container = page.css('div.container')[1]
    content = container.css('div.content')[0]
    File.open("#{opts[:dir]}/#{txt_fn}", 'w') {|f| f.write(content.text)}
  end
end

