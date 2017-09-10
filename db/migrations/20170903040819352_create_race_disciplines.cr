class CreateRaceDisciplines20170903040819352 < Jennifer::Migration::Base
  def up
    create_table(:race_disciplines) do |t|
      t.reference :race
      t.reference :discipline
      t.integer :position
      t.float :distance
      t.timestamps
    end
  end

  def down
    drop_table(:race_disciplines)
  end
end
