class CreateDisciplines20170903035431202 < Jennifer::Migration::Base
  def up
    create_table(:disciplines) do |t|
      t.string :name
      t.timestamps
    end
  end

  def down
    drop_table(:disciplines)
  end
end
