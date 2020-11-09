Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28D682AB64E
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 12:15:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727774AbgKILPp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 06:15:45 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41516 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727303AbgKILPp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 06:15:45 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 52CA7B2B;
        Mon,  9 Nov 2020 12:15:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604920541;
        bh=rhcQO8Lw1Hz8Os5ETjdUlm3XRq4Y5JfbgWg6/SRcQpA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eoRoSKmL+kOgisSuSnXriwbboaHpGjNUtUtpe9HnjmAwxGOMpyX5C5GgKcdHyqS57
         7vTvLjQdZctWFW3fIafjL8VnPlt/MkHFzYV+xk+jwVYtG3tjWb5KL7LM/FpM8Rl/aO
         z4cMmDpeo19JGlIEKggySg8Bp3KRX4i/YasXbV7Y=
Date:   Mon, 9 Nov 2020 13:15:38 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v3 52/56] drm/omap: squash omapdrm sub-modules into one
Message-ID: <20201109111538.GW6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-53-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-53-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:03:29PM +0200, Tomi Valkeinen wrote:
> At the moment we have three different modules: omapdss-base, omapdss,
> omapdrm. This setup is finally obsolete, as the last omapdrm specific
> panel has been converted to DRM panel.
> 
> We can thus remove omapdss-base and omapdss, and just compile everything
> into omapdrm.ko.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/omapdrm/Kconfig       | 119 ++++++++++++++++++++++-
>  drivers/gpu/drm/omapdrm/Makefile      |  17 +++-
>  drivers/gpu/drm/omapdrm/dss/Kconfig   | 132 --------------------------
>  drivers/gpu/drm/omapdrm/dss/Makefile  |  18 ----
>  drivers/gpu/drm/omapdrm/dss/base.c    |  23 +----
>  drivers/gpu/drm/omapdrm/dss/display.c |   2 -
>  drivers/gpu/drm/omapdrm/dss/dss.c     |  11 +--
>  drivers/gpu/drm/omapdrm/dss/omapdss.h |   3 +
>  drivers/gpu/drm/omapdrm/dss/output.c  |  11 ---
>  drivers/gpu/drm/omapdrm/omap_drv.c    |  12 ++-
>  10 files changed, 148 insertions(+), 200 deletions(-)
>  delete mode 100644 drivers/gpu/drm/omapdrm/dss/Kconfig
>  delete mode 100644 drivers/gpu/drm/omapdrm/dss/Makefile
> 
> diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
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
>  
>  if DRM_OMAP
>  
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
>  
>  endif
> diff --git a/drivers/gpu/drm/omapdrm/Makefile b/drivers/gpu/drm/omapdrm/Makefile
> index 2a404e045b78..33fe7e937680 100644
> --- a/drivers/gpu/drm/omapdrm/Makefile
> +++ b/drivers/gpu/drm/omapdrm/Makefile
> @@ -4,8 +4,6 @@
>  # Direct Rendering Infrastructure (DRI)
>  #
>  
> -obj-y += dss/
> -
>  omapdrm-y := omap_drv.o \
>  	omap_irq.o \
>  	omap_debugfs.o \
> @@ -20,4 +18,17 @@ omapdrm-y := omap_drv.o \
>  
>  omapdrm-$(CONFIG_DRM_FBDEV_EMULATION) += omap_fbdev.o
>  
> -obj-$(CONFIG_DRM_OMAP)	+= omapdrm.o
> +omapdrm-y += dss/base.o dss/display.o dss/output.o dss/dss.o dss/dispc.o \
> +		dss/dispc_coefs.o dss/pll.o dss/video-pll.o
> +omapdrm-$(CONFIG_OMAP2_DSS_DPI) += dss/dpi.o
> +omapdrm-$(CONFIG_OMAP2_DSS_VENC) += dss/venc.o
> +omapdrm-$(CONFIG_OMAP2_DSS_SDI) += dss/sdi.o
> +omapdrm-$(CONFIG_OMAP2_DSS_DSI) += dss/dsi.o
> +omapdrm-$(CONFIG_OMAP2_DSS_HDMI_COMMON) += dss/hdmi_common.o dss/hdmi_wp.o \
> +		dss/hdmi_pll.o dss/hdmi_phy.o
> +omapdrm-$(CONFIG_OMAP4_DSS_HDMI) += dss/hdmi4.o dss/hdmi4_core.o
> +omapdrm-$(CONFIG_OMAP4_DSS_HDMI_CEC) += dss/hdmi4_cec.o
> +omapdrm-$(CONFIG_OMAP5_DSS_HDMI) += dss/hdmi5.o dss/hdmi5_core.o
> +ccflags-$(CONFIG_OMAP2_DSS_DEBUG) += -DDEBUG
> +
> +obj-$(CONFIG_DRM_OMAP) += omapdrm.o
> diff --git a/drivers/gpu/drm/omapdrm/dss/Kconfig b/drivers/gpu/drm/omapdrm/dss/Kconfig
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
> diff --git a/drivers/gpu/drm/omapdrm/dss/Makefile b/drivers/gpu/drm/omapdrm/dss/Makefile
> deleted file mode 100644
> index 811966cd7468..000000000000
> --- a/drivers/gpu/drm/omapdrm/dss/Makefile
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -obj-$(CONFIG_OMAP_DSS_BASE) += omapdss-base.o
> -omapdss-base-y := base.o display.o output.o
> -
> -obj-$(CONFIG_OMAP2_DSS) += omapdss.o
> -# Core DSS files
> -omapdss-y := dss.o dispc.o dispc_coefs.o \
> -	pll.o video-pll.o
> -omapdss-$(CONFIG_OMAP2_DSS_DPI) += dpi.o
> -omapdss-$(CONFIG_OMAP2_DSS_VENC) += venc.o
> -omapdss-$(CONFIG_OMAP2_DSS_SDI) += sdi.o
> -omapdss-$(CONFIG_OMAP2_DSS_DSI) += dsi.o
> -omapdss-$(CONFIG_OMAP2_DSS_HDMI_COMMON) += hdmi_common.o hdmi_wp.o hdmi_pll.o \
> -	hdmi_phy.o
> -omapdss-$(CONFIG_OMAP4_DSS_HDMI) += hdmi4.o hdmi4_core.o
> -omapdss-$(CONFIG_OMAP4_DSS_HDMI_CEC) += hdmi4_cec.o
> -omapdss-$(CONFIG_OMAP5_DSS_HDMI) += hdmi5.o hdmi5_core.o
> -ccflags-$(CONFIG_OMAP2_DSS_DEBUG) += -DDEBUG
> diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
> index d9a5e7b9d401..08c7c5024896 100644
> --- a/drivers/gpu/drm/omapdrm/dss/base.c
> +++ b/drivers/gpu/drm/omapdrm/dss/base.c
> @@ -20,13 +20,11 @@ struct dispc_device *dispc_get_dispc(struct dss_device *dss)
>  {
>  	return dss->dispc;
>  }
> -EXPORT_SYMBOL(dispc_get_dispc);
>  
>  const struct dispc_ops *dispc_get_ops(struct dss_device *dss)
>  {
>  	return dss->dispc_ops;
>  }
> -EXPORT_SYMBOL(dispc_get_ops);
>  

While at it, could you remove the extra blank line ?

>  
>  /* -----------------------------------------------------------------------------
> @@ -42,7 +40,6 @@ void omapdss_device_register(struct omap_dss_device *dssdev)
>  	list_add_tail(&dssdev->list, &omapdss_devices_list);
>  	mutex_unlock(&omapdss_devices_lock);
>  }
> -EXPORT_SYMBOL_GPL(omapdss_device_register);
>  
>  void omapdss_device_unregister(struct omap_dss_device *dssdev)
>  {
> @@ -50,7 +47,6 @@ void omapdss_device_unregister(struct omap_dss_device *dssdev)
>  	list_del(&dssdev->list);
>  	mutex_unlock(&omapdss_devices_lock);
>  }
> -EXPORT_SYMBOL_GPL(omapdss_device_unregister);
>  
>  static bool omapdss_device_is_registered(struct device_node *node)
>  {
> @@ -72,24 +68,16 @@ static bool omapdss_device_is_registered(struct device_node *node)
>  
>  struct omap_dss_device *omapdss_device_get(struct omap_dss_device *dssdev)
>  {
> -	if (!try_module_get(dssdev->owner))
> +	if (get_device(dssdev->dev) == NULL)
>  		return NULL;
>  
> -	if (get_device(dssdev->dev) == NULL) {
> -		module_put(dssdev->owner);
> -		return NULL;
> -	}
> -
>  	return dssdev;
>  }
> -EXPORT_SYMBOL(omapdss_device_get);
>  
>  void omapdss_device_put(struct omap_dss_device *dssdev)
>  {
>  	put_device(dssdev->dev);
> -	module_put(dssdev->owner);
>  }
> -EXPORT_SYMBOL(omapdss_device_put);
>  
>  struct omap_dss_device *omapdss_find_device_by_node(struct device_node *node)
>  {
> @@ -150,7 +138,6 @@ struct omap_dss_device *omapdss_device_next_output(struct omap_dss_device *from)
>  	mutex_unlock(&omapdss_devices_lock);
>  	return dssdev;
>  }
> -EXPORT_SYMBOL(omapdss_device_next_output);
>  
>  static bool omapdss_device_is_connected(struct omap_dss_device *dssdev)
>  {
> @@ -181,7 +168,6 @@ int omapdss_device_connect(struct dss_device *dss,
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL_GPL(omapdss_device_connect);
>  
>  void omapdss_device_disconnect(struct omap_dss_device *src,
>  			       struct omap_dss_device *dst)
> @@ -204,7 +190,6 @@ void omapdss_device_disconnect(struct omap_dss_device *src,
>  
>  	dst->dss = NULL;
>  }
> -EXPORT_SYMBOL_GPL(omapdss_device_disconnect);
>  
>  /* -----------------------------------------------------------------------------
>   * Components Handling
> @@ -290,7 +275,6 @@ void omapdss_gather_components(struct device *dev)
>  	for_each_available_child_of_node(dev->of_node, child)
>  		omapdss_walk_device(dev, child, true);
>  }
> -EXPORT_SYMBOL(omapdss_gather_components);
>  
>  static bool omapdss_component_is_loaded(struct omapdss_comp_node *comp)
>  {
> @@ -315,8 +299,3 @@ bool omapdss_stack_is_ready(void)
>  
>  	return true;
>  }
> -EXPORT_SYMBOL(omapdss_stack_is_ready);
> -
> -MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ti.com>");
> -MODULE_DESCRIPTION("OMAP Display Subsystem Base");
> -MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/omapdrm/dss/display.c b/drivers/gpu/drm/omapdrm/dss/display.c
> index 3b82158b1bfd..7b7ee2019eae 100644
> --- a/drivers/gpu/drm/omapdrm/dss/display.c
> +++ b/drivers/gpu/drm/omapdrm/dss/display.c
> @@ -38,7 +38,6 @@ void omapdss_display_init(struct omap_dss_device *dssdev)
>  		dssdev->name = devm_kasprintf(dssdev->dev, GFP_KERNEL,
>  					      "display%u", id);
>  }
> -EXPORT_SYMBOL_GPL(omapdss_display_init);
>  
>  int omapdss_display_get_modes(struct drm_connector *connector,
>  			      const struct videomode *vm)
> @@ -57,4 +56,3 @@ int omapdss_display_get_modes(struct drm_connector *connector,
>  
>  	return 1;
>  }
> -EXPORT_SYMBOL_GPL(omapdss_display_get_modes);
> diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
> index 6a160138bf88..6547a9f4b388 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dss.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dss.c
> @@ -1638,21 +1638,14 @@ static struct platform_driver * const omap_dss_drivers[] = {
>  #endif
>  };
>  
> -static int __init omap_dss_init(void)
> +int __init omap_dss_init(void)
>  {
>  	return platform_register_drivers(omap_dss_drivers,
>  					 ARRAY_SIZE(omap_dss_drivers));
>  }
>  
> -static void __exit omap_dss_exit(void)
> +void __exit omap_dss_exit(void)
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
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index 4a0826c8fed5..4e7ae164de4f 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -458,4 +458,7 @@ const struct dispc_ops *dispc_get_ops(struct dss_device *dss);
>  bool omapdss_stack_is_ready(void);
>  void omapdss_gather_components(struct device *dev);
>  
> +int omap_dss_init(void);
> +void omap_dss_exit(void);
> +
>  #endif /* __OMAP_DRM_DSS_H */
> diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/omapdrm/dss/output.c
> index 40cb353572f6..7a14d2b5b2f7 100644
> --- a/drivers/gpu/drm/omapdrm/dss/output.c
> +++ b/drivers/gpu/drm/omapdrm/dss/output.c
> @@ -73,7 +73,6 @@ int omapdss_device_init_output(struct omap_dss_device *out,
>  	omapdss_device_cleanup_output(out);
>  	return ret;
>  }
> -EXPORT_SYMBOL(omapdss_device_init_output);
>  
>  void omapdss_device_cleanup_output(struct omap_dss_device *out)
>  {
> @@ -81,7 +80,6 @@ void omapdss_device_cleanup_output(struct omap_dss_device *out)
>  		drm_panel_bridge_remove(out->next_bridge ?
>  					out->next_bridge : out->bridge);
>  }
> -EXPORT_SYMBOL(omapdss_device_cleanup_output);
>  
>  int dss_install_mgr_ops(struct dss_device *dss,
>  			const struct dss_mgr_ops *mgr_ops,
> @@ -95,14 +93,12 @@ int dss_install_mgr_ops(struct dss_device *dss,
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL(dss_install_mgr_ops);
>  
>  void dss_uninstall_mgr_ops(struct dss_device *dss)
>  {
>  	dss->mgr_ops = NULL;
>  	dss->mgr_ops_priv = NULL;
>  }
> -EXPORT_SYMBOL(dss_uninstall_mgr_ops);
>  
>  void dss_mgr_set_timings(struct omap_dss_device *dssdev,
>  			 const struct videomode *vm)
> @@ -110,7 +106,6 @@ void dss_mgr_set_timings(struct omap_dss_device *dssdev,
>  	dssdev->dss->mgr_ops->set_timings(dssdev->dss->mgr_ops_priv,
>  					  dssdev->dispc_channel, vm);
>  }
> -EXPORT_SYMBOL(dss_mgr_set_timings);
>  
>  void dss_mgr_set_lcd_config(struct omap_dss_device *dssdev,
>  		const struct dss_lcd_mgr_config *config)
> @@ -118,28 +113,24 @@ void dss_mgr_set_lcd_config(struct omap_dss_device *dssdev,
>  	dssdev->dss->mgr_ops->set_lcd_config(dssdev->dss->mgr_ops_priv,
>  					     dssdev->dispc_channel, config);
>  }
> -EXPORT_SYMBOL(dss_mgr_set_lcd_config);
>  
>  int dss_mgr_enable(struct omap_dss_device *dssdev)
>  {
>  	return dssdev->dss->mgr_ops->enable(dssdev->dss->mgr_ops_priv,
>  					    dssdev->dispc_channel);
>  }
> -EXPORT_SYMBOL(dss_mgr_enable);
>  
>  void dss_mgr_disable(struct omap_dss_device *dssdev)
>  {
>  	dssdev->dss->mgr_ops->disable(dssdev->dss->mgr_ops_priv,
>  				      dssdev->dispc_channel);
>  }
> -EXPORT_SYMBOL(dss_mgr_disable);
>  
>  void dss_mgr_start_update(struct omap_dss_device *dssdev)
>  {
>  	dssdev->dss->mgr_ops->start_update(dssdev->dss->mgr_ops_priv,
>  					   dssdev->dispc_channel);
>  }
> -EXPORT_SYMBOL(dss_mgr_start_update);
>  
>  int dss_mgr_register_framedone_handler(struct omap_dss_device *dssdev,
>  		void (*handler)(void *), void *data)
> @@ -150,7 +141,6 @@ int dss_mgr_register_framedone_handler(struct omap_dss_device *dssdev,
>  							dssdev->dispc_channel,
>  							handler, data);
>  }
> -EXPORT_SYMBOL(dss_mgr_register_framedone_handler);
>  
>  void dss_mgr_unregister_framedone_handler(struct omap_dss_device *dssdev,
>  		void (*handler)(void *), void *data)
> @@ -161,4 +151,3 @@ void dss_mgr_unregister_framedone_handler(struct omap_dss_device *dssdev,
>  						   dssdev->dispc_channel,
>  						   handler, data);
>  }
> -EXPORT_SYMBOL(dss_mgr_unregister_framedone_handler);
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> index dbb8e95234b3..9d5f53e774ef 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -741,8 +741,14 @@ static struct platform_driver * const drivers[] = {
>  
>  static int __init omap_drm_init(void)
>  {
> +	int r;
> +
>  	DBG("init");
>  
> +	r = omap_dss_init();
> +	if (r)
> +		return r;
> +
>  	return platform_register_drivers(drivers, ARRAY_SIZE(drivers));

Shouldn't you call omap_dss_exit() if this fails ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  }
>  
> @@ -751,13 +757,15 @@ static void __exit omap_drm_fini(void)
>  	DBG("fini");
>  
>  	platform_unregister_drivers(drivers, ARRAY_SIZE(drivers));
> +
> +	omap_dss_exit();
>  }
>  
> -/* need late_initcall() so we load after dss_driver's are loaded */
> -late_initcall(omap_drm_init);
> +module_init(omap_drm_init);
>  module_exit(omap_drm_fini);
>  
>  MODULE_AUTHOR("Rob Clark <rob@ti.com>");
> +MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ti.com>");
>  MODULE_DESCRIPTION("OMAP DRM Display Driver");
>  MODULE_ALIAS("platform:" DRIVER_NAME);
>  MODULE_LICENSE("GPL v2");

-- 
Regards,

Laurent Pinchart
