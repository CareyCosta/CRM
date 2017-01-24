require_relative 'contact'


class CRM

  def initialize(name)
    @name = name
  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number:'
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then Exit
    end
  end

  def add_new_contact
    print 'Enter First Name:'
    first_name = gets.chomp

    print 'Enter Last Name:'
    last_name = gets.chomp

    print 'Enter Email Address'
    email = gets.chomp

    print 'Enter a Note'
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end

  def attributes
    puts 'Select Attribute'
    puts '1 - First Name'
    puts '2 - Last Name'
    puts '3 - Email'
    puts '4 - Note'
  end


  def modify_existing_contact
    display_all_contacts
    puts "Enter Contact ID to modify"
    id = gets.chomp.to_i
    modify_contact = Contact.find(id)
      unless modify_contact
        puts "ID not found"
        return
    end

    attributes

    while user_selected =gets.to_i

    case user_selected
    when 1 then puts "Enter New First Name"
      new = modify_contact.update(:first_name, value = gets.chomp)
      puts
      modify_contact.display_contact
      puts
      break

    when 2 then puts "Enter New Last Name"
      new = modify_contact.update(:first_name, value = gets.chomp)
      puts
      modify_contact.display_contact
      puts
      break

    when 3 then puts "Enter New Email Address"
      new = modify_contact.update(:email, value = gets.chomp)
      puts
      modify_contact.display_contact
      puts
      break

    when 4 then puts "Enter New Note"
      new = modify_contact.update(:note, value = gets.chomp)
      puts
      modify_contact.display_contact
      puts
      break

    else
      puts "Enter a number between 1 and 4"
      attributes
    end
  end
  end

  def delete_contact
    display_all_contacts
    puts "Select ID of contact to delete"
    id = gets.chomp.to_idelete_value = Contact.find(id)
    delete_value = Contact.find(id)
  end

  def display_all_contacts
    all_contact = Contact.all
    all_contact.each do |list|
      puts "First name: #{list.first_name}"
      puts "Last name: #{list.last_name}"
      puts "Email: #{list.email}"
      puts "note: #{list.note}"
      puts "id: #{list.id}"
    end
  end

  def search_by_attribute

  end


end
