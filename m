Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0E2159300
	for <lists+linux-omap@lfdr.de>; Tue, 11 Feb 2020 16:22:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729214AbgBKPWb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Feb 2020 10:22:31 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58030 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730407AbgBKPVz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Feb 2020 10:21:55 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01BFLsj5022397;
        Tue, 11 Feb 2020 09:21:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1581434514;
        bh=hLpMhA/DQOSEGxT1JMEcmi7MPVEfve9uqOLxpyOK9iw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=arJjL3enOL/fC1Y+nmIZOmxNECLMIGX3X9lV1KmOC+De/eI1VxKV9/URgKCsfeaE/
         s0VCoFSJpbxTG3SpMhozcx9OJh53qIRhWn0hdCeKbKaab2eLN0O8Sj+SXfEJDsfLeC
         SArKMD5sX6t505ud1qzQDF39ecjtfwV34cBL3wq0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01BFLs5i059335;
        Tue, 11 Feb 2020 09:21:54 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 11
 Feb 2020 09:21:54 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 11 Feb 2020 09:21:54 -0600
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01BFLbki020993;
        Tue, 11 Feb 2020 09:21:52 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>, <afd@ti.com>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-omap@vger.kernel.org>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCHv6 06/14] remoteproc/omap: Initialize and assign reserved memory node
Date:   Tue, 11 Feb 2020 17:21:17 +0200
Message-ID: <20200211152125.23819-7-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211152125.23819-1-t-kristo@ti.com>
References: <20200211152125.23819-1-t-kristo@ti.com>
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
---
v6:
  - made memory-regions optional
  - added multi-line warning if memory-regions are not provided

 drivers/remoteproc/omap_remoteproc.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 0846839b2c97..a0711c1035d3 100644
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
@@ -480,14 +481,23 @@ static int omap_rproc_probe(struct platform_device *pdev)
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
@@ -499,6 +509,7 @@ static int omap_rproc_remove(struct platform_device *pdev)
 
 	rproc_del(rproc);
 	rproc_free(rproc);
+	of_reserved_mem_device_release(&pdev->dev);
 
 	return 0;
 }
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
