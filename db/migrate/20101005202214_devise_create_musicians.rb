class DeviseCreateMusicians < ActiveRecord::Migration
  def self.up
    create_table(:musicians) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :musicians, :email,                :unique => true
    add_index :musicians, :reset_password_token, :unique => true
    # add_index :musicians, :confirmation_token,   :unique => true
    # add_index :musicians, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :musicians
  end
end
