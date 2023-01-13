class Budget
          attr_reader :year, 
                      :departments
  def initialize(year)
    @year = year 
    @departments = []
  end

  def add_department(department)
    @departments << department
  end

  def cheap_departments
    @departments.find_all do |department|
      department.expenses < 500
    end
  end

  def list_employee_salaries
    salary_list = Hash.new
    @departments.each do |department|
      department.employees.each do |employee|
        salary_list[employee.name] = salary_to_s(employee)
      end
    end
    salary_list
  end

  def salary_to_s(employee)
    (employee.salary.to_s).prepend("$")
  end

  def total_charges_responsible(employee)
    cost = 0
    @departments.each do |department|
      department.listed_expenses.each do |expense|
        if expense.employee_charging == employee
          cost += expense.cost_on_department
        end
      end
    end
  cost 
  end 
end