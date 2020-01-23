class TimeFormatter
  FORMATS = %w[year month day hour minute second].freeze
  ISO = { year: '%Y', month: '-%m', day: '-%d', hour: ' %H:', minute: '%M', second: '%S' }.freeze

  def initialize(params)
    @params = params
    @invalid_params = @params - FORMATS
  end

  def result
    temp = [] # temporary array for sorting
    @params.each { |e| temp << ISO[e.to_sym] }
    current_format = temp.join
    Time.now.strftime(current_format).to_s + "\n"
  end

  def valid?
    @invalid_params.empty?
  end

  def excess
    @invalid_params
  end
end
