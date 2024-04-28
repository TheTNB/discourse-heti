# frozen_string_literal: true

# name: discourse-heti
# about: Integrate Heti styling and functionality into Discourse.
# version: 1.0.0
# authors: TreeNewBee
# url: https://github.com/TheTNB/discourse-heti
# required_version: 2.7.0

module ::DiscourseHeti
  PLUGIN_NAME = "discourse-heti"
end

register_asset "stylesheets/heti.min.css"
register_asset "stylesheets/heti.scss"

after_initialize do
  # Code which should run after Rails has finished booting
end
