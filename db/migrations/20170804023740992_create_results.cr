class CreateResults20170804023740992 < Jennifer::Migration::Base
  def up
    create_table(:results) do |t|
      t.reference :user
      t.reference :group
      t.reference :race
      t.json :disciplines
      t.timestamps
    end
  end

  def down
    drop_table(:results)
  end
end
