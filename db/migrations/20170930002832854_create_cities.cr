class CreateCities20170930002832854 < Jennifer::Migration::Base
  def up
    create_table(:cities) do |t|
      t.string :name
      t.timestamps
    end
  end

  def down
    drop_table(:cities)
  end
end
