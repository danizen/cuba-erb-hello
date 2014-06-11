# cat hello_world.rb
require 'cuba'
require 'cuba/render'
require 'rack/protection'
require 'tilt/erubis'

# generate secret like this:
#     dd if=/dev/random of=/dev/stdout bs=8 count=2 | od -x
# You can edit if you like.
Cuba.use Rack::Session::Cookie, :secret  => "9f82 b895 c526 baf6 0a27 a975 c24a 70e2"

Cuba.use Rack::Protection

Cuba.plugin Cuba::Render
Cuba.define do

  on get do
    on "hello" do

      # instance variables are accessible in the ERB
      @page_title = 'Hello'
      @page_heading = 'Hello with ERB and Cuba'

      # structured date, e.g. any object, can be passed as local data
      local_data = [ "Hello World", 
          "Every good boy does fine", 
          "Normandy is fine for me" ]

      res.write render("views/hello.erb", :arr1 => local_data)
    end

    on root do
      res.redirect "/hello"
    end
  end

end
