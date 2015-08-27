module SpreeAnalyticsDashboard
  module Generators
    class InstallGenerator < Rails::Generators::Base

      class_option :skip_migrations, :type => :boolean, :default => false, :description => "Skips the `run_migrations` step"

      desc "Installs required migrations for spree_analytics_dashboard"

      def install_migrations
      	run "bundle exec rails g impressionist"
      end

    end
  end
end
