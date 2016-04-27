actions :write

attribute :message, :kind_of => String, :name_attribute => true
attribute :color, :kind_of => Symbol, :equal_to => [:magenta, :cyan, :red, :blue, :yellow, :green], :default => :cyan
attribute :level, :equal_to => [ :debug, :info, :warn, :error, :fatal ], :default => :info

# Defining default action
def initialize(*args)
  super
  @action = :write
end