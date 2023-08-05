namespace :points do
  desc "pointをresetします"
  task reset: :environment do
    Point.destroy_all
  end
end

