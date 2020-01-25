# == Schema Information
#
# Table name: expenses
#
#  id          :integer          not null, primary key
#  date        :date
#  amount      :decimal(, )
#  concept     :string
#  type_id     :integer
#  category_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Expense < ApplicationRecord
  belongs_to :type
  belongs_to :category
  belongs_to :user

  validates :date, presence: true
  validates :amount, presence: true
  validates :concept, presence: true
  
  #scope :purchase_id  , -> {where(:type_id => 2 )}

  
  scope :purchase_id  , -> (type_id) {where("type_id LIKE ?", type_id )}
  scope :purchase_id  , -> (type_id) {where("type_id LIKE ?", type_id )}


  #scope :colored, -> (color) {where("color LIKE ?", color)

  #scope :purchase_id  , -> {where(:concept => "prueba" )}

  #scope :by_type, -> name {where(:name => name)}X|

  #scope :by_type, ->  {where(:name => name)}

  #scope :by_type  , -> name
  #{where(:name => name )}

 
 # scope :by_type, -> (name)
 # {where("name LIKE ?", name )}
  

  
end
