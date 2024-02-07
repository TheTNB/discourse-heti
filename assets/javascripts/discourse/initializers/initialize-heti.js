import { withPluginApi } from "discourse/lib/plugin-api";
import Heti from "../lib/heti";

function initializeHeti() {
  document.querySelectorAll("div.cooked").forEach(function (element) {
    element.classList.add("heti");
  });
  const heti = new Heti(".heti");
  heti.autoSpacing();
}

export default {
  name: "initialize-heti",
  initialize() {
    withPluginApi("0.8.31", (api) => {
      api.onPageChange(() => {
        initializeHeti();
      });
      initializeHeti();
    });
  },
};
