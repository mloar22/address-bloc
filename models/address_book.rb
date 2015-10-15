require_relative "./entry.rb"
 
 class AddressBook
   attr_accessor :entries

   def initialize
     @entries = [
      Entry.new("Michael", "12321", "michael@example.com"),
      Entry.new("Example1", "12321312", "Example1@example.com"),
      Entry.new("Example2", "12321312", "Example2@example.com")
     ]
   end
   
   def add_entry(name, phone, email)
 
     index = 0
     @entries.each do |entry|
 
       if name < entry.name
         break
       end
       index += 1
     end
 
     @entries.insert(index, Entry.new(name, phone, email))
   end

   def remove_entry(entry_to_delete)
    #this needs to remove an entry from @entries
    #remove a specific entry

    @entries.each do |entry|
      if entry == entry_to_delete
        @entries.delete(entry)
      end
    end
   end
 end