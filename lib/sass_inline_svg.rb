require "sass_inline_svg/version"
require "sass"
require "cgi"

module Sass::Script::Functions

  # Alias function to comply with old documentation
  def svg_inline(path, repl = nil)
    inline_svg(path, repl)
  end
  
  def inline_svg(path, repl = nil)
    assert_type path, :String
    path = path.value.strip()

    # Use Rails asset pipeline if in Rails context (and handle File not found):
    if defined?(Rails)
      asset = Rails.application.assets.find_asset(path)
      raise "File not found or cannot be read (Sprockets): #{path}" if asset.nil?
      svg = asset.to_s
    else
      svg = _readFile(path).strip
    end

    if repl && repl.respond_to?('to_h')
      repl = repl.to_h
      svg = svg.to_s

      repl.each_pair do |k, v|

        if svg.include? k.value
          svg.gsub!(k.value, v.value)
        end
      end
    end

    encoded = CGI::escape(svg).gsub("+", "%20")
    encoded_url = "url('data:image/svg+xml;charset=utf-8," + encoded + "')"
    Sass::Script::String.new(encoded_url)
    
  end


  private

  def _readFile(path)
    if File.readable?(path)
      File.open(path, 'rb') do |f|
        f.read
      end
    else
      raise Sass::SyntaxError, "File not found or cannot be read (native): #{path}"
    end
  end

end
