#
# Copyright (C) 2014 OpenWrt-dist
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=redsocks
PKG_VERSION:=0.4
PKG_RELEASE=5

PKG_SOURCE:=release-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/darkk/redsocks/archive
PKG_MD5SUM:=810102ef06a9ea796f310ae811afc6a8

PKG_LICENSE:=GPLv2
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Yuanl <yuanl.lee@gmail.com>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/$(BUILD_VARIANT)/$(PKG_NAME)-release-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/redsocks
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Redirect any TCP connection to a SOCKS or HTTPS proxy server
	URL:=https://github.com/darkk/redsocks
	DEPENDS:=+libevent2
endef

define Package/redsocks/description
This is the original redsocks.
endef

define Package/redsocks/conffiles
/etc/config/redsocks
endef

define Package/redsocks/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/redsocks $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/redsocks.config $(1)/etc/config/redsocks
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/redsocks.init $(1)/etc/init.d/redsocks
	$(INSTALL_DIR) $(1)/etc/redsocks
	$(INSTALL_DATA) ./files/redsocks.template $(1)/etc/redsocks/config.template
endef

$(eval $(call BuildPackage,redsocks))
