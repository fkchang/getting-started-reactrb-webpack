namespace :js do
  desc 'installs node modules defined in package.json'
  task 'install' do
    sh 'npm install'
  end

  desc 'generates webpack.bundle.js into app/assets/javascripts'
  task 'generate' do
    sh 'webpack -c webpack.config.js'
  end

  desc 'installs node modules and generates webpack.bundle.js'
  task 'all' => [:install, :generate]

  desc 'starts webpack in watch mode to auto generate a new webpack.config.js when code in ./webpack changes'
  task 'watch' do
    sh 'webpack -c webpack.config.js -w &'
  end


end
