json.array!(@document_topic_sub_topics) do |document_topic_sub_topic|
  json.extract! document_topic_sub_topic, :id, :document_topic_id, :number, :name, :description
  json.url document_topic_sub_topic_url(document_topic_sub_topic, format: :json)
end
