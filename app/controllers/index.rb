require_relative '../models/word'

get '/:word' do
  # Look in app/views/index.erb
  new_word = Word.new
  @matching_sorted_word = new_word.anagram_for?(params[:word])
  erb :index
end


# class CreateWords < ActiveRecord::Migration
#   def change
#     create_table :words do |t|
#       t.string :text
#     end
#   end
# end

# class ChangeWords < ActiveRecord::Migration
#   def up
#     add_column :words, :text_sorted, :string
#   end
# end