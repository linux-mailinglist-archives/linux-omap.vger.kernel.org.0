Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A533B20B0FD
	for <lists+linux-omap@lfdr.de>; Fri, 26 Jun 2020 13:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727818AbgFZLxr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 26 Jun 2020 07:53:47 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:40279 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727876AbgFZLxn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Fri, 26 Jun 2020 07:53:43 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id omv4jNJEP0MRaomvMjN2nm; Fri, 26 Jun 2020 13:53:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593172420; bh=ILcKqFv3h0kmEmx9/ZHVcYq7DskHYVXqtZDIue9+UnQ=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=kKs/iRX4QYm/khTeeyi8soRJcJev7SndQd1VyItCZu1NF7U/i2c3+q5KOoRbc+ulo
         eNWPrNHv3oZiMZ6NPhHo336vDTR3k4+cy2kJ84cEEEB3Qh66O27D8e+mJGjoLq2hI8
         4HtQqercX3ewPq0OEUoSbO+yHAio8uc2opQKXLlxKeTOk+jXARGtN/w6FmgbQWFI6N
         YcgE52WqID66RFAPZuxh2Srh6ep11nDjeHFAhAm/t5qyCmACXk3egH3Gi5riGCagUd
         JPjW1NZZ6KEdxswx5haXV4wSmZFCK6uUvh8FDJr4ImxogS3mpi+p/DornQRyH86yWa
         /fSHkbwfHb6Ug==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Arnd Bergmann <arnd@arndb.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH 5/7] mach-pxa: palmz72/pcm990: remove soc_camera dependencies
Date:   Fri, 26 Jun 2020 13:53:19 +0200
Message-Id: <20200626115321.1898798-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626115321.1898798-1-hverkuil-cisco@xs4all.nl>
References: <20200626115321.1898798-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfM83++3PfpXBGBT6xIQAO90d/DwDpX+hH4alsFkWUBRt3CCwupXJbI88DXpqI7xGvjJBSMGKG7Pp4Di+S9Ip0O14Zp/RT6dAZeiZ5BPbLRsKfY9efF7m
 IHmTiuAamnX/GFlUdq1k53NYJchRcGT+oSdg4Nm9kHZ2eFirhXcNOrj9YRe60IXuFHf6dsqqs1K4xtYg6TIqkQKLAAYBQmKUSVu7MRH3BJVT34aIhjuHSUMj
 23/TiEFj4ljSdnugcNmXSzv0oKGc5lNlZytTLSzPsZZHG2JgHs28G3HjTfTcv7un0zr4Ox/tWr7EedClTRn+nalh9pCqQsNDlgUWpQjcVrCC70TJY0G76cMb
 Z96NZEgWxuZENNKjNbYPmqckG8xR4Q==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The soc_camera driver is about to be removed, so drop camera
support from this board. Note that the soc_camera driver itself has
long since been deprecated and can't be compiled anymore (it depends
on BROKEN), so camera support on this board has been broken for a long
time (at least since 4.9 when the pxa_camera.c was removed from soc_camera).

Note that there is a new pxa_camera.c driver that replaced the old
soc_camera based driver, but using that would require these boards to
be converted to use the device tree.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
---
 arch/arm/mach-pxa/palmz72.c          | 112 -------------------
 arch/arm/mach-pxa/pcm990-baseboard.c | 157 ---------------------------
 2 files changed, 269 deletions(-)

diff --git a/arch/arm/mach-pxa/palmz72.c b/arch/arm/mach-pxa/palmz72.c
index 4df443943579..b4a5fe02a0af 100644
--- a/arch/arm/mach-pxa/palmz72.c
+++ b/arch/arm/mach-pxa/palmz72.c
@@ -47,8 +47,6 @@
 #include "pm.h"
 #include <linux/platform_data/media/camera-pxa.h>
 
-#include <media/soc_camera.h>
-
 #include "generic.h"
 #include "devices.h"
 
@@ -272,115 +270,6 @@ static int __init palmz72_pm_init(void)
 device_initcall(palmz72_pm_init);
 #endif
 
-/******************************************************************************
- * SoC Camera
- ******************************************************************************/
-#if defined(CONFIG_SOC_CAMERA_OV9640) || \
-	defined(CONFIG_SOC_CAMERA_OV9640_MODULE)
-static struct pxacamera_platform_data palmz72_pxacamera_platform_data = {
-	.flags		= PXA_CAMERA_MASTER | PXA_CAMERA_DATAWIDTH_8 |
-			PXA_CAMERA_PCLK_EN | PXA_CAMERA_MCLK_EN,
-	.mclk_10khz	= 2600,
-};
-
-/* Board I2C devices. */
-static struct i2c_board_info palmz72_i2c_device[] = {
-	{
-		I2C_BOARD_INFO("ov9640", 0x30),
-	}
-};
-
-static int palmz72_camera_power(struct device *dev, int power)
-{
-	gpio_set_value(GPIO_NR_PALMZ72_CAM_PWDN, !power);
-	mdelay(50);
-	return 0;
-}
-
-static int palmz72_camera_reset(struct device *dev)
-{
-	gpio_set_value(GPIO_NR_PALMZ72_CAM_RESET, 1);
-	mdelay(50);
-	gpio_set_value(GPIO_NR_PALMZ72_CAM_RESET, 0);
-	mdelay(50);
-	return 0;
-}
-
-static struct soc_camera_link palmz72_iclink = {
-	.bus_id		= 0, /* Match id in pxa27x_device_camera in device.c */
-	.board_info	= &palmz72_i2c_device[0],
-	.i2c_adapter_id	= 0,
-	.module_name	= "ov96xx",
-	.power		= &palmz72_camera_power,
-	.reset		= &palmz72_camera_reset,
-	.flags		= SOCAM_DATAWIDTH_8,
-};
-
-static struct gpiod_lookup_table palmz72_i2c_gpiod_table = {
-	.dev_id		= "i2c-gpio.0",
-	.table		= {
-		GPIO_LOOKUP_IDX("gpio-pxa", 118, NULL, 0,
-				GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN),
-		GPIO_LOOKUP_IDX("gpio-pxa", 117, NULL, 1,
-				GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN),
-	},
-};
-
-static struct i2c_gpio_platform_data palmz72_i2c_bus_data = {
-	.udelay		= 10,
-	.timeout	= 100,
-};
-
-static struct platform_device palmz72_i2c_bus_device = {
-	.name		= "i2c-gpio",
-	.id		= 0, /* we use this as a replacement for i2c-pxa */
-	.dev		= {
-		.platform_data	= &palmz72_i2c_bus_data,
-	}
-};
-
-static struct platform_device palmz72_camera = {
-	.name	= "soc-camera-pdrv",
-	.id	= -1,
-	.dev	= {
-		.platform_data	= &palmz72_iclink,
-	},
-};
-
-/* Here we request the camera GPIOs and configure them. We power up the camera
- * module, deassert the reset pin, but put it into powerdown (low to no power
- * consumption) mode. This allows us to later bring the module up fast. */
-static struct gpio palmz72_camera_gpios[] = {
-	{ GPIO_NR_PALMZ72_CAM_POWER,	GPIOF_INIT_HIGH,"Camera DVDD" },
-	{ GPIO_NR_PALMZ72_CAM_RESET,	GPIOF_INIT_LOW,	"Camera RESET" },
-	{ GPIO_NR_PALMZ72_CAM_PWDN,	GPIOF_INIT_LOW,	"Camera PWDN" },
-};
-
-static inline void __init palmz72_cam_gpio_init(void)
-{
-	int ret;
-
-	ret = gpio_request_array(ARRAY_AND_SIZE(palmz72_camera_gpios));
-	if (!ret)
-		gpio_free_array(ARRAY_AND_SIZE(palmz72_camera_gpios));
-	else
-		printk(KERN_ERR "Camera GPIO init failed!\n");
-
-	return;
-}
-
-static void __init palmz72_camera_init(void)
-{
-	palmz72_cam_gpio_init();
-	pxa_set_camera_info(&palmz72_pxacamera_platform_data);
-	gpiod_add_lookup_table(&palmz72_i2c_gpiod_table);
-	platform_device_register(&palmz72_i2c_bus_device);
-	platform_device_register(&palmz72_camera);
-}
-#else
-static inline void palmz72_camera_init(void) {}
-#endif
-
 static struct gpiod_lookup_table palmz72_mci_gpio_table = {
 	.dev_id = "pxa2xx-mci.0",
 	.table = {
@@ -416,7 +305,6 @@ static void __init palmz72_init(void)
 	palm27x_pmic_init();
 	palmz72_kpc_init();
 	palmz72_leds_init();
-	palmz72_camera_init();
 }
 
 MACHINE_START(PALMZ72, "Palm Zire72")
diff --git a/arch/arm/mach-pxa/pcm990-baseboard.c b/arch/arm/mach-pxa/pcm990-baseboard.c
index bf613f88d70b..8dfcc366d0fe 100644
--- a/arch/arm/mach-pxa/pcm990-baseboard.c
+++ b/arch/arm/mach-pxa/pcm990-baseboard.c
@@ -24,10 +24,6 @@
 #include <linux/pwm.h>
 #include <linux/pwm_backlight.h>
 
-#include <media/i2c/mt9v022.h>
-#include <media/soc_camera.h>
-
-#include <linux/platform_data/media/camera-pxa.h>
 #include <asm/mach/map.h>
 #include "pxa27x.h"
 #include <mach/audio.h>
@@ -374,149 +370,6 @@ static struct pxaohci_platform_data pcm990_ohci_platform_data = {
 	.power_on_delay	= 10,
 };
 
-/*
- * PXA27x Camera specific stuff
- */
-#if defined(CONFIG_VIDEO_PXA27x) || defined(CONFIG_VIDEO_PXA27x_MODULE)
-static unsigned long pcm990_camera_pin_config[] = {
-	/* CIF */
-	GPIO98_CIF_DD_0,
-	GPIO105_CIF_DD_1,
-	GPIO104_CIF_DD_2,
-	GPIO103_CIF_DD_3,
-	GPIO95_CIF_DD_4,
-	GPIO94_CIF_DD_5,
-	GPIO93_CIF_DD_6,
-	GPIO108_CIF_DD_7,
-	GPIO107_CIF_DD_8,
-	GPIO106_CIF_DD_9,
-	GPIO42_CIF_MCLK,
-	GPIO45_CIF_PCLK,
-	GPIO43_CIF_FV,
-	GPIO44_CIF_LV,
-};
-
-/*
- * CICR4: PCLK_EN:	Pixel clock is supplied by the sensor
- *	MCLK_EN:	Master clock is generated by PXA
- *	PCP:		Data sampled on the falling edge of pixel clock
- */
-struct pxacamera_platform_data pcm990_pxacamera_platform_data = {
-	.flags  = PXA_CAMERA_MASTER | PXA_CAMERA_DATAWIDTH_8 | PXA_CAMERA_DATAWIDTH_10 |
-		PXA_CAMERA_PCLK_EN | PXA_CAMERA_MCLK_EN/* | PXA_CAMERA_PCP*/,
-	.mclk_10khz = 1000,
-};
-
-#include <linux/platform_data/pca953x.h>
-
-static struct pca953x_platform_data pca9536_data = {
-	.gpio_base	= PXA_NR_BUILTIN_GPIO,
-};
-
-static int gpio_bus_switch = -EINVAL;
-
-static int pcm990_camera_set_bus_param(struct soc_camera_link *link,
-				       unsigned long flags)
-{
-	if (gpio_bus_switch < 0) {
-		if (flags == SOCAM_DATAWIDTH_10)
-			return 0;
-		else
-			return -EINVAL;
-	}
-
-	if (flags & SOCAM_DATAWIDTH_8)
-		gpio_set_value_cansleep(gpio_bus_switch, 1);
-	else
-		gpio_set_value_cansleep(gpio_bus_switch, 0);
-
-	return 0;
-}
-
-static unsigned long pcm990_camera_query_bus_param(struct soc_camera_link *link)
-{
-	int ret;
-
-	if (gpio_bus_switch < 0) {
-		ret = gpio_request(PXA_NR_BUILTIN_GPIO, "camera");
-		if (!ret) {
-			gpio_bus_switch = PXA_NR_BUILTIN_GPIO;
-			gpio_direction_output(gpio_bus_switch, 0);
-		}
-	}
-
-	if (gpio_bus_switch >= 0)
-		return SOCAM_DATAWIDTH_8 | SOCAM_DATAWIDTH_10;
-	else
-		return SOCAM_DATAWIDTH_10;
-}
-
-static void pcm990_camera_free_bus(struct soc_camera_link *link)
-{
-	if (gpio_bus_switch < 0)
-		return;
-
-	gpio_free(gpio_bus_switch);
-	gpio_bus_switch = -EINVAL;
-}
-
-/* Board I2C devices. */
-static struct i2c_board_info __initdata pcm990_i2c_devices[] = {
-	{
-		/* Must initialize before the camera(s) */
-		I2C_BOARD_INFO("pca9536", 0x41),
-		.platform_data = &pca9536_data,
-	},
-};
-
-static struct mt9v022_platform_data mt9v022_pdata = {
-	.y_skip_top = 1,
-};
-
-static struct i2c_board_info pcm990_camera_i2c[] = {
-	{
-		I2C_BOARD_INFO("mt9v022", 0x48),
-	}, {
-		I2C_BOARD_INFO("mt9m001", 0x5d),
-	},
-};
-
-static struct soc_camera_link iclink[] = {
-	{
-		.bus_id			= 0, /* Must match with the camera ID */
-		.board_info		= &pcm990_camera_i2c[0],
-		.priv			= &mt9v022_pdata,
-		.i2c_adapter_id		= 0,
-		.query_bus_param	= pcm990_camera_query_bus_param,
-		.set_bus_param		= pcm990_camera_set_bus_param,
-		.free_bus		= pcm990_camera_free_bus,
-	}, {
-		.bus_id			= 0, /* Must match with the camera ID */
-		.board_info		= &pcm990_camera_i2c[1],
-		.i2c_adapter_id		= 0,
-		.query_bus_param	= pcm990_camera_query_bus_param,
-		.set_bus_param		= pcm990_camera_set_bus_param,
-		.free_bus		= pcm990_camera_free_bus,
-	},
-};
-
-static struct platform_device pcm990_camera[] = {
-	{
-		.name	= "soc-camera-pdrv",
-		.id	= 0,
-		.dev	= {
-			.platform_data = &iclink[0],
-		},
-	}, {
-		.name	= "soc-camera-pdrv",
-		.id	= 1,
-		.dev	= {
-			.platform_data = &iclink[1],
-		},
-	},
-};
-#endif /* CONFIG_VIDEO_PXA27x ||CONFIG_VIDEO_PXA27x_MODULE */
-
 /*
  * system init for baseboard usage. Will be called by pcm027 init.
  *
@@ -551,15 +404,5 @@ void __init pcm990_baseboard_init(void)
 	pxa_set_i2c_info(NULL);
 	pxa_set_ac97_info(NULL);
 
-#if defined(CONFIG_VIDEO_PXA27x) || defined(CONFIG_VIDEO_PXA27x_MODULE)
-	pxa2xx_mfp_config(ARRAY_AND_SIZE(pcm990_camera_pin_config));
-	pxa_set_camera_info(&pcm990_pxacamera_platform_data);
-
-	i2c_register_board_info(0, ARRAY_AND_SIZE(pcm990_i2c_devices));
-
-	platform_device_register(&pcm990_camera[0]);
-	platform_device_register(&pcm990_camera[1]);
-#endif
-
 	printk(KERN_INFO "PCM-990 Evaluation baseboard initialized\n");
 }
-- 
2.27.0

