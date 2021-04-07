require 'salary'
require 'employee'
require 'timecop'

RSpec.describe Bike do
  let(:salary { Salary.new(employee) }

  context '月薪加班費' do
    let(:employee) { Employee.new(monthly: true) }

    it "平日或休息日" do
      employee = Employee.new(monthly: true)
      day = Day.new()
      salary = Salary.new(30000)
      salary.overhrs(4)
      expect(salary.add).to be 752
      #n/30/8 * (2*1.34 + 2*1.67)
    end

    it "月薪假日" do
      employee = Employee.new(monthly: true)
      salary = Salary.new(30000)
      salary.overhrs(4)
      expect(rental.charge).to be 1000
    end

    # it "時薪假日" do
    #   employee = Employee.new(monthly: false)
    #   salary = Salary.new(130)
    #   salary.overhrs(4)
    #   expect(rental.charge).to be 1040
    # end
  end

  context '時薪加班費' do
    let(:employee) { Employee.new }

    it "平日或休息日" do
      employee = Employee.new(monthly: false)
      salary = Salary.new(30000)
      salary.overhrs(4)
      expect(salary.add).to be 752
      #n/30/8 * (2*1.34 + 2*1.67)
    end

    it "時薪假日" do
      employee = Employee.new(monthly: false)
      salary = Salary.new(130)
      salary.overhrs(4)
      expect(rental.charge).to be 1040
    end

  #   it "超過 4 小時，但於 8 小時內還車，第 4~8 小時費率為每 30 分鐘 20 元" do
  #     # Act
  #     rental.rent(subject)
  #     Timecop.travel(348 * 60) # 經過 5 小時 48 分後（348 分鐘）
  #     rental.return(subject)

  #     # Assert
  #     # 前 4 小時，每 30 分鐘 10 元，小計 80 元
  #     # 剩餘 108 分鐘，每 30 分鐘 20 元，小計 80 元
  #     # 共計 80 + 80 = 160 元
  #     expect(rental.charge).to be 160
  #   end
  # end
end
