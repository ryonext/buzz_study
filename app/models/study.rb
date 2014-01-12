class Study
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields
  store_in collection: "uri"

  # field <name>, :type => <type>, :default => <value>
  field :tweet_id, :type => String
  field :uri, :type => String

  # You can define indexes on documents using the index macro:
  # index :field <, :unique => true>

  # You can create a composite key in mongoid to replace the default id using the key macro:
  # key :field <, :another_field, :one_more ....>
  
  class << self
    def grouped_collection
      Study.collection.aggregate(
        {
          "$group" => {
            "_id" => "$uri",
            "count" => {
              "$sum" => 1
            }
          }
        }, 
        {
          "$sort" => {
            "count" => -1
          }
        }
      )
    end
  end
end
