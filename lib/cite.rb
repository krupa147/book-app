class Cite

  def generate_citation(options)
    clean_options = clean_hash(options)
    mla_book_generate_citation(clean_options).strip
  end

  def chicago_book_generate_citation(clean_options)
     output = ''
     output << author_info(clean_options)
     output <<  year_of_publication(clean_options[:publication_year])
     output <<  format_title(clean_options[:title]) if clean_options[:title]
     output <<  format_container_title(clean_options[:title_of_container]) if clean_options[:title_of_container]
     output << "#{format_volume(clean_options[:volume])} "
     output << "#{format_issue_no(clean_options[:issue_year], clean_options[:issue_month])}:"
     output << " #{clean_options[:page_range]}."
     output << " #{clean_options[:url]}."

     output.strip
  end

  private

  def mla_book_generate_citation(clean_options)
     output = ''
     output << author_info(clean_options)
     output <<  format_title(clean_options[:title]) if clean_options[:title]
     output <<  format_container_title(clean_options[:title_of_container]) if clean_options[:title_of_container]
     output <<  clean_options[:city_of_publication] + ": " if clean_options[:city_of_publication]
     output <<  clean_options[:publisher] + ", " if clean_options[:publisher]
     output <<  year_of_publication(clean_options[:publication_year])
     output <<  clean_options[:medium] + "." if clean_options[:medium]

     output
  end

  def format_volume(volume)
    "no. #{volume}"
  end

  def format_issue_no(issue_year, issue_month)
    "(#{issue_month} #{issue_year})"
  end



  def format_title(title)
    "&quot;#{punctuated_title(title)}&quot; "
  end

  def format_container_title(container_title)
    "<i>;#{punctuated_title(container_title)}</i>; "
  end

  def punctuated_title(title)
    ending_puncutuation_present = %w[? ! .].include?(title[-1])
    "#{title}#{'.' unless ending_puncutuation_present}"
  end

  def authors(option)
    author_string = ''
    if option.is_a? String
      # if passed a string, cast it to an array
      # then rename that array to option to be
      #consistent with the rest of the method
      author = []
      author << option
      option = author
    end

    option.each_with_index do |author, index|
      if author =~ /,/
        # Doe, John A.
        author_string += author.to_s
        # option.length - 1 checks if last entry in array of authors
        #   if so, end with period, else, 'and , '
        author_string += index == option.length - 1 ? ". " : "and , "
      else
        # John Doe or John A. Doe
        name = author.split(" ")
        middle_initial = author.scan(/ \w\. /)
        author_string += name.last.to_s + ", " + name.first.to_s + middle_initial.first.to_s
        # add a period if it's the last entry and NOT a name with a middle initial
        author_string += index == option.length - 1 ? ". " : ", and " if middle_initial.empty?
      end
    end
    author_string.to_s
  end

  def author_info(clean_options)
    if clean_options[:authors]
      authors(clean_options[:authors])
    elsif clean_options[:author]
      authors(clean_options[:author])
    else
      # return empty string so it can concat it without error
      ''
    end
  end

   def year_of_publication(option)
    if option
      option.to_s + ". "
    else
      'n.d. '
    end
  end

  def clean_hash(options)
    clean_options = {}
    if options.class.ancestors.to_s.include?('ActiveRecord::Base')
      options = options.attributes
    end

    ## delete any " in key (usually from ActiveRecord object) and turn it to a symbol
    ## we also call to_s on any present values in case a date or year is saved
    ## as an integer in the database
    options.map do |key, value|
      if value == ''
        cleaned_key = ( key.is_a? Symbol ) ? key : key.delete('"').to_sym
        clean_options[cleaned_key] = nil
      else
        cleaned_key = ( key.is_a? Symbol ) ? key : key.delete('"').to_sym
        clean_options[cleaned_key] = value
      end
    end
    clean_options
  end

end