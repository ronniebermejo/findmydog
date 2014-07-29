module JsonApiHelpers
  def response_json
    @json_response ||= JSON.parse(response.body)
  end
end
