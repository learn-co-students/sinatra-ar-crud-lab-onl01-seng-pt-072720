#Placeholder for a model

class Article < ActiveRecord::Base

    def up 
        create_table :articles do |t|
            t.string :title
            t.string :content
        end
    end

    def down 
        
    end

end