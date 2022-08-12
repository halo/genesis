default[:gems][:gems] = %w[
]

if Console.profile? :orange
  default[:gems][:gems] += %w[
    rubocop
    rubocop-rails
    rubocop-rspec
  ]
end
