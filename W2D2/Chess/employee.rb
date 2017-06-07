class Employee
  attr_reader :salary
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  def initialize(employee, name, title, salary, boss)
    @employees = employee
    super(name, title, salary, boss)
  end

  def bonus(multiplier)
    all_salaries = @employees.map do |individual|
      individual.salary
    end
    all_salaries.reduce(:+) * multiplier
  end

end

shawna = Employee.new("Shawna","TA",12000,"Darren")
david = Employee.new("David","TA",10000,"Darren")
darren = Manager.new([david, shawna], "Darren", "TA Manager", 78000, "Ned")
ned = Manager.new([david, shawna, darren], "Ned", "Founder", 1000000, nil)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
