class CreateRaces20170804023731521 < Jennifer::Migration::Base
  def up
    create_table(:races) do |t|
      t.string :title
      t.text :description
      t.timestamps
    end
  end

  def down
    drop_table(:races)
  end
end
