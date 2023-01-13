class Employee
        attr_reader :name, 
                    :age, 
                    :salary
  def initialize(info)
    @name = info[:name]
    @age = info[:age].to_i
    @salary = info[:salary][1..-1].to_i
    
  end
end