class Employee
  attr_reader :monthly, :salary

  def initialize(options = {})
    @monthly = options[:monthly]
  end

  def monthly?
    monthly == true
  end
end

