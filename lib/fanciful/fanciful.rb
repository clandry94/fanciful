require 'colorize'

module TestColorizer 
  PASS_IDENT = 'PASS'
  FAIL_IDENT = 'FAIL'
  RUN_IDENT = '=== RUN'

  def TestColorizer.colorize_failure(line)
    if line.include?(FAIL_IDENT)
      colored = line.match(FAIL_IDENT).to_s.colorize(:red)
      return line.gsub!(FAIL_IDENT, colored)
    end 
    line
  end

  def TestColorizer.colorize_success(line)
    if line.include?(PASS_IDENT)
      colored =  line.match(PASS_IDENT).to_s.colorize(:green)
      return line.gsub!(PASS_IDENT, colored)
    end 
    line
  end

  def TestColorizer.colorize_run(line)
    if line.include?(RUN_IDENT)
      colored = line.match(RUN_IDENT).to_s.colorize(:white)
      return line.gsub!(RUN_IDENT, colored)
    end 
    line
  end
end

class Fanciful
  include TestColorizer

  class << self
    def new(input)
      input.each do |line|
        line = TestColorizer::colorize_run(line)
        line = TestColorizer::colorize_failure(line)
        line = TestColorizer::colorize_success(line)
        puts line
      end 
    end
  end

end



