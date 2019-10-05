class Application

    @@items = [Item.new("item1", 10.0), Item.new("item2", 37.0), Item.new("item3", 12.0)]

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            item_name = req.path.split("/items/").last
            if matching_item = @@items.find do |item|
                 item.name == item_name
            end
                    resp.write matching_item.price
            else
                resp.write "Item not found"
                resp.status = 400
            end
        else 
            resp.write "Route not found"
            resp.status = 404
        end
        resp.finish
    end
end

