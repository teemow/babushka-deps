dep "generator-angular.npm"
dep "generator-heroku.npm"
dep "coffee.npm"
dep "compass.gem"

dep "webpage-on-heroku" do
  requires "nodejs", "nodejs-basics", "heroku-toolbelt.yaourt", "generator-angular.npm", "compass.gem", "generator-heroku.npm", "coffee.npm"
end
