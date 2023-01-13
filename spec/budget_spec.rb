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

    it "exists as a budget object" do 
      expect(budget2020). to be_an_instance_of(Budget)
      expect(budget2021). to be_an_instance_of(Budget)

    end

    it "each budget has an attribute including the year it represents" do 
      expect(budget2020.year).to eq(2020)
      expect(budget2021.year).to eq(2021)
    end

    it "starts out having no departments" do 
      expect(budget2020.departments).to eq([])
      expect(budget2021.departments).to eq([])

    end

    it "can list the departments within its jurisdiction" do 
      
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
      law_enfocement.expense(100)
      covid_recovery.expense(700)

      budget2021.add_department(health)
      budget2021.add_department(sanitation)
      budget2021.add_department(law_enforcement)
      budget2021.add_department(covid_recovery)


      expect(budget2020.cheap_departments).to match_array([recreation, customer_service])

      expect(budget2021.cheap_departments).to match_array([law_enforcement])

    end


  end
end 