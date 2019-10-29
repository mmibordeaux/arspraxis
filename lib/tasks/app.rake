namespace :app do
  namespace :db do
    desc 'Dump production database to localhost'

    task production: :environment do
      Bundler.with_clean_env do
        begin
          sh 'heroku pg:backups capture'
          sh 'curl -o latest.dump `heroku pg:backups public-url`'
          sh 'DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rake db:drop'
          sh 'bundle exec rake db:create'
          sh "pg_restore --verbose --clean --no-acl --no-owner -h localhost -U postgres -d praxis_development latest.dump"
          sh 'bundle exec rake db:migrate'
          sh 'rm latest.dump'
        rescue
          'There was warnings/errors while restoring'
        end
      end
    end
  end
end
