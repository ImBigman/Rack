class TimeFormatter  
  ISO = { year: '%Y', month: '-%m', day: '-%d', hour: ' %H:', minute: '%M', second: '%S' }.freeze

  def initialize(params)
    @params = params
    @invalid_params = @params - ISO.keys.map(&:to_s)
  end

  def result
    Time.now.strftime(call).to_s + "\n"
  end

  def call
    temp = [] # temporary array for sorting
    @params.each { |e| temp << ISO[e.to_sym] }
    temp.join
  end

  def valid?
    @invalid_params.empty?
  end

  def excess
    @invalid_params
  end
end
