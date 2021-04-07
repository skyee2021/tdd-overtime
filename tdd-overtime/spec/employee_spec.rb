require 'employee'

RSpec.describe User do
  context '是否月薪' do
    it '月薪' do
      employee = Employee.new(monthly: true)

      expect(employee).to be_monthly
    end

    it '時薪（預設值）' do
      user = User.new

      expect(user).not_to be_monthly
    end
  end
end
