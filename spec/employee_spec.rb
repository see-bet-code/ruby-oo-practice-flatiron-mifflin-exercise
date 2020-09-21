require 'spec_helper'

describe 'Employee' do
    before :each do
        Employee.all.clear
        Manager.all.clear
    end

    it '#name' do
        dwight = Employee.new("Dwight Shrute", 25000, "Michael Scott")
        expect(dwight.name).to eq "Dwight Shrute"
    end

    it '#salary' do
        dwight = Employee.new("Dwight Shrute", 25000, "Michael Scott")
        expect(dwight.salary).to eq 25000
    end

    it '#manager_name' do
        dwight = Employee.new("Dwight Shrute", 25000, "Michael Scott")
        expect(dwight.manager_name).to eq "Michael Scott"
    end

    it '.all' do
        dwight = Employee.new("Dwight Shrute", 25000, "Michael Scott")
        jim = Employee.new("Slim Jim", 25000, "Michael Scott")
        pam = Employee.new("Pam Jam", 25000, "Michael Scott")
        expect(Employee.all).to eq [dwight, jim, pam]
    end

    it '.paid_over' do
        dwight = Employee.new("Dwight Shrute", 25000, "Michael Scott")
        jim = Employee.new("Slim Jim", 10000, "Michael Scott")
        pam = Employee.new("Pam Jam", 25000, "Michael Scott")
        expect(Employee.paid_over(24999)).to eq [dwight, pam]
    end

    it '.find_by_department' do
        dwight = Employee.new("Dwight Shrute", 25000, "Andy Cohen")
        jim = Employee.new("Slim Jim", 10000, "Michael Scott")
        pam = Employee.new("Pam Jam", 25000, "Michael Scott")
        michael = Manager.new("Michael Scott", "Accounting", 40)
        cohen = Manager.new("Andy Cohen", "Reality TV", 40)
        expect(Employee.find_by_department("Accounting")).to eq jim
    end

    it '#tax_bracket' do
        dwight = Employee.new("Dwight Shrute", 25000, "Andy Cohen")
        jim = Employee.new("Slim Jim", 10000, "Michael Scott")
        pam = Employee.new("Pam Jam", 24050, "Michael Scott")
        kevin = Employee.new("Kevin Chili", 25001, "Andy Cohen")
        expect(jim.tax_bracket).to eq []
        expect(dwight.tax_bracket).to eq [pam, kevin]
    end
end