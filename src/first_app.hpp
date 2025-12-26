#pragma once

#include "ve_window.hpp"

namespace ve {
    class FirstApp {

        public:
            static constexpr int WIDTH = 800;
            static constexpr int HEIGHT = 800;

            void run();

        private:
            veWindow veWindow{WIDTH, HEIGHT, "Hello Vulkan!"};

    };
} // namespace ve
