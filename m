Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8B0E2D9858
	for <lists+linux-omap@lfdr.de>; Mon, 14 Dec 2020 13:54:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406851AbgLNMx7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Dec 2020 07:53:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:52786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732174AbgLNMx7 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 14 Dec 2020 07:53:59 -0500
Date:   Mon, 14 Dec 2020 13:53:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607950398;
        bh=gUCS4zwWHUZgbQyvkSd7CXLcJgrMzS3i62Pz0gH2MV4=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=UQIiHLzKu5FOq98y1SznJhWIInUQoFVqMjNUStEDcYjljhTs29jhPoiBtIlFtnmXs
         MX8wLrRQmSAMnrrsEWBBSJA/fzHXcZSTuDTKimcYpyMnrD9omU5FNkLA9rK6pxwk6G
         LZafK/e5pesUVh4Uv12/3GYlBsdcsV1i/0iEnGyuhvkFgseYRqbtUH8HX+EtzXPskS
         Ni8UZFbiL64R5aQ+oK+Ayi4zT25ajQ6s5C07frBx/C5ITiY+X9Qqt6uEH2sHyN9cAp
         k+IEwbJyeTQ5ONag3E35wgqi913MNHvkvFn7Conr5s+W24E67bR3sIZvOdG8yOkT67
         x5qmFfMkT4QWA==
From:   Sebastian Reichel <sre@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com
Subject: Re: [PATCH v4 50/80] drm/omap: squash omapdrm sub-modules into one
Message-ID: <20201214125315.234l3hln3d4txfsl@earth.universe>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-51-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zvpkb7bfrol3tyz7"
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-51-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--zvpkb7bfrol3tyz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 24, 2020 at 02:45:08PM +0200, Tomi Valkeinen wrote:
> At the moment we have three different modules: omapdss-base, omapdss,
> omapdrm. This setup is finally obsolete, as the last omapdrm specific
> panel has been converted to DRM panel.
>=20
> We can thus remove omapdss-base and omapdss, and just compile everything
> into omapdrm.ko.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/omapdrm/Kconfig       | 119 ++++++++++++++++++++++-
>  drivers/gpu/drm/omapdrm/Makefile      |  17 +++-
>  drivers/gpu/drm/omapdrm/dss/Kconfig   | 132 --------------------------
>  drivers/gpu/drm/omapdrm/dss/Makefile  |  18 ----
>  drivers/gpu/drm/omapdrm/dss/base.c    |  24 +----
>  drivers/gpu/drm/omapdrm/dss/display.c |   2 -
>  drivers/gpu/drm/omapdrm/dss/dss.c     |  11 +--
>  drivers/gpu/drm/omapdrm/dss/omapdss.h |   3 +
>  drivers/gpu/drm/omapdrm/dss/output.c  |  11 ---
>  drivers/gpu/drm/omapdrm/omap_drv.c    |  20 +++-
>  10 files changed, 155 insertions(+), 202 deletions(-)
>  delete mode 100644 drivers/gpu/drm/omapdrm/dss/Kconfig
>  delete mode 100644 drivers/gpu/drm/omapdrm/dss/Makefile
>=20
> diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kc=
onfig
> index cea3f44ea6d4..e7281da5bc6a 100644
> --- a/drivers/gpu/drm/omapdrm/Kconfig
> +++ b/drivers/gpu/drm/omapdrm/Kconfig
> @@ -5,12 +5,129 @@ config DRM_OMAP
>  	depends on ARCH_OMAP2PLUS || ARCH_MULTIPLATFORM
>  	select OMAP2_DSS
>  	select DRM_KMS_HELPER
> +	select VIDEOMODE_HELPERS
> +	select HDMI
>  	default n
>  	help
>  	  DRM display driver for OMAP2/3/4 based boards.
> =20
>  if DRM_OMAP
> =20
> -source "drivers/gpu/drm/omapdrm/dss/Kconfig"
> +config OMAP2_DSS_DEBUG
> +	bool "Debug support"
> +	default n
> +	help
> +	  This enables printing of debug messages. Alternatively, debug messages
> +	  can also be enabled by setting CONFIG_DYNAMIC_DEBUG and then setting
> +	  appropriate flags in <debugfs>/dynamic_debug/control.
> +
> +config OMAP2_DSS_DEBUGFS
> +	bool "Debugfs filesystem support"
> +	depends on DEBUG_FS
> +	default n
> +	help
> +	  This enables debugfs for OMAPDSS at <debugfs>/omapdss. This enables
> +	  querying about clock configuration and register configuration of dss,
> +	  dispc, dsi, hdmi and rfbi.
> +
> +config OMAP2_DSS_COLLECT_IRQ_STATS
> +	bool "Collect DSS IRQ statistics"
> +	depends on OMAP2_DSS_DEBUGFS
> +	default n
> +	help
> +	  Collect DSS IRQ statistics, printable via debugfs.
> +
> +	  The statistics can be found from
> +	  <debugfs>/omapdss/dispc_irq for DISPC interrupts, and
> +	  <debugfs>/omapdss/dsi_irq for DSI interrupts.
> +
> +config OMAP2_DSS_DPI
> +	bool "DPI support"
> +	default y
> +	help
> +	  DPI Interface. This is the Parallel Display Interface.
> +
> +config OMAP2_DSS_VENC
> +	bool "VENC support"
> +	default y
> +	help
> +	  OMAP Video Encoder support for S-Video and composite TV-out.
> +
> +config OMAP2_DSS_HDMI_COMMON
> +	bool
> +
> +config OMAP4_DSS_HDMI
> +	bool "HDMI support for OMAP4"
> +	default y
> +	select OMAP2_DSS_HDMI_COMMON
> +	help
> +	  HDMI support for OMAP4 based SoCs.
> +
> +config OMAP4_DSS_HDMI_CEC
> +	bool "Enable HDMI CEC support for OMAP4"
> +	depends on OMAP4_DSS_HDMI
> +	select CEC_CORE
> +	default y
> +	help
> +	  When selected the HDMI transmitter will support the CEC feature.
> +
> +config OMAP5_DSS_HDMI
> +	bool "HDMI support for OMAP5"
> +	default n
> +	select OMAP2_DSS_HDMI_COMMON
> +	help
> +	  HDMI Interface for OMAP5 and similar cores. This adds the High
> +	  Definition Multimedia Interface. See http://www.hdmi.org/ for HDMI
> +	  specification.
> +
> +config OMAP2_DSS_SDI
> +	bool "SDI support"
> +	default n
> +	help
> +	  SDI (Serial Display Interface) support.
> +
> +	  SDI is a high speed one-way display serial bus between the host
> +	  processor and a display.
> +
> +config OMAP2_DSS_DSI
> +	bool "DSI support"
> +	default n
> +	select DRM_MIPI_DSI
> +	help
> +	  MIPI DSI (Display Serial Interface) support.
> +
> +	  DSI is a high speed half-duplex serial interface between the host
> +	  processor and a peripheral, such as a display or a framebuffer chip.
> +
> +	  See http://www.mipi.org/ for DSI specifications.
> +
> +config OMAP2_DSS_MIN_FCK_PER_PCK
> +	int "Minimum FCK/PCK ratio (for scaling)"
> +	range 0 32
> +	default 0
> +	help
> +	  This can be used to adjust the minimum FCK/PCK ratio.
> +
> +	  With this you can make sure that DISPC FCK is at least
> +	  n x PCK. Video plane scaling requires higher FCK than
> +	  normally.
> +
> +	  If this is set to 0, there's no extra constraint on the
> +	  DISPC FCK. However, the FCK will at minimum be
> +	  2xPCK (if active matrix) or 3xPCK (if passive matrix).
> +
> +	  Max FCK is 173MHz, so this doesn't work if your PCK
> +	  is very high.
> +
> +config OMAP2_DSS_SLEEP_AFTER_VENC_RESET
> +	bool "Sleep 20ms after VENC reset"
> +	default y
> +	help
> +	  There is a 20ms sleep after VENC reset which seemed to fix the
> +	  reset. The reason for the bug is unclear, and it's also unclear
> +	  on what platforms this happens.
> +
> +	  This option enables the sleep, and is enabled by default. You can
> +	  disable the sleep if it doesn't cause problems on your platform.
> =20
>  endif
> diff --git a/drivers/gpu/drm/omapdrm/Makefile b/drivers/gpu/drm/omapdrm/M=
akefile
> index 2a404e045b78..33fe7e937680 100644
> --- a/drivers/gpu/drm/omapdrm/Makefile
> +++ b/drivers/gpu/drm/omapdrm/Makefile
> @@ -4,8 +4,6 @@
>  # Direct Rendering Infrastructure (DRI)
>  #
> =20
> -obj-y +=3D dss/
> -
>  omapdrm-y :=3D omap_drv.o \
>  	omap_irq.o \
>  	omap_debugfs.o \
> @@ -20,4 +18,17 @@ omapdrm-y :=3D omap_drv.o \
> =20
>  omapdrm-$(CONFIG_DRM_FBDEV_EMULATION) +=3D omap_fbdev.o
> =20
> -obj-$(CONFIG_DRM_OMAP)	+=3D omapdrm.o
> +omapdrm-y +=3D dss/base.o dss/display.o dss/output.o dss/dss.o dss/dispc=
=2Eo \
> +		dss/dispc_coefs.o dss/pll.o dss/video-pll.o
> +omapdrm-$(CONFIG_OMAP2_DSS_DPI) +=3D dss/dpi.o
> +omapdrm-$(CONFIG_OMAP2_DSS_VENC) +=3D dss/venc.o
> +omapdrm-$(CONFIG_OMAP2_DSS_SDI) +=3D dss/sdi.o
> +omapdrm-$(CONFIG_OMAP2_DSS_DSI) +=3D dss/dsi.o
> +omapdrm-$(CONFIG_OMAP2_DSS_HDMI_COMMON) +=3D dss/hdmi_common.o dss/hdmi_=
wp.o \
> +		dss/hdmi_pll.o dss/hdmi_phy.o
> +omapdrm-$(CONFIG_OMAP4_DSS_HDMI) +=3D dss/hdmi4.o dss/hdmi4_core.o
> +omapdrm-$(CONFIG_OMAP4_DSS_HDMI_CEC) +=3D dss/hdmi4_cec.o
> +omapdrm-$(CONFIG_OMAP5_DSS_HDMI) +=3D dss/hdmi5.o dss/hdmi5_core.o
> +ccflags-$(CONFIG_OMAP2_DSS_DEBUG) +=3D -DDEBUG
> +
> +obj-$(CONFIG_DRM_OMAP) +=3D omapdrm.o
> diff --git a/drivers/gpu/drm/omapdrm/dss/Kconfig b/drivers/gpu/drm/omapdr=
m/dss/Kconfig
> deleted file mode 100644
> index 6ec80771af3d..000000000000
> --- a/drivers/gpu/drm/omapdrm/dss/Kconfig
> +++ /dev/null
> @@ -1,132 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only
> -config OMAP_DSS_BASE
> -	tristate
> -
> -menuconfig OMAP2_DSS
> -	tristate "OMAP2+ Display Subsystem support"
> -	select OMAP_DSS_BASE
> -	select VIDEOMODE_HELPERS
> -	select HDMI
> -	help
> -	  OMAP2+ Display Subsystem support.
> -
> -if OMAP2_DSS
> -
> -config OMAP2_DSS_DEBUG
> -	bool "Debug support"
> -	default n
> -	help
> -	  This enables printing of debug messages. Alternatively, debug messages
> -	  can also be enabled by setting CONFIG_DYNAMIC_DEBUG and then setting
> -	  appropriate flags in <debugfs>/dynamic_debug/control.
> -
> -config OMAP2_DSS_DEBUGFS
> -	bool "Debugfs filesystem support"
> -	depends on DEBUG_FS
> -	default n
> -	help
> -	  This enables debugfs for OMAPDSS at <debugfs>/omapdss. This enables
> -	  querying about clock configuration and register configuration of dss,
> -	  dispc, dsi, hdmi and rfbi.
> -
> -config OMAP2_DSS_COLLECT_IRQ_STATS
> -	bool "Collect DSS IRQ statistics"
> -	depends on OMAP2_DSS_DEBUGFS
> -	default n
> -	help
> -	  Collect DSS IRQ statistics, printable via debugfs.
> -
> -	  The statistics can be found from
> -	  <debugfs>/omapdss/dispc_irq for DISPC interrupts, and
> -	  <debugfs>/omapdss/dsi_irq for DSI interrupts.
> -
> -config OMAP2_DSS_DPI
> -	bool "DPI support"
> -	default y
> -	help
> -	  DPI Interface. This is the Parallel Display Interface.
> -
> -config OMAP2_DSS_VENC
> -	bool "VENC support"
> -	default y
> -	help
> -	  OMAP Video Encoder support for S-Video and composite TV-out.
> -
> -config OMAP2_DSS_HDMI_COMMON
> -	bool
> -
> -config OMAP4_DSS_HDMI
> -	bool "HDMI support for OMAP4"
> -	default y
> -	select OMAP2_DSS_HDMI_COMMON
> -	help
> -	  HDMI support for OMAP4 based SoCs.
> -
> -config OMAP4_DSS_HDMI_CEC
> -	bool "Enable HDMI CEC support for OMAP4"
> -	depends on OMAP4_DSS_HDMI
> -	select CEC_CORE
> -	default y
> -	help
> -	  When selected the HDMI transmitter will support the CEC feature.
> -
> -config OMAP5_DSS_HDMI
> -	bool "HDMI support for OMAP5"
> -	default n
> -	select OMAP2_DSS_HDMI_COMMON
> -	help
> -	  HDMI Interface for OMAP5 and similar cores. This adds the High
> -	  Definition Multimedia Interface. See http://www.hdmi.org/ for HDMI
> -	  specification.
> -
> -config OMAP2_DSS_SDI
> -	bool "SDI support"
> -	default n
> -	help
> -	  SDI (Serial Display Interface) support.
> -
> -	  SDI is a high speed one-way display serial bus between the host
> -	  processor and a display.
> -
> -config OMAP2_DSS_DSI
> -	bool "DSI support"
> -	default n
> -	select DRM_MIPI_DSI
> -	help
> -	  MIPI DSI (Display Serial Interface) support.
> -
> -	  DSI is a high speed half-duplex serial interface between the host
> -	  processor and a peripheral, such as a display or a framebuffer chip.
> -
> -	  See http://www.mipi.org/ for DSI specifications.
> -
> -config OMAP2_DSS_MIN_FCK_PER_PCK
> -	int "Minimum FCK/PCK ratio (for scaling)"
> -	range 0 32
> -	default 0
> -	help
> -	  This can be used to adjust the minimum FCK/PCK ratio.
> -
> -	  With this you can make sure that DISPC FCK is at least
> -	  n x PCK. Video plane scaling requires higher FCK than
> -	  normally.
> -
> -	  If this is set to 0, there's no extra constraint on the
> -	  DISPC FCK. However, the FCK will at minimum be
> -	  2xPCK (if active matrix) or 3xPCK (if passive matrix).
> -
> -	  Max FCK is 173MHz, so this doesn't work if your PCK
> -	  is very high.
> -
> -config OMAP2_DSS_SLEEP_AFTER_VENC_RESET
> -	bool "Sleep 20ms after VENC reset"
> -	default y
> -	help
> -	  There is a 20ms sleep after VENC reset which seemed to fix the
> -	  reset. The reason for the bug is unclear, and it's also unclear
> -	  on what platforms this happens.
> -
> -	  This option enables the sleep, and is enabled by default. You can
> -	  disable the sleep if it doesn't cause problems on your platform.
> -
> -endif
> diff --git a/drivers/gpu/drm/omapdrm/dss/Makefile b/drivers/gpu/drm/omapd=
rm/dss/Makefile
> deleted file mode 100644
> index 811966cd7468..000000000000
> --- a/drivers/gpu/drm/omapdrm/dss/Makefile
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -obj-$(CONFIG_OMAP_DSS_BASE) +=3D omapdss-base.o
> -omapdss-base-y :=3D base.o display.o output.o
> -
> -obj-$(CONFIG_OMAP2_DSS) +=3D omapdss.o
> -# Core DSS files
> -omapdss-y :=3D dss.o dispc.o dispc_coefs.o \
> -	pll.o video-pll.o
> -omapdss-$(CONFIG_OMAP2_DSS_DPI) +=3D dpi.o
> -omapdss-$(CONFIG_OMAP2_DSS_VENC) +=3D venc.o
> -omapdss-$(CONFIG_OMAP2_DSS_SDI) +=3D sdi.o
> -omapdss-$(CONFIG_OMAP2_DSS_DSI) +=3D dsi.o
> -omapdss-$(CONFIG_OMAP2_DSS_HDMI_COMMON) +=3D hdmi_common.o hdmi_wp.o hdm=
i_pll.o \
> -	hdmi_phy.o
> -omapdss-$(CONFIG_OMAP4_DSS_HDMI) +=3D hdmi4.o hdmi4_core.o
> -omapdss-$(CONFIG_OMAP4_DSS_HDMI_CEC) +=3D hdmi4_cec.o
> -omapdss-$(CONFIG_OMAP5_DSS_HDMI) +=3D hdmi5.o hdmi5_core.o
> -ccflags-$(CONFIG_OMAP2_DSS_DEBUG) +=3D -DDEBUG
> diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm=
/dss/base.c
> index d0d5d9c8ca76..6c57d9292415 100644
> --- a/drivers/gpu/drm/omapdrm/dss/base.c
> +++ b/drivers/gpu/drm/omapdrm/dss/base.c
> @@ -20,14 +20,11 @@ struct dispc_device *dispc_get_dispc(struct dss_devic=
e *dss)
>  {
>  	return dss->dispc;
>  }
> -EXPORT_SYMBOL(dispc_get_dispc);
> =20
>  const struct dispc_ops *dispc_get_ops(struct dss_device *dss)
>  {
>  	return dss->dispc_ops;
>  }
> -EXPORT_SYMBOL(dispc_get_ops);
> -
> =20
>  /* ---------------------------------------------------------------------=
--------
>   * OMAP DSS Devices Handling
> @@ -42,7 +39,6 @@ void omapdss_device_register(struct omap_dss_device *ds=
sdev)
>  	list_add_tail(&dssdev->list, &omapdss_devices_list);
>  	mutex_unlock(&omapdss_devices_lock);
>  }
> -EXPORT_SYMBOL_GPL(omapdss_device_register);
> =20
>  void omapdss_device_unregister(struct omap_dss_device *dssdev)
>  {
> @@ -50,7 +46,6 @@ void omapdss_device_unregister(struct omap_dss_device *=
dssdev)
>  	list_del(&dssdev->list);
>  	mutex_unlock(&omapdss_devices_lock);
>  }
> -EXPORT_SYMBOL_GPL(omapdss_device_unregister);
> =20
>  static bool omapdss_device_is_registered(struct device_node *node)
>  {
> @@ -72,24 +67,16 @@ static bool omapdss_device_is_registered(struct devic=
e_node *node)
> =20
>  struct omap_dss_device *omapdss_device_get(struct omap_dss_device *dssde=
v)
>  {
> -	if (!try_module_get(dssdev->owner))
> +	if (get_device(dssdev->dev) =3D=3D NULL)
>  		return NULL;
> =20
> -	if (get_device(dssdev->dev) =3D=3D NULL) {
> -		module_put(dssdev->owner);
> -		return NULL;
> -	}
> -
>  	return dssdev;
>  }
> -EXPORT_SYMBOL(omapdss_device_get);
> =20
>  void omapdss_device_put(struct omap_dss_device *dssdev)
>  {
>  	put_device(dssdev->dev);
> -	module_put(dssdev->owner);
>  }
> -EXPORT_SYMBOL(omapdss_device_put);
> =20
>  struct omap_dss_device *omapdss_find_device_by_node(struct device_node *=
node)
>  {
> @@ -150,7 +137,6 @@ struct omap_dss_device *omapdss_device_next_output(st=
ruct omap_dss_device *from)
>  	mutex_unlock(&omapdss_devices_lock);
>  	return dssdev;
>  }
> -EXPORT_SYMBOL(omapdss_device_next_output);
> =20
>  static bool omapdss_device_is_connected(struct omap_dss_device *dssdev)
>  {
> @@ -181,7 +167,6 @@ int omapdss_device_connect(struct dss_device *dss,
> =20
>  	return 0;
>  }
> -EXPORT_SYMBOL_GPL(omapdss_device_connect);
> =20
>  void omapdss_device_disconnect(struct omap_dss_device *src,
>  			       struct omap_dss_device *dst)
> @@ -204,7 +189,6 @@ void omapdss_device_disconnect(struct omap_dss_device=
 *src,
> =20
>  	dst->dss =3D NULL;
>  }
> -EXPORT_SYMBOL_GPL(omapdss_device_disconnect);
> =20
>  /* ---------------------------------------------------------------------=
--------
>   * Components Handling
> @@ -290,7 +274,6 @@ void omapdss_gather_components(struct device *dev)
>  	for_each_available_child_of_node(dev->of_node, child)
>  		omapdss_walk_device(dev, child, true);
>  }
> -EXPORT_SYMBOL(omapdss_gather_components);
> =20
>  static bool omapdss_component_is_loaded(struct omapdss_comp_node *comp)
>  {
> @@ -315,8 +298,3 @@ bool omapdss_stack_is_ready(void)
> =20
>  	return true;
>  }
> -EXPORT_SYMBOL(omapdss_stack_is_ready);
> -
> -MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ti.com>");
> -MODULE_DESCRIPTION("OMAP Display Subsystem Base");
> -MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/omapdrm/dss/display.c b/drivers/gpu/drm/omap=
drm/dss/display.c
> index 3b82158b1bfd..7b7ee2019eae 100644
> --- a/drivers/gpu/drm/omapdrm/dss/display.c
> +++ b/drivers/gpu/drm/omapdrm/dss/display.c
> @@ -38,7 +38,6 @@ void omapdss_display_init(struct omap_dss_device *dssde=
v)
>  		dssdev->name =3D devm_kasprintf(dssdev->dev, GFP_KERNEL,
>  					      "display%u", id);
>  }
> -EXPORT_SYMBOL_GPL(omapdss_display_init);
> =20
>  int omapdss_display_get_modes(struct drm_connector *connector,
>  			      const struct videomode *vm)
> @@ -57,4 +56,3 @@ int omapdss_display_get_modes(struct drm_connector *con=
nector,
> =20
>  	return 1;
>  }
> -EXPORT_SYMBOL_GPL(omapdss_display_get_modes);
> diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/=
dss/dss.c
> index 6a160138bf88..2d566ff81c55 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dss.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dss.c
> @@ -1638,21 +1638,14 @@ static struct platform_driver * const omap_dss_dr=
ivers[] =3D {
>  #endif
>  };
> =20
> -static int __init omap_dss_init(void)
> +int __init omap_dss_init(void)
>  {
>  	return platform_register_drivers(omap_dss_drivers,
>  					 ARRAY_SIZE(omap_dss_drivers));
>  }
> =20
> -static void __exit omap_dss_exit(void)
> +void omap_dss_exit(void)
>  {
>  	platform_unregister_drivers(omap_dss_drivers,
>  				    ARRAY_SIZE(omap_dss_drivers));
>  }
> -
> -module_init(omap_dss_init);
> -module_exit(omap_dss_exit);
> -
> -MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ti.com>");
> -MODULE_DESCRIPTION("OMAP2/3/4/5 Display Subsystem");
> -MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omap=
drm/dss/omapdss.h
> index 4a0826c8fed5..4e7ae164de4f 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -458,4 +458,7 @@ const struct dispc_ops *dispc_get_ops(struct dss_devi=
ce *dss);
>  bool omapdss_stack_is_ready(void);
>  void omapdss_gather_components(struct device *dev);
> =20
> +int omap_dss_init(void);
> +void omap_dss_exit(void);
> +
>  #endif /* __OMAP_DRM_DSS_H */
> diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/omapd=
rm/dss/output.c
> index 40cb353572f6..7a14d2b5b2f7 100644
> --- a/drivers/gpu/drm/omapdrm/dss/output.c
> +++ b/drivers/gpu/drm/omapdrm/dss/output.c
> @@ -73,7 +73,6 @@ int omapdss_device_init_output(struct omap_dss_device *=
out,
>  	omapdss_device_cleanup_output(out);
>  	return ret;
>  }
> -EXPORT_SYMBOL(omapdss_device_init_output);
> =20
>  void omapdss_device_cleanup_output(struct omap_dss_device *out)
>  {
> @@ -81,7 +80,6 @@ void omapdss_device_cleanup_output(struct omap_dss_devi=
ce *out)
>  		drm_panel_bridge_remove(out->next_bridge ?
>  					out->next_bridge : out->bridge);
>  }
> -EXPORT_SYMBOL(omapdss_device_cleanup_output);
> =20
>  int dss_install_mgr_ops(struct dss_device *dss,
>  			const struct dss_mgr_ops *mgr_ops,
> @@ -95,14 +93,12 @@ int dss_install_mgr_ops(struct dss_device *dss,
> =20
>  	return 0;
>  }
> -EXPORT_SYMBOL(dss_install_mgr_ops);
> =20
>  void dss_uninstall_mgr_ops(struct dss_device *dss)
>  {
>  	dss->mgr_ops =3D NULL;
>  	dss->mgr_ops_priv =3D NULL;
>  }
> -EXPORT_SYMBOL(dss_uninstall_mgr_ops);
> =20
>  void dss_mgr_set_timings(struct omap_dss_device *dssdev,
>  			 const struct videomode *vm)
> @@ -110,7 +106,6 @@ void dss_mgr_set_timings(struct omap_dss_device *dssd=
ev,
>  	dssdev->dss->mgr_ops->set_timings(dssdev->dss->mgr_ops_priv,
>  					  dssdev->dispc_channel, vm);
>  }
> -EXPORT_SYMBOL(dss_mgr_set_timings);
> =20
>  void dss_mgr_set_lcd_config(struct omap_dss_device *dssdev,
>  		const struct dss_lcd_mgr_config *config)
> @@ -118,28 +113,24 @@ void dss_mgr_set_lcd_config(struct omap_dss_device =
*dssdev,
>  	dssdev->dss->mgr_ops->set_lcd_config(dssdev->dss->mgr_ops_priv,
>  					     dssdev->dispc_channel, config);
>  }
> -EXPORT_SYMBOL(dss_mgr_set_lcd_config);
> =20
>  int dss_mgr_enable(struct omap_dss_device *dssdev)
>  {
>  	return dssdev->dss->mgr_ops->enable(dssdev->dss->mgr_ops_priv,
>  					    dssdev->dispc_channel);
>  }
> -EXPORT_SYMBOL(dss_mgr_enable);
> =20
>  void dss_mgr_disable(struct omap_dss_device *dssdev)
>  {
>  	dssdev->dss->mgr_ops->disable(dssdev->dss->mgr_ops_priv,
>  				      dssdev->dispc_channel);
>  }
> -EXPORT_SYMBOL(dss_mgr_disable);
> =20
>  void dss_mgr_start_update(struct omap_dss_device *dssdev)
>  {
>  	dssdev->dss->mgr_ops->start_update(dssdev->dss->mgr_ops_priv,
>  					   dssdev->dispc_channel);
>  }
> -EXPORT_SYMBOL(dss_mgr_start_update);
> =20
>  int dss_mgr_register_framedone_handler(struct omap_dss_device *dssdev,
>  		void (*handler)(void *), void *data)
> @@ -150,7 +141,6 @@ int dss_mgr_register_framedone_handler(struct omap_ds=
s_device *dssdev,
>  							dssdev->dispc_channel,
>  							handler, data);
>  }
> -EXPORT_SYMBOL(dss_mgr_register_framedone_handler);
> =20
>  void dss_mgr_unregister_framedone_handler(struct omap_dss_device *dssdev,
>  		void (*handler)(void *), void *data)
> @@ -161,4 +151,3 @@ void dss_mgr_unregister_framedone_handler(struct omap=
_dss_device *dssdev,
>  						   dssdev->dispc_channel,
>  						   handler, data);
>  }
> -EXPORT_SYMBOL(dss_mgr_unregister_framedone_handler);
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm=
/omap_drv.c
> index dbb8e95234b3..b6ba4a43f217 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -741,9 +741,21 @@ static struct platform_driver * const drivers[] =3D {
> =20
>  static int __init omap_drm_init(void)
>  {
> +	int r;
> +
>  	DBG("init");
> =20
> -	return platform_register_drivers(drivers, ARRAY_SIZE(drivers));
> +	r =3D omap_dss_init();
> +	if (r)
> +		return r;
> +
> +	r =3D platform_register_drivers(drivers, ARRAY_SIZE(drivers));
> +	if (r) {
> +		omap_dss_exit();
> +		return r;
> +	}
> +
> +	return 0;
>  }
> =20
>  static void __exit omap_drm_fini(void)
> @@ -751,13 +763,15 @@ static void __exit omap_drm_fini(void)
>  	DBG("fini");
> =20
>  	platform_unregister_drivers(drivers, ARRAY_SIZE(drivers));
> +
> +	omap_dss_exit();
>  }
> =20
> -/* need late_initcall() so we load after dss_driver's are loaded */
> -late_initcall(omap_drm_init);
> +module_init(omap_drm_init);
>  module_exit(omap_drm_fini);
> =20
>  MODULE_AUTHOR("Rob Clark <rob@ti.com>");
> +MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ti.com>");
>  MODULE_DESCRIPTION("OMAP DRM Display Driver");
>  MODULE_ALIAS("platform:" DRIVER_NAME);
>  MODULE_LICENSE("GPL v2");
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--zvpkb7bfrol3tyz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XYC4ACgkQ2O7X88g7
+po4OhAAjGRziZcmfgVDN16xT5c5kLP3visdybTeR5CpxHn9etYcaFZ9mp+8tpgp
D2GX6ctZzFJU1C5xK57XS9DNP2TPxa6D734xkCtzzK70LcIukrPqic/8oDAyI7pE
wA0YbXfVhJIkWXSfyodQ7l9QV/iKBNxkY3RRRM8giWNOJwsEhOIwALPYYZu1RPCz
Mocz/OvbBxqC2YF8AObC88y8IsDm9YBsmaYIdQ6uzKgZzF0lb1DHARAe8bFEGAGH
8vtLo9ELdoXeAkFtpwQtpQll6Zq5u5fGoVZecnH/3KH/XOyZNV1oFrX+0P1QJWQy
uXmuvjWr557x/4lFf5zIgHcf/Tk9UnF6LngxM/qUVsrov6gJaXzKOO1NTPaVhH3G
zf0aBk9rGdEx5q6a03zTsLXjSbjTG08UQ79y6t40KjjZ+6c9PuTd1Iuu0aCtLhHD
JZh8oDMdzfA0mNuAbehzzRAmMERtApbUAB+IKBSXuPefVkueOuX6z1sJ4S6nTFHl
ZuiYAV8Rm+6zz7B3wtZi/Hf9VbIZpY47ehfqypk1Voo67RChJhcvEkm0eIClGP5H
vvthPiza7F0O0f8TSxgi1RLZ51xWOpqg1I6qEvbHUWhbvguOLOKDQoei9qjwUnjR
als9OtStWyGEMCbXk+EAGBD8yJUMlQ8d4cSxdYgo/ti1oZlkFRo=
=+ZXW
-----END PGP SIGNATURE-----

--zvpkb7bfrol3tyz7--
