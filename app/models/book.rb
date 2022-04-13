class Book < ApplicationRecord

	enum issue_month: Date::MONTHNAMES.slice(1..12)

	def citation
		cite = Cite.new
		cite.generate_citation({
			source_type: 'book',
			title_of_container: title_of_container,
      authors: author_name,
      title: title,
 			city_of_publication: '',
    	publisher: publisher,
 			publication_year: publication_year,
 			volume: volume,
  	  page_range: page_range,
  	  url: url,
  	  issue_year: issue_year,
  	  issue_month: issue_month,
 		})
	end

	def chicago_book_generate_citation
		cite = Cite.new
		cite.chicago_book_generate_citation({
			source_type: 'book',
			title_of_container: title_of_container,
      authors: author_name,
      title: title,
 			city_of_publication: '',
    	publisher: publisher,
 			publication_year: publication_year,
 			volume: volume,
  	  page_range: page_range,
  	  url: url,
  	  issue_year: issue_year,
  	  issue_month: issue_month,
 		})
	end

	def author_name
		"#{author_first_name} #{author_last_name}"
	end
end
