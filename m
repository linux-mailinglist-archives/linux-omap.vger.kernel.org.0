Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B197E34007
	for <lists+linux-omap@lfdr.de>; Tue,  4 Jun 2019 09:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbfFDHYt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 4 Jun 2019 03:24:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:47408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726589AbfFDHYs (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 4 Jun 2019 03:24:48 -0400
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5953924AEC;
        Tue,  4 Jun 2019 07:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559633087;
        bh=hmrJ2p5mH493GGZU8V5J/UU/337+v+oyPRRJDYEkLdU=;
        h=From:To:Cc:Subject:Date:From;
        b=x0Tz56zDQhWlPiJm5eUReQtZjksYgJEHo9/yOKHhCRLsVA9rlCo2BivNcrXdtvpqq
         lBqKAi/FSRktRAaIVnJnVlw8aHqQ776H005kXcF07OZJvf+KnS7VA7xsQHlCQlCjG7
         MPJt17EHmfxo2KqB81zFwORP5+s/s85YkN84RQq0=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Russell King <linux@armlinux.org.uk>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, arm@kernel.org
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Alexander Shiyan <shc_work@mail.ru>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2] ARM: config: Remove left-over BACKLIGHT_LCD_SUPPORT
Date:   Tue,  4 Jun 2019 09:24:21 +0200
Message-Id: <1559633061-28003-1-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The CONFIG_BACKLIGHT_LCD_SUPPORT was removed in commit 8c5dc8d9f19c
("video: backlight: Remove useless BACKLIGHT_LCD_SUPPORT kernel
symbol"). Options protected by CONFIG_BACKLIGHT_LCD_SUPPORT are now
available directly.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Change also mini2440_defconfig.
---
 arch/arm/configs/cm_x2xx_defconfig        | 1 -
 arch/arm/configs/cm_x300_defconfig        | 1 -
 arch/arm/configs/colibri_pxa270_defconfig | 1 -
 arch/arm/configs/colibri_pxa300_defconfig | 1 -
 arch/arm/configs/collie_defconfig         | 1 -
 arch/arm/configs/corgi_defconfig          | 1 -
 arch/arm/configs/em_x270_defconfig        | 1 -
 arch/arm/configs/eseries_pxa_defconfig    | 1 -
 arch/arm/configs/ezx_defconfig            | 1 -
 arch/arm/configs/imote2_defconfig         | 1 -
 arch/arm/configs/integrator_defconfig     | 1 -
 arch/arm/configs/jornada720_defconfig     | 1 -
 arch/arm/configs/lpc18xx_defconfig        | 1 -
 arch/arm/configs/lpc32xx_defconfig        | 1 -
 arch/arm/configs/magician_defconfig       | 1 -
 arch/arm/configs/mini2440_defconfig       | 1 -
 arch/arm/configs/mmp2_defconfig           | 1 -
 arch/arm/configs/mxs_defconfig            | 1 -
 arch/arm/configs/nhk8815_defconfig        | 1 -
 arch/arm/configs/omap1_defconfig          | 1 -
 arch/arm/configs/palmz72_defconfig        | 1 -
 arch/arm/configs/pxa3xx_defconfig         | 1 -
 arch/arm/configs/pxa_defconfig            | 1 -
 arch/arm/configs/qcom_defconfig           | 1 -
 arch/arm/configs/realview_defconfig       | 1 -
 arch/arm/configs/s3c6400_defconfig        | 1 -
 arch/arm/configs/sama5_defconfig          | 1 -
 arch/arm/configs/spear3xx_defconfig       | 1 -
 arch/arm/configs/spitz_defconfig          | 1 -
 arch/arm/configs/trizeps4_defconfig       | 1 -
 arch/arm/configs/u300_defconfig           | 1 -
 arch/arm/configs/versatile_defconfig      | 1 -
 arch/arm/configs/vexpress_defconfig       | 1 -
 arch/arm/configs/viper_defconfig          | 1 -
 arch/arm/configs/zeus_defconfig           | 1 -
 35 files changed, 35 deletions(-)

diff --git a/arch/arm/configs/cm_x2xx_defconfig b/arch/arm/configs/cm_x2xx_defconfig
index 5344434df652..2789837ea24c 100644
--- a/arch/arm/configs/cm_x2xx_defconfig
+++ b/arch/arm/configs/cm_x2xx_defconfig
@@ -103,7 +103,6 @@ CONFIG_FB=y
 CONFIG_FB_PXA=y
 CONFIG_FB_PXA_PARAMETERS=y
 CONFIG_FB_MBX=m
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 # CONFIG_LCD_CLASS_DEVICE is not set
 # CONFIG_BACKLIGHT_CLASS_DEVICE is not set
 # CONFIG_VGA_CONSOLE is not set
diff --git a/arch/arm/configs/cm_x300_defconfig b/arch/arm/configs/cm_x300_defconfig
index 3707a014cbc4..569a5ed70c55 100644
--- a/arch/arm/configs/cm_x300_defconfig
+++ b/arch/arm/configs/cm_x300_defconfig
@@ -86,7 +86,6 @@ CONFIG_REGULATOR=y
 CONFIG_REGULATOR_DA903X=y
 CONFIG_FB=y
 CONFIG_FB_PXA=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_LCD_TDO24M=y
 # CONFIG_BACKLIGHT_GENERIC is not set
diff --git a/arch/arm/configs/colibri_pxa270_defconfig b/arch/arm/configs/colibri_pxa270_defconfig
index 8d484e4d51cc..a54e1f32139f 100644
--- a/arch/arm/configs/colibri_pxa270_defconfig
+++ b/arch/arm/configs/colibri_pxa270_defconfig
@@ -102,7 +102,6 @@ CONFIG_WATCHDOG=y
 CONFIG_FB=y
 CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_PXA=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 # CONFIG_VGA_CONSOLE is not set
diff --git a/arch/arm/configs/colibri_pxa300_defconfig b/arch/arm/configs/colibri_pxa300_defconfig
index d282e8b0bf33..8364407e0abf 100644
--- a/arch/arm/configs/colibri_pxa300_defconfig
+++ b/arch/arm/configs/colibri_pxa300_defconfig
@@ -33,7 +33,6 @@ CONFIG_DEBUG_GPIO=y
 # CONFIG_HWMON is not set
 CONFIG_FB=y
 CONFIG_FB_PXA=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 # CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 # CONFIG_BACKLIGHT_GENERIC is not set
diff --git a/arch/arm/configs/collie_defconfig b/arch/arm/configs/collie_defconfig
index d398ae53aba7..e6df11e906ba 100644
--- a/arch/arm/configs/collie_defconfig
+++ b/arch/arm/configs/collie_defconfig
@@ -63,7 +63,6 @@ CONFIG_MCP_UCB1200_TS=y
 CONFIG_FB=y
 CONFIG_FB_MODE_HELPERS=y
 CONFIG_FB_SA1100=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
diff --git a/arch/arm/configs/corgi_defconfig b/arch/arm/configs/corgi_defconfig
index d99725984947..58d7deec7e1b 100644
--- a/arch/arm/configs/corgi_defconfig
+++ b/arch/arm/configs/corgi_defconfig
@@ -132,7 +132,6 @@ CONFIG_SPI=y
 CONFIG_SPI_PXA2XX=y
 CONFIG_FB=y
 CONFIG_FB_W100=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_LCD_CORGI=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
diff --git a/arch/arm/configs/em_x270_defconfig b/arch/arm/configs/em_x270_defconfig
index 61228a25ba8d..858289b7f1de 100644
--- a/arch/arm/configs/em_x270_defconfig
+++ b/arch/arm/configs/em_x270_defconfig
@@ -101,7 +101,6 @@ CONFIG_FB=y
 CONFIG_FB_PXA=y
 CONFIG_FB_PXA_PARAMETERS=y
 CONFIG_FB_MBX=m
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_LCD_TDO24M=y
 # CONFIG_BACKLIGHT_GENERIC is not set
diff --git a/arch/arm/configs/eseries_pxa_defconfig b/arch/arm/configs/eseries_pxa_defconfig
index b85575867d21..bc76cf5399b6 100644
--- a/arch/arm/configs/eseries_pxa_defconfig
+++ b/arch/arm/configs/eseries_pxa_defconfig
@@ -74,7 +74,6 @@ CONFIG_MFD_TC6393XB=y
 CONFIG_FB=y
 CONFIG_FB_PXA=y
 CONFIG_FB_W100=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 # CONFIG_VGA_CONSOLE is not set
diff --git a/arch/arm/configs/ezx_defconfig b/arch/arm/configs/ezx_defconfig
index e3afca5bd9d6..eb966ac6de1d 100644
--- a/arch/arm/configs/ezx_defconfig
+++ b/arch/arm/configs/ezx_defconfig
@@ -247,7 +247,6 @@ CONFIG_FB=y
 CONFIG_FB_PXA=y
 CONFIG_FB_PXA_OVERLAY=y
 CONFIG_FB_PXA_PARAMETERS=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 # CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_PWM=y
diff --git a/arch/arm/configs/imote2_defconfig b/arch/arm/configs/imote2_defconfig
index 9b779e13e05d..82f5b938e395 100644
--- a/arch/arm/configs/imote2_defconfig
+++ b/arch/arm/configs/imote2_defconfig
@@ -228,7 +228,6 @@ CONFIG_FB=y
 CONFIG_FB_PXA=y
 CONFIG_FB_PXA_OVERLAY=y
 CONFIG_FB_PXA_PARAMETERS=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 # CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 # CONFIG_VGA_CONSOLE is not set
diff --git a/arch/arm/configs/integrator_defconfig b/arch/arm/configs/integrator_defconfig
index 747550c7af2f..2f0a762dc3a0 100644
--- a/arch/arm/configs/integrator_defconfig
+++ b/arch/arm/configs/integrator_defconfig
@@ -61,7 +61,6 @@ CONFIG_FB_MODE_HELPERS=y
 CONFIG_FB_MATROX=y
 CONFIG_FB_MATROX_MILLENIUM=y
 CONFIG_FB_MATROX_MYSTIQUE=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_LOGO=y
diff --git a/arch/arm/configs/jornada720_defconfig b/arch/arm/configs/jornada720_defconfig
index 65d37ad6e6b8..3dcc2f4ab7b7 100644
--- a/arch/arm/configs/jornada720_defconfig
+++ b/arch/arm/configs/jornada720_defconfig
@@ -47,7 +47,6 @@ CONFIG_LEGACY_PTY_COUNT=32
 # CONFIG_HWMON is not set
 CONFIG_FB=y
 CONFIG_FB_S1D13XXX=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 # CONFIG_BACKLIGHT_GENERIC is not set
diff --git a/arch/arm/configs/lpc18xx_defconfig b/arch/arm/configs/lpc18xx_defconfig
index e3d5e15d66d1..e518168a0627 100644
--- a/arch/arm/configs/lpc18xx_defconfig
+++ b/arch/arm/configs/lpc18xx_defconfig
@@ -119,7 +119,6 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_DRM=y
 CONFIG_DRM_PL111=y
 CONFIG_FB_MODE_HELPERS=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_ROOT_HUB_TT=y
diff --git a/arch/arm/configs/lpc32xx_defconfig b/arch/arm/configs/lpc32xx_defconfig
index 4b3b2c693c29..6d5a0067e66d 100644
--- a/arch/arm/configs/lpc32xx_defconfig
+++ b/arch/arm/configs/lpc32xx_defconfig
@@ -110,7 +110,6 @@ CONFIG_DRM=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_PL111=y
 CONFIG_FB_MODE_HELPERS=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
diff --git a/arch/arm/configs/magician_defconfig b/arch/arm/configs/magician_defconfig
index de5be2fc7306..6116c44678b9 100644
--- a/arch/arm/configs/magician_defconfig
+++ b/arch/arm/configs/magician_defconfig
@@ -96,7 +96,6 @@ CONFIG_FB=y
 CONFIG_FB_PXA=y
 CONFIG_FB_PXA_OVERLAY=y
 CONFIG_FB_W100=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 # CONFIG_BACKLIGHT_GENERIC is not set
diff --git a/arch/arm/configs/mini2440_defconfig b/arch/arm/configs/mini2440_defconfig
index a0b9d86498bb..82b8848fdd93 100644
--- a/arch/arm/configs/mini2440_defconfig
+++ b/arch/arm/configs/mini2440_defconfig
@@ -156,7 +156,6 @@ CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_MODE_HELPERS=y
 CONFIG_FB_TILEBLITTING=y
 CONFIG_FB_S3C2410=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_LCD_PLATFORM=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
diff --git a/arch/arm/configs/mmp2_defconfig b/arch/arm/configs/mmp2_defconfig
index 94deb0ed0541..a5e8d2235a1a 100644
--- a/arch/arm/configs/mmp2_defconfig
+++ b/arch/arm/configs/mmp2_defconfig
@@ -50,7 +50,6 @@ CONFIG_MFD_MAX8925=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_MAX8649=y
 CONFIG_REGULATOR_MAX8925=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_MAX8925=y
diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
index ed570a0d1f2a..2773899c21b3 100644
--- a/arch/arm/configs/mxs_defconfig
+++ b/arch/arm/configs/mxs_defconfig
@@ -96,7 +96,6 @@ CONFIG_DRM=y
 CONFIG_DRM_PANEL_SEIKO_43WVF1G=y
 CONFIG_DRM_MXSFB=y
 CONFIG_FB_MODE_HELPERS=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_PWM=y
diff --git a/arch/arm/configs/nhk8815_defconfig b/arch/arm/configs/nhk8815_defconfig
index cfc094189d09..2ecb049daf61 100644
--- a/arch/arm/configs/nhk8815_defconfig
+++ b/arch/arm/configs/nhk8815_defconfig
@@ -98,7 +98,6 @@ CONFIG_REGULATOR=y
 CONFIG_DRM=y
 CONFIG_DRM_PANEL_TPO_TPG110=y
 CONFIG_DRM_PL111=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_PWM=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
diff --git a/arch/arm/configs/omap1_defconfig b/arch/arm/configs/omap1_defconfig
index 82af77c093f1..f24a857e8733 100644
--- a/arch/arm/configs/omap1_defconfig
+++ b/arch/arm/configs/omap1_defconfig
@@ -154,7 +154,6 @@ CONFIG_FB_OMAP_LCDC_EXTERNAL=y
 CONFIG_FB_OMAP_LCDC_HWA742=y
 CONFIG_FB_OMAP_MANUAL_UPDATE=y
 CONFIG_FB_OMAP_LCD_MIPID=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
diff --git a/arch/arm/configs/palmz72_defconfig b/arch/arm/configs/palmz72_defconfig
index e0a614272561..ade09bfcba56 100644
--- a/arch/arm/configs/palmz72_defconfig
+++ b/arch/arm/configs/palmz72_defconfig
@@ -49,7 +49,6 @@ CONFIG_PDA_POWER=y
 # CONFIG_HWMON is not set
 CONFIG_FB=y
 CONFIG_FB_PXA=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 # CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_PWM=y
diff --git a/arch/arm/configs/pxa3xx_defconfig b/arch/arm/configs/pxa3xx_defconfig
index 7681eea60127..02997bcbfe8a 100644
--- a/arch/arm/configs/pxa3xx_defconfig
+++ b/arch/arm/configs/pxa3xx_defconfig
@@ -72,7 +72,6 @@ CONFIG_REGULATOR_DEBUG=y
 CONFIG_REGULATOR_DA903X=y
 CONFIG_FB=y
 CONFIG_FB_PXA=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_LCD_TDO24M=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index 07ebbdce3645..a02dd4cf6138 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -462,7 +462,6 @@ CONFIG_PXA3XX_GCU=m
 CONFIG_FB_MBX=m
 CONFIG_FB_VIRTUAL=m
 CONFIG_FB_SIMPLE=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 CONFIG_LCD_CORGI=m
 CONFIG_LCD_PLATFORM=m
 CONFIG_LCD_TOSA=m
diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index c1854751c99a..e8a17b41b2db 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -148,7 +148,6 @@ CONFIG_MEDIA_SUPPORT=y
 CONFIG_DRM=y
 CONFIG_FB=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 # CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 # CONFIG_BACKLIGHT_GENERIC is not set
diff --git a/arch/arm/configs/realview_defconfig b/arch/arm/configs/realview_defconfig
index cc9fa24d4b8f..8884723b827e 100644
--- a/arch/arm/configs/realview_defconfig
+++ b/arch/arm/configs/realview_defconfig
@@ -65,7 +65,6 @@ CONFIG_DRM=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_PL111=y
 CONFIG_FB_MODE_HELPERS=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
diff --git a/arch/arm/configs/s3c6400_defconfig b/arch/arm/configs/s3c6400_defconfig
index 6e2656567da6..a18be42e5134 100644
--- a/arch/arm/configs/s3c6400_defconfig
+++ b/arch/arm/configs/s3c6400_defconfig
@@ -40,7 +40,6 @@ CONFIG_SPI_GPIO=m
 CONFIG_SPI_S3C64XX=m
 CONFIG_FB=y
 CONFIG_FB_S3C=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_LCD_LTV350QV=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
diff --git a/arch/arm/configs/sama5_defconfig b/arch/arm/configs/sama5_defconfig
index d5341b0bd88d..6275f4fb3e5e 100644
--- a/arch/arm/configs/sama5_defconfig
+++ b/arch/arm/configs/sama5_defconfig
@@ -154,7 +154,6 @@ CONFIG_SOC_CAMERA_OV2640=m
 CONFIG_DRM=y
 CONFIG_DRM_ATMEL_HLCDC=y
 CONFIG_DRM_PANEL_SIMPLE=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 # CONFIG_BACKLIGHT_GENERIC is not set
diff --git a/arch/arm/configs/spear3xx_defconfig b/arch/arm/configs/spear3xx_defconfig
index ddd73b25f75e..5d88c4817f41 100644
--- a/arch/arm/configs/spear3xx_defconfig
+++ b/arch/arm/configs/spear3xx_defconfig
@@ -54,7 +54,6 @@ CONFIG_WATCHDOG=y
 CONFIG_ARM_SP805_WATCHDOG=y
 CONFIG_DRM=y
 CONFIG_DRM_PL111=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/arch/arm/configs/spitz_defconfig b/arch/arm/configs/spitz_defconfig
index f6d2f674517c..09f6fe432eef 100644
--- a/arch/arm/configs/spitz_defconfig
+++ b/arch/arm/configs/spitz_defconfig
@@ -126,7 +126,6 @@ CONFIG_SPI=y
 CONFIG_SPI_PXA2XX=y
 CONFIG_FB=y
 CONFIG_FB_PXA=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_LCD_CORGI=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
diff --git a/arch/arm/configs/trizeps4_defconfig b/arch/arm/configs/trizeps4_defconfig
index ecad22501b48..d66f0c287d41 100644
--- a/arch/arm/configs/trizeps4_defconfig
+++ b/arch/arm/configs/trizeps4_defconfig
@@ -136,7 +136,6 @@ CONFIG_SA1100_WATCHDOG=y
 CONFIG_FB=y
 CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_PXA=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 # CONFIG_VGA_CONSOLE is not set
diff --git a/arch/arm/configs/u300_defconfig b/arch/arm/configs/u300_defconfig
index bedf397c75de..9f16487c0eb0 100644
--- a/arch/arm/configs/u300_defconfig
+++ b/arch/arm/configs/u300_defconfig
@@ -43,7 +43,6 @@ CONFIG_WATCHDOG=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_FB=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 # CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 # CONFIG_USB_SUPPORT is not set
diff --git a/arch/arm/configs/versatile_defconfig b/arch/arm/configs/versatile_defconfig
index 5282324c7cef..fe4d4b596585 100644
--- a/arch/arm/configs/versatile_defconfig
+++ b/arch/arm/configs/versatile_defconfig
@@ -62,7 +62,6 @@ CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_DUMB_VGA_DAC=y
 CONFIG_DRM_PL111=y
 CONFIG_FB_MODE_HELPERS=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_LOGO=y
 CONFIG_SOUND=y
diff --git a/arch/arm/configs/vexpress_defconfig b/arch/arm/configs/vexpress_defconfig
index 484d77a7f589..d170da388389 100644
--- a/arch/arm/configs/vexpress_defconfig
+++ b/arch/arm/configs/vexpress_defconfig
@@ -86,7 +86,6 @@ CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_SII902X=y
 CONFIG_DRM_PL111=y
 CONFIG_FB_MODE_HELPERS=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
diff --git a/arch/arm/configs/viper_defconfig b/arch/arm/configs/viper_defconfig
index 070e5074f1ee..218bfb6c9b24 100644
--- a/arch/arm/configs/viper_defconfig
+++ b/arch/arm/configs/viper_defconfig
@@ -110,7 +110,6 @@ CONFIG_WATCHDOG=y
 CONFIG_FB=y
 CONFIG_FB_PXA=m
 CONFIG_FB_PXA_PARAMETERS=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 CONFIG_BACKLIGHT_PWM=m
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
diff --git a/arch/arm/configs/zeus_defconfig b/arch/arm/configs/zeus_defconfig
index 09e7050d5653..8c01047801b8 100644
--- a/arch/arm/configs/zeus_defconfig
+++ b/arch/arm/configs/zeus_defconfig
@@ -110,7 +110,6 @@ CONFIG_WATCHDOG=y
 CONFIG_FB=y
 CONFIG_FB_PXA=m
 CONFIG_FB_PXA_PARAMETERS=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
-- 
2.7.4

