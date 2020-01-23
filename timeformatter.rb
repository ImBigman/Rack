class TimeFormatter
  ISO = { year: '%Y', month: '-%m', day: '-%d', hour: ' %H:', minute: '%M', second: '%S' }.freeze

  def initialize(params)
    @params = params
  end

  def result
    temp = [] # temporary array for sorting
    @params.each { |e| temp << ISO[e.to_sym] }
    current_format = temp.join
    Time.now.strftime(current_format).to_s + "\n"
  end
end
