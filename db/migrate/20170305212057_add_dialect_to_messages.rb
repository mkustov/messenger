class AddDialectToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :dialect, :string
  end
end
