class AddAdminToRecruiters < ActiveRecord::Migration[6.1]
  def change
    add_column :recruiters, :admin, :boolean
  end
end
