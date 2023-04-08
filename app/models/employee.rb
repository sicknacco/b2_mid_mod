class Employee < ApplicationRecord
  belongs_to :department
  has_many :employees_tickets
  has_many :tickets, through: :employee_tickets
end