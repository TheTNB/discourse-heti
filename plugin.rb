# frozen_string_literal: true

# name: discourse-heti
# about: Integrate Heti styling and functionality into Discourse.
# version: 1.0.0
# authors: TreeNewBee
# url: https://github.com/TheTNB/discourse-heti
# required_version: 2.7.0

enabled_site_setting :heti_enabled

module ::DiscourseHeti
  PLUGIN_NAME = "discourse-heti"
end

after_initialize do
  DiscourseEvent.on(:post_cooked) do |doc, post|
    doc.css("div.cooked").each { |div| div["class"] += " heti" }
  end
end
