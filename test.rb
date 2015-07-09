class Human

  attr_reader :name
  attr_reader :money

  def initialize(name, money)
    @name = name
    @money = money
  end

  def build_calculator
    @my_calculator = TipCalculator.new(@name.downcase)
  end

  def use_calculator
    if @my_calculator
      return @my_calculator.use_calculator
    else
      "I need to make a calculator before I can use one. I can make one with '#{@name.downcase}.build_calculator'."
    end
  end

  def check_wallet
    "I have $#{@money} left."
  end

  def can_i_afford_the_bill(bill)
    puts "Can I afford the bill?"
    if @money > bill
      puts "Yes!"
      return pay_bill(bill)
    else
      return "No! I'm off to do the dishes."
    end
  end

  def pay_bill(bill)
    @money -= bill
    puts "My remaining money is $#{@money}."
    return mission_accomplished
  end

  def mission_accomplished
    puts "You done it, bro!"
  end

end

class TipCalculator
  def initialize(owner)
    @owner = owner
    puts "'Poof!' A calculator appears!"
  end

  attr_reader :owner

        # Getting input for the calculator
  def use_calculator
    puts "Alright, I have to enter in some information.\nHow much was the bill?"
    bill = gets.chomp.to_f
    puts "Ok, that's entered in. How much am I going to tip as a decimal?"
    tip = gets.chomp.to_f
    puts "Now all I have to do is divide it by how many people are here.\nHow many are there?..."
    num_people = gets.chomp.to_i
    total = bill + (bill * tip)
    my_share = total / num_people
    puts "Your share of the bill is $#{my_share}."
    return @owner.can_i_afford_the_bill(my_share)
  end
end

chris = Human.new("Chris", 200)
chris.build_calculator
chris.use_calculator
