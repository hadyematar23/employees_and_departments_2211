class Expense
          attr_reader :employee_charging,
                      :cost_on_department
  def initialize(employee_charging, cost_on_department)
    @employee_charging = employee_charging
    @cost_on_department = cost_on_department
  end
end