Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 063773154F9
	for <lists+linux-omap@lfdr.de>; Tue,  9 Feb 2021 18:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233076AbhBIRYu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Feb 2021 12:24:50 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37882 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233056AbhBIRYg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 9 Feb 2021 12:24:36 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 119HMwJp085912;
        Tue, 9 Feb 2021 11:22:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1612891378;
        bh=ORR1qWbzGKPhFb6nJeQy4m4jrPKcnKzbMF0SL3bn+OY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=UfatRChCyUh8gNTI/1xMI6ph/aAE/4AjyMuaYcI75ctaX8r7MU0g1YFq/JOFA736k
         JWpkLFvwUgRD7SoHLq7EL/NgOfPIbzu6ekc5KKb5AkVvmXQkhOZfhSVh9hrWrnrZ1H
         fdDCqun+4jlTAt8ZftTeOITFfXlycPZja7ANnKW8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 119HMwGb047703
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 9 Feb 2021 11:22:58 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 9 Feb
 2021 11:22:58 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 9 Feb 2021 11:22:58 -0600
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 119HMwWH091746;
        Tue, 9 Feb 2021 11:22:58 -0600
Received: from localhost ([10.250.35.110])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 119HMv93007541;
        Tue, 9 Feb 2021 11:22:57 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 2/2] hwspinlock: omap: Add support for K3 AM64x SoCs
Date:   Tue, 9 Feb 2021 11:22:40 -0600
Message-ID: <20210209172240.2305-3-s-anna@ti.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210209172240.2305-1-s-anna@ti.com>
References: <20210209172240.2305-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The AM64x SoC contains a HwSpinlock IP instance in the MAIN domain,
and is a minor variant of the IP on the current TI K3 SoCs such as
AM64x, J721E or J7200 SoCs. The IP is not built with the K3 safety
feature in hardware, and has slightly different integration into
the overall SoC.

Add the support for this IP through a new compatible.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
v2: No changes

 drivers/hwspinlock/omap_hwspinlock.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index 3b05560456ea..65dbf1ae3aa7 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -2,11 +2,12 @@
 /*
  * OMAP hardware spinlock driver
  *
- * Copyright (C) 2010-2015 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2010-2021 Texas Instruments Incorporated - https://www.ti.com
  *
  * Contact: Simon Que <sque@ti.com>
  *          Hari Kanigeri <h-kanigeri2@ti.com>
  *          Ohad Ben-Cohen <ohad@wizery.com>
+ *          Suman Anna <s-anna@ti.com>
  */
 
 #include <linux/kernel.h>
@@ -165,6 +166,7 @@ static int omap_hwspinlock_remove(struct platform_device *pdev)
 static const struct of_device_id omap_hwspinlock_of_match[] = {
 	{ .compatible = "ti,omap4-hwspinlock", },
 	{ .compatible = "ti,am654-hwspinlock", },
+	{ .compatible = "ti,am64-hwspinlock", },
 	{ /* end */ },
 };
 MODULE_DEVICE_TABLE(of, omap_hwspinlock_of_match);
-- 
2.29.2

