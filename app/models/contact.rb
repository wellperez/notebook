class Contact < ActiveRecord::Base
  belongs_to :kind
  has_one :address
  has_many :phones
  
  validates :name, presence: true, length: { minimum: 3 }
  
  validates :email, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true
end