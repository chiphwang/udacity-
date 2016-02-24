class EventItem
  include Listable
  attr_reader :description, :start_date,:end_date, :type
   @@events=[]

  def initialize(description, options={})
    @description = description
    @start_date = Date.parse(options[:start_date]) if options[:start_date]
    @end_date = Date.parse(options[:end_date]) if options[:end_date]
    @type="event"
    @@events << self
  end


def list_all
  @@events.each do |event|
    event.details
  end
end

=begin
  def format_description
    "#{@description}".ljust(25)
  end
=end

=begin
  def format_date
    dates = @start_date.strftime("%D") if @start_date
    dates << " -- " + @end_date.strftime("%D") if @end_date
    dates = "N/A" if !dates
    return dates
  end
=end

  def details
    format_description(@description,@type) + "event dates: " + format_date({start_date: @start_date, end_date: @end_date})
  end
end
