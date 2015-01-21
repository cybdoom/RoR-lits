class AddEmailToUser < ActiveRecord::Migration
  def change
    add_column :users, :email, :string, default: 'some.invalid.email@domen.com'

    User.update_all(email: 'some.invalid.email@domen.com')
  end
end
