################################################################################
# chip-ota-provider-app Buildroot Package
################################################################################

CHIP_OTA_PROVIDER_APP_VERSION = 2024.7.2
CHIP_OTA_PROVIDER_APP_LICENSE = Apache License
CHIP_OTA_PROVIDER_APP_SOURCE = chip-ota-provider-app-aarch64
CHIP_OTA_PROVIDER_APP_SITE = https://github.com/home-assistant-libs/matter-linux-ota-provider/releases/download/$(CHIP_OTA_PROVIDER_APP_VERSION)
CHIP_OTA_PROVIDER_APP_INSTALL_PATH = /usr/bin

define CHIP_OTA_PROVIDER_APP_EXTRACT_CMDS
	cp $(CHIP_OTA_PROVIDER_APP_DL_DIR)/$(CHIP_OTA_PROVIDER_APP_SOURCE) $(@D)
endef

define CHIP_OTA_PROVIDER_APP_INSTALL_TARGET_CMDS
	# 创建安装目录
	$(INSTALL) -d $(TARGET_DIR)/usr/bin
	# 先执行strip操作以减小文件体积
	$(TARGET_CROSS)strip -o $(@D)/$(CHIP_OTA_PROVIDER_APP_SOURCE).stripped $(@D)/$(CHIP_OTA_PROVIDER_APP_SOURCE)
	# 将strip后的文件复制到目标文件系统
	$(INSTALL) -m 0755 $(@D)/$(CHIP_OTA_PROVIDER_APP_SOURCE).stripped $(TARGET_DIR)/usr/bin/chip-ota-provider-app
endef

$(eval $(generic-package))
