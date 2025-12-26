#include "ve_window.hpp"

namespace ve {
    veWindow::veWindow(int w, int h, std::string name) : width{w}, height{h}, windowName{name} {
        initWindow();
    }

    veWindow::~veWindow() {
        glfwDestroyWindow(window);
        glfwTerminate();
    }

    void veWindow::initWindow() {
        glfwInit();
        glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API);
        glfwWindowHint(GLFW_RESIZABLE, GLFW_FALSE);

        window = glfwCreateWindow(width, height, windowName.c_str(), nullptr, nullptr);

    }
}
