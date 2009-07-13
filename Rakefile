# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'

begin
  require 'metric_fu'

  MetricFu::Configuration.run do |config|
    config.rcov.merge! :rcov_opts => ["--sort coverage",
                                      "--no-html",
                                      "--text-coverage",
                                      "--no-color",
                                      "--profile",
                                      "--rails",
                                      "--exclude spec/*,gems/*"]
  end
rescue Exception
end

task :build => [:'db:migrate', :spec, :'metrics:all']

