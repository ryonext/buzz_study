class Study
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields
  store_in collection: "tweet"

  # field <name>, :type => <type>, :default => <value>
  field :id, :type => String
  field :original_url, :type => String

  # You can define indexes on documents using the index macro:
  # index :field <, :unique => true>

  # You can create a composite key in mongoid to replace the default id using the key macro:
  # key :field <, :another_field, :one_more ....>

  class << self
    def grouped_collection
      result = Study.collection.aggregate(
        {
          "$group" => {
            "_id" => "$original_url",
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
      10.times.map do |i|
        RankedItem.new(
          result[i]["_id"], #uri
          result[i]["count"]
        )
      end
    end
  end
end
