Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8BD618BDD
	for <lists+linux-omap@lfdr.de>; Thu,  3 Nov 2022 23:47:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbiKCWrk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Nov 2022 18:47:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231328AbiKCWrc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 3 Nov 2022 18:47:32 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66E9522B18;
        Thu,  3 Nov 2022 15:47:22 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id 130so2960211pfu.8;
        Thu, 03 Nov 2022 15:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dR45AF1eDqvlbsOVWvhgDA8qPBA7xNN50vsRHZ8lb/Q=;
        b=kxrgEzv7Q/BhLS5Xx8wbJ/XahPkfeazdsz15CJteuQcn44jMx3whcHrw9OSiV5BGoM
         kUko2VZkK3XZhIXakJpfKUxmzZPCY923ctwOTsEXsdVmKLw32lsD6Lka+lH4JPXED4QF
         QNHCn2rSZYW55umB36jDcXOmtxkorkdLkg4SJirTTMtJwEd5eRQ5tZFfFkEtK3jMQEKC
         GmIkgxmIWrbBcMFSouWaA13gQRG9QI1jRWcD+Urkkwkx0xn7GjpOdW+F6TYWn7jaDGHw
         1GzvvpqLZZko5DjoVsrn7tnCC3x2mRI4pmTQ7iPf3TL+bstgIai9cVHLbpQjM4Z+FU/0
         kf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dR45AF1eDqvlbsOVWvhgDA8qPBA7xNN50vsRHZ8lb/Q=;
        b=OocYWWVwgXIOWAGaG0dYCHK9PfFZj30k926A4RedaA7lqegAwQtMfLU4RDp0cpxWIf
         XEIsVhJtexdPH+YkakoeSSs48n28/SHD65Aj/aLDg65pQzCUUr431AsDJ9x4pvXA3Pu3
         /zZHL4V7/m+EGE8xsCFnnLY2IEJOMlgxiYQlb8a8kEGkqmp1cnNTrtjBUSUBRBsCB3vB
         DKngeiyfRcavp+iwi9Pom7FnEDKqFturzgNIJhGS/MC5xm62imBOfezG4FRRqBuD5hP+
         ga1K6TbT5WhxEQD31fgf7sCTj2yPriBRz9SwQAZilyC0VrT0G8hbTJY4hm13sLP+OE7b
         J1ig==
X-Gm-Message-State: ACrzQf37Wl4NI+L3dIbwcdndfW1lqZ8aFikPI2Cfw2U5u1NVdV4qfUWb
        QyzhN0J4LQWB7/qL9XTO6AM=
X-Google-Smtp-Source: AMsMyM6ejyLYpipDgFAFY3sojBOGLmpBeUWR8BOV6MgdZwjE3apF6DDESgQa1eErqT/8aXUCiP+SPg==
X-Received: by 2002:a63:854a:0:b0:46f:45ab:31a with SMTP id u71-20020a63854a000000b0046f45ab031amr28168420pgd.190.1667515641746;
        Thu, 03 Nov 2022 15:47:21 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id g13-20020aa796ad000000b0056be1d7d4a3sm1280421pfk.73.2022.11.03.15.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 15:47:20 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Helge Deller <deller@gmx.de>, Tony Lindgren <tony@atomide.com>,
        Sebastian Reichel <sre@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 05/13] omapfb: panel-dsi-cm: switch to using gpiod API
Date:   Thu,  3 Nov 2022 15:46:45 -0700
Message-Id: <20221103-omapfb-gpiod-v1-5-c3d53ca7988f@gmail.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
In-Reply-To: <20221103-omapfb-gpiod-v1-0-c3d53ca7988f@gmail.com>
References: <20221103-omapfb-gpiod-v1-0-c3d53ca7988f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Switch the driver from legacy gpio API that is deprecated to the newer
gpiod API that respects line polarities described in ACPI/DT.

Note that because existing DTSes specify incorrect polarity of reset
lines (active high) and GPU drivers have adopted to this, we follow
the suit and use inverted values when controlling reset lines.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 .../fbdev/omap2/omapfb/displays/panel-dsi-cm.c     | 116 ++++++++-------------
 1 file changed, 45 insertions(+), 71 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
index a2c7c5cb1523..4fc4b26a8d30 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
@@ -10,8 +10,9 @@
 
 #include <linux/backlight.h>
 #include <linux/delay.h>
+#include <linux/err.h>
 #include <linux/fb.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/jiffies.h>
 #include <linux/module.h>
@@ -20,7 +21,6 @@
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 #include <linux/of_device.h>
-#include <linux/of_gpio.h>
 
 #include <video/omapfb_dss.h>
 #include <video/mipi_display.h>
@@ -53,8 +53,8 @@ struct panel_drv_data {
 	unsigned long	hw_guard_wait;	/* max guard time in jiffies */
 
 	/* panel HW configuration from DT or platform data */
-	int reset_gpio;
-	int ext_te_gpio;
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *ext_te_gpio;
 
 	bool use_dsi_backlight;
 
@@ -250,8 +250,8 @@ static int dsicm_enter_ulps(struct panel_drv_data *ddata)
 	if (r)
 		goto err;
 
-	if (gpio_is_valid(ddata->ext_te_gpio))
-		disable_irq(gpio_to_irq(ddata->ext_te_gpio));
+	if (ddata->ext_te_gpio)
+		disable_irq(gpiod_to_irq(ddata->ext_te_gpio));
 
 	in->ops.dsi->disable(in, false, true);
 
@@ -292,8 +292,8 @@ static int dsicm_exit_ulps(struct panel_drv_data *ddata)
 		goto err2;
 	}
 
-	if (gpio_is_valid(ddata->ext_te_gpio))
-		enable_irq(gpio_to_irq(ddata->ext_te_gpio));
+	if (ddata->ext_te_gpio)
+		enable_irq(gpiod_to_irq(ddata->ext_te_gpio));
 
 	dsicm_queue_ulps_work(ddata);
 
@@ -306,8 +306,8 @@ static int dsicm_exit_ulps(struct panel_drv_data *ddata)
 
 	r = dsicm_panel_reset(ddata);
 	if (!r) {
-		if (gpio_is_valid(ddata->ext_te_gpio))
-			enable_irq(gpio_to_irq(ddata->ext_te_gpio));
+		if (ddata->ext_te_gpio)
+			enable_irq(gpiod_to_irq(ddata->ext_te_gpio));
 		ddata->ulps_enabled = false;
 	}
 err1:
@@ -556,16 +556,19 @@ static const struct attribute_group dsicm_attr_group = {
 
 static void dsicm_hw_reset(struct panel_drv_data *ddata)
 {
-	if (!gpio_is_valid(ddata->reset_gpio))
-		return;
-
-	gpio_set_value(ddata->reset_gpio, 1);
+	/*
+	 * Note that we appear to activate the reset line here. However
+	 * existing DTSes specified incorrect polarity for it (active high),
+	 * so in fact this deasserts the reset line.
+	 */
+	gpiod_set_value_cansleep(ddata->reset_gpio, 1);
 	udelay(10);
 	/* reset the panel */
-	gpio_set_value(ddata->reset_gpio, 0);
-	/* assert reset */
+	gpiod_set_value_cansleep(ddata->reset_gpio, 0);
+	/* keep reset asserted */
 	udelay(10);
-	gpio_set_value(ddata->reset_gpio, 1);
+	/* release reset line */
+	gpiod_set_value_cansleep(ddata->reset_gpio, 1);
 	/* wait after releasing reset */
 	usleep_range(5000, 10000);
 }
@@ -886,7 +889,7 @@ static int dsicm_update(struct omap_dss_device *dssdev,
 	if (r)
 		goto err;
 
-	if (ddata->te_enabled && gpio_is_valid(ddata->ext_te_gpio)) {
+	if (ddata->te_enabled && ddata->ext_te_gpio) {
 		schedule_delayed_work(&ddata->te_timeout_work,
 				msecs_to_jiffies(250));
 		atomic_set(&ddata->do_update, 1);
@@ -933,7 +936,7 @@ static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
 	else
 		r = dsicm_dcs_write_0(ddata, MIPI_DCS_SET_TEAR_OFF);
 
-	if (!gpio_is_valid(ddata->ext_te_gpio))
+	if (!ddata->ext_te_gpio)
 		in->ops.dsi->enable_te(in, enable);
 
 	/* possible panel bug */
@@ -1115,41 +1118,6 @@ static struct omap_dss_driver dsicm_ops = {
 	.memory_read	= dsicm_memory_read,
 };
 
-static int dsicm_probe_of(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
-	struct omap_dss_device *in;
-	int gpio;
-
-	gpio = of_get_named_gpio(node, "reset-gpios", 0);
-	if (!gpio_is_valid(gpio)) {
-		dev_err(&pdev->dev, "failed to parse reset gpio\n");
-		return gpio;
-	}
-	ddata->reset_gpio = gpio;
-
-	gpio = of_get_named_gpio(node, "te-gpios", 0);
-	if (gpio_is_valid(gpio) || gpio == -ENOENT) {
-		ddata->ext_te_gpio = gpio;
-	} else {
-		dev_err(&pdev->dev, "failed to parse TE gpio\n");
-		return gpio;
-	}
-
-	in = omapdss_of_find_source_for_first_ep(node);
-	if (IS_ERR(in)) {
-		dev_err(&pdev->dev, "failed to find video source\n");
-		return PTR_ERR(in);
-	}
-
-	ddata->in = in;
-
-	/* TODO: ulps, backlight */
-
-	return 0;
-}
-
 static int dsicm_probe(struct platform_device *pdev)
 {
 	struct backlight_properties props;
@@ -1171,9 +1139,12 @@ static int dsicm_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, ddata);
 	ddata->pdev = pdev;
 
-	r = dsicm_probe_of(pdev);
-	if (r)
+	ddata->in = omapdss_of_find_source_for_first_ep(pdev->dev.of_node);
+	r = PTR_ERR_OR_ZERO(ddata->in);
+	if (r) {
+		dev_err(&pdev->dev, "failed to find video source: %d\n", r);
 		return r;
+	}
 
 	ddata->timings.x_res = 864;
 	ddata->timings.y_res = 480;
@@ -1200,24 +1171,27 @@ static int dsicm_probe(struct platform_device *pdev)
 
 	atomic_set(&ddata->do_update, 0);
 
-	if (gpio_is_valid(ddata->reset_gpio)) {
-		r = devm_gpio_request_one(dev, ddata->reset_gpio,
-				GPIOF_OUT_INIT_LOW, "taal rst");
-		if (r) {
-			dev_err(dev, "failed to request reset gpio\n");
-			return r;
-		}
+	ddata->reset_gpio = devm_gpiod_get(&pdev->dev, "reset", GPIOD_OUT_LOW);
+	r = PTR_ERR_OR_ZERO(ddata->reset_gpio);
+	if (r) {
+		dev_err(&pdev->dev, "Failed to request reset gpio: %d\n", r);
+		return r;
 	}
 
-	if (gpio_is_valid(ddata->ext_te_gpio)) {
-		r = devm_gpio_request_one(dev, ddata->ext_te_gpio,
-				GPIOF_IN, "taal irq");
-		if (r) {
-			dev_err(dev, "GPIO request failed\n");
-			return r;
-		}
+	gpiod_set_consumer_name(ddata->reset_gpio, "taal rst");
+
+	ddata->ext_te_gpio = devm_gpiod_get_optional(&pdev->dev, "te",
+						     GPIOD_IN);
+	r = PTR_ERR_OR_ZERO(ddata->ext_te_gpio);
+	if (r) {
+		dev_err(&pdev->dev, "Failed to request TE gpio: %d\n", r);
+		return r;
+	}
+
+	if (ddata->ext_te_gpio) {
+		gpiod_set_consumer_name(ddata->ext_te_gpio, "taal irq");
 
-		r = devm_request_irq(dev, gpio_to_irq(ddata->ext_te_gpio),
+		r = devm_request_irq(dev, gpiod_to_irq(ddata->ext_te_gpio),
 				dsicm_te_isr,
 				IRQF_TRIGGER_RISING,
 				"taal vsync", ddata);

-- 
b4 0.11.0-dev-5166b
