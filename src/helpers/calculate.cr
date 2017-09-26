class Calculate
  def self.two_digits(digit : Int32)
    digit < 10 ? "0#{digit}" : digit
  end

  def self.all_time(results)
    seconds = results.map { |res| Time.parse(res.time, "%X").ticks / 10_000_000 }.sum(0)
    "#{Calculate.two_digits hour = seconds / 3600}:#{Calculate.two_digits (seconds - hour * 3600) / 60}:#{Calculate.two_digits seconds % 60}"
  end
end
