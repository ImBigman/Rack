require './timeformatter.rb'
class App
  FORMATS = %w[year month day hour minute second].freeze

  def call(env)
    request = Rack::Request.new(env)
    if request.fullpath[1..12] != 'time?format='
      status = 404
      body = ["Page not found (404)\n"]
    else
      params = request.params['format'].split(',')
      processing = TimeFormatter.new(params)
      diff = params - FORMATS
      if diff.empty?
        status = 200
        body = [processing.result]
      else
        status = 400
        body = ["Unknown time format [#{diff.join(', ')}]\n"]
      end
    end
    [status, headers, body]
  end

  private

  def status
    200
  end

  def headers
    { 'Content-Type' => 'text/plain' }
  end

  def body
    nil
  end
end
