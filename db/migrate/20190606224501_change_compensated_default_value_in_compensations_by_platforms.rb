class ChangeCompensatedDefaultValueInCompensationsByPlatforms < ActiveRecord::Migration[5.1]
  def change
    change_column_default :compensations_by_platforms, :compensated, 'False'
  end
end
