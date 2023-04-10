require 'rails_helper'

RSpec.describe 'employees show page' do
  before(:each) do
    @accounting = Department.create!(name: "Accounting", floor: "3")
    @sales = Department.create!(name: "Sales", floor: "5")
    @software = Department.create!(name: "Software", floor: "4")
    
    @bill = @accounting.employees.create!(name: "Bill Roberts", level: 2)
    @will = @accounting.employees.create!(name: "Will Two", level: 3)
    @ted = @sales.employees.create!(name: "Ted Tedston", level: 6)
    @miller = @software.employees.create!(name: "Miller Mills", level: 3)
    @phil = @software.employees.create!(name: "Phil Walter", level: 1)

    @ticket_1 = Ticket.create!(subject: "New Computer", age: 4)
    @ticket_2 = Ticket.create!(subject: "Mini fridge", age: 1)
    @ticket_3 = Ticket.create!(subject: "Lunch Money", age: 2)
    @ticket_4 = Ticket.create!(subject: "Office Supplies", age: 3)
    @ticket_5 = Ticket.create!(subject: "Broken Printer", age: 9)


    @bill_computer = EmployeeTicket.create!(employee: @bill, ticket: @ticket_1)
    @will_fridge = EmployeeTicket.create!(employee: @will, ticket: @ticket_2)
    @bill_lunch = EmployeeTicket.create!(employee: @bill, ticket: @ticket_3)
    @ted_printer = EmployeeTicket.create!(employee: @ted, ticket: @ticket_5)
    @miller_printer = EmployeeTicket.create!(employee: @miller, ticket: @ticket_5)
    @phil_supplies = EmployeeTicket.create!(employee: @phil, ticket: @ticket_4)
    @phil_lunch = EmployeeTicket.create!(employee: @phil, ticket: @ticket_3)
    @phil_computer = EmployeeTicket.create!(employee: @phil, ticket: @ticket_1)
  end

  it 'shows the employee name and department' do
    visit "/employees/#{@bill.id}"

    expect(page).to have_content("Name: Bill Roberts")
    expect(page).to have_content("Department: Accounting")
  end

  it 'lists all of an employees tickets from oldest to youngest'
end