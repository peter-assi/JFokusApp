class Shout
  include DataMapper::Resource

  property :id, Serial
  property :message, Text, :required => true

end
