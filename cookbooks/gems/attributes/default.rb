default[:gems][:gems] = %w[
  bundler
]

if Console.profile? :orange, :blue
  default[:gems][:gems] += %w[
    rubocop
    rubocop-rails
    rubocop-rspec
  ]
end
