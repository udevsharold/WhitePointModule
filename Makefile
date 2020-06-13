DEBUG=0
FINALPACKAGE=1

include $(THEOS)/makefiles/common.mk

export TARGET = iphone:clang:12.1.2:11.0
export ARCHS = arm64 arm64e

BUNDLE_NAME = WhitePointModule
WhitePointModule_BUNDLE_EXTENSION = bundle
WhitePointModule_FILES = $(wildcard *.m)
WhitePointModule_FRAMEWORKS = MediaAccessibility Preferences
WhitePointModule_PRIVATE_FRAMEWORKS = ControlCenterUIKit AccessibilityUtilities
WhitePointModule_LIBRARIES = activator
WhitePointModule_CFLAGS = -fobjc-arc
WhitePointModule_INSTALL_PATH = /Library/ControlCenter/Bundles/

after-install::
	install.exec "killall -9 SpringBoard"

include $(THEOS_MAKE_PATH)/bundle.mk
