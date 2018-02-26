module Jekyll
  class SassOutput < Liquid::Tag
    def initialize(tag_name, args, options)
      super
    end

    def render(context)
      sass = context['site']['sass_output'].detect { |s|
        s['file'].include? context['page']['sass_file']
      }
      output = sass['compressed_css']
      output.gsub! /}([^}])/, " }\n\\1" # Match closing brackets
      output.gsub! /\){/, "){ \n" # Match @media opening brackets
      output.gsub! /} }/, " }\n}" # Match @media closing brackets
      output.gsub! /{/, ' { '
      # output.gsub! /([a-z]),/, "\\1,\n\\2"
      # output.gsub! /\),./, "),\n." # Matches :not(...),.class
      # output.gsub! /([a-z]):([^:|not])/, '\1: \2'
      # output.gsub! /;/, '; '
      # output.gsub! /\n\z/, ''
      # output
    end
  end
end

Liquid::Template.register_tag('sass_output', Jekyll::SassOutput)
