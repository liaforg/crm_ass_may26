require_relative 'contact.rb'

class CRM

  def initialize(name_being_passed_in)
    @name = name_being_passed_in
    puts "Ok this CRM has the name #{@name}"
  end


  def what_is_the_name_of_this_CRM_again
    puts "Oh master, how could you forget? it was #{@name}"
  end

  def main_menu
    while true # repeat indefinitely
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
    puts 'Enter a number: '
  end


  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
    end
  end



  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end


  def modify_existing_contact
    puts "What's the first name of the contact you would like to change?"
    value_find = gets.chomp

    contact_to_modify = Contact.find_by("first_name", value_find)

    puts "What's the attribute you would like to modify?"
    attribute = gets.chomp

    puts "What's the value of that new attribute?"
    value = gets.chomp

    contact_to_modify.update(attribute, value)
  end

  def delete_contact
    puts "What is the first name of the contact you would like to delete?"
    value=gets.chomp

    contact_to_delete = Contact.find_by("first_name", value)

    puts "deleting contact!"

    puts contact_to_delete.delete
  end

  def display_all_contacts
    puts "Display all contacts"
    Contact.all.each do |contact|
      puts "#{contact.first_name} #{contact.last_name} #{contact.email} #{contact.note}"
    end
  end

  def search_by_attribute
    puts "Enter attribute you are looking for"
    attribute = gets.chomp

    puts "What is the value of that attribute?"
    value = gets.chomp

    Contact.find_by(attribute, value)
  end

end


Contact.create("Lia", "Forg", "abc", "def")
Contact.create("Dan", "Man", "abc", "def")
Contact.create("Laur", "Mac", "abc", "def")

a_crm_app = CRM.new("New CRM")
a_crm_app.main_menu
