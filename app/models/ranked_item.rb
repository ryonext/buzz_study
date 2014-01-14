require "httpclient"

class RankedItem
  attr_accessor :uri, :count, :page_name

  def initialize(uri, count)
    @uri = uri
    @count = count
    @page_name = get_page_name(@uri)
  end

  def get_page_name(uri)
    return "" if uri.nil?
    response = try_redirection_uri(uri)
    doc = Nokogiri(response.body)
    doc.title
  end

  def try_redirection_uri(uri)
    hc = HTTPClient.new
    response = hc.get(@uri)
    if response.code == 301
      @uri = response.http_header["location"].first
      response = try_redirection_uri(@uri)
    end
    response
  end
end
