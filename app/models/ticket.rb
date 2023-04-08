class Ticket < ApplicationRecord
  has_many :employees_tickets
  has_many :tickets, through: :employees_tickets
end