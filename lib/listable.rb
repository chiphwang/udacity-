module Listable
  # Listable methods go here

  def format_description(description,type)
   "#{description}".ljust(30) + "#{type}".ljust(20)
 end

 def format_type(type)
   "#{type}".rjust(10)
 end

=begin
 def format_date(options={})
   if !options[:due] && !options[:start_date]
     dates = " N/A"
     return dates
   elsif options[:due]
     @due=options[:due]
     @due.strftime(" %D %I:%M %P")
   elsif
     @start_date=options[:start_date]
     @end_date=options[:end_date]
     dates = @start_date.strftime("%D") if @start_date
     dates << " -- " + @end_date.strftime("%D") if @end_date
    return dates
  end
 end
=end

def format_date(options={})
  if !options[:due] && !options[:start_date]
    dates = " N/A"
    return dates
  elsif options[:due]
    due=options[:due]
    due.strftime(" %D %I:%M %P")
  elsif
    start_date=options[:start_date]
    end_date=options[:end_date]
    dates = start_date.strftime("%D") if start_date
    dates << " -- " + end_date.strftime("%D") if end_date
   return dates
 end
end


 def print_tables(type,rows)

   if type == "event"
   table = Terminal::Table.new :title => type, :headings => ['Description', 'ID', 'Type',' Start Date', 'End Date'], :rows => rows
   elsif type == "todo"
    table = Terminal::Table.new :title => type, :headings => ['Description', 'ID', 'Type','Due Day and Time' ,'Priority'], :rows => rows
   elsif type == "link"
      table=Terminal::Table.new :title => type, :headings => ['Description', 'ID', 'Type','Page'], :rows => rows
    end
   puts table
   puts " "
   puts " "
 end

 def format_priority(priority)
   value = " ⇧".colorize(:red) if priority == "high"
   value = " ⇨".colorize(:magenta) if priority == "medium"
   value = " ⇩".colorize(:blue) if priority == "low"
   value = "" if !priority
   return value
 end



end
