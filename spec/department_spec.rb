require './lib/employee'
require './lib/department'

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

    it "exists as a Department object" do 
      expect(customer_service.name).to eq("Customer Service")
    end

    it "can have employees but starts out with none" do 

      expect(customer_service.employees).to eq([])
    
    end  

    it "checking bobbi's salary to be safe as input here does not incldue a $" do 
      expect(bobbi.salary).to eq(100000)
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



  end 
end 
