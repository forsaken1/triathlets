class CreateResultDisciplines20170903041017147 < Jennifer::Migration::Base
  def up
    create_table(:result_disciplines) do |t|
      t.reference :result
      t.reference :discipline
      t.integer :position
      t.string :time
      t.timestamps
    end
  end

  def down
    drop_table(:result_disciplines)
  end
end
