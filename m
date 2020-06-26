Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60A8620B0F8
	for <lists+linux-omap@lfdr.de>; Fri, 26 Jun 2020 13:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728902AbgFZLxo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 26 Jun 2020 07:53:44 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:38565 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727823AbgFZLxl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Fri, 26 Jun 2020 07:53:41 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id omv4jNJEP0MRaomvLjN2nO; Fri, 26 Jun 2020 13:53:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593172419; bh=3NGkg9jtYaeqc5bKrG6IOVQP2LXCnDH/oz9GeKbjg6Q=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=mx8WH3289YJxJ+rnCDSAXIV2kF5V8N3y7Q7eyw2s6be0xW5zc0nhvr3J5FaOVV7Za
         vGLDwzCBXLhGH1f5/3w5FKM4nbQMn2ikffIuKAJKT035i+VbCt3vijiHDIwDL5V7UL
         Xkj2qRrqcRNNKFqLw1tKkHMSjtje+0GZJAuWOyRZvx0xfu1M6XGGMuy8MKXPO+Qout
         TjMN7m5wIucduNlInCzbCPciZZVHkq18rMoRk5R9oO16XHAlFgtFmFBZXoYE03UCh4
         BPZ2q7eYmKShsrS1VGXzvv70m5B+3s7Z1ZBUZMT3kPufeANfSxfCXSXIZ+GP007GnY
         USgLjd2S2vaIQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 3/7] mach-imx: mach-imx27_visstrim_m10.c: remove soc_camera dependencies
Date:   Fri, 26 Jun 2020 13:53:17 +0200
Message-Id: <20200626115321.1898798-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626115321.1898798-1-hverkuil-cisco@xs4all.nl>
References: <20200626115321.1898798-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfIzDGmm54NkO8W3SCVbUUAstiCA20EKfCwZIT0izPaF5iBHWGwmtdzwhRo5LIoLW+5JOnha/vYGpqq8JTMDB3rHvgpWRBbDJEWi4TF3qqvKYMNoW7rsF
 TE5iKNNQzd6+6x/HnyCqVQ31GrfPEFHXhz+01I9VLifLttucc3VGMWTtDjZ362X1UrEIHQUfeLIfRHu/FmXjDEucAcwoFwgY3ucKAbNebMp6hHckEFNCVwZh
 qwkOwlEAbBekjo64OvW4SJfNLB4EIUFsG85Ou5HU0D78XTGZhBSECulHZT2Xl/M2k6SeEqJel3T90zAI0dJxTmM9UHHoI59Hnn83RH82xMI=
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The soc_camera.h header driver is about to be removed, so drop camera
support from this board. Note that the soc_camera driver itself has
long since been deprecated and can't be compiled anymore (it depends
on BROKEN), so camera support on this board has been broken for a long
time (at least since 4.6 when the mx2_camera.c was removed from soc_camera).

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-imx/mach-imx27_visstrim_m10.c | 31 ---------------------
 1 file changed, 31 deletions(-)

diff --git a/arch/arm/mach-imx/mach-imx27_visstrim_m10.c b/arch/arm/mach-imx/mach-imx27_visstrim_m10.c
index c0350bc20941..3da4c0920198 100644
--- a/arch/arm/mach-imx/mach-imx27_visstrim_m10.c
+++ b/arch/arm/mach-imx/mach-imx27_visstrim_m10.c
@@ -19,7 +19,6 @@
 #include <linux/dma-mapping.h>
 #include <linux/leds.h>
 #include <linux/platform_data/asoc-mx27vis.h>
-#include <media/soc_camera.h>
 #include <sound/tlv320aic32x4.h>
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
@@ -191,34 +190,6 @@ static const struct gpio visstrim_m10_gpios[] __initconst = {
 };
 
 /* Camera */
-static int visstrim_camera_power(struct device *dev, int on)
-{
-	gpio_set_value(TVP5150_PWDN, on);
-
-	return 0;
-};
-
-static int visstrim_camera_reset(struct device *dev)
-{
-	gpio_set_value(TVP5150_RSTN, 0);
-	ndelay(500);
-	gpio_set_value(TVP5150_RSTN, 1);
-
-	return 0;
-};
-
-static struct i2c_board_info visstrim_i2c_camera =  {
-	I2C_BOARD_INFO("tvp5150", 0x5d),
-};
-
-static struct soc_camera_link iclink_tvp5150 = {
-	.bus_id         = 0,
-	.board_info     = &visstrim_i2c_camera,
-	.i2c_adapter_id = 0,
-	.power = visstrim_camera_power,
-	.reset = visstrim_camera_reset,
-};
-
 static struct mx2_camera_platform_data visstrim_camera = {
 	.flags = MX2_CAMERA_CCIR | MX2_CAMERA_CCIR_INTERLACE |
 		 MX2_CAMERA_PCLK_SAMPLE_RISING,
@@ -549,8 +520,6 @@ static void __init visstrim_m10_late_init(void)
 
 	imx_add_platform_device("mx27vis", 0, NULL, 0, &snd_mx27vis_pdata,
 				sizeof(snd_mx27vis_pdata));
-	platform_device_register_resndata(NULL, "soc-camera-pdrv", 0, NULL, 0,
-				      &iclink_tvp5150, sizeof(iclink_tvp5150));
 
 	gpio_led_register_device(0, &visstrim_m10_led_data);
 
-- 
2.27.0

