class Employee
    attr_accessor :name, :salary, :manager_name
    @@all = []

    def initialize(name, salary, manager_name)
        @name = name
        @salary = salary
        @manager_name = manager_name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.paid_over(amt)
        self.all.select { |e| e.salary > amt }
    end

    def department
        Manager.all.find { |m| m.name == self.manager_name }.department
    end

    def self.find_by_department(department)
        self.all.find do |e|
            e.department == department
        end
    end

    def tax_bracket
        other_employees = self.class.all - [self]
        other_employees.select do |e|
            (e.salary - self.salary).abs <= 1000
        end
    end

end
