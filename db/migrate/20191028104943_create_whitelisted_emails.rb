class CreateWhitelistedEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :whitelisted_emails do |t|
      t.string :email, null: false
      t.boolean :used, null: false, default: false
    end
  end
end
