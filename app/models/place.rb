class Place < ActiveRecord
    
    geocoded_by :address
    # calculate geocode by address when address changes
    after_validation :geocode, if: :address_changed?
    
end
