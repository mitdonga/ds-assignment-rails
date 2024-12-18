class AddReferralCodeToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :referral_code, :string, default: -> { "substr(md5(random()::text), 0, 6)" }
    add_reference :users, :referrer, foreign_key: { to_table: :users }
  end
end
