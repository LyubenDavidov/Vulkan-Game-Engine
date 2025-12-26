#pragma once

#define GLFW_INCLUDE_VULKAN
#include <GLFW/glfw3.h>

#include <string>
namespace ve {
    class veWindow {

        public:
            veWindow(int w, int h, std::string name);
            ~veWindow();

            veWindow(const veWindow &) = delete;
            veWindow &operator=(const veWindow &) = delete;

            bool shouldClose() { return glfwWindowShouldClose(window); }

        private:
            void initWindow();

            const int width;
            const int height;

            std::string windowName;
            GLFWwindow *window;
    };
}