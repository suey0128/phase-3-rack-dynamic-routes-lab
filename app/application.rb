class Application

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            
            item_input = req.path.split("/items/").last
            item_found = Item.all.find{|item| item.name == item_input}
            if item_found 
                resp.write "#{item_found.price}"
                resp.status = 200
            else
                resp.write "Item not found"
                resp.status =400
            end

        else
            resp.write "Route not found"
            resp.status = 404
        end

        resp.finish
    end
end

# class Application

#     def call(env)
#       resp = Rack::Response.new
#       req = Rack::Request.new(env)
  
#       if req.path.match(/songs/)
  
#         song_title = req.path.split("/songs/").last #strip path info to capture just the title
#         song = @@songs.find{|s| s.title == song_title}
  
#         resp.write song.artist
#       end
  
#       resp.finish
#     end
#   end 