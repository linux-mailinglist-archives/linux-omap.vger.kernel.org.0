Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9B9C40089E
	for <lists+linux-omap@lfdr.de>; Sat,  4 Sep 2021 02:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350805AbhIDAGw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 3 Sep 2021 20:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350801AbhIDAGv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 3 Sep 2021 20:06:51 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35FCFC061760
        for <linux-omap@vger.kernel.org>; Fri,  3 Sep 2021 17:05:50 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id k15-20020a25240f000000b0059efafc5a58so961510ybk.11
        for <linux-omap@vger.kernel.org>; Fri, 03 Sep 2021 17:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=CmiOovZTt1y4cIWEfI47PRt3/MlHznjnR9cha/mAR4c=;
        b=YwL/ZRmVL05ExLE8Uye2bq5sdTwSfXVFJvEJM3RSL7OVnlT4viA1ZPsdqJbNE+RcMg
         UgbROXkOc+awabmhS8Dhd/IfE5Ni+56xWlHUf4Eqgphst0spjSiEsxqxlBXxV6m2Ah+P
         LaZabo3SchFKsQZrmYELQEAmKQVR0XJQMx1Y7YMcU2RCpessU4+lEZPRoEI+GypG8SfW
         PwCI/fte/EJW9+wuc09PN7EbczrDfoIoDp+TcylGNLZ3K+R7g3WutymywjInJTwNdUKp
         tOKHhoauY9ddyjAT4cxP8s+rsbMV7xjnf5qPR1oJUosL0E12HM383vRUS7Me6ht+ZctT
         ydbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=CmiOovZTt1y4cIWEfI47PRt3/MlHznjnR9cha/mAR4c=;
        b=iX9o3nfwHunMLUazu/47pzof7s6D6rGEG5Nc7q8b62kx5zUUr628fOHzpNlQdJCIiT
         I2ATfz22If0qRvEg4mOm0/67JUOPfpTN7KRJMRFYBDD9Wvn4bJYIiSHr4TTPOiWnW9k/
         4V3vAF2Ph6M3051V1RXAqH2Io/jA/rzhxIiymezfVoxwJwjep1UaRKMFEiU8L1GmbUSy
         i/MTSajH+B5agLsyTqbODiN9zKmsQMTW/lnmjiomtg6W7q5Zt/DF7Fp1yHhmGGmNsDId
         LfaZM6SsuUpbAec7btnHW6DsnRxmNYr18TKX8kHnPZYjNTEr+BQ0Y0o4zTgzcLN6QyWV
         Wrhw==
X-Gm-Message-State: AOAM532VbSIV0pr3ApTjmDk73ZW+O6RiIDiMyGPy5zRkjt6gSE668qa2
        1/x42dApDOdEqrlbe8lSYytPGaJX1G+ssKo=
X-Google-Smtp-Source: ABdhPJxmH19nPmNYfApQCzFJa101DpD5Gzo0XYSrXU/wL13p/J/9TjYYqd+ffs7ankEM4mjnReGAXwID7O4vqfQ=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:b45b:ca56:952a:2176])
 (user=saravanak job=sendgmr) by 2002:a25:b9cf:: with SMTP id
 y15mr2035451ybj.110.1630713949404; Fri, 03 Sep 2021 17:05:49 -0700 (PDT)
Date:   Fri,  3 Sep 2021 17:05:41 -0700
In-Reply-To: <20210904000543.2019010-1-saravanak@google.com>
Message-Id: <20210904000543.2019010-2-saravanak@google.com>
Mime-Version: 1.0
References: <20210904000543.2019010-1-saravanak@google.com>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
Subject: [PATCH v3 1/2] drivers: bus: simple-pm-bus: Add support for probing
 simple bus only devices
From:   Saravana Kannan <saravanak@google.com>
To:     Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Saravana Kannan <saravanak@google.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, kernel-team@android.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

fw_devlink could end up creating device links for bus only devices.
However, bus only devices don't get probed and can block probe() or
sync_state() [1] call backs of other devices. To avoid this, probe these
devices using the simple-pm-bus driver.

However, there are instances of devices that are not simple buses (they
get probed by their specific drivers) that also list the "simple-bus"
(or other bus only compatible strings) in their compatible property to
automatically populate their child devices. We still want these devices
to get probed by their specific drivers. So, we make sure this driver
only probes devices that are only buses.

[1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
Signed-off-by: Saravana Kannan <saravanak@google.com>
Tested-by: Saravana Kannan <saravanak@google.com>
---
 drivers/bus/simple-pm-bus.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
index 01a3d0cd08ed..3e086a9f34cb 100644
--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -13,11 +13,26 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
-
 static int simple_pm_bus_probe(struct platform_device *pdev)
 {
-	const struct of_dev_auxdata *lookup = dev_get_platdata(&pdev->dev);
-	struct device_node *np = pdev->dev.of_node;
+	const struct device *dev = &pdev->dev;
+	const struct of_dev_auxdata *lookup = dev_get_platdata(dev);
+	struct device_node *np = dev->of_node;
+	const struct of_device_id *match;
+
+	match = of_match_device(dev->driver->of_match_table, dev);
+
+	/*
+	 * These are transparent bus devices (not simple-pm-bus matches) that
+	 * have their child nodes populated automatically.  So, don't need to
+	 * do anything more.
+	 */
+	if (match && match->data) {
+		if (of_property_match_string(np, "compatible", match->compatible) == 0)
+			return 0;
+		else
+			return -ENODEV;
+	}
 
 	dev_dbg(&pdev->dev, "%s\n", __func__);
 
@@ -31,14 +46,25 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 
 static int simple_pm_bus_remove(struct platform_device *pdev)
 {
+	const void *data = of_device_get_match_data(&pdev->dev);
+
+	if (data)
+		return 0;
+
 	dev_dbg(&pdev->dev, "%s\n", __func__);
 
 	pm_runtime_disable(&pdev->dev);
 	return 0;
 }
 
+#define ONLY_BUS	((void *) 1) /* Match if the device is only a bus. */
+
 static const struct of_device_id simple_pm_bus_of_match[] = {
 	{ .compatible = "simple-pm-bus", },
+	{ .compatible = "simple-bus",	.data = ONLY_BUS },
+	{ .compatible = "simple-mfd",	.data = ONLY_BUS },
+	{ .compatible = "isa",		.data = ONLY_BUS },
+	{ .compatible = "arm,amba-bus",	.data = ONLY_BUS },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, simple_pm_bus_of_match);
-- 
2.33.0.153.gba50c8fa24-goog

