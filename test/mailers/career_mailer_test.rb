require 'test_helper'

class CareerMailerTest < ActiveSupport::TestCase
  setup do
    @admin1 = User.create name: 'admin1', email: 'lits.test.mailbox@gmail.com', password: 'lits123!@#', password_confirmation: 'lits123!@#', role: 2
    @admin2 = User.create name: 'admin2', email: 'lits.test.mailbox@gmail.com', password: 'lits123!@#', password_confirmation: 'lits123!@#', role: 2
    @hr = User.create name: 'hr1', email: 'lits.test.mailbox@gmail.com', password: 'lits123!@#', password_confirmation: 'lits123!@#', role: 1
  end

  test 'notifies admins with mail after vacancy was creted' do
    @vacancy = Vacancy.create name: 'Test vacancy', description: 'bla-bla-bla', user: @hr
    p CareerMailer.deliveries[0].body.to_s
    assert CareerMailer.deliveries.count == 1
  end
end
