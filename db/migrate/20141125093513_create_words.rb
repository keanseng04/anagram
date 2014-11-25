# require_relative '../../config'

class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :dictionary_word
    end
  end

end