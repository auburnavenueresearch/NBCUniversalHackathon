class StaticPagesController < ApplicationController
	
  def home
    if signed_in?
      @post = current_user.posts.build 
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
    results = HTTParty.get("https://search-proxy.spredfast.com/search.jsonhttps://search-proxy.spredfast.com/search.json?q=telemundo&filter.start=-1d&filter.finish=0&view.entities.limit=20")
    stream = results
    @tweets = stream['views']['entities']['data']['raw']['text']
    @address = store1['store_info']['address']
  end

  def help
  end

  def about
  end

  def contact
    results = HTTParty.get("http://api.developer.sears.com/v2.1/products/search/Sears/json/keyword/wrench?apikey=ktnenNM4NHI3gHkPdD11r0YBN4DkdqyA")
    product1 = results
    @name = product1['SearchResults']['Products'][1]['Description']['Name']
    @image = product1['SearchResults']['Products'][1]['Description']['ImageURL']
    @price = product1['SearchResults']['Products'][1]['Price']['DisplayPrice']
  end
   
end
