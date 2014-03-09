class Study
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields
  store_in collection: "study_rank2"

  # field <name>, :type => <type>, :default => <value>
  field :_id, :type => Hash
  field :value,:type => Hash

  # You can define indexes on documents using the index macro:
  # index :field <, :unique => true>

  # You can create a composite key in mongoid to replace the default id using the key macro:
  # key :field <, :another_field, :one_more ....>
end
