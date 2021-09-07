Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2ED44027E5
	for <lists+linux-omap@lfdr.de>; Tue,  7 Sep 2021 13:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344086AbhIGLeF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Sep 2021 07:34:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:53970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234765AbhIGLeB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 7 Sep 2021 07:34:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 191FF61102;
        Tue,  7 Sep 2021 11:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631014375;
        bh=sQuZUWgdARuE9kUIz+EivFia19C84kYYBU5ITZKbWv4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Hs9RrmOBVNUx+rwZpa8Infit7YRrlacPH8yDRkAWO5ZI4pqIKueSjeU+A7jGC7v8X
         veSKNgllzSCtRijYA4CHasEIJbX5VKso7ckVaz/FMWCi5OsNvMdS5B6cI6AIroQL1B
         fNATi6LFabqDf08lk7Zq71AR3dLgyZ2yyahuyMSUyByn1EEfhKeY+o1gRcw5fw3WX8
         RekFhhaaPu4hcGdxrxBbEAtAvRk/E++Ycnu1A7cQdw7JtbwvZ3gz3POcnIPucFOs83
         NI5auWr0Vox7lYKYl61K2a1cz1iNN8DZJfT/5TC0BZVKO7B0QOM2mIjvJKvBB7rAAQ
         Kg/j76neHcv+A==
From:   Roger Quadros <rogerq@kernel.org>
To:     tony@atomide.com
Cc:     robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
        lokeshvutla@ti.com, nsekhar@ti.com,
        krzysztof.kozlowski@canonical.com, miquel.raynal@bootlin.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v3 8/8] memory: gpmc-omap: "gpmc,device-width" DT property is optional
Date:   Tue,  7 Sep 2021 14:32:26 +0300
Message-Id: <20210907113226.31876-9-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210907113226.31876-1-rogerq@kernel.org>
References: <20210907113226.31876-1-rogerq@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Check for valid gpmc,device-width, nand-bus-width and bank-width
at one place. Default to 8-bit width if none present.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/memory/omap-gpmc.c | 41 ++++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index f80c2ea39ca4..32d7c665f33c 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -2171,10 +2171,8 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
 		}
 	}
 
-	if (of_device_is_compatible(child, "ti,omap2-nand")) {
-		/* NAND specific setup */
-		val = 8;
-		of_property_read_u32(child, "nand-bus-width", &val);
+	/* DT node can have "nand-bus-width" or "bank-width" or "gpmc,device-width" */
+	if (!of_property_read_u32(child, "nand-bus-width", &val)) {
 		switch (val) {
 		case 8:
 			gpmc_s.device_width = GPMC_DEVWIDTH_8BIT;
@@ -2183,24 +2181,37 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
 			gpmc_s.device_width = GPMC_DEVWIDTH_16BIT;
 			break;
 		default:
-			dev_err(&pdev->dev, "%pOFn: invalid 'nand-bus-width'\n",
-				child);
+			dev_err(&pdev->dev,
+				"%pOFn: invalid 'nand-bus-width':%d\n", child, val);
+			ret = -EINVAL;
+			goto err;
+		}
+	} else if (!of_property_read_u32(child, "bank-width", &val)) {
+		if (val != 1 && val != 2) {
+			dev_err(&pdev->dev,
+				"%pOFn: invalid 'bank-width':%d\n", child, val);
 			ret = -EINVAL;
 			goto err;
 		}
+		gpmc_s.device_width = val;
+	} else if (!of_property_read_u32(child, "gpmc,device-width", &val)) {
+		if (val != 1 && val != 2) {
+			dev_err(&pdev->dev,
+				"%pOFn: invalid 'gpmc,device-width':%d\n", child, val);
+			ret = -EINVAL;
+			goto err;
+		}
+		gpmc_s.device_width = val;
+	} else {
+		/* default to 8-bit */
+		gpmc_s.device_width = GPMC_DEVWIDTH_8BIT;
+	}
 
+	if (of_device_is_compatible(child, "ti,omap2-nand")) {
+		/* NAND specific setup */
 		/* disable write protect */
 		gpmc_configure(GPMC_CONFIG_WP, 0);
 		gpmc_s.device_nand = true;
-	} else {
-		ret = of_property_read_u32(child, "bank-width",
-					   &gpmc_s.device_width);
-		if (ret < 0 && !gpmc_s.device_width) {
-			dev_err(&pdev->dev,
-				"%pOF has no 'gpmc,device-width' property\n",
-				child);
-			goto err;
-		}
 	}
 
 	/* Reserve wait pin if it is required and valid */
-- 
2.17.1

