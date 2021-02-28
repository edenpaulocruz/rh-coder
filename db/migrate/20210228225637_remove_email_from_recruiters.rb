class RemoveEmailFromRecruiters < ActiveRecord::Migration[6.1]
  def change
    remove_column :recruiters, :email, :string
  end
end
