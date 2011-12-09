class AddRetrospectiveToNote < ActiveRecord::Migration
  def change
    add_column :notes, :retrospective, :string, :default => 'current'
  end
end
