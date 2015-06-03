class Denun < ActiveRecord::Base
  belongs_to :denun_type
  has_many :comments
end
