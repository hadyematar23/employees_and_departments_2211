require './lib/employee'
require './lib/department'
require './lib/expense'

describe Expense do
  context "Expense happy paths" do 
  let(:sanitation){Department.new("Sanitation")}
  let(:abraham){Employee.new({
    name: "Abraham Matar", 
    age: "38", 
    salary: "$12"})}
  let(:hady){Employee.new({
    name: "Hady Matar", 
    age: "32", 
    salary: "$80000"})}
  let(:clean_up){Expense.new(abraham, 12)}

    it "exists as an expense object" do 
      expect(clean_up).to be_an_instance_of(Expense)
    end

    it "has attributes such as who is responsible and the cost of the expense on the department" do 
      expect(clean_up.employee_charging).to eq(abraham)
      expect(clean_up.cost_on_department).to eq(12)

    end


  end
end 