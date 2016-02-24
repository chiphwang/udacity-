class TodoItem
  include Listable
  attr_reader :description,:due,:type
  attr_accessor :priority

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



  def details
    format_description(@description,@type) + "due: " +
    format_date({due: @due}) +
    format_priority(@priority)
  end


end
