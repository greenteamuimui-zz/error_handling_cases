# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue
    return nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]
class CoffeeError < StandardError
  attr_reader :message
  def message
    p "Try again since you gave me coffee."
  end
end

class OtherError < StandardError
  attr_reader :message
  def message
    p "I don't like that fruit, too bad."
  end
end


def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else
    raise OtherError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError => e
    e.message
    retry
  rescue OtherError => e
    e.message
  end
end

# PHASE 4

class BestFriend

class TypeError < StandardError
  attr_reader :message
  def message
    p "Less than 5 yrs is not enough!"
  end
end

class NameError < StandardError
  attr_reader :message
  def message
    p "Put a name"
  end
end

class FavError < StandardError
  attr_reader :message
  def message
    p "Put a fav"
  end
end

  def initialize(name, yrs_known, fav_pastime)
    begin
      @name = name
      if name.length <= 1
        raise NameError
      end
    rescue NameError => e
      e.message
      puts "try again"
      new_name = gets.chomp
      @name = new_name
    end
    begin
      @yrs_known = yrs_known
      if @yrs_known < 5
        raise TypeError
      end
    rescue TypeError => e
      e.message
      puts "try again"
      new_year = gets.chomp.to_i
      @yrs_known = new_year
    end
    begin
      @fav_pastime = fav_pastime
      if fav_pastime.length <= 1
        raise FavError
      end
    rescue FavError => e
      e.message
      puts "try again"
      new_fav = gets.chomp
      @fav_pastime = new_fav
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end

fd = BestFriend.new("",4,"")
fd.talk_about_friendship
fd.do_friendstuff
fd.give_friendship_bracelet
