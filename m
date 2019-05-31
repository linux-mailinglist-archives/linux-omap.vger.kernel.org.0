Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EDE13067E
	for <lists+linux-omap@lfdr.de>; Fri, 31 May 2019 04:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbfEaCNa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 May 2019 22:13:30 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:60874 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726372AbfEaCN3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 May 2019 22:13:29 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4V2DOXo098765;
        Thu, 30 May 2019 21:13:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559268804;
        bh=ihidVVcFNIyittejhS+bbU/Ve3sebgl4qU990HXA5s8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=UBaLIbXlctcH4PNdaixSS3Mbp8yqO0KBGnTQ9FHrZg7p8jKtRYBmC4dX18uUwTGUK
         ofDRtlgXsXZnq334I1Lkwc4oEhhJUXehInrqx1ebF9G7ql4zH4NWoIPWpetWBGq3n3
         s5pToFqLwE3iqO80FvAF5nrOw5yfnyZsuCOTtlzU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4V2DO8k111177
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 30 May 2019 21:13:24 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 30
 May 2019 21:13:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 30 May 2019 21:13:24 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4V2DNxG008960;
        Thu, 30 May 2019 21:13:24 -0500
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id x4V2DNm18132;
        Thu, 30 May 2019 21:13:23 -0500 (CDT)
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 2/3] hwspinlock/omap: Add support for TI K3 SoCs
Date:   Thu, 30 May 2019 21:13:20 -0500
Message-ID: <20190531021321.14025-3-s-anna@ti.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190531021321.14025-1-s-anna@ti.com>
References: <20190531021321.14025-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

A HwSpinlock IP is also present on the newer TI K3 AM65x and J721E
family of SoCs within the Main NavSS sub-module. Reuse the existing
OMAP Hwspinlock driver to extend the support for this IP on K3 AM65x
SoCs as well. The IP has slightly different bit-fields in the
SYSCONFIG and SYSSTATUS registers.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/hwspinlock/Kconfig           | 2 +-
 drivers/hwspinlock/omap_hwspinlock.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwspinlock/Kconfig b/drivers/hwspinlock/Kconfig
index 7869c67e5b6b..37740e992cfa 100644
--- a/drivers/hwspinlock/Kconfig
+++ b/drivers/hwspinlock/Kconfig
@@ -9,7 +9,7 @@ menuconfig HWSPINLOCK
 config HWSPINLOCK_OMAP
 	tristate "OMAP Hardware Spinlock device"
 	depends on HWSPINLOCK
-	depends on ARCH_OMAP4 || SOC_OMAP5 || SOC_DRA7XX || SOC_AM33XX || SOC_AM43XX
+	depends on ARCH_OMAP4 || SOC_OMAP5 || SOC_DRA7XX || SOC_AM33XX || SOC_AM43XX || ARCH_K3
 	help
 	  Say y here to support the OMAP Hardware Spinlock device (firstly
 	  introduced in OMAP4).
diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index 625844e0abef..a4d7a7bc863a 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -171,6 +171,7 @@ static int omap_hwspinlock_remove(struct platform_device *pdev)
 
 static const struct of_device_id omap_hwspinlock_of_match[] = {
 	{ .compatible = "ti,omap4-hwspinlock", },
+	{ .compatible = "ti,am654-hwspinlock", },
 	{ /* end */ },
 };
 MODULE_DEVICE_TABLE(of, omap_hwspinlock_of_match);
-- 
2.21.0

