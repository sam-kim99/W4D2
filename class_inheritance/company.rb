class Employee
    attr_reader :salary, :title, :name, :boss
    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        bonus = @salary * multiplier
    end
end

class Manager < Employee
    attr_accessor :employees
    def initialize(name, title, salary, boss)
        super
        @employees = []
    end

    def bonus(multiplier)
        sum = 0
        line = []
        line.push(*@employees)
        # = [employee1, employee2, etc] or, employees.dup
        until line.empty?
            current = line.shift
            sum += current.salary
            line.concat(current.employees) if current.is_a?(Manager)
        end
        sum * multiplier
    end
end

ned = Manager.new('ned', 'big boss', 500, nil)
darren = Manager.new('darren', 'mid boss', 100, 'ned')
shawna = Employee.new('shawna', 'little', 20, 'darren')
david = Employee.new('david', 'little', 20, 'darren')
ned.employees << darren
darren.employees << shawna << david
p ned.bonus(5)
