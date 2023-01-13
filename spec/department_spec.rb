require './lib/employee'
require './lib/department'

describe Department do
  context "Department happy paths" do 
    let(:customer_service){Department.new("Customer Service")}

    it "exists as a Department object" do 
      expect(customer_service.name).to eq("Customer Service")
    end

    it "can have employees but starts out with none" do 

      expect(customer_service.employees).to eq([])
    
    end  



  end 
end 
