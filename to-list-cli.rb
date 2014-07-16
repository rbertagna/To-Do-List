class List

  def initialize
    @items = []
    until @action == "quit"
      base
    end
  end

  def space #Make Neater
    puts "\n"
  end


  def base #brings user to other actions
    puts "What would you like to do? (View List, Add Item, Delete Item, Complete Item, Quit)"
    @action = gets.chomp.downcase
    if @action == "add item"
      add_item
    elsif @action == "delete item"
      delete_item
    elsif @action == "view list"
      view_items
    elsif @action == "quit"
    else #Safety Net
      puts "Invalid input"
      base
    end
  end


  def add_item
    space
    puts "Please eneter an item"
    @items << gets.chomp
    view_items
  end

  def view_items #Use in other actions
    space
    puts "To Do:"
    @items.each_index do |index|
      puts (index+1).to_s + ". " + @items[index] #+1 in order to not confuse viewer with item 0
    end
    space
  end

  def delete_item
    space
    puts "What item would you like to delete? Enter number"
    view_items
    delete = gets.chomp
    if delete.match(/\D/) #Check for digits
      puts "Please enter a valid item number"
      delete_item
    else
      if delete.to_i > @items.size || delete.to_i < 1 #check it is in range
         puts "Please enter a valid item number"
        delete_item
      else
        @items.delete_at(delete.to_i - 1) #-1 to counteract view_items +1
        view_items
      end
    end
  end

end

today_list = List.new