require 'rails_helper'

RSpec.describe Ticket do
  describe 'relationships' do
    it {should have_many :employees_tickets}
    it {should have_many :tickets}
  end
end