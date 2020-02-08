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
  
  scope :expense_type_id, -> (type_id) {where(type_id: type_id)}
  scope :expense_category_id, -> (category_id) {where(category_id: category_id)}

  def self.total(expenses)
    expenses.empty? ? 0 : expenses.map { |expense| expense[:amount].to_f }.reduce(:+)
  end
  
   # source -  https://github.com/ankane/groupdate
  def self.extract_month_list(expenses = Expense.all)
    expenses.group_by_month(:date, format: "%b %Y").count.keys
  end 

  scope :current_month, -> {
    start = Time.zone.now
    where(date: start.beginning_of_month..start.end_of_month )  
  }







  

  
end
