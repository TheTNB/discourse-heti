# frozen_string_literal: true

# name: discourse-heti
# about: Integrate Heti styling and functionality into Discourse.
# version: 1.0.0
# authors: TreeNewBee
# url: https://github.com/TheTNB/discourse-heti
# required_version: 2.7.0

enabled_site_setting :discourse_heti_enabled

module ::DiscourseHeti
  PLUGIN_NAME = "discourse-heti"
end

after_initialize do
  # Code which should run after Rails has finished booting
end
