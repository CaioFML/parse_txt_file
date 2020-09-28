class RenameColumnTypeForKindInPerson < ActiveRecord::Migration[5.2]
  def change
    rename_column :people, :type, :kind
  end
end
