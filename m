Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB176F1363
	for <lists+linux-omap@lfdr.de>; Fri, 28 Apr 2023 10:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbjD1IlS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 28 Apr 2023 04:41:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbjD1IlS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 28 Apr 2023 04:41:18 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FDD02720
        for <linux-omap@vger.kernel.org>; Fri, 28 Apr 2023 01:41:15 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f00d41df22so8595642e87.1
        for <linux-omap@vger.kernel.org>; Fri, 28 Apr 2023 01:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682671274; x=1685263274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GmwujyEofKH0N0RkusC0bFQE2iWXbpOcl5orXJCMM0U=;
        b=N5u6tGCClq9yCovZLBeo7SIpmFYJeDKMpp550hG8Ip8A+nP3BaXsoBSAi2qVBh2nKL
         pebiSWoSxl98Aa7+T1fcQ5zJUzbVdPD5EzIOS3IYcaDjfcdLv6aQuFy8YiEdzI5SH5N0
         HRSmNt/GWdKwCamsdn5LRBtzouN95WrSw6FOpVnDYu0ZyttHuzN89kN0DtRQuiFVlDm0
         u84ZAaWeIud912rHJ42pLRsv1J8wobcFVXYA0lNLu7nJGByqlK04nFepNOPMR8kV9Rwq
         OqpuMHhIthm+2Cns/CZKhM3z0hNCk9O28AzLvGyBC5RRwC65f9hfvGnvXqwL2mJTAjCO
         j8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682671274; x=1685263274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GmwujyEofKH0N0RkusC0bFQE2iWXbpOcl5orXJCMM0U=;
        b=Or94gzmPp8t8degGdrQhDNJGBg6mAS7vtv9Emgz5Z8Wjsw8AUQV4pGoWud5Xy6GrCq
         SROkTV9QAdNgD7APB9XtvFAQa98hVDab4CZNErwBRmrHipIC3IHwUYjlDj+eWO65Dj4h
         loIqEYp9Q5WMydFwMCYeca2/D3JXKrlr1zLzlviRH5lOJK2XOBFN/5+k37StIlh6RRT/
         bOss8y3wmnAIQOtAQh9cwq+tANnyIQEB8+Qt/NXkyp4GnbIN7jzbZi/+muzSqA2k+qs4
         SXx98WvvHy6cYk4GRPr5q+v/8bK1f1dJUieYHPeAYFsRrUrdknNRPlQ3+fY6DJuaFvGX
         V0jA==
X-Gm-Message-State: AC+VfDxaK/Yi6Ji8RykJO4TEu3H64uzecJZcE5+Ywl3ZFWZmua2yHKqL
        qA60iumK1nU50OQwmy7t9eXkxw==
X-Google-Smtp-Source: ACHHUZ4AaeWezFxuYShzLIS0V1WMyC/tF+cJYJRzcp6qdC/a44NCkXXt58Sd8CgeZ9zNSxK1svhTiQ==
X-Received: by 2002:a2e:b90e:0:b0:2a8:ea1f:428c with SMTP id b14-20020a2eb90e000000b002a8ea1f428cmr2321279ljb.23.1682671273851;
        Fri, 28 Apr 2023 01:41:13 -0700 (PDT)
Received: from Linus-Dell.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u19-20020a2e8553000000b0029839faa74fsm3248692ljj.134.2023.04.28.01.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 01:41:13 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        andy.shevchenko@gmail.com, Andreas Kemnade <andreas@kemnade.info>,
        Lee Jones <lee@kernel.org>
Subject: [PATCH v2] ARM/mfd/gpio: Fixup TPS65010 regression on OMAP1 OSK1
Date:   Fri, 28 Apr 2023 10:41:09 +0200
Message-Id: <20230428084109.486785-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Aaro reports problems on the OSK1 board after we altered
the dynamic base for GPIO allocations.

It appears this happens because the OMAP driver now
allocates GPIO numbers dynamically, so all that is
references by number is a bit up in the air.

Let's bite the bullet and try to just move the gpio_chip
in the tps65010 MFD driver over to using dynamic allocations.
Alter everything in the OSK1 board file to use a GPIO
descriptor table and lookups.

Utilize the NULL device to define some board-specific
GPIO lookups and use these to immediately look up the
same GPIOs, convert to IRQ numbers and pass as resources
to the devices. This is ugly but should work.

The .setup() callback for tps65010 was used for some GPIO
hogging, but since the OSK1 is the only user in the entire
kernel we can alter the signatures to something that
is helpful and make a clean transition.

Fixes: 92bf78b33b0b ("gpio: omap: use dynamic allocation of base")
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: andy.shevchenko@gmail.com
Cc: Andreas Kemnade <andreas@kemnade.info>
Cc: Lee Jones <lee@kernel.org>
Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Fix the CF card GPIO lookup
- Use the right Fixes: tag
---
 arch/arm/mach-omap1/board-osk.c | 139 ++++++++++++++++++++++----------
 drivers/mfd/tps65010.c          |  14 ++--
 include/linux/mfd/tps65010.h    |  10 +--
 3 files changed, 103 insertions(+), 60 deletions(-)

diff --git a/arch/arm/mach-omap1/board-osk.c b/arch/arm/mach-omap1/board-osk.c
index df758c1f9237..15404391bf7a 100644
--- a/arch/arm/mach-omap1/board-osk.c
+++ b/arch/arm/mach-omap1/board-osk.c
@@ -25,7 +25,8 @@
  * with this program; if not, write  to the Free Software Foundation, Inc.,
  * 675 Mass Ave, Cambridge, MA 02139, USA.
  */
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -64,13 +65,12 @@
 /* TPS65010 has four GPIOs.  nPG and LED2 can be treated like GPIOs with
  * alternate pin configurations for hardware-controlled blinking.
  */
-#define OSK_TPS_GPIO_BASE		(OMAP_MAX_GPIO_LINES + 16 /* MPUIO */)
-#	define OSK_TPS_GPIO_USB_PWR_EN	(OSK_TPS_GPIO_BASE + 0)
-#	define OSK_TPS_GPIO_LED_D3	(OSK_TPS_GPIO_BASE + 1)
-#	define OSK_TPS_GPIO_LAN_RESET	(OSK_TPS_GPIO_BASE + 2)
-#	define OSK_TPS_GPIO_DSP_PWR_EN	(OSK_TPS_GPIO_BASE + 3)
-#	define OSK_TPS_GPIO_LED_D9	(OSK_TPS_GPIO_BASE + 4)
-#	define OSK_TPS_GPIO_LED_D2	(OSK_TPS_GPIO_BASE + 5)
+#define OSK_TPS_GPIO_USB_PWR_EN	0
+#define OSK_TPS_GPIO_LED_D3	1
+#define OSK_TPS_GPIO_LAN_RESET	2
+#define OSK_TPS_GPIO_DSP_PWR_EN	3
+#define OSK_TPS_GPIO_LED_D9	4
+#define OSK_TPS_GPIO_LED_D2	5
 
 static struct mtd_partition osk_partitions[] = {
 	/* bootloader (U-Boot, etc) in first sector */
@@ -174,11 +174,20 @@ static const struct gpio_led tps_leds[] = {
 	/* NOTE:  D9 and D2 have hardware blink support.
 	 * Also, D9 requires non-battery power.
 	 */
-	{ .gpio = OSK_TPS_GPIO_LED_D9, .name = "d9",
-			.default_trigger = "disk-activity", },
-	{ .gpio = OSK_TPS_GPIO_LED_D2, .name = "d2", },
-	{ .gpio = OSK_TPS_GPIO_LED_D3, .name = "d3", .active_low = 1,
-			.default_trigger = "heartbeat", },
+	{ .name = "d9", .default_trigger = "disk-activity", },
+	{ .name = "d2", },
+	{ .name = "d3", .default_trigger = "heartbeat", },
+};
+
+static struct gpiod_lookup_table tps_leds_gpio_table = {
+	.dev_id = "leds-gpio",
+	.table = {
+		/* Use local offsets on TPS65010 */
+		GPIO_LOOKUP_IDX("tps65010", OSK_TPS_GPIO_LED_D9, NULL, 0, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("tps65010", OSK_TPS_GPIO_LED_D2, NULL, 1, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("tps65010", OSK_TPS_GPIO_LED_D3, NULL, 2, GPIO_ACTIVE_LOW),
+		{ }
+	},
 };
 
 static struct gpio_led_platform_data tps_leds_data = {
@@ -192,29 +201,34 @@ static struct platform_device osk5912_tps_leds = {
 	.dev.platform_data	= &tps_leds_data,
 };
 
-static int osk_tps_setup(struct i2c_client *client, void *context)
+/* The board just hold these GPIOs hogged from setup to teardown */
+static struct gpio_desc *eth_reset;
+static struct gpio_desc *vdd_dsp;
+
+static int osk_tps_setup(struct i2c_client *client, struct gpio_chip *gc)
 {
+	struct gpio_desc *d;
 	if (!IS_BUILTIN(CONFIG_TPS65010))
 		return -ENOSYS;
 
 	/* Set GPIO 1 HIGH to disable VBUS power supply;
 	 * OHCI driver powers it up/down as needed.
 	 */
-	gpio_request(OSK_TPS_GPIO_USB_PWR_EN, "n_vbus_en");
-	gpio_direction_output(OSK_TPS_GPIO_USB_PWR_EN, 1);
+	d = gpiochip_request_own_desc(gc, OSK_TPS_GPIO_USB_PWR_EN, "n_vbus_en",
+				      GPIO_ACTIVE_HIGH, GPIOD_OUT_HIGH);
 	/* Free the GPIO again as the driver will request it */
-	gpio_free(OSK_TPS_GPIO_USB_PWR_EN);
+	gpiochip_free_own_desc(d);
 
 	/* Set GPIO 2 high so LED D3 is off by default */
 	tps65010_set_gpio_out_value(GPIO2, HIGH);
 
 	/* Set GPIO 3 low to take ethernet out of reset */
-	gpio_request(OSK_TPS_GPIO_LAN_RESET, "smc_reset");
-	gpio_direction_output(OSK_TPS_GPIO_LAN_RESET, 0);
+	eth_reset = gpiochip_request_own_desc(gc, OSK_TPS_GPIO_LAN_RESET, "smc_reset",
+					      GPIO_ACTIVE_HIGH, GPIOD_OUT_LOW);
 
 	/* GPIO4 is VDD_DSP */
-	gpio_request(OSK_TPS_GPIO_DSP_PWR_EN, "dsp_power");
-	gpio_direction_output(OSK_TPS_GPIO_DSP_PWR_EN, 1);
+	vdd_dsp = gpiochip_request_own_desc(gc, OSK_TPS_GPIO_DSP_PWR_EN, "dsp_power",
+					    GPIO_ACTIVE_HIGH, GPIOD_OUT_HIGH);
 	/* REVISIT if DSP support isn't configured, power it off ... */
 
 	/* Let LED1 (D9) blink; leds-gpio may override it */
@@ -232,15 +246,22 @@ static int osk_tps_setup(struct i2c_client *client, void *context)
 
 	/* register these three LEDs */
 	osk5912_tps_leds.dev.parent = &client->dev;
+	gpiod_add_lookup_table(&tps_leds_gpio_table);
 	platform_device_register(&osk5912_tps_leds);
 
 	return 0;
 }
 
+static void osk_tps_teardown(struct i2c_client *client, struct gpio_chip *gc)
+{
+	gpiochip_free_own_desc(eth_reset);
+	gpiochip_free_own_desc(vdd_dsp);
+}
+
 static struct tps65010_board tps_board = {
-	.base		= OSK_TPS_GPIO_BASE,
 	.outmask	= 0x0f,
 	.setup		= osk_tps_setup,
+	.teardown	= osk_tps_teardown,
 };
 
 static struct i2c_board_info __initdata osk_i2c_board_info[] = {
@@ -263,11 +284,6 @@ static void __init osk_init_smc91x(void)
 {
 	u32 l;
 
-	if ((gpio_request(0, "smc_irq")) < 0) {
-		printk("Error requesting gpio 0 for smc91x irq\n");
-		return;
-	}
-
 	/* Check EMIFS wait states to fix errors with SMC_GET_PKT_HDR */
 	l = omap_readl(EMIFS_CCS(1));
 	l |= 0x3;
@@ -279,10 +295,6 @@ static void __init osk_init_cf(int seg)
 	struct resource *res = &osk5912_cf_resources[1];
 
 	omap_cfg_reg(M7_1610_GPIO62);
-	if ((gpio_request(62, "cf_irq")) < 0) {
-		printk("Error requesting gpio 62 for CF irq\n");
-		return;
-	}
 
 	switch (seg) {
 	/* NOTE: CS0 could be configured too ... */
@@ -308,16 +320,14 @@ static void __init osk_init_cf(int seg)
 		seg, omap_readl(EMIFS_CCS(seg)), omap_readl(EMIFS_ACS(seg)));
 	omap_writel(0x0004a1b3, EMIFS_CCS(seg));	/* synch mode 4 etc */
 	omap_writel(0x00000000, EMIFS_ACS(seg));	/* OE hold/setup */
-
-	/* the CF I/O IRQ is really active-low */
-	irq_set_irq_type(gpio_to_irq(62), IRQ_TYPE_EDGE_FALLING);
 }
 
 static struct gpiod_lookup_table osk_usb_gpio_table = {
 	.dev_id = "ohci",
 	.table = {
 		/* Power GPIO on the I2C-attached TPS65010 */
-		GPIO_LOOKUP("tps65010", 0, "power", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("tps65010", OSK_TPS_GPIO_USB_PWR_EN, "power",
+			    GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP(OMAP_GPIO_LABEL, 9, "overcurrent",
 			    GPIO_ACTIVE_HIGH),
 	},
@@ -341,8 +351,24 @@ static struct omap_usb_config osk_usb_config __initdata = {
 
 #define EMIFS_CS3_VAL	(0x88013141)
 
+static struct gpiod_lookup_table osk_irq_gpio_table = {
+	.dev_id = NULL,
+	.table = {
+		/* GPIO used for SMC91x IRQ */
+		GPIO_LOOKUP(OMAP_GPIO_LABEL, 0, "smc_irq",
+			    GPIO_ACTIVE_HIGH),
+		/* GPIO used for CF IRQ */
+		GPIO_LOOKUP("gpio-48-63", 14, "cf_irq",
+			    GPIO_ACTIVE_HIGH),
+		/* GPIO used by the TPS65010 chip */
+		GPIO_LOOKUP("mpuio", 1, "tps65010",
+			    GPIO_ACTIVE_HIGH),
+	},
+};
+
 static void __init osk_init(void)
 {
+	struct gpio_desc *d;
 	u32 l;
 
 	osk_init_smc91x();
@@ -359,10 +385,32 @@ static void __init osk_init(void)
 
 	osk_flash_resource.end = osk_flash_resource.start = omap_cs3_phys();
 	osk_flash_resource.end += SZ_32M - 1;
-	osk5912_smc91x_resources[1].start = gpio_to_irq(0);
-	osk5912_smc91x_resources[1].end = gpio_to_irq(0);
-	osk5912_cf_resources[0].start = gpio_to_irq(62);
-	osk5912_cf_resources[0].end = gpio_to_irq(62);
+
+	/*
+	 * Add the GPIOs to be used as IRQs and immediately look them up
+	 * to be passed as an IRQ resource. This is ugly but should work
+	 * until the day we convert to device tree.
+	 */
+	gpiod_add_lookup_table(&osk_irq_gpio_table);
+
+	d = gpiod_get(NULL, "smc_irq", GPIOD_IN);
+	if (IS_ERR(d)) {
+		pr_err("Unable to get SMC IRQ GPIO descriptor\n");
+	} else {
+		osk5912_smc91x_resources[1].start = gpiod_to_irq(d);
+		osk5912_smc91x_resources[1].end = gpiod_to_irq(d);
+	}
+
+	d = gpiod_get(NULL, "cf_irq", GPIOD_IN);
+	if (IS_ERR(d)) {
+		pr_err("Unable to get CF IRQ GPIO descriptor\n");
+	} else {
+		/* the CF I/O IRQ is really active-low */
+		irq_set_irq_type(gpiod_to_irq(d), IRQ_TYPE_EDGE_FALLING);
+		osk5912_cf_resources[0].start = gpiod_to_irq(d);
+		osk5912_cf_resources[0].end = gpiod_to_irq(d);
+	}
+
 	platform_add_devices(osk5912_devices, ARRAY_SIZE(osk5912_devices));
 
 	l = omap_readl(USB_TRANSCEIVER_CTRL);
@@ -372,13 +420,16 @@ static void __init osk_init(void)
 	gpiod_add_lookup_table(&osk_usb_gpio_table);
 	omap1_usb_init(&osk_usb_config);
 
+	omap_serial_init();
+
 	/* irq for tps65010 chip */
 	/* bootloader effectively does:  omap_cfg_reg(U19_1610_MPUIO1); */
-	if (gpio_request(OMAP_MPUIO(1), "tps65010") == 0)
-		gpio_direction_input(OMAP_MPUIO(1));
-
-	omap_serial_init();
-	osk_i2c_board_info[0].irq = gpio_to_irq(OMAP_MPUIO(1));
+	d = gpiod_get(NULL, "tps65010", GPIOD_IN);
+	if (IS_ERR(d)) {
+		pr_err("Unable to get TPS65010 IRQ GPIO descriptor\n");
+	} else {
+		osk_i2c_board_info[0].irq = gpiod_to_irq(d);
+	}
 	omap_register_i2c_bus(1, 400, osk_i2c_board_info,
 			      ARRAY_SIZE(osk_i2c_board_info));
 }
diff --git a/drivers/mfd/tps65010.c b/drivers/mfd/tps65010.c
index fb733288cca3..faea4ff44c6f 100644
--- a/drivers/mfd/tps65010.c
+++ b/drivers/mfd/tps65010.c
@@ -506,12 +506,8 @@ static void tps65010_remove(struct i2c_client *client)
 	struct tps65010		*tps = i2c_get_clientdata(client);
 	struct tps65010_board	*board = dev_get_platdata(&client->dev);
 
-	if (board && board->teardown) {
-		int status = board->teardown(client, board->context);
-		if (status < 0)
-			dev_dbg(&client->dev, "board %s %s err %d\n",
-				"teardown", client->name, status);
-	}
+	if (board && board->teardown)
+		board->teardown(client, &tps->chip);
 	if (client->irq > 0)
 		free_irq(client->irq, tps);
 	cancel_delayed_work_sync(&tps->work);
@@ -619,7 +615,7 @@ static int tps65010_probe(struct i2c_client *client)
 				tps, DEBUG_FOPS);
 
 	/* optionally register GPIOs */
-	if (board && board->base != 0) {
+	if (board) {
 		tps->outmask = board->outmask;
 
 		tps->chip.label = client->name;
@@ -632,7 +628,7 @@ static int tps65010_probe(struct i2c_client *client)
 		/* NOTE:  only partial support for inputs; nyet IRQs */
 		tps->chip.get = tps65010_gpio_get;
 
-		tps->chip.base = board->base;
+		tps->chip.base = -1;
 		tps->chip.ngpio = 7;
 		tps->chip.can_sleep = 1;
 
@@ -641,7 +637,7 @@ static int tps65010_probe(struct i2c_client *client)
 			dev_err(&client->dev, "can't add gpiochip, err %d\n",
 					status);
 		else if (board->setup) {
-			status = board->setup(client, board->context);
+			status = board->setup(client, &tps->chip);
 			if (status < 0) {
 				dev_dbg(&client->dev,
 					"board %s %s err %d\n",
diff --git a/include/linux/mfd/tps65010.h b/include/linux/mfd/tps65010.h
index a1fb9bc5311d..8b59545642cf 100644
--- a/include/linux/mfd/tps65010.h
+++ b/include/linux/mfd/tps65010.h
@@ -27,6 +27,7 @@
 
 #ifndef __LINUX_I2C_TPS65010_H
 #define __LINUX_I2C_TPS65010_H
+#include <linux/gpio/driver.h>
 
 /*
  * ----------------------------------------------------------------------------
@@ -176,12 +177,10 @@ struct i2c_client;
 
 /**
  * struct tps65010_board - packages GPIO and LED lines
- * @base: the GPIO number to assign to GPIO-1
  * @outmask: bit (N-1) is set to allow GPIO-N to be used as an
  *	(open drain) output
  * @setup: optional callback issued once the GPIOs are valid
  * @teardown: optional callback issued before the GPIOs are invalidated
- * @context: optional parameter passed to setup() and teardown()
  *
  * Board data may be used to package the GPIO (and LED) lines for use
  * in by the generic GPIO and LED frameworks.  The first four GPIOs
@@ -193,12 +192,9 @@ struct i2c_client;
  * devices in their initial states using these GPIOs.
  */
 struct tps65010_board {
-	int				base;
 	unsigned			outmask;
-
-	int		(*setup)(struct i2c_client *client, void *context);
-	int		(*teardown)(struct i2c_client *client, void *context);
-	void		*context;
+	int		(*setup)(struct i2c_client *client, struct gpio_chip *gc);
+	void		(*teardown)(struct i2c_client *client, struct gpio_chip *gc);
 };
 
 #endif /*  __LINUX_I2C_TPS65010_H */
-- 
2.34.1

