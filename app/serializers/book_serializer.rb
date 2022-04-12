class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :publisher
end