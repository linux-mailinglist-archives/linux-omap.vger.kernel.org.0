Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F701641C73
	for <lists+linux-omap@lfdr.de>; Sun,  4 Dec 2022 11:59:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbiLDK7F convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Sun, 4 Dec 2022 05:59:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbiLDK7E (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 4 Dec 2022 05:59:04 -0500
Received: from sender11-of-o51.zoho.eu (sender11-of-o51.zoho.eu [31.186.226.237])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A719317E2A;
        Sun,  4 Dec 2022 02:59:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670150627; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=ec07gctNe7R/k5thMNk5OBHzQJ2NeGUC4l6vEKG48GQySl5qKMGwU//mYM+a/PAf26AvPyiCRxp4ai8EXFbOi50OLTa6pdJI+C411d/Q0ow3fUH4cM/An4cbZ1nohovoVghc0iwDT/0f38pCpgcyZGgWL/zG/QzNB81Kdzcyq/c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1670150627; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=jHe0jGTJmF7m6cDleOyuTXJHSDg7MvwwuBD3IegP5zw=; 
        b=d55LpoLSjWZrEus9peQWyawsEV9D7+A6k++BwKslGOI5XpFGdAWFge3TkTRPpCKvlO/OMcqiHL7IvCY0fpbmVfsXRP0691KUhjQXJ1dL9Vo/7UNlEn3SU6xX59JQANb0zEBthg5s7NnYv5GwHNKNtd9IWCAWP6qK4luuMFbnbZ8=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz>
Received: from localhost.localdomain (ip-095-222-026-199.um34.pools.vodafone-ip.de [95.222.26.199]) by mx.zoho.eu
        with SMTPS id 167015062549041.40231813979858; Sun, 4 Dec 2022 11:43:45 +0100 (CET)
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org
Cc:     devicetree@vger.kernel.org, Carl Philipp Klemm <philipp@uvos.xyz>
Message-ID: <20221204104313.17478-2-philipp@uvos.xyz>
Subject: [PATCH 2/4] leds: cpcap: make leds-cpcap an independent platform device to allow varying led setups
Date:   Sun,  4 Dec 2022 11:43:11 +0100
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204104313.17478-1-philipp@uvos.xyz>
References: <20221204104313.17478-1-philipp@uvos.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FROM_SUSPICIOUS_NTLD,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Previously led-cpcap devices where defined statically in mfd_cell
of the parent mdf device. This causes issues for devices like
xt875 that have less and different leds than xt894. Splitting the
device like this is posssible, as in reality the cpcap led ip block
is totaly independent from the mdf device and cpcap core.

Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
---
 drivers/leds/leds-cpcap.c    | 19 +++++++++++++++++--
 drivers/mfd/motorola-cpcap.c | 24 ------------------------
 2 files changed, 17 insertions(+), 26 deletions(-)

diff --git a/drivers/leds/leds-cpcap.c b/drivers/leds/leds-cpcap.c
index 11a9b857d8ea..7a1dd050fdf0 100644
--- a/drivers/leds/leds-cpcap.c
+++ b/drivers/leds/leds-cpcap.c
@@ -11,6 +11,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <linux/spi/spi.h>
 
 #define CPCAP_LED_NO_CURRENT 0x0001
 
@@ -170,6 +171,18 @@ static int cpcap_led_probe(struct platform_device *pdev)
 {
 	struct cpcap_led *led;
 	int err;
+	struct device_node *mfd_node;
+	struct device *cpcap_dev;
+
+	mfd_node = of_parse_phandle(pdev->dev.of_node, "cpcap-phandle", 0);
+	if (!mfd_node) {
+		dev_err(&pdev->dev, "cpcap-phandle is missing in device tree\n");
+		return -ENODEV;
+	}
+
+	cpcap_dev = bus_find_device_by_of_node(&spi_bus_type, mfd_node);
+	if (IS_ERR_OR_NULL(cpcap_dev))
+		return -EAGAIN;
 
 	led = devm_kzalloc(&pdev->dev, sizeof(*led), GFP_KERNEL);
 	if (!led)
@@ -188,9 +201,11 @@ static int cpcap_led_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	led->regmap = dev_get_regmap(pdev->dev.parent, NULL);
-	if (!led->regmap)
+	led->regmap = dev_get_regmap(cpcap_dev, NULL);
+	if (!led->regmap) {
+		dev_err(led->dev, "Couldn't get regmap from cpcap mdf device");
 		return -ENODEV;
+	}
 
 	led->vdd = devm_regulator_get(&pdev->dev, "vdd");
 	if (IS_ERR(led->vdd)) {
diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cpcap.c
index 57b3378a8829..e1ae14e0e651 100644
--- a/drivers/mfd/motorola-cpcap.c
+++ b/drivers/mfd/motorola-cpcap.c
@@ -265,30 +265,6 @@ static const struct mfd_cell cpcap_mfd_devices[] = {
 	}, {
 		.name          = "cpcap-usb-phy",
 		.of_compatible = "motorola,mapphone-cpcap-usb-phy",
-	}, {
-		.name          = "cpcap-led",
-		.id            = 0,
-		.of_compatible = "motorola,cpcap-led-red",
-	}, {
-		.name          = "cpcap-led",
-		.id            = 1,
-		.of_compatible = "motorola,cpcap-led-green",
-	}, {
-		.name          = "cpcap-led",
-		.id            = 2,
-		.of_compatible = "motorola,cpcap-led-blue",
-	}, {
-		.name          = "cpcap-led",
-		.id            = 3,
-		.of_compatible = "motorola,cpcap-led-adl",
-	}, {
-		.name          = "cpcap-led",
-		.id            = 4,
-		.of_compatible = "motorola,cpcap-led-cp",
-	}, {
-		.name          = "cpcap-led",
-		.id            = 5,
-		.of_compatible = "motorola,cpcap-led-kl",
 	}, {
 		.name          = "cpcap-codec",
 	}
-- 
2.38.1


