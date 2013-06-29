dep "ahead" do
  setup { @repo = Babushka::GitRepo.new('~/.babushka/deps')}
  met? { !@repo.ahead? }
  meet {
    @repo.repo_shell('git push -u origin master')
  }
end

dep "behind" do
  setup { @repo = Babushka::GitRepo.new('~/.babushka/deps')}
  met? { !@repo.behind? }
  meet {
    @repo.repo_shell('git pull')
  }
end

dep "update" do
  requires "behind", "ahead"
end
