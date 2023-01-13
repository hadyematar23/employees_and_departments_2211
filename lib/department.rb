class Department
          attr_reader :name, 
                      :employees, 
                      :expenses, 
                      :listed_expenses
  def initialize(name)
    @name = name 
    @employees = [] 
    @expenses = 0
    @listed_expenses =[]
  end

  def hire(employee)
    @employees << employee
  end

  def expense(expense_amount)
    @expenses += expense_amount
  end

  def add_expense(expense)
    if employees.include?(expense.employee_charging)
      @listed_expenses << expense
    end
  end

  def employee_responsible(expense)
    expense.employee_charging
  end

end