import { Heti } from "heti";
import { withPluginApi } from "discourse/lib/plugin-api";

function initializeHeti() {
  const heti = new Heti(".heti");
  heti.autoSpacing();
}

export default {
  name: "initialize-heti",
  initialize() {
    withPluginApi("0.8.31", (api) => {
      api.onAppEvent("page:changed", () => {
        initializeHeti();
      });
      api.onPageChange(() => {
        initializeHeti();
      });
    });
  },
};
