dep "generator-meanstack.npm"

dep "meanstack" do
  requires "mongodb.bin", "nodejs-basics", "generator-meanstack.npm", "heroku-toolbelt.yaourt"
  met? {
    hostname = shell "hostname"
    log ""
    log "Don't forget!"
    log ""
    log "$ cd ~/#{hostname}"
    log "$ yo meanstack #{hostname}"
    log ""
    true
  }
end
