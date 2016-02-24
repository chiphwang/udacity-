class TodoItem
  include Listable
  attr_reader :description, :due, :priority ,:type

  @@todos=[]

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
    @type="todo"
    @@todos << self
  end

 def self.all
   @@todos
 end


=begin
  def format_description
    "#{@description}".ljust(25)
  end
=end

=begin
  def format_date
    @due ? @due.strftime("%D") : "No due date"
  end
=end


=begin
  def format_priority
    value = " ⇧" if @priority == "high"
    value = " ⇨" if @priority == "medium"
    value = " ⇩" if @priority == "low"
    value = "" if !@priority
    return value
  end
=end

  def details
    format_description(@description,@type) + "due: " +
    format_date({due: @due}) +
    format_priority(@priority)
  end


end
