module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    # If we write the mapping here and run create_index for each model then all the fields mentioned in this mapping bloack will be stored in ES 
        # even though those fields not available in mode.
    # mapping do
    #   indexes :email, type: :text
    #   indexes :name, type: :text
    # end

    def self.search(query)
      self.__elasticsearch__.search(query)
    end
  end
end
