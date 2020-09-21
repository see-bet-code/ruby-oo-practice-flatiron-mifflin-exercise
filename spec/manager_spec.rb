require 'spec_helper'

describe 'Manager' do
    before :each do
        Employee.all.clear
        Manager.all.clear
    end

    it '#name' do
        michael = Manager.new("Michael Scott", "Accounting", 40)
        expect(michael.name).to eq "Michael Scott"
    end

    it '#department' do
        michael = Manager.new("Michael Scott", "Accounting", 40)
        expect(michael.department).to eq "Accounting"
    end

    it '#age' do
        michael = Manager.new("Michael Scott", "Accounting", 40)
        expect(michael.age).to eq 40
    end

    it '#employees + #hire_employee' do
        michael = Manager.new("Michael Scott", "Accounting", 40)
        andy = Manager.new("Andy Cohen", "Reality TV", 40)
        dwight = andy.hire_employee("Dwight Shrute", 25000)
        jim = michael.hire_employee("Slim Jim", 10000)
        pam = michael.hire_employee("Pam Jam", 25000)
        expect(michael.employees).to eq [jim, pam]
        expect(andy.employees).to eq [dwight]
    end

    it '.all' do
        michael = Manager.new("Michael Scott", "Accounting", 40)
        andy = Manager.new("Andy Cohen", "Reality TV", 40)
        expect(Manager.all).to eq [michael, andy]
    end

    it '.all_departments' do
        michael = Manager.new("Michael Scott", "Accounting", 40)
        andy = Manager.new("Andy Cohen", "Reality TV", 40)
        kevin = Manager.new("Kevin Boss Chili", "Accounting", 45)
        expect(Manager.all_departments).to eq ["Accounting", "Reality TV"]
    end

    it '.average_age' do
        michael = Manager.new("Michael Scott", "Accounting", 45)
        andy = Manager.new("Andy Cohen", "Reality TV", 40)
        kevin = Manager.new("Kevin Boss Chili", "Accounting", 35)
        expect(Manager.average_age).to eq 40
    end

end