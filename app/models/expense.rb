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

  
end
