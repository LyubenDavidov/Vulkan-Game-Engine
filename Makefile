# ---- Config -------------------------------------------------
CXX := clang++
TARGET := app
SRC := $(wildcard src/*.cpp)
BUILD_DIR := build
OBJ := $(patsubst src/%.cpp,$(BUILD_DIR)/%.o,$(SRC))

# Homebrew prefix (auto-detect)
BREW_PREFIX := $(shell brew --prefix)

# Vulkan SDK path:
# Set this to where you extracted the VulkanSDK.
# Example: /Users/you/SDKs/VulkanSDK/1.3.xxx.x/macOS
VULKAN_SDK ?= $(HOME)/VulkanSDK/1.4.335.1/macOS

# ---- Flags --------------------------------------------------
CXXFLAGS := -std=c++20 -Wall -Wextra -O2 \
	-I$(BREW_PREFIX)/include \
	-I$(VULKAN_SDK)/include

LDFLAGS := \
	-L$(BREW_PREFIX)/lib \
	-L$(VULKAN_SDK)/lib

# Libraries: GLFW (from brew) + Vulkan loader (from SDK)
# GLM is header-only -> no -lglm
LDLIBS := -lglfw -lvulkan.1

# macOS frameworks commonly needed for GLFW windowing
FRAMEWORKS := -framework Cocoa -framework IOKit -framework CoreVideo

# ---- Targets ------------------------------------------------
all: $(TARGET)

$(TARGET): $(OBJ)
	$(CXX) $(OBJ) -o $@ $(LDFLAGS) $(LDLIBS) $(FRAMEWORKS)

$(BUILD_DIR)/%.o: src/%.cpp
	mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR) $(TARGET)

run: $(TARGET)
	./$(TARGET)

.PHONY: all clean run
