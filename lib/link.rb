class LinkItem
  include Listable
  attr_reader :description, :site_name, :type

@@links=[]

  def initialize(url, options={})
    @description = url
    @site_name = options[:site_name]
    @type="link"
    @@links << self
  end

=begin
  def format_description
    "#{@description}".ljust(25)
  end
=end

def self.all
  @@links
end

  def format_name
    @site_name ? @site_name : ""
  end

  def details
    format_description(@description,@type) + "site name: " + format_name
  end
end
