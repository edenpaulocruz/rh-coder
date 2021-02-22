class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :cnpj
      t.text :adress
      t.string :website
      t.string :facebook
      t.string :instagram
      t.string :linkedin
      t.string :twitter
      t.string :business_line

      t.timestamps
    end
  end
end
