Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA25D159E1A
	for <lists+linux-omap@lfdr.de>; Wed, 12 Feb 2020 01:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728073AbgBLAkQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Feb 2020 19:40:16 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33324 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728070AbgBLAkQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Feb 2020 19:40:16 -0500
Received: by mail-lj1-f195.google.com with SMTP id y6so292262lji.0
        for <linux-omap@vger.kernel.org>; Tue, 11 Feb 2020 16:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1E6U1KXN6Rcnkdcrq0BPPezEV5qfb7m21AOfkLuyxDo=;
        b=u4VSpkKl40Av+vWVlGDk5M6EJHsC+aP6g1qHFL7Ssr3u+n0QsQjq1srx8PfseuEuIj
         Ps0xrsUWPLUwRPLl9sbUKec3gOfLRj848+Kp8NQAscYPDxKm+yPp+AaOIDeMJ6M6KGz3
         zVZePI+foU/oUER8HIWYYVGp1Ij5wMqSRgPnYDe3IeZHLgHY0PaOsnBSigpaNP6e+hAR
         eTPapSzPtbdjcbCTyh/dUo780PEYHLZ28QWfRaVbRLTNaa3VL8aq6JeoVOT9e8j6bWKh
         mKcKG3P147Is2mRggjc9SiReKD13Rr1ypGWAYR70PV0UvJ8PZ/VIuiWfB/3YvW6NZLWk
         O9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1E6U1KXN6Rcnkdcrq0BPPezEV5qfb7m21AOfkLuyxDo=;
        b=f2hnVQsHNfdLJ/znD6d7zD3Q6+BNL8AfkLMa9Ze9m42VAQo9p0WRzVAoV/SeaWtmTH
         9gmxzazCCXRiwiSjmLTHC/ai9A098ujg93tvCtfp4+jzzezSW/Iz4lXDLjlULBHscg2s
         cprDJv9qG63Ys+PW8mnmmxbhR4cjhQM/S96TICoYLtX09EZhKjaWOXsX140RQoZXk2je
         E3rASf/V4CDTLS1UKePFVFB4q/uxQQG2ZCHdTVSaTUch8OngSzfD7qQxQWXze+olzKCK
         yiodnZdnXKQtO8b1I9vFJIhb+ZqISsLHyYdLMCua7PfP7xCjJp33ae9VQ3aiXUTEfy2y
         WMnQ==
X-Gm-Message-State: APjAAAUTrM+BI3QDJWqDPwzcSA+zwzMVlbqosVTifru5yG7oU0MJdEE6
        cyig4aFIG9FUBnx8lGuY9mI=
X-Google-Smtp-Source: APXvYqyZTguDgRqpwWaZ+6ZgVuWMJkwrup7xgzKvxWnDPUtwVrP2Se7fBz1FzXWoTaCjDRUXa4UV+g==
X-Received: by 2002:a05:651c:2046:: with SMTP id t6mr6132637ljo.180.1581468014885;
        Tue, 11 Feb 2020 16:40:14 -0800 (PST)
Received: from z50.gdansk-morena.vectranet.pl (109241122244.gdansk.vectranet.pl. [109.241.122.244])
        by smtp.gmail.com with ESMTPSA id e8sm3621935ljb.45.2020.02.11.16.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 16:40:14 -0800 (PST)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-mtd@lists.infradead.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [RFC PATCH 02/14] mtd: rawnand: ams-delta: Use struct gpio_nand_platdata
Date:   Wed, 12 Feb 2020 01:39:17 +0100
Message-Id: <20200212003929.6682-3-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200212003929.6682-1-jmkrzyszt@gmail.com>
References: <20200212003929.6682-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In order to be able to move the hardcoded Amstrad Delta partition info
from the driver code to the board file, reuse gpio_nand_platdata
structure owned by "gpio-nand" driver and try to obtain information
on device partitions from device platform data.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 2501cfe00f43..fbab7cc14607 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -19,6 +19,7 @@
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/mtd/mtd.h>
+#include <linux/mtd/nand-gpio.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/platform_device.h>
@@ -220,12 +221,20 @@ static const struct nand_controller_ops ams_delta_ops = {
  */
 static int ams_delta_init(struct platform_device *pdev)
 {
+	struct gpio_nand_platdata *pdata = dev_get_platdata(&pdev->dev);
+	const struct mtd_partition *partitions = partition_info;
+	int num_partitions = ARRAY_SIZE(partition_info);
 	struct ams_delta_nand *priv;
 	struct nand_chip *this;
 	struct mtd_info *mtd;
 	struct gpio_descs *data_gpiods;
 	int err = 0;
 
+	if (pdata) {
+		partitions = pdata->parts;
+		num_partitions = pdata->num_parts;
+	}
+
 	/* Allocate memory for MTD device structure and private data */
 	priv = devm_kzalloc(&pdev->dev, sizeof(struct ams_delta_nand),
 			    GFP_KERNEL);
@@ -326,8 +335,7 @@ static int ams_delta_init(struct platform_device *pdev)
 		return err;
 
 	/* Register the partitions */
-	err = mtd_device_register(mtd, partition_info,
-				  ARRAY_SIZE(partition_info));
+	err = mtd_device_register(mtd, partitions, num_partitions);
 	if (err)
 		goto err_nand_cleanup;
 
-- 
2.24.1

