require 'employee'

RSpec.describe Employee do
  context '是否月薪' do
    it '月薪' do
      employee = Employee.new(true)
      employee.is_monthly?
      expect(employee.ans).to be true
    end
  end
end
