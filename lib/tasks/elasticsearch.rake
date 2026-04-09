# lib/tasks/elasticsearch.rake

namespace :elasticsearch do
  desc "Reindex User model in Elasticsearch"
  task reindex_users: :environment do

    begin
      User.__elasticsearch__.delete_index!

    rescue => e
      puts "⚠️  Could not delete index: #{e.message}"
    end

    User.__elasticsearch__.create_index!

    result = User.import(force: true, batch_size: 1000)

    puts result
  end
end
