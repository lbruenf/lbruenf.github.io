module Jekyll
    class WikipediaTag < Liquid::Tag

        def initialize(tag_name, path, tokens)
            super
            @path = path
        end

        def render(context)
            # Pipe parameter through Liquid to make additional replacements possible
            query = Liquid::Template.parse(@path).render context
            base_url = "https://en.wikipedia.org/wiki/"
            base_url + query
        end
    end
end

Liquid::Template.register_tag('wikipedia', Jekyll::WikipediaTag)
