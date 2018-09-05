
module Requestable
  def get(url)
    RestClient::Request.execute(method: :get,
                                url: url,
                                headers: headers)
  end

  def build_url(*pieces, params: nil)
    url = pieces.join('')

    if params
      url << '?'
      params.each do |key, value|
        url << "#{key}=#{value}"
      end
    end

    url
  end
end