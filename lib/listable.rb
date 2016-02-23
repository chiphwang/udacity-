module Listable
  # Listable methods go here

  def format_description(description)
   "#{description}".ljust(30)
 end


 def format_date(options={})
   if !options[:due] && !options[:start_date]
     dates = "N/A"
     return dates
   elsif options[:due]
     @due=options[:due]
     @due.strftime("%D")
   elsif
     @start_date=options[:start_date]
     @end_date=options[:end_date]
     dates = @start_date.strftime("%D") if @start_date
     dates << " -- " + @end_date.strftime("%D") if @end_date
    return dates
  end
 end



 def format_priority(priority)
   @priority=priority
   value = " ⇧" if @priority == "high"
   value = " ⇨" if @priority == "medium"
   value = " ⇩" if @priority == "low"
   value = "" if !@priority
   return value
 end

end
