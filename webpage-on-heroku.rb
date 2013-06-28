dep "generator-angular.npm"
dep "generator-heroku.npm"
dep "coffee.npm"
dep "compass.gem"

dep "webpage-on-heroku" do
  requires "nodejs", "nodejs-basics", "heroku-toolbelt.yaourt", "generator-angular.npm", "compass.gem", "generator-heroku.npm", "coffee.npm"
  met? {
    hostname = shell "hostname"
    log ""
    log "Don't forget!"
    log ""
    log "$ cd ~/#{hostname}"
    log "$ yo angular #{hostname} --coffee"
    log "$ npm install"
    log "$ bower install"
    log "$ grunt build"
    log "$ yo heroku"
    log ""
    true
  }
end
