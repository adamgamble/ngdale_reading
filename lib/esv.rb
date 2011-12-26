require 'uri'
class ESVBible
  include HTTParty

  def base_url
    "http://www.esvapi.org/v2/rest/"
  end

  def lookup_passage passage
    self.class.get(base_url + "passageQuery?key=" + api_key + "&passage=" + URI.escape(passage)).parsed_response
  end

  def api_key
    "67364aa88e8e6a64"
  end
end
