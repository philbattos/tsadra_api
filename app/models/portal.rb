class Portal

  # responsible for connecting research.tsadra.org with librarywiki.tsadra.org
  # example query  = https://research.tsadra.org/index.php?title=Special%3AAsk&q=%5B%5BBuddhism%2C+Sexuality%2C+and+Gender%5D%5D&po=author%0D%0Afulltitle%0D%0Apublisher%0D%0A&eq=yes&p%5Bformat%5D=csv&p%5Bsep%5D=%2C
  def fetch(query)
    root_url        = 'https://research.tsadra.org/index.php?'
    research_query  = root_url + query
    uri             = build_uri(research_query)
    response        = authenticate_request(uri)
  end

  # responsible for sending queries to research.tsadra.org using the Special:Ask wiki extension
  # example query: https://tsadra.herokuapp.com/ask-query?action=query&titles=Asian_Traditions_of_Meditation&prop=revisions&list=&meta=siteinfo&format=json
  def ask_query(query)
    root_url       = 'https://research.tsadra.org/api.php?'
    research_query = root_url + query
    client         = MediawikiApi::Client.new(research_query)

    client.log_in(ENV['RESEARCH_WIKI_USERNAME'], ENV['RESEARCH_WIKI_PASSWORD'])
    response = client.query
    response.data
  end

  # bypasses the DRL firewall to provide access to research.tsadra.org
  # example request: https://tsadra.herokuapp.com/tunnel?https://research.tsadra.org/images/1/1b/The_Evolution_of_the_Buddha_Image-front.jpeg
  def bypass_firewall(query)
    root_url  = 'https://research.tsadra.org/'
    full_url  = root_url + query
    uri       = build_uri(full_url)
    response  = authenticate_request(uri)
  end

#=================================================
  private
#=================================================

    def build_uri(query)
      uri           = URI(query)
      uri.user      = ENV['RESEARCH_WIKI_FIREWALL_USERNAME']
      uri.password  = ENV['RESEARCH_WIKI_FIREWALL_PASSWORD']
      uri
    end

    def authenticate_request(uri)
      digest_auth = Net::HTTP::DigestAuth.new
      Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
        request1        = Net::HTTP::Get.new uri            # initial request
        response1       = http.request request1             # initial response from remote server
        authentication  = digest_auth.auth_header uri, response1['www-authenticate'], 'GET'
        request2        = Net::HTTP::Get.new uri            # prepare follow-up request
        request2.add_field 'Authorization', authentication  # add hashed authentication to follow-up request
        http.request request2                               # final request & response
      end
    end

end