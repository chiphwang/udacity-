class UdaciList

  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title]
    @items = []
  end

 def filter(search_type)
   puts "-" * @title.length
   puts @title
   puts "-" * @title.length
   list_item=[]
   counter = 1
    items.each_with_index do |item, counter|
      if item.type == search_type
       puts "#{counter} #{item.details}"
     end
   end
 end



  def table_filter(search_type)
    @rows = []
    counter=0
    @items.each_with_index do |item, counter1|
        if item.type == search_type
            @tr=[]
            @tr << item.description
            @tr << counter1
            @tr << item.type

            if item.type == "event"
              @tr << item.start_date
              @tr << item.end_date
            elsif item.type == "todo"
              @tr << item.due
              @tr << item.priority

            elsif item.type == "link"
              @tr << item.site_name
       end
       @rows << @tr
     end

      end
      print_tables(search_type,@rows)
   end




def print_tables(type,rows)
  @type1 = type
  @rows1 = rows

  if type == "event"
  table = Terminal::Table.new :title => @type1, :headings => ['Description', 'ID', 'Type',' Start Date', 'End Date'], :rows => @rows1
  elsif type == "todo"
   table = Terminal::Table.new :title => @type1, :headings => ['Description', 'ID', 'Type','Due Day and Time' ,'Priority'], :rows => @rows1
  elsif type == "link"
     table=Terminal::Table.new :title => @type1, :headings => ['Description', 'ID', 'Type','Link'], :rows => @rows1
   end
  puts table
  puts " "
  puts " "
end

  def add(type, description, options={})
      @type=type
      @type = @type.downcase

     if @type != "todo" && @type !="event" && @type !="link"
      raise UdaciListErrors:: InvalidItemType, "'#{type}' InvalidItemType..."
     end

    if options[:priority]
        if options[:priority] != "high" && options[:priority] != "medium" && options[:priority] != "low"
     raise UdaciListErrors:: InvalidPriorityValue, " ''#{options[:priority]}' is InvalidPriorityValue..."
   end
 end


   @items.push TodoItem.new(description, options) if type == "todo"
   @items.push EventItem.new(description, options) if type == "event"
   @items.push LinkItem.new(description, options) if type == "link"
 end







  def delete(index)
    if index > @items.length
      raise UdaciListErrors::IndexExceedsListSize, "'#{index}' ExceedsListSize"
    end
    @items.delete_at(index - 1)
  end

  def all
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end


end
