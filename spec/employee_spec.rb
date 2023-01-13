require './lib/employee'

describe Employee do
  context "Employee happy paths" do 
    let(:bobbi) {Employee.new({
      name: "Bobbi Jaeger", 
      age: "30", 
      salary: "$100000"})}

    it "exists as an object of employee" do 

      expect(bobbi).to be_an_instance_of(Employee)
    end

    it "has attributes including a name, age, salary" do 
      expect(bobbi.name).to eq("Bobbi Jaeger")
      expect(bobbi.age).to eq(30)
      expect(bobbi.salary).to eq(100000)
    end

    it "can give the employee a raise" do 
      bobbi.give_raise(5000)
      expect(bobbi.salary).to eq(105000)
    end



  end 
end