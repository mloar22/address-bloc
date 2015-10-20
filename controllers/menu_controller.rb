require_relative "../models/address_book"
 
 class MenuController
   attr_accessor :address_book
 
   def initialize
     @address_book = AddressBook.new
   end

   def main_menu
     puts "Main Menu - #{@address_book.entries.count} entries"
     puts "1 - View all entries"
     puts "2 - Create an entry"
     puts "3 - Search for an entry"
     puts "4 - Import entries from a CSV"
     puts "5 - View Entry n"
     puts "6 - Delete all Entries"
     puts "7 - Exit"
     print "Enter your selection: "
 
     selection = gets.to_i
     case selection
     when 1
       system "clear"
       view_all_entries
       main_menu
     when 2
       system "clear"
       create_entry
       main_menu
     when 3
       system "clear"
       search_entries
       main_menu
     when 4
       system "clear"
       read_csv
       main_menu
     when 5 
       system "clear"
       entry_view
       main_menu
     when 6
      system "clear"
      delete_all_entries
      main_menu

     when 7
       puts "Good-bye!"
       exit(0)
     else
       system "clear"
       puts "Sorry, that is not a valid input"
       main_menu
     end
   end

   

   def create_entry

     system "clear"
     puts "New AddressBloc Entry"
     print "Name: "
     name = gets.chomp
     print "Phone number: "
     phone = gets.chomp
     print "Email: "
     email = gets.chomp
 
     @address_book.add_entry(name, phone, email)
 
     system "clear"
     puts "New entry created"

   end
 
   def search_entries
   end
 
   def read_csv
   end
   def entry_submenu(entry)

     puts "n - next entry"
     puts "d - delete entry"
     puts "e - edit this entry"
     puts "m - return to main menu"

     selection = gets.chomp
 
     case selection
     when "n"
     when "d"
     when "e"
     when "m"
       system "clear"
       main_menu
     else
       system "clear"
       puts "#{selection} is not a valid input"
       entries_submenu(entry)
     end
   end

   def entry_view
    print "What entry would you like to see? "
    entry_desired = gets.chomp.to_i
     puts @address_book.entries[entry_desired]
     if entry_desired > @address_book.entries.count
      puts "invalid selection"
      entry_view
      system "clear"
     end
   end

   def view_all_entries
     @address_book.entries.each do |entry|
     system "clear"
     puts entry.to_s
      entry_submenu(entry)
      end
     system "clear"
     puts "End of entries"
   end

   def delete_all_entries
    @address_book.a_bomb 
      puts "You just nuked all your entries...."
   end
 end 
