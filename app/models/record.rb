class Record < ApplicationRecord
validates :title, length: { minimum: 4}
validates :title, :date, :amount, presence: true
  def self.balance
    where("amount>?",0).sum(:amount)
  end

  def self.debt
    where("amount<?",0).sum(:amount)
  end

  def self.total
    total = self.balance + self.debt
  end
end
