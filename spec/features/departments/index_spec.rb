require 'rails_helper'

RSpec.describe 'Department index page' do
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
  end

  it "shows each department's name and floor" do
    visit '/departments'
    
    expect(page).to have_content("Accounting")
    expect(page).to have_content("Sales")
    expect(page).to have_content("Software")
    expect(page).to have_content("3")
    expect(page).to have_content("5")
    expect(page).to have_content("4")
    # save_and_open_page
  end
  
  it 'shows all employees in each department' do
    visit '/departments'
    
    expect(page).to have_content('Bill Roberts')
    expect(page).to have_content('Will Two')
    expect(page).to have_content('Ted Tedston')
    expect(page).to have_content('Miller Mills')
    expect(page).to have_content('Phil Walter')
    # save_and_open_page
  end
end