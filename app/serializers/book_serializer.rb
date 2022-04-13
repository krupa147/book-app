class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :publisher, :author_name, :citation, :chicago_style_citation
end