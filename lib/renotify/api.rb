require "sinatra"
require "sinatra/contrib"

module Renotify
  class API < Sinatra::Base
    register Sinatra::Namespace

    before do
      content_type "application/json"
    end

    namespace "/v1" do
      namespace "/messages" do
        post do
          # do a thing
        end
      end
    end
  end
end
