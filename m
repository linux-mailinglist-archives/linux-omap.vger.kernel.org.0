Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 248503030B1
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jan 2021 00:59:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731921AbhAYX60 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 25 Jan 2021 18:58:26 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:57936 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732469AbhAYX6O (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 25 Jan 2021 18:58:14 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10PNvF4J122260;
        Mon, 25 Jan 2021 17:57:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1611619035;
        bh=u490ZBd71l4VSU5ZzR93uUh3gBx2Qawp9w+Ia8TQfbc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=fwrQgHbcXL2VL8GW5qSwSrSmyjJo4F4We1fOR3s4+7Pi7gBWFdlEB6AMtjom0c62K
         WFEcdnjjwgjyNTx2Ph6kDtdZ2RF+IYOD5OgVMMs+DDi/Uq1vSRs3VqNG/CJ5CUbNDP
         QaRWyhmEmYr21BTXcbibaiH+PXb/hOfCrs06UccU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10PNvF6s088368
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 25 Jan 2021 17:57:15 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 25
 Jan 2021 17:57:15 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 25 Jan 2021 17:57:14 -0600
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10PNvEsH035804;
        Mon, 25 Jan 2021 17:57:14 -0600
Received: from localhost ([10.250.35.71])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 10PNvE3t117198;
        Mon, 25 Jan 2021 17:57:14 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 2/2] hwspinlock: omap: Add support for K3 AM64x SoCs
Date:   Mon, 25 Jan 2021 17:56:53 -0600
Message-ID: <20210125235653.24385-3-s-anna@ti.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125235653.24385-1-s-anna@ti.com>
References: <20210125235653.24385-1-s-anna@ti.com>
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

