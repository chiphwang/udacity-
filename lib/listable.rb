module Listable
  # Listable methods go here

  def format_description(description)
   "#{description}".ljust(30)
 end


 def format_date(options={})

 @due=options[:due]
 @start_date=options[:due]
 @end_date=options[:end_date]

   @due ? @due.strftime("%D") : "No due date" if @due
   dates = @start_date.strftime("%D") if @start_date
   dates << " -- " + @end_date.strftime("%D") if @end_date
   dates = "N/A" if !dates
   return dates
 end

end
