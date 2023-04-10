class Department < ApplicationRecord
  has_many :employees

  def dept_employees
    employees.pluck(:name).to_sentence
  end
end