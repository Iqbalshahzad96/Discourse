import DiscourseRoute from "discourse/routes/discourse";
import PreloadStore from "discourse/lib/preload-store";
import { ajax } from "discourse/lib/ajax";

export default DiscourseRoute.extend({
  model() {
    if (PreloadStore.data.has("user_2fa_settings")) {
      return PreloadStore.getAndRemove("user_2fa_settings");
    } else {
      return ajax("/session/confirm-2fa.json", { type: "GET" });
    }
  },
});
