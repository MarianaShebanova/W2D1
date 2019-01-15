class Employee
    attr_reader :name, :title, :salary, :boss
    attr_writer :salary, :boss

    def initialize(name, salary, boss, title)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        @salary *= multiplier
    end
end

class Manager < Employee
    attr_reader :team
gi
    def initialize(name, salary, boss, title)
        super #(name, salary, boss, title)
        @team = []
    end

    def bonus(multiplier)         
        @team.each do |emp|
            @salary += emp.salary
        end
        super(multiplier)
    end

    def build_team(employee)
        team << employee
        employee.boss = self.name
    end
end 

if __FILE__ == $PROGRAM_NAME
    david = Employee.new("David", 10000, "Darren", "TA")
    shawna = Employee.new("Shawna", 12000, "Darren", "TA")
    darren = Manager.new("Darren", 78000, "Ned", "TA Manager")
    ned = Employee.new("Ned", 1000000, nil, "Founder")

    darren.build_team(shawna)
    darren.build_team(david)
    print darren.team
end