class CreateRedmineReports < ActiveRecord::Migration
  def change
    create_table :redmine_reports do |t|
      t.integer :user_id
      t.integer :public_flg
      t.string :title
      t.text :sql
      t.integer :times
    end
  end
end
