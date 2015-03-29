class StaticPagesController < ApplicationController
	
  def home
    if signed_in?
      @post = current_user.posts.build 
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
    @results = HTTParty.get("http://search-proxy.spredfast.com/search.json?q=telemundo&filter.start=-3d&filter.finish=0&view.entities.limit=20")
    #@tweets = results['views']['entities']['data'][x]['raw']['text']
    #@poster = results['views']['entities']['data'][x]['raw']['user']['name']
    
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
