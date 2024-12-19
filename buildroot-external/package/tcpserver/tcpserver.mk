#############################################################
#
# tcp server for wifi config
#
#############################################################

TCPSERVER_VERSION = 0.1
TCPSERVER_SITE = $(BR2_EXTERNAL_HASSOS_PATH)/package/tcpserver/src
TCPSERVER_SITE_METHOD = local

define TCPSERVER_BUILD_CMDS
    $(MAKE) CXX=$(TARGET_CXX) -C $(@D)
endef

define TCPSERVER_INSTALL_TARGET_CMDS
    $(MAKE) -C $(@D) install
endef

$(eval $(generic-package))
