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
    
    expect(page).to have_content("Bill Roberts")
    expect(page).to have_content("Will Two")
    expect(page).to have_content("Ted Tedston")
    expect(page).to have_content("Miller Mills")
    expect(page).to have_content("Phill Walter")
  end
end