class Bite

  include Mongoid::Document
  include Mongoid::Timestamps
  field :chef, type: String
  field :bite, type: String

  validates :chef, presence: :true
  validates :bite, presence: :true

end
