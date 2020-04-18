TEST_INFLUXDB_VERSION = HEAD
TEST_INFLUXDB_SITE = http://s3.amazonaws.com/influxdb/influxdb-latest.src.tar.gz
TEST_INFLUXDB_SITE_METHOD = wget
TEST_INFLUXDB_DEPENDENCIES = go1.3

# TEST_INFLUXDB_CONF_OPTS = --prefix=/usr

define TEST_INFLUXDB_CONFIGURE_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) defconfig
endef



define TEST_INFLUXDB_CONFIGURE_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) defconfig
endef

define TEST_INFLUXDB_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
endef

define TEST_INFLUXDB_INSTALL_TARGET_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) DESTDIR=$(TARGET_DIR)  install
	$(INSTALL) -D -m 0755 $(STT_IHM_PKGDIR)/S50sttdaemon $(TARGET_DIR)/etc/init.d/
endef
$(eval $(generic-package))
