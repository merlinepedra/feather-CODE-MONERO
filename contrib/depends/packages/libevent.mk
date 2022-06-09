package=libevent
$(package)_version=2.1.12
$(package)_download_path=https://github.com/libevent/libevent/releases/download/release-2.1.12-stable/
$(package)_file_name=libevent-$($(package)_version)-stable.tar.gz
$(package)_sha256_hash=92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037a27d346b0403bb
$(package)_dependencies=openssl

define $(package)_set_vars
    $(package)_config_opts=--disable-shared --enable-static --with-pic
endef

define $(package)_config_cmds
    $($(package)_autoconf)
endef

define $(package)_build_cmds
    $(MAKE)
endef

define $(package)_stage_cmds
    $(MAKE) DESTDIR=$($(package)_staging_dir) install
endef
