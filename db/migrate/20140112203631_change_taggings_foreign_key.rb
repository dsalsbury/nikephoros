class ChangeTaggingsForeignKey < ActiveRecord::Migration
  def change
    change_table(:taggings) do |t|
      t.remove_index :article_id
      t.rename       :article_id, :document_id
      t.string       :document_type
      t.index        [:document_id, :document_type]
    end

    Tagging.update_all(document_type: 'Article')
  end
end
