namespace :db do
  namespace :admin do
    desc "create admin username and password"
    task :create => :environment do
      require File.join(Rails.root, 'db', 'sample', 'users.rb')
    end  
  end
end