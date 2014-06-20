set :stage, :production

set :default_environment, {
  'ENV' => "production",
  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}

role :app, "deploy@renotify.us"
