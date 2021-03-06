class <%= migration_class_name %> < ActiveRecord::Migration
  def self.up
    create_table :audits, :force => true do |t|
      t.column :id, :string
      t.column :auditable_id, :string
      t.column :organization_id, :string
      t.column :auditable_type, :string
      t.column :associated_id, :string
      t.column :associated_type, :string
      t.column :user_id, :string
      t.column :user_type, :string
      t.column :user_role, :string
      t.column :username, :string
      t.column :action, :string
      t.column :audited_changes, :text
      t.column :version, :integer, :default => 0
      t.column :comment, :string
      t.column :remote_address, :string
      t.column :request_uuid, :string
      t.column :created_at, :datetime
    end

    add_index :audits, [:auditable_id, :auditable_type], :name => 'auditable_index'
    add_index :audits, [:associated_id, :associated_type], :name => 'associated_index'
    add_index :audits, [:user_id, :user_type], :name => 'user_index'
    add_index :audits, :request_uuid
    add_index :audits, :created_at
  end

  def self.down
    drop_table :audits
  end
end
