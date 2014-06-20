require "sinatra"
require "sinatra/contrib"
require "sinatra-websocket"
require "json"

module Renotify
  class API < Sinatra::Base
    set :sockets, []
    set :server, "thin"

    register Sinatra::Namespace

    before do
      content_type "application/json"
    end

    namespace "/v1" do
      get "/ws" do
        if request.websocket?
          request.websocket do |ws|
            ws.onopen do
              ws.send("Hello World!")
              settings.sockets << ws
            end
            ws.onmessage do |msg|
              EM.next_tick { settings.sockets.each{|s| s.send(msg) } }
            end
            ws.onclose do
              warn("websocket closed")
              settings.sockets.delete(ws)
            end
          end
        end
      end

      namespace "/messages" do
        post do
          body = JSON.parse(request.body.read)
          title = body["title"]
          message = body["message"]

          data = { title: title, message: message }.to_json
          settings.sockets.each { |socket| socket.send(data) }
          status 200
        end
      end
    end
  end
end
