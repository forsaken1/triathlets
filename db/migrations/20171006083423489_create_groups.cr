class CreateGroups20171006083423489 < Jennifer::Migration::Base
  def up
    create_table(:groups) do |t|
      t.string :name
      t.timestamps
    end
  end

  def down
    drop_table(:groups)
  end
end
