dep "bower.npm"
dep "yo.npm"
dep "node-inspector.npm"
dep "nodemon.npm"
dep "grunt-cli.npm"
dep "bower.npm"
dep "coffee.npm"

dep "nodejs-basics" do
  requires "nodejs", "bower.npm", "yo.npm", "grunt-cli.npm", "bower.npm", "coffee.npm"
end
