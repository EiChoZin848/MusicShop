class Instrument < ActiveRecord::Base
    #attr_accessible :brand, :model, :description, :condition, :finish, :title, :price, :image

    before_destroy :not_referenced_by_any_line_itemm
    mount_uploader :image, ImageUploader
    #serialize :image, JSON
    belongs_to :user
    has_many :line_items

    validates_presence_of :title, :brand, :price, :model, :image
    validates_length_of :description, :maximum => 1000, :too_long => "%{count} characters is the maximum aloud. " 
    validates_length_of :title, :maximum => 140, :too_long => "%{count} characters is the maximum aloud. " 
    validates_numericality_of :price, :only_integer => true
   

    BRAND = %w{ Fender Gibson Epiphone ESP Martin Dean Taylor Jackson PRS Ibanez Charvel Washburn}
    FINISH = %w{ Black White Navy Blue Red Clear Satin Yellow Seafoam}
    CONDITION = %w{ New Excellent Mint Used Fair Poor}
    
    private

        def not_referenced_by_any_line_itemm
            unless line_items.empty?
                errors.add(:base, "Line items present")
                throw :abort
            end
        end
end
