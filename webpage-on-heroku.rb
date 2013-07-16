dep "generator-angular.npm"
dep "compass.gem"

dep "webpage-on-heroku" do
  requires "nodejs-basics", "generator-angular.npm", "compass.gem", "yo-heroku"
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
