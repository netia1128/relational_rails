class ChangeSalesToAnnualSales < ActiveRecord::Migration[5.2]
  def change
    rename_column :franchisees, :sales, :annual_sales
  end
end
