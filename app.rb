require './timeformatter.rb'
class App
  def call(env)
    request = Rack::Request.new(env)
    if check_url(request)
      response_with(404, "Page not found (404)\n")
    else
      process_request(request)
    end
  end

  def check_url(request)
    request.fullpath[1..12] != 'time?format='
  end

  def response_with(code, message)
    response = Rack::Response.new
    response.status = code
    response['Content-Type'] = 'text/plain'
    response.write message
    response.finish
  end

  def process_request(request)
    processing = TimeFormatter.new(request.params['format'].split(','))
    if processing.valid?
      response_with(200, processing.result)
    else
      response_with(400, "Unknown time format [#{processing.excess.join(',')}] \n")
    end
  end
end
