require 'pry'

class Application
  
  @@items = [Item.new("Figs", 3.42), Item.new("Pears", 0.99)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/item/)
      binding.pry
      item_name = req.path.split("/items/").last
      item = @items.find{|i| i.name == item_name}
      
      resp.write item.name
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
  
  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Item not found"
      resp.status
    end
  end

end