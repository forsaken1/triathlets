class CreateUsers20170804022043741 < Jennifer::Migration::Base
  def up
    create_table(:users) do |t|
      t.string :name
      t.string :qualification
      t.integer :year
      t.timestamps
    end
  end

  def down
    drop_table(:users)
  end
end
