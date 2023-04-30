Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 932A76F2A79
	for <lists+linux-omap@lfdr.de>; Sun, 30 Apr 2023 21:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231202AbjD3Tic (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 30 Apr 2023 15:38:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjD3Tib (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 30 Apr 2023 15:38:31 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD42B186
        for <linux-omap@vger.kernel.org>; Sun, 30 Apr 2023 12:38:28 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4efd6e26585so2224390e87.1
        for <linux-omap@vger.kernel.org>; Sun, 30 Apr 2023 12:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682883507; x=1685475507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ik8hCS/jNuBIdmFQhk+wJ0CjZJ753UK/c+kLRGa0JY0=;
        b=dGCNNRWunjZyGbPEHLEeh9E2ky+NMFwVMuHxu/qblINiGUf/jGo/j6m+YeH1uwpucR
         wrY39u7m8FAPNuPolZq87Ke6zJDye45gtOp9szliAqj4BQ9pxsQ9ZhNTwZ3QwlyFCnhr
         TJAt4mP+NlAeN/xAwzBKRu1VWEBJteo7217ZqxHEOs+fKUHu8p/yB8tmkqQMJcvvEdvD
         AcOXxQmOecRjc0mjmwJw9pvT9tBraZ4eiNEEBftDg1PQIz7OUNFfiQoox+TeisyqU2p2
         XMKVIVUJlfFlvxIuz9r3AZdXfTVVFaft8O+0H1yhWd4yGanVbXbRTVmJtMTbg9Z1BABA
         x1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682883507; x=1685475507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ik8hCS/jNuBIdmFQhk+wJ0CjZJ753UK/c+kLRGa0JY0=;
        b=Q+sq+wVBrgwd+uzZ4JTJKr22S7jThO+VJJp/JbGVmbgNlLKhLK4zSP6GU+YYKr/WFE
         pt1tmm6jvXZGb4DR7SEjz6Gh+ew9bUb+mtH3sI17Cv4J8RRdLdpDXSsVItQiqOSz1i6t
         KN365chUZVNGIl81fJlbOjmJbGQD7I/jfPobzQmj5LB33NH2Hp4Jw6hWfc5WBmz3W9tK
         3qav+NMSRZO1s3a/JjcVPxg98XcgiFuMDqUPT/HnMIHaKRKO3OiNZ0zdoBkIIChmzffc
         RuPn5aVH2EjUnvIakojpt1cf1R8WU+1JtysJ4f6HAcRErpmRjaD52B7vmrmh6nNexIhx
         G3xg==
X-Gm-Message-State: AC+VfDyDLtF/sAyboVVtzcl/zbtfLO5rk8CceD2QKnK/uyHTzRSS8ye1
        TcrBiWOsMTjJ1ZWVcIgMjZBzhA==
X-Google-Smtp-Source: ACHHUZ5VIWasloR4fM8fiLP8V/UBZBtJSRr5GzKTZXASc+eFQ74DJjxOVEATlMSv4eAnq9/eHXLbjQ==
X-Received: by 2002:a05:6512:991:b0:4eb:1527:e29d with SMTP id w17-20020a056512099100b004eb1527e29dmr3029203lft.52.1682883506865;
        Sun, 30 Apr 2023 12:38:26 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id n26-20020a19551a000000b004d545f1e0ccsm4339995lfe.187.2023.04.30.12.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 12:38:26 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org
Subject: [PATCH] ARM/musb: omap2: Remove global GPIO numbers from TUSB6010
Date:   Sun, 30 Apr 2023 21:38:24 +0200
Message-Id: <20230430193824.577867-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The TUSB6010 (MUSB) device is picking up some GPIO lines
hardcoded by number and passing on to the TUSB6010 device
when registering it.

Instead of nasty workarounds, provide a GPIO descriptor
table and then make the TUSB6010 MUSB glue driver pick up
the GPIO lines directly, convert it to an IRQ and pass down
to the MUSB driver. OMAP2 is the only system using the
TUSB6010.

Stash the GPIO descriptors in the glue layer and use
then to power up and down the TUSB6010 on-demand, instead
of using boardfile callbacks.

Since the OMAP2 boards are the only boards using the
.set_power() and .board_set_power() callbacks, we can
just delete them as the power is now handled directly
in the TUSB6010 glue code.

Cc: Bin Liu <b-liu@ti.com>
Cc: linux-usb@vger.kernel.org
Fixes: 92bf78b33b0b ("gpio: omap: use dynamic allocation of base")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-omap2/board-n8x0.c   | 71 ++++++++----------------------
 arch/arm/mach-omap2/usb-tusb6010.c | 20 ++-------
 arch/arm/mach-omap2/usb-tusb6010.h | 12 +++++
 drivers/usb/musb/musb_core.c       |  1 -
 drivers/usb/musb/musb_core.h       |  2 -
 drivers/usb/musb/tusb6010.c        | 53 ++++++++++++++++------
 include/linux/usb/musb.h           | 13 ------
 7 files changed, 73 insertions(+), 99 deletions(-)
 create mode 100644 arch/arm/mach-omap2/usb-tusb6010.h

diff --git a/arch/arm/mach-omap2/board-n8x0.c b/arch/arm/mach-omap2/board-n8x0.c
index baa2f0341aed..7cf34c25e9ad 100644
--- a/arch/arm/mach-omap2/board-n8x0.c
+++ b/arch/arm/mach-omap2/board-n8x0.c
@@ -10,8 +10,8 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/gpio/machine.h>
+#include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/irq.h>
@@ -29,13 +29,12 @@
 
 #include "common.h"
 #include "mmc.h"
+#include "usb-tusb6010.h"
 #include "soc.h"
 #include "common-board-devices.h"
 
 #define TUSB6010_ASYNC_CS	1
 #define TUSB6010_SYNC_CS	4
-#define TUSB6010_GPIO_INT	58
-#define TUSB6010_GPIO_ENABLE	0
 #define TUSB6010_DMACHAN	0x3f
 
 #define NOKIA_N810_WIMAX	(1 << 2)
@@ -62,37 +61,6 @@ static void board_check_revision(void)
 }
 
 #if IS_ENABLED(CONFIG_USB_MUSB_TUSB6010)
-/*
- * Enable or disable power to TUSB6010. When enabling, turn on 3.3 V and
- * 1.5 V voltage regulators of PM companion chip. Companion chip will then
- * provide then PGOOD signal to TUSB6010 which will release it from reset.
- */
-static int tusb_set_power(int state)
-{
-	int i, retval = 0;
-
-	if (state) {
-		gpio_set_value(TUSB6010_GPIO_ENABLE, 1);
-		msleep(1);
-
-		/* Wait until TUSB6010 pulls INT pin down */
-		i = 100;
-		while (i && gpio_get_value(TUSB6010_GPIO_INT)) {
-			msleep(1);
-			i--;
-		}
-
-		if (!i) {
-			printk(KERN_ERR "tusb: powerup failed\n");
-			retval = -ENODEV;
-		}
-	} else {
-		gpio_set_value(TUSB6010_GPIO_ENABLE, 0);
-		msleep(10);
-	}
-
-	return retval;
-}
 
 static struct musb_hdrc_config musb_config = {
 	.multipoint	= 1,
@@ -103,39 +71,36 @@ static struct musb_hdrc_config musb_config = {
 
 static struct musb_hdrc_platform_data tusb_data = {
 	.mode		= MUSB_OTG,
-	.set_power	= tusb_set_power,
 	.min_power	= 25,	/* x2 = 50 mA drawn from VBUS as peripheral */
 	.power		= 100,	/* Max 100 mA VBUS for host mode */
 	.config		= &musb_config,
 };
 
+static struct gpiod_lookup_table tusb_gpio_table = {
+	.dev_id = "musb-tusb",
+	.table = {
+		GPIO_LOOKUP("gpio-0-15", 0, "enable",
+			    GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("gpio-48-63", 10, "int",
+			    GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
 static void __init n8x0_usb_init(void)
 {
 	int ret = 0;
-	static const char announce[] __initconst = KERN_INFO "TUSB 6010\n";
-
-	/* PM companion chip power control pin */
-	ret = gpio_request_one(TUSB6010_GPIO_ENABLE, GPIOF_OUT_INIT_LOW,
-			       "TUSB6010 enable");
-	if (ret != 0) {
-		printk(KERN_ERR "Could not get TUSB power GPIO%i\n",
-		       TUSB6010_GPIO_ENABLE);
-		return;
-	}
-	tusb_set_power(0);
 
+	gpiod_add_lookup_table(&tusb_gpio_table);
 	ret = tusb6010_setup_interface(&tusb_data, TUSB6010_REFCLK_19, 2,
-					TUSB6010_ASYNC_CS, TUSB6010_SYNC_CS,
-					TUSB6010_GPIO_INT, TUSB6010_DMACHAN);
+				       TUSB6010_ASYNC_CS, TUSB6010_SYNC_CS,
+				       TUSB6010_DMACHAN);
 	if (ret != 0)
-		goto err;
+		return;
 
-	printk(announce);
+	pr_info("TUSB 6010\n");
 
 	return;
-
-err:
-	gpio_free(TUSB6010_GPIO_ENABLE);
 }
 #else
 
diff --git a/arch/arm/mach-omap2/usb-tusb6010.c b/arch/arm/mach-omap2/usb-tusb6010.c
index 18fa52f828dc..b46c254c2bc4 100644
--- a/arch/arm/mach-omap2/usb-tusb6010.c
+++ b/arch/arm/mach-omap2/usb-tusb6010.c
@@ -11,12 +11,12 @@
 #include <linux/errno.h>
 #include <linux/delay.h>
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
 #include <linux/export.h>
 #include <linux/platform_data/usb-omap.h>
 
 #include <linux/usb/musb.h>
 
+#include "usb-tusb6010.h"
 #include "gpmc.h"
 
 static u8		async_cs, sync_cs;
@@ -132,10 +132,6 @@ static struct resource tusb_resources[] = {
 	{ /* Synchronous access */
 		.flags	= IORESOURCE_MEM,
 	},
-	{ /* IRQ */
-		.name	= "mc",
-		.flags	= IORESOURCE_IRQ,
-	},
 };
 
 static u64 tusb_dmamask = ~(u32)0;
@@ -154,9 +150,9 @@ static struct platform_device tusb_device = {
 
 /* this may be called only from board-*.c setup code */
 int __init tusb6010_setup_interface(struct musb_hdrc_platform_data *data,
-		unsigned ps_refclk, unsigned waitpin,
-		unsigned async, unsigned sync,
-		unsigned irq, unsigned dmachan)
+		unsigned int ps_refclk, unsigned int waitpin,
+		unsigned int async, unsigned int sync,
+		unsigned int dmachan)
 {
 	int		status;
 	static char	error[] __initdata =
@@ -192,14 +188,6 @@ int __init tusb6010_setup_interface(struct musb_hdrc_platform_data *data,
 	if (status < 0)
 		return status;
 
-	/* IRQ */
-	status = gpio_request_one(irq, GPIOF_IN, "TUSB6010 irq");
-	if (status < 0) {
-		printk(error, 3, status);
-		return status;
-	}
-	tusb_resources[2].start = gpio_to_irq(irq);
-
 	/* set up memory timings ... can speed them up later */
 	if (!ps_refclk) {
 		printk(error, 4, status);
diff --git a/arch/arm/mach-omap2/usb-tusb6010.h b/arch/arm/mach-omap2/usb-tusb6010.h
new file mode 100644
index 000000000000..d210ff6238c2
--- /dev/null
+++ b/arch/arm/mach-omap2/usb-tusb6010.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __USB_TUSB6010_H
+#define __USB_TUSB6010_H
+
+extern int __init tusb6010_setup_interface(
+		struct musb_hdrc_platform_data *data,
+		unsigned int ps_refclk, unsigned int waitpin,
+		unsigned int async_cs, unsigned int sync_cs,
+		unsigned int dmachan);
+
+#endif /* __USB_TUSB6010_H */
diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index d162afbbe19f..ecbd3784bec3 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -2330,7 +2330,6 @@ musb_init_controller(struct device *dev, int nIrq, void __iomem *ctrl)
 
 	spin_lock_init(&musb->lock);
 	spin_lock_init(&musb->list_lock);
-	musb->board_set_power = plat->set_power;
 	musb->min_power = plat->min_power;
 	musb->ops = plat->platform_ops;
 	musb->port_mode = plat->mode;
diff --git a/drivers/usb/musb/musb_core.h b/drivers/usb/musb/musb_core.h
index b7588d11cfc5..91b5b6b66f96 100644
--- a/drivers/usb/musb/musb_core.h
+++ b/drivers/usb/musb/musb_core.h
@@ -352,8 +352,6 @@ struct musb {
 	u16 epmask;
 	u8 nr_endpoints;
 
-	int			(*board_set_power)(int state);
-
 	u8			min_power;	/* vbus for periph, in mA/2 */
 
 	enum musb_mode		port_mode;
diff --git a/drivers/usb/musb/tusb6010.c b/drivers/usb/musb/tusb6010.c
index a1f29dbc62e6..cbc707fe570f 100644
--- a/drivers/usb/musb/tusb6010.c
+++ b/drivers/usb/musb/tusb6010.c
@@ -11,6 +11,8 @@
  *   interface.
  */
 
+#include <linux/gpio/consumer.h>
+#include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -30,6 +32,8 @@ struct tusb6010_glue {
 	struct device		*dev;
 	struct platform_device	*musb;
 	struct platform_device	*phy;
+	struct gpio_desc	*enable;
+	struct gpio_desc	*intpin;
 };
 
 static void tusb_musb_set_vbus(struct musb *musb, int is_on);
@@ -1021,16 +1025,29 @@ static void tusb_setup_cpu_interface(struct musb *musb)
 
 static int tusb_musb_start(struct musb *musb)
 {
+	struct tusb6010_glue *glue = dev_get_drvdata(musb->controller->parent);
 	void __iomem	*tbase = musb->ctrl_base;
-	int		ret = 0;
 	unsigned long	flags;
 	u32		reg;
+	int		i;
 
-	if (musb->board_set_power)
-		ret = musb->board_set_power(1);
-	if (ret != 0) {
-		printk(KERN_ERR "tusb: Cannot enable TUSB6010\n");
-		return ret;
+	/*
+	 * Enable or disable power to TUSB6010. When enabling, turn on 3.3 V and
+	 * 1.5 V voltage regulators of PM companion chip. Companion chip will then
+	 * provide then PGOOD signal to TUSB6010 which will release it from reset.
+	 */
+	gpiod_set_value(glue->enable, 1);
+	msleep(1);
+
+	/* Wait for 100ms until TUSB6010 pulls INT pin down */
+	i = 100;
+	while (i && gpiod_get_value(glue->intpin)) {
+		msleep(1);
+		i--;
+	}
+	if (!i) {
+		pr_err("tusb: Powerup respones failed\n");
+		return -ENODEV;
 	}
 
 	spin_lock_irqsave(&musb->lock, flags);
@@ -1083,8 +1100,8 @@ static int tusb_musb_start(struct musb *musb)
 err:
 	spin_unlock_irqrestore(&musb->lock, flags);
 
-	if (musb->board_set_power)
-		musb->board_set_power(0);
+	gpiod_set_value(glue->enable, 0);
+	msleep(10);
 
 	return -ENODEV;
 }
@@ -1158,11 +1175,13 @@ static int tusb_musb_init(struct musb *musb)
 
 static int tusb_musb_exit(struct musb *musb)
 {
+	struct tusb6010_glue *glue = dev_get_drvdata(musb->controller->parent);
+
 	del_timer_sync(&musb->dev_timer);
 	the_musb = NULL;
 
-	if (musb->board_set_power)
-		musb->board_set_power(0);
+	gpiod_set_value(glue->enable, 0);
+	msleep(10);
 
 	iounmap(musb->sync_va);
 
@@ -1218,6 +1237,15 @@ static int tusb_probe(struct platform_device *pdev)
 
 	glue->dev			= &pdev->dev;
 
+	glue->enable = devm_gpiod_get(glue->dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(glue->enable))
+		return dev_err_probe(glue->dev, PTR_ERR(glue->enable),
+				     "could not obtain power on/off GPIO\n");
+	glue->intpin = devm_gpiod_get(glue->dev, "int", GPIOD_IN);
+	if (IS_ERR(glue->intpin))
+		return dev_err_probe(glue->dev, PTR_ERR(glue->intpin),
+				     "could not obtain INT GPIO\n");
+
 	pdata->platform_ops		= &tusb_ops;
 
 	usb_phy_generic_register();
@@ -1236,10 +1264,7 @@ static int tusb_probe(struct platform_device *pdev)
 	musb_resources[1].end = pdev->resource[1].end;
 	musb_resources[1].flags = pdev->resource[1].flags;
 
-	musb_resources[2].name = pdev->resource[2].name;
-	musb_resources[2].start = pdev->resource[2].start;
-	musb_resources[2].end = pdev->resource[2].end;
-	musb_resources[2].flags = pdev->resource[2].flags;
+	musb_resources[2] = DEFINE_RES_IRQ_NAMED(gpiod_to_irq(glue->intpin), "mc");
 
 	pinfo = tusb_dev_info;
 	pinfo.parent = &pdev->dev;
diff --git a/include/linux/usb/musb.h b/include/linux/usb/musb.h
index e4a3ad3c800f..3963e55e88a3 100644
--- a/include/linux/usb/musb.h
+++ b/include/linux/usb/musb.h
@@ -99,9 +99,6 @@ struct musb_hdrc_platform_data {
 	/* (HOST or OTG) program PHY for external Vbus */
 	unsigned	extvbus:1;
 
-	/* Power the device on or off */
-	int		(*set_power)(int state);
-
 	/* MUSB configuration-specific details */
 	const struct musb_hdrc_config *config;
 
@@ -135,14 +132,4 @@ static inline int musb_mailbox(enum musb_vbus_id_status status)
 #define	TUSB6010_REFCLK_24	41667	/* psec/clk @ 24.0 MHz XI */
 #define	TUSB6010_REFCLK_19	52083	/* psec/clk @ 19.2 MHz CLKIN */
 
-#ifdef	CONFIG_ARCH_OMAP2
-
-extern int __init tusb6010_setup_interface(
-		struct musb_hdrc_platform_data *data,
-		unsigned ps_refclk, unsigned waitpin,
-		unsigned async_cs, unsigned sync_cs,
-		unsigned irq, unsigned dmachan);
-
-#endif	/* OMAP2 */
-
 #endif /* __LINUX_USB_MUSB_H */
-- 
2.34.1

