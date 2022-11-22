#include "sokol.h"
#include "text.h"

struct DemoState {
  struct sg_pass_action action_clear;
};

void init(void* raw_state) {
  struct DemoState* state = raw_state;
  sg_setup(&(sg_desc){
      .context = sapp_sgcontext()
  });
  state->action_clear = (sg_pass_action) {
      .colors[0] = { .action=SG_ACTION_CLEAR, .value={1.0f, 0.0f, 0.0f, 1.0f} }
  };
}

void frame(void* raw_state) {
  struct DemoState* state = raw_state;
  float g = state->action_clear.colors[0].value.g + 0.01f;
  state->action_clear.colors[0].value.g = (g > 1.0f) ? 0.0f : g;
  sg_begin_default_pass(&state->action_clear, sapp_width(), sapp_height());
  sg_end_pass();
  sg_commit();
}

void cleanup(void) {
  sg_shutdown();
}

int main(int argc, char** argv) {
  (void)argc;
  (void)argv;
  struct DemoState state;
  sapp_desc app_desc = {
      .init_userdata_cb = init,
      .frame_userdata_cb = frame,
      .cleanup_cb = cleanup,
      .width = 1920,
      .height = 1080,
      .window_title = "sokol-msdf-text",
      .user_data = &state,
  };
  sapp_run(&app_desc);
  return 0;
}
