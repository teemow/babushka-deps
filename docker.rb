dep "lxc-docker.yaourt" do
  provides "docker"
end

dep "docker" do
  requires "lxc-docker.yaourt"
end
