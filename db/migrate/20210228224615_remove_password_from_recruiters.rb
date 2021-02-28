class RemovePasswordFromRecruiters < ActiveRecord::Migration[6.1]
  def change
    remove_column :recruiters, :password, :string
  end
end
