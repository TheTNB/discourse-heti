import { withPluginApi } from "discourse/lib/plugin-api";

export default {
  name: "initialize-heti",
  initialize() {
    withPluginApi("0.8.31", (api) => {
      api.decorateCooked(($elem) => {
        if (!$elem.hasClass("heti")) {
          $elem.addClass("heti");
        }

        if ($elem.hasClass("d-editor-preview")) {
          /* eslint-disable no-undef */
          new Heti(".d-editor-preview").autoSpacing();
        } else {
          const randomClass = "heti-" + Date.now();
          $elem.addClass(randomClass);
          /* eslint-disable no-undef */
          new Heti("." + randomClass).autoSpacing();
        }
      });
    });
  },
};
