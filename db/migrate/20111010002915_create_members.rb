class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, :uniqueness => true
      t.string :password
      t.string :street_line_1
      t.string :street_line_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :home_phone
      t.string :mobile_phone
      t.boolean :notify_by_email
      t.boolean :notify_by_sms

      t.timestamps
    end
  end
end
