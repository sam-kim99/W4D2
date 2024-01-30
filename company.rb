class Employee
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
    def initialize(name, title, salary, boss)
        super
        @employees = []
    end

    def bonus(multiplier)
        bonus
    end
end