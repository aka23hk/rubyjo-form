class CreateMails < ActiveRecord::Migration
  def change
  	create_table :mails do |t|
  		t.string  :email
     	t.string :message
      	t.timestamps null: false
    end
  end
end
