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
end