# This has to be runned with    rake updated_confirmed_at_users    if we have already users that are unconfirmed
task :updated_confirmed_at_users => :environment do
    User.all.each do |user|
    user.update(confirmed_at: DateTime.now)
   end
end