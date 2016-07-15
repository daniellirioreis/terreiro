json.array!(@documents) do |document|
  json.extract! document, :id, :name, :type_document, :description
  json.url document_url(document, format: :json)
end
