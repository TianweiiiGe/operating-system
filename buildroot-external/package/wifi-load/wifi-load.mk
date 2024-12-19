#############################################################
#
# Wifi Load
#
#############################################################
WIFI_LOAD_VERSION = 0.1
WIFI_LOAD_SITE = $(BR2_EXTERNAL_HASSOS_PATH)/package/wifi-load/src
WIFI_LOAD_SITE_METHOD = local

WIFI_LOAD_DEPENDENCIES = libusb

define WIFI_LOAD_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CFLAGS=$(FLAGS) -C $(@D) all
endef

define WIFI_LOAD_INSTALL_TARGET_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(@D) install
	mkdir -p $(TARGET_DIR)/lib/firmware/w1
	cp -rf $(BR2_EXTERNAL_HASSOS_PATH)/package/wifi-load/w155s1/* $(TARGET_DIR)/lib/firmware/w1/
endef

$(eval $(generic-package))
