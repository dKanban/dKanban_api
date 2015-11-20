namespace :map_events do
  desc "Rake task to get events data"
  task :fetch => :environment do
    puts "#{Time.now} - Success rai!"
  end
end