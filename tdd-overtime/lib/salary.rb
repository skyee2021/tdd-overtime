class Salary
  attr_reader :employee, :salary

  def initialize(salary employee: nil)
    @employee = employee
    @salary = salary
  end


  def add_m(hrs)
    #加班費以半小時計算

    if employee.monthly?
      case working_day
        when 0..2
          (salary / 30 / 8) * hrs * 1.34
        when 2.5..8
          ((salary / 30 / 8) * 2 * 1.34) + ((salary / 30 / 8) * (hrs-2) * 1.67)
        else
          ((salary / 30 / 8) * 2 * 1.34) + ((salary / 30 / 8) * 6 * 1.67) + ((salary / 30 / 8) * (hrs-8) * 2.34)
        end
      case weekend
        when 0..8
          salary / 30
        when 8.5..10
          (salary / 30) + ((salary / 30 / 8) * (hrs-8) * 2.34)
        else
          (salary / 30) + ((salary / 30 / 8) * 2 * 2.34) + ((salary / 30 / 8) * (hrs-10) * 2.67)
        end

        

  end


  def charge
    rental_duration_mins = (bike.rental_duration_seconds) / 60

    if user.member?
      case rental_duration_mins
      when 0..30
        # 前 30 分鐘 5 元
        5
      when 31..240
        # 超過 30 分鐘，但於 4 小時內還車，費率為每 30 分鐘 10 元
        5 + ((rental_duration_mins - 30) / 30.0).ceil * 10
      when 241..480
        # 超過 4 小時，但於 8 小時內還車，第 4~8 小時費率為每 30 分鐘 20 元
        5 + (4 * 2 * 10) + ((rental_duration_mins - (30 + 240)) / 30.0).ceil * 20
      else
        # 超過 8 小時，於第 8 小時起將以每 30 分鐘 40 元計價
        5 + (4 * 2 * 10) + (4 * 2 * 20) + ((rental_duration_mins - (30 + 480)) / 30.0).ceil * 40
      end
    else
      case rental_duration_mins
      when 0..240
        # 4 小時內，費率為每 30 分鐘 10 元
        (rental_duration_mins / 30.0).ceil * 10
      else
        # 超過 4 小時，但於 8 小時內還車，第 4~8 小時費率為每 30 分鐘 20 元
        (4 * 2 * 10) + ((rental_duration_mins - 240) / 30.0).ceil * 20
      end
    end
  end
end

