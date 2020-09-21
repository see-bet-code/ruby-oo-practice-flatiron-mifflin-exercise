class Manager
    attr_accessor :name, :department, :age
    @@all = []

    def initialize(name, department, age)
        @name = name
        @department = department
        @age = age
        @@all << self
    end

    def employees
        Employee.all.select { |e| e.manager_name == self.name }
    end

    def self.all
        @@all
    end

    def hire_employee(name, salary)
        Employee.new(name, salary, self.name)
    end

    def self.all_departments
        self.all.map {|mgr| mgr.department }.uniq
    end

    def self.average_age
        self.all.sum {|mgr| mgr.age } / self.all.size
    end
end
