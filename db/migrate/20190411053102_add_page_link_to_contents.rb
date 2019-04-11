class AddPageLinkToContents < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :page_link, :text
  end
end
