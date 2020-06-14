INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WhitePointModulePlugin
WhitePointModulePlugin_PRIVATE_FRAMEWORKS = AccessibilityUtilities
WhitePointModulePlugin_LIBRARIES = activator
WhitePointModulePlugin_FILES = Tweak.xm
WhitePointModulePlugin_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
