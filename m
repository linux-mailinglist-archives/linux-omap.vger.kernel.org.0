Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79CEC41BB96
	for <lists+linux-omap@lfdr.de>; Wed, 29 Sep 2021 02:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243351AbhI2AJX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Sep 2021 20:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbhI2AJW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Sep 2021 20:09:22 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50421C061745
        for <linux-omap@vger.kernel.org>; Tue, 28 Sep 2021 17:07:42 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id x16-20020a25b910000000b005b6b7f2f91cso1207245ybj.1
        for <linux-omap@vger.kernel.org>; Tue, 28 Sep 2021 17:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=z1hBUYCayRXYRV1aBawCwI0ZIv5Q/7fBQjmnWUJmax8=;
        b=OCTtfUW5Npi/dJF4mW3n2SkJDP9rlPZGGl3YJShJKkmbrIGTpbtm+FRSRh59L+okrW
         +Sw89Nrsu7F20rC9Ug1X3rBcXEdArcyk+yz9F7j3EkrBMy/TUFV4KbCTCOu33ARr7dLu
         BHtO+dcRUGo9HjZaTk3UKE0V2TKE9DUaf0Sqr2uoLhavLrbrF2O6yojifKpdtVO8SYHH
         E7cCWqIByvVl+HGLhSwj2XRerUrrllX8R6o49LdMM1Stq6wLp0HSJCkG0SQrbCu16oPL
         Tg59QYvArInNUx7dnNGHxcTCW2lhVC7TxzMfSHxkbtS3e6c2/nU/9yIfgIpObvQUSt3D
         NLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=z1hBUYCayRXYRV1aBawCwI0ZIv5Q/7fBQjmnWUJmax8=;
        b=qQDvf7f48+EUb06JY1hoHCWTLZcacDcMdhSigbO6PccOWRQ3MktUv/n2IzOsjKAnKl
         wo4nyH4Ak/CaNNEAZZKDc7YHyVJj8QrMH0HuWHUW9WTavbtQsbvhNNgAibz4u7VlUY50
         rEupjo7iHhVXCPB8L4+uCBf3+SejsEB87PxJmyw5FYysUxdRD7flvEbGpEjeoOfEhIC3
         ardp3fljh4CX0M6SX/qN66lmBLoJk+pL8vlPwHkddNatmhTLm8P64vXfQphen1Qnh32l
         V+Qxv4PrsMKCL5e9kRokkb7/6ZOngfhbfcdR75Pd1vuNuOcH6KSEHUcMMNfr4adRquWx
         6vHg==
X-Gm-Message-State: AOAM531D9ZkXrC3sg0wsI+MEA20kaU3B7/zvMCzM0B8tng7IyT9jM/gz
        mEhG8C0AWmL/zxerP9vsgUA32SGNd7QaoP0=
X-Google-Smtp-Source: ABdhPJzRrBTTHFIUolV1HI4zYSv3r1hQit3Ioobw+9iFo7JuoZ1s/FWEsVYnyLcKndbaY2HiicWHeMpImyPd9NU=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:5241:a7e9:90c9:9c91])
 (user=saravanak job=sendgmr) by 2002:a25:8885:: with SMTP id
 d5mr9515658ybl.14.1632874061568; Tue, 28 Sep 2021 17:07:41 -0700 (PDT)
Date:   Tue, 28 Sep 2021 17:07:33 -0700
In-Reply-To: <20210929000735.585237-1-saravanak@google.com>
Message-Id: <20210929000735.585237-2-saravanak@google.com>
Mime-Version: 1.0
References: <20210929000735.585237-1-saravanak@google.com>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
Subject: [PATCH v4 1/2] drivers: bus: simple-pm-bus: Add support for probing
 simple bus only devices
From:   Saravana Kannan <saravanak@google.com>
To:     Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
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

However, there are instances of devices that are not simple buses (they get
probed by their specific drivers) that also list the "simple-bus" (or other
bus only compatible strings) in their compatible property to automatically
populate their child devices. We still want these devices to get probed by
their specific drivers. So, we make sure this driver only probes devices
that are only buses.

[1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
Fixes: c442a0d18744 ("driver core: Set fw_devlink to "permissive" behavior by default")
Signed-off-by: Saravana Kannan <saravanak@google.com>
Tested-by: Saravana Kannan <saravanak@google.com>
Tested-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/bus/simple-pm-bus.c | 42 ++++++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
index 01a3d0cd08ed..6b8d6257ed8a 100644
--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -13,11 +13,36 @@
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
+	/*
+	 * Allow user to use driver_override to bind this driver to a
+	 * transparent bus device which has a different compatible string
+	 * that's not listed in simple_pm_bus_of_match. We don't want to do any
+	 * of the simple-pm-bus tasks for these devices, so return early.
+	 */
+	if (pdev->driver_override)
+		return 0;
+
+	match = of_match_device(dev->driver->of_match_table, dev);
+	/*
+	 * These are transparent bus devices (not simple-pm-bus matches) that
+	 * have their child nodes populated automatically.  So, don't need to
+	 * do anything more. We only match with the device if this driver is
+	 * the most specific match because we don't want to incorrectly bind to
+	 * a device that has a more specific driver.
+	 */
+	if (match && match->data) {
+		if (of_property_match_string(np, "compatible", match->compatible) == 0)
+			return 0;
+		else
+			return -ENODEV;
+	}
 
 	dev_dbg(&pdev->dev, "%s\n", __func__);
 
@@ -31,14 +56,25 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 
 static int simple_pm_bus_remove(struct platform_device *pdev)
 {
+	const void *data = of_device_get_match_data(&pdev->dev);
+
+	if (pdev->driver_override || data)
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
2.33.0.685.g46640cef36-goog

