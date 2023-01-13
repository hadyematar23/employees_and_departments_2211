require './lib/employee'
require './lib/department'
require './lib/budget'

describe Budget do
  context "Budget happy paths" do 
    let(:budget2020){Budget.new(2020)}
    let(:budget2021){Budget.new(2021)}

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

    xit "can list the departments within its jurisdiction" do 
      budget2020.add_department(customer_service)
      budget2020.add_department(sanitation)
      budget2020.add_department(law_enforcement)
      budget2020.add_department(covid_relief)

      budget2021.add_department(customer_service)
      budget2021.add_department(sanitation)
      budget2021.add_department(law_enforcement)
      budget2021.add_department(covid_recovery)

      expect(budget2020.departments).to match_array([customer_service, sanitation, law_enforcement, covid_relief])

      expect(budget2021.departments).to match_array([customer_service, sanitation, law_enforcement, covid_recovery])

    end

    xit "can list all departments with expenses less than 500 dollars" do 

      expect(budget2020.cheap_departments).to match_array([customer_service, sanitation])

      expect(budget2021.cheap_departments).to match_array([law_enforcement])

    end


  end
end 