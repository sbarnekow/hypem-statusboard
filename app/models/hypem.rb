require 'uri'
require 'open-uri'

class Hypem
  def search 
    url = "http://hypem.com/playlist/popular/3day/json/1/data.js"
    file = open(url)
    JSON.load(file.read) || []
  end
end