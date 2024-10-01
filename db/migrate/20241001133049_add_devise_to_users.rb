class AddDeviseToUsers < ActiveRecord::Migration[7.2]
  def self.up
    change_table :users do |t|
      ## Database authenticatable
      t.string :encrypted_password, null: false, default: "" unless column_exists? :users, :encrypted_password

      ## Recoverable
      t.string   :reset_password_token unless column_exists? :users, :reset_password_token
      t.datetime :reset_password_sent_at unless column_exists? :users, :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at unless column_exists? :users, :remember_created_at

      ## Add any other Devise modules you want

      # Add the role column if it doesn't exist
      t.string :role unless column_exists? :users, :role
    end

    add_index :users, :email,                unique: true unless index_exists? :users, :email
    add_index :users, :reset_password_token, unique: true unless index_exists? :users, :reset_password_token
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end