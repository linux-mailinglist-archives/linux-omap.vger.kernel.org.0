Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E73BA20B0F7
	for <lists+linux-omap@lfdr.de>; Fri, 26 Jun 2020 13:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725884AbgFZLxo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 26 Jun 2020 07:53:44 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:47487 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726901AbgFZLxn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Fri, 26 Jun 2020 07:53:43 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id omv4jNJEP0MRaomvLjN2nU; Fri, 26 Jun 2020 13:53:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593172420; bh=8IQwi2UOOo9egwe5J+rhUluuFakB9GIcrBw1NndKzgM=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=c/okY/OXv381/ofB83my/ilerviZmGu9VLzT2XIFq5Z+GowWI6pxwNA+Av6ATP4pK
         ckvPZCmcN3+h70jFfjaET3WwEzU5IL87IrO0+WiJ3fhqVlePqkWJneypQlEp+YCtzc
         2SiQbCcHXpdzyiGzNVGxG0II4+NtztFJS6fMAlm71AvA1mnv35R+gxzmdjzIYVbLOt
         FhIX4uI9cuzR2fhQ/vWXHfwYwWMjBsRfU8UlbEe4U4K29+6nxkOrnnxj37adVDvaP0
         VBHQBDI46REH/SAVwz9rW4BP2YUpHXETbg8v/Y4s6W9DW710dhnBHLCyQwQhd4I49o
         wyMrqXUAxyfWg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>
Subject: [PATCH 4/7] mach-omap1: board-ams-delta.c: remove soc_camera dependencies
Date:   Fri, 26 Jun 2020 13:53:18 +0200
Message-Id: <20200626115321.1898798-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626115321.1898798-1-hverkuil-cisco@xs4all.nl>
References: <20200626115321.1898798-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfM83++3PfpXBGBT6xIQAO90d/DwDpX+hH4alsFkWUBRt3CCwupXJbI88DXpqI7xGvjJBSMGKG7Pp4Di+S9Ip0O14Zp/RT6dAZeiZ5BPbLRsKfY9efF7m
 IHmTiuAamnX/GFlUdq1k53NYJchRcGT+oSdg4Nm9kHZ2eFirhXcNOrj9YRe60IXuFHf6dsqqs1K4xtYg6TIqkQKLAAYBQmKUSVu7MRH3BJVT34aIhjuHSUMj
 23/TiEFj4ljSdnugcNmXSzv0oKGc5lNlZytTLSzPsZZHG2JgHs28G3HjTfTcv7un0zr4Ox/tWr7EedClTRn+ndzPfJt+is73FLPHVNLNW8VMvHTAM6zOnRo2
 2XrdC+naW48g/iCQZynPi6MA/F+MuA==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The soc_camera driver is about to be removed, so drop camera
support from this board. Note that the soc_camera driver itself has
long since been deprecated and can't be compiled anymore (it depends
on BROKEN), so camera support on this board has been broken for a long
time (at least since 4.6 when the omap1_camera.c was removed from soc_camera).

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap1/board-ams-delta.c         | 32 --------------
 arch/arm/mach-omap1/camera.h                  | 14 ------
 arch/arm/mach-omap1/devices.c                 | 43 -------------------
 .../linux/platform_data/media/omap1_camera.h  | 32 --------------
 4 files changed, 121 deletions(-)
 delete mode 100644 arch/arm/mach-omap1/camera.h
 delete mode 100644 include/linux/platform_data/media/omap1_camera.h

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index 8d32894ecd2e..2ee527c00284 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -29,8 +29,6 @@
 #include <linux/io.h>
 #include <linux/platform_data/gpio-omap.h>
 
-#include <media/soc_camera.h>
-
 #include <asm/serial.h>
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
@@ -40,7 +38,6 @@
 #include <mach/mux.h>
 
 #include <mach/hardware.h>
-#include "camera.h"
 #include <mach/usb.h>
 
 #include "ams-delta-fiq.h"
@@ -459,12 +456,6 @@ static struct gpiod_lookup_table leds_gpio_table = {
 	},
 };
 
-static struct i2c_board_info ams_delta_camera_board_info[] = {
-	{
-		I2C_BOARD_INFO("ov6650", 0x60),
-	},
-};
-
 #ifdef CONFIG_LEDS_TRIGGERS
 DEFINE_LED_TRIGGER(ams_delta_camera_led_trigger);
 
@@ -483,27 +474,6 @@ static int ams_delta_camera_power(struct device *dev, int power)
 #define ams_delta_camera_power	NULL
 #endif
 
-static struct soc_camera_link ams_delta_iclink = {
-	.bus_id         = 0,	/* OMAP1 SoC camera bus */
-	.i2c_adapter_id = 1,
-	.board_info     = &ams_delta_camera_board_info[0],
-	.module_name    = "ov6650",
-	.power		= ams_delta_camera_power,
-};
-
-static struct platform_device ams_delta_camera_device = {
-	.name   = "soc-camera-pdrv",
-	.id     = 0,
-	.dev    = {
-		.platform_data = &ams_delta_iclink,
-	},
-};
-
-static struct omap1_cam_platform_data ams_delta_camera_platform_data = {
-	.camexclk_khz	= 12000,	/* default 12MHz clock, no extra DPLL */
-	.lclk_khz_max	= 1334,		/* results in 5fps CIF, 10fps QCIF */
-};
-
 static struct platform_device ams_delta_audio_device = {
 	.name   = "ams-delta-audio",
 	.id     = -1,
@@ -598,7 +568,6 @@ static struct platform_device *ams_delta_devices[] __initdata = {
 	&latch1_gpio_device,
 	&latch2_gpio_device,
 	&ams_delta_kp_device,
-	&ams_delta_camera_device,
 	&ams_delta_audio_device,
 	&ams_delta_serio_device,
 	&ams_delta_nand_device,
@@ -750,7 +719,6 @@ static void __init ams_delta_init(void)
 	omap_register_i2c_bus(1, 100, NULL, 0);
 
 	omap1_usb_init(&ams_delta_usb_config);
-	omap1_set_camera_info(&ams_delta_camera_platform_data);
 #ifdef CONFIG_LEDS_TRIGGERS
 	led_trigger_register_simple("ams_delta_camera",
 			&ams_delta_camera_led_trigger);
diff --git a/arch/arm/mach-omap1/camera.h b/arch/arm/mach-omap1/camera.h
deleted file mode 100644
index 8018f410d024..000000000000
--- a/arch/arm/mach-omap1/camera.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_ARCH_CAMERA_H_
-#define __ASM_ARCH_CAMERA_H_
-
-#include <linux/platform_data/media/omap1_camera.h>
-
-void omap1_camera_init(void *);
-
-static inline void omap1_set_camera_info(struct omap1_cam_platform_data *info)
-{
-	omap1_camera_init(info);
-}
-
-#endif /* __ASM_ARCH_CAMERA_H_ */
diff --git a/arch/arm/mach-omap1/devices.c b/arch/arm/mach-omap1/devices.c
index 3c4900ac72fc..eb0f09edb3d1 100644
--- a/arch/arm/mach-omap1/devices.c
+++ b/arch/arm/mach-omap1/devices.c
@@ -21,7 +21,6 @@
 #include <mach/mux.h>
 
 #include <mach/omap7xx.h>
-#include "camera.h"
 #include <mach/hardware.h>
 
 #include "common.h"
@@ -258,48 +257,6 @@ static inline void omap_init_spi100k(void)
 }
 #endif
 
-
-#define OMAP1_CAMERA_BASE	0xfffb6800
-#define OMAP1_CAMERA_IOSIZE	0x1c
-
-static struct resource omap1_camera_resources[] = {
-	[0] = {
-		.start	= OMAP1_CAMERA_BASE,
-		.end	= OMAP1_CAMERA_BASE + OMAP1_CAMERA_IOSIZE - 1,
-		.flags	= IORESOURCE_MEM,
-	},
-	[1] = {
-		.start	= INT_CAMERA,
-		.flags	= IORESOURCE_IRQ,
-	},
-};
-
-static u64 omap1_camera_dma_mask = DMA_BIT_MASK(32);
-
-static struct platform_device omap1_camera_device = {
-	.name		= "omap1-camera",
-	.id		= 0, /* This is used to put cameras on this interface */
-	.dev		= {
-		.dma_mask		= &omap1_camera_dma_mask,
-		.coherent_dma_mask	= DMA_BIT_MASK(32),
-	},
-	.num_resources	= ARRAY_SIZE(omap1_camera_resources),
-	.resource	= omap1_camera_resources,
-};
-
-void __init omap1_camera_init(void *info)
-{
-	struct platform_device *dev = &omap1_camera_device;
-	int ret;
-
-	dev->dev.platform_data = info;
-
-	ret = platform_device_register(dev);
-	if (ret)
-		dev_err(&dev->dev, "unable to register device: %d\n", ret);
-}
-
-
 /*-------------------------------------------------------------------------*/
 
 static inline void omap_init_sti(void) {}
diff --git a/include/linux/platform_data/media/omap1_camera.h b/include/linux/platform_data/media/omap1_camera.h
deleted file mode 100644
index 386439db68de..000000000000
--- a/include/linux/platform_data/media/omap1_camera.h
+++ /dev/null
@@ -1,32 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Header for V4L2 SoC Camera driver for OMAP1 Camera Interface
- *
- * Copyright (C) 2010, Janusz Krzysztofik <jkrzyszt@tis.icnet.pl>
- */
-
-#ifndef __MEDIA_OMAP1_CAMERA_H_
-#define __MEDIA_OMAP1_CAMERA_H_
-
-#include <linux/bitops.h>
-
-#define OMAP1_CAMERA_IOSIZE		0x1c
-
-enum omap1_cam_vb_mode {
-	OMAP1_CAM_DMA_CONTIG = 0,
-	OMAP1_CAM_DMA_SG,
-};
-
-#define OMAP1_CAMERA_MIN_BUF_COUNT(x)	((x) == OMAP1_CAM_DMA_CONTIG ? 3 : 2)
-
-struct omap1_cam_platform_data {
-	unsigned long	camexclk_khz;
-	unsigned long	lclk_khz_max;
-	unsigned long	flags;
-};
-
-#define OMAP1_CAMERA_LCLK_RISING	BIT(0)
-#define OMAP1_CAMERA_RST_LOW		BIT(1)
-#define OMAP1_CAMERA_RST_HIGH		BIT(2)
-
-#endif /* __MEDIA_OMAP1_CAMERA_H_ */
-- 
2.27.0

