class DeviseCreateGods < ActiveRecord::Migration
  def self.up
    create_table(:gods) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      ## Trackable
      t.integer  :sign_in_count, default: 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.integer :failed_attempts,:default=>3
      t.string :unlock_token
      t.datetime :locked_at

      t.timestamps
    end
  end

  def self.down
    drop_table :gods
  end


end
