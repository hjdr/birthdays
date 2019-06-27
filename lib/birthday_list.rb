
class Birthday
  
  attr_accessor = :friends_list

  def initialize
    @friends_list = {}
  end

  def add_info(name, birthday)
    stored_friends(name, birthday)
    "added #{name} #{birthday} to your list of friends!"
  end

  def stored_friends(name, birthday)
    @friends_list[name] = birthday
    @friends_list
  end

  def print_all_friends_birthdays
    print_list = @friends_list.map do |name, birthday|
      "#{name}'s birthday is #{birthday}"
    end
    print_list.join(" ")
  end
end