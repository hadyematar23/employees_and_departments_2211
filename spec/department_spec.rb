require './lib/employee'
require './lib/department'
require './lib/expense'
require './lib/budget'

describe Department do
  context "Department happy paths" do 
    let(:customer_service){Department.new("Customer Service")}
    let(:bobbi){Employee.new({
      name: "Bobbi Jaeger", 
      age: "30", 
      salary: "100000"})}
    let(:aaron){Employee.new({
      name: "Aaron Tanaka", 
      age: "25", 
      salary: "90000"})}  
    let(:clean_up){Expense.new(abraham, 12)}
    let(:abraham){Employee.new({
      name: "Abraham Matar", 
      age: "38", 
      salary: "$12"})}

    it "exists as a Department object" do 
      expect(customer_service).to be_an_instance_of(Department)
    end

    it "has a readable attribute of name" do 
      expect(customer_service.name).to eq("Customer Service")
    end

    it "starts out with no employees" do 

      expect(customer_service.employees).to eq([])
    
    end  

    it "the employee's salary returns as an integer regardless of whether it has a $ prepending it or not" do 
      expect(bobbi.salary).to eq(100000)
      expect(aaron.salary).to eq(90000)
    end

    it "the department can hire employees" do 
      customer_service.hire(bobbi)
      customer_service.hire(aaron)
      
      expect(customer_service.employees).to match_array([bobbi, aaron])
    end

    it "the department starts out with no expenses" do 
      expect(customer_service.expenses).to eq(0)
    end

    it "the department adds some expenses" do 
      customer_service.expense(100)
      customer_service.expense(25) 
      expect(customer_service.expenses).to eq(125)
    end

    it "the department can list its expenses" do 
      expect(customer_service.listed_expenses).to eq([])
    end 

    it "the departmetn can only add an expense if that employee charging it is on staff" do 
      customer_service.add_expense(clean_up)
      expect(customer_service.listed_expenses).to eq([])

    end

    it "when abraham is hired, he can now add it to his departments expenses" do 
      customer_service.hire(abraham)
      customer_service.add_expense(clean_up)
      expect(customer_service.listed_expenses).to eq([clean_up])
    end

    it "can input an expense and provide the employee responsible" do 
      customer_service.hire(abraham)
      customer_service.add_expense(clean_up)
      expect(customer_service.employee_responsible(clean_up)).to eq(abraham)
    end 

    # I did the final part of iteration 4 in budget as maybe the employee is contracted or hired by multiple departments 
  end 
end 
