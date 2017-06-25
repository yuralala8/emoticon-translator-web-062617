# require modules here
require 'yaml'

def load_library(emoticon_file)
  emoticons = YAML.load_file('./lib/emoticons.yml')
  hash = {'get_meaning' => {},
        'get_emoticon' => {} }
  
  emoticons.each do |k, v|
      english = v[0]
      japanese = v[1]
    hash['get_meaning'][japanese] = k
    hash['get_emoticon'][english] = japanese
    end
  hash
end

def get_japanese_emoticon(emoticon_file = './lib/emoticons.ytml', emoticon)
    library = load_library(emoticon_file)
    if library["get_emoticon"].include?(emoticon)
        library["get_emoticon"][emoticon]
    else
    "Sorry, that emoticon was not found"
    end
end

def get_english_meaning(emoticon_file = './lib/emoticons.ytml', emoticon)
  library = load_library(emoticon_file)
  if library["get_meaning"].include?(emoticon)
      library["get_meaning"][emoticon]
      else
      "Sorry, that emoticon was not found"
      end
end
