Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 727F2167A88
	for <lists+linux-omap@lfdr.de>; Fri, 21 Feb 2020 11:20:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728941AbgBUKU0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Feb 2020 05:20:26 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:60438 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728924AbgBUKUY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 21 Feb 2020 05:20:24 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01LAKNVo015325;
        Fri, 21 Feb 2020 04:20:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582280423;
        bh=94pf8MJOEI5lUWMdnD33HTUx8TsrZDnn1rWS02X5YE0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=GO2F9HFBtdkPYUBMmWDY78oq3x9p18yK1si+O3FQi4TXr19MiCwRNbv/Ceg6nXjmz
         bqdoLnk2Q0mtI4HynRTC15U6NhKlAozitiGIG+8RJuCJDHLMxhqZWnPeBVgsUOpNHf
         OYwKc6HTakqVjDsN+vm3ZZAtfQXlFVBMNgiJZJMY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01LAKNcV116550
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 21 Feb 2020 04:20:23 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 21
 Feb 2020 04:20:22 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 21 Feb 2020 04:20:22 -0600
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01LAJnwt034983;
        Fri, 21 Feb 2020 04:20:05 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>, <afd@ti.com>, <s-anna@ti.com>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-omap@vger.kernel.org>, Tero Kristo <t-kristo@ti.com>
Subject: [PATCHv7 06/15] remoteproc/omap: Initialize and assign reserved memory node
Date:   Fri, 21 Feb 2020 12:19:27 +0200
Message-ID: <20200221101936.16833-7-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200221101936.16833-1-t-kristo@ti.com>
References: <20200221101936.16833-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The reserved memory nodes are not assigned to platform devices by
default in the driver core to avoid the lookup for every platform
device and incur a penalty as the real users are expected to be
only a few devices.

OMAP remoteproc devices fall into the above category and the OMAP
remoteproc driver _requires_ specific CMA pools to be assigned
for each device at the moment to align on the location of the
vrings and vring buffers in the RTOS-side firmware images. So,
use the of_reserved_mem_device_init/release() API appropriately
to assign the corresponding reserved memory region to the OMAP
remoteproc device. Note that only one region per device is
allowed by the framework.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/omap_remoteproc.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 89084dd919ba..872cd0df342b 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/err.h>
 #include <linux/of_device.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
 #include <linux/remoteproc.h>
@@ -483,14 +484,23 @@ static int omap_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
+	ret = of_reserved_mem_device_init(&pdev->dev);
+	if (ret) {
+		dev_warn(&pdev->dev, "device does not have specific CMA pool.\n");
+		dev_warn(&pdev->dev, "Typically this should be provided,\n");
+		dev_warn(&pdev->dev, "only omit if you know what you are doing.\n");
+	}
+
 	platform_set_drvdata(pdev, rproc);
 
 	ret = rproc_add(rproc);
 	if (ret)
-		goto free_rproc;
+		goto release_mem;
 
 	return 0;
 
+release_mem:
+	of_reserved_mem_device_release(&pdev->dev);
 free_rproc:
 	rproc_free(rproc);
 	return ret;
@@ -502,6 +512,7 @@ static int omap_rproc_remove(struct platform_device *pdev)
 
 	rproc_del(rproc);
 	rproc_free(rproc);
+	of_reserved_mem_device_release(&pdev->dev);
 
 	return 0;
 }
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
