class Application
  def call(env)
    response = Rack::Response.new
    request = Rack::Request.new(env)

    if request.path.match(/items/)
      user_item = request.path.split("/items/").last
      puts user_item
      item = @@items.find { |item| user_item == item.name}

      if item != nil
        response.write item.price
        response.status = 200
      else
        response.write "Item not found"
        response.status = 400
      end
    else 
      response.write "Route not found"
      response.status = 404
    end

    response.finish
  end
end