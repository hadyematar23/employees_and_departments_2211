require './lib/employee'
require './lib/department'
require './lib/budget'

describe Budget do
  context "Budget happy paths" do 
    let(:budget2020){Budget.new(2020)}
    let(:budget2021){Budget.new(2021)}
    let(:customer_service){Department.new("Customer Service")}
    let(:food){Department.new("Food")}
    let(:recreation){Department.new("Recreation")}
    let(:covid_relief){Department.new("Covid Relief")}
    let(:health){Department.new("Health HS")}
    let(:sanitation){Department.new("Sanitation")}
    let(:law_enforcement){Department.new("Law Enforcement")}
    let(:covid_recovery){Department.new("Covid Recovery")}
    let(:hady){Employee.new({
      name: "Hady Matar", 
      age: "32", 
      salary: "$80000"})}
    let(:malena){Employee.new({
      name: "Maria Magdelna", 
      age: "26", 
      salary: "$90000"})}
    let(:diego){Employee.new({
      name: "Diego Colive", 
      age: "34", 
      salary: "$60000"})}
    let(:michele){Employee.new({
      name: "Michele", 
      age: "33", 
      salary: "$100000"})}
    let(:abraham){Employee.new({
      name: "Abraham Matar", 
      age: "38", 
      salary: "$12"})}
  

    it "exists as a budget object" do 
      expect(budget2020).to be_an_instance_of(Budget)
      expect(budget2021).to be_an_instance_of(Budget)

    end

    it "each budget has an attribute of the year it represents" do 
      expect(budget2020.year).to eq(2020)
      expect(budget2021.year).to eq(2021)
    end

    it "each budget out having no departments within it" do 
      expect(budget2020.departments).to eq([])
      expect(budget2021.departments).to eq([])

    end

    it "departments can be added to its jurisdiction and then listed by budget" do 
      
      budget2020.add_department(customer_service)
      budget2020.add_department(food)
      budget2020.add_department(recreation)
      budget2020.add_department(covid_relief)

      budget2021.add_department(health)
      budget2021.add_department(sanitation)
      budget2021.add_department(law_enforcement)
      budget2021.add_department(covid_recovery)

      expect(budget2020.departments).to match_array([customer_service, food, recreation, covid_relief])

      expect(budget2021.departments).to match_array([health, sanitation, law_enforcement, covid_recovery])

    end

    it "can list all departments with expenses less than 500 dollars" do 

      customer_service.expense(300)
      customer_service.expense(100)
      food.expense(700)
      recreation.expense(50)
      covid_relief.expense(400)
      covid_relief.expense(300)

      budget2020.add_department(customer_service)
      budget2020.add_department(food)
      budget2020.add_department(recreation)
      budget2020.add_department(covid_relief)

      health.expense(800)
      sanitation.expense(600)
      law_enforcement.expense(200)
      law_enforcement.expense(100)
      covid_recovery.expense(700)

      budget2021.add_department(health)
      budget2021.add_department(sanitation)
      budget2021.add_department(law_enforcement)
      budget2021.add_department(covid_recovery)

      expect(budget2020.cheap_departments).to match_array([recreation, customer_service])

      expect(budget2021.cheap_departments).to match_array([law_enforcement])

    end

    it "if the budget expenses change, the list of cheap departments also changes" do 

      customer_service.expense(300)
      customer_service.expense(500)
      food.expense(400)
      recreation.expense(500)
      covid_relief.expense(400)
      covid_relief.expense(300)

      budget2020.add_department(customer_service)
      budget2020.add_department(food)
      budget2020.add_department(recreation)
      budget2020.add_department(covid_relief)

      health.expense(300)
      sanitation.expense(400)
      law_enforcement.expense(800)
      law_enforcement.expense(100)
      covid_recovery.expense(100)

      budget2021.add_department(health)
      budget2021.add_department(sanitation)
      budget2021.add_department(law_enforcement)
      budget2021.add_department(covid_recovery)

      expect(budget2020.cheap_departments).to match_array([food])

      expect(budget2021.cheap_departments).to match_array([health, sanitation, covid_recovery])

    end

    it "a budget can list all of the employees' salaries" do 

      recreation.hire(hady)
      recreation.hire(malena)
      covid_relief.hire(diego)
      covid_relief.hire(michele)
      budget2020.add_department(recreation)
      budget2020.add_department(covid_relief)
      
      expect(budget2020.list_employee_salaries).to eq({
        "Hady Matar" => "$80000", 
        "Maria Magdelna" => "$90000",
        "Diego Colive" => "$60000",
        "Michele" => "$100000"
      })

    end

    it "if the employee composition within a department changes, or the salary of employee changes, so does the list" do 
      
      hady = Employee.new({
        name: "Hady Matar", 
        age: "32", 
        salary: "$800000"})

      covid_relief.hire(hady)
      recreation.hire(abraham)
      budget2020.add_department(recreation)
      budget2020.add_department(covid_relief)
      
      expect(budget2020.list_employee_salaries).to eq({
        "Hady Matar" => "$800000", 
        "Abraham Matar" => "$12"
      })

    end
  end
end 