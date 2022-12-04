Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 065E8641C71
	for <lists+linux-omap@lfdr.de>; Sun,  4 Dec 2022 11:59:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbiLDK67 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Sun, 4 Dec 2022 05:58:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbiLDK66 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 4 Dec 2022 05:58:58 -0500
X-Greylist: delayed 910 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 04 Dec 2022 02:58:57 PST
Received: from sender11-of-o51.zoho.eu (sender11-of-o51.zoho.eu [31.186.226.237])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B5BB17E2A;
        Sun,  4 Dec 2022 02:58:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670150613; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=f4CyAkDKBeEjrpQlYw4bgfumrtflaX8kCKP6lbXFFrGZt/XCcxGUx8U+05L5jKzMUEQc0PccNiEF0jweBy+8y7ORiZCnBSLNtQUxgKGp/r67XNOU92jk4SgOPMnkf04lMm/yVq25Ot3RmJExeyGf6HhPgL86H7tqQmtjl0WFwkk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1670150613; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=jvvnOVg7mEdcYOEaYthf36cr1JVF4keZCUbF+K/j7nU=; 
        b=TUqIwtjBmnsrOCusfesXvegVD9MDaZxzBs1h8X0Z22Fu9ICCUV1VTp3WOAGc1eht00IFJp0T+7WllC+Tv7A6cv1FahbhXFueOk69xLw8mCDtLtC/QAKqrTHszxNck2I9mEjSzxKMbqPvLtUkXs8Mtau3yTtZm1O17AmoRO3CIwA=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz>
Received: from localhost.localdomain (ip-095-222-026-199.um34.pools.vodafone-ip.de [95.222.26.199]) by mx.zoho.eu
        with SMTPS id 1670150611687421.3830626799993; Sun, 4 Dec 2022 11:43:31 +0100 (CET)
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org
Cc:     devicetree@vger.kernel.org, Carl Philipp Klemm <philipp@uvos.xyz>
Message-ID: <20221204104313.17478-1-philipp@uvos.xyz>
Subject: [PATCH 1/4] leds: cpcap: add support for the keyboard light channel
Date:   Sun,  4 Dec 2022 11:43:10 +0100
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,FROM_SUSPICIOUS_NTLD,
        FROM_SUSPICIOUS_NTLD_FP,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The keyboard light channel is used on xt875 for the touchscreen
button lights.
This commit also adds a checks for the sucessfull return of
device_get_match_data.

Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
---
 drivers/leds/leds-cpcap.c    | 15 +++++++++++++++
 drivers/mfd/motorola-cpcap.c |  4 ++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/leds/leds-cpcap.c b/drivers/leds/leds-cpcap.c
index 7d41ce8c9bb1..11a9b857d8ea 100644
--- a/drivers/leds/leds-cpcap.c
+++ b/drivers/leds/leds-cpcap.c
@@ -58,6 +58,15 @@ static const struct cpcap_led_info cpcap_led_cp = {
 	.init_val	= 0x0008,
 };
 
+/* keyboard led */
+static const struct cpcap_led_info cpcap_led_kl = {
+	.reg		= CPCAP_REG_KLC,
+	.mask		= 0x0001,
+	.limit		= 1,
+	.init_mask	= 0x07FF,
+	.init_val	= 0x07F0,
+};
+
 struct cpcap_led {
 	struct led_classdev led;
 	const struct cpcap_led_info *info;
@@ -152,6 +161,7 @@ static const struct of_device_id cpcap_led_of_match[] = {
 	{ .compatible = "motorola,cpcap-led-blue",  .data = &cpcap_led_blue },
 	{ .compatible = "motorola,cpcap-led-adl", .data = &cpcap_led_adl },
 	{ .compatible = "motorola,cpcap-led-cp", .data = &cpcap_led_cp },
+	{ .compatible = "motorola,cpcap-led-kl", .data = &cpcap_led_kl },
 	{},
 };
 MODULE_DEVICE_TABLE(of, cpcap_led_of_match);
@@ -168,6 +178,11 @@ static int cpcap_led_probe(struct platform_device *pdev)
 	led->info = device_get_match_data(&pdev->dev);
 	led->dev = &pdev->dev;
 
+	if (!led->info) {
+		dev_warn(led->dev, "Can't get match data");
+		return -ENODEV;
+	}
+
 	if (led->info->reg == 0x0000) {
 		dev_err(led->dev, "Unsupported LED");
 		return -ENODEV;
diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cpcap.c
index 265464b5d7cc..57b3378a8829 100644
--- a/drivers/mfd/motorola-cpcap.c
+++ b/drivers/mfd/motorola-cpcap.c
@@ -285,6 +285,10 @@ static const struct mfd_cell cpcap_mfd_devices[] = {
 		.name          = "cpcap-led",
 		.id            = 4,
 		.of_compatible = "motorola,cpcap-led-cp",
+	}, {
+		.name          = "cpcap-led",
+		.id            = 5,
+		.of_compatible = "motorola,cpcap-led-kl",
 	}, {
 		.name          = "cpcap-codec",
 	}
-- 
2.38.1


