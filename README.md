# Hello World with Cuba and ERB #

## Description ##

This is a tiny demonstration of how to get Cuba and ERB (through erubis) 
working well together, passing local variables and referencing instance
variables.

## How else could you do it? ##

Look at [lib/cuba/render.rb](https://github.com/soveran/cuba/blob/master/lib/cuba/render.rb) and the signature of the render function:

        def render(template, locals = {}, options = {}, &block)
            ...
        end

So, if you just give a hash in your call, it will be locals:

        res.write render("views/hello.erb", :foo => bar, ...)

You can also make it explicit:

        res.write render("views/hello.erb", { :foo => bar, ... }, options_hash)

## Author ##

Dan Davis (junior), dansmood@gmail.com

## License ##

MIT License
but not much here


