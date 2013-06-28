dep "bower.npm"
dep "yo.npm"
dep "node-inspector.npm"
dep "nodemon.npm"
dep "grunt-cli.npm"
dep "bower.npm"

dep "nodejs-basics" do
  requires "bower.npm", "yo.npm", "grunt-cli.npm", "bower.npm"
end
