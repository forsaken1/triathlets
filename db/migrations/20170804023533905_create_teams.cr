class CreateTeams20170804023533905 < Jennifer::Migration::Base
  def up
    create_table(:teams) do |t|
      t.string :name
      t.timestamps
    end
  end

  def down
    drop_table(:teams)
  end
end
