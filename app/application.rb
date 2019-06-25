class Application
  
  @@items = [Item.new("Figs", 3.42), Item.new("Pears", 0.99)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path=="/item"
      resp.write "You requested the songs"
    elsif req.path.match(/items/)
      item_price = req.path.split("/items/").last
      item = @@items.find{|i| i.price == item_price}
      
      resp.write item.price
      
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