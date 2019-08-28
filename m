Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB219FC2A
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 09:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbfH1Hqc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 03:46:32 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:37858 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbfH1Hqb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Aug 2019 03:46:31 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7S7kTkQ003940;
        Wed, 28 Aug 2019 02:46:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566978389;
        bh=hCwSNtASFYkENxgowz6wh/YL9fDjf9WpL2VlfaibQrA=;
        h=From:To:CC:Subject:Date;
        b=dwuwoQWn5pXhI16yCnZMEsYGy/v1i6FdxW8TRjwcl/jpJavEorXWZ+Wi1zc1s7dDv
         YV6PhqdiEt4kdxAhbl1HH/6ghE0BbMCqrvUB27Sl0QM5DJKOLvs+LtKq2BrzP118yX
         Id7wvMfW2Sv9/6xKAno1LmFpmrIwsqzX0zVLQjvY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7S7kTre111767
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 28 Aug 2019 02:46:29 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 28
 Aug 2019 02:46:28 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 28 Aug 2019 02:46:29 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7S7kR3M051783;
        Wed, 28 Aug 2019 02:46:28 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <s-anna@ti.com>
Subject: [PATCHv2] ARM: OMAP2+: pdata-quirks: add PRM data for reset support
Date:   Wed, 28 Aug 2019 10:46:27 +0300
Message-ID: <20190828074627.682-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The parent clockdomain for reset must be in force wakeup mode, otherwise
the reset may never complete. Add pdata quirks for this purpose for PRM
driver.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
Changes in v2:
- split out from the main PRM series
- added support for am4/omap5

Depends on the v2 PRM series:
  https://marc.info/?l=linux-omap&m=156697680731569&w=2

 arch/arm/mach-omap2/pdata-quirks.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
index 6c6f8fce854e..4730f8c0cb0e 100644
--- a/arch/arm/mach-omap2/pdata-quirks.c
+++ b/arch/arm/mach-omap2/pdata-quirks.c
@@ -25,6 +25,7 @@
 #include <linux/platform_data/ti-sysc.h>
 #include <linux/platform_data/wkup_m3.h>
 #include <linux/platform_data/asoc-ti-mcbsp.h>
+#include <linux/platform_data/ti-prm.h>
 
 #include "clockdomain.h"
 #include "common.h"
@@ -565,6 +566,12 @@ void omap_pcs_legacy_init(int irq, void (*rearm)(void))
 	pcs_pdata.rearm = rearm;
 }
 
+static struct ti_prm_platform_data ti_prm_pdata = {
+	.clkdm_deny_idle = clkdm_deny_idle,
+	.clkdm_allow_idle = clkdm_allow_idle,
+	.clkdm_lookup = clkdm_lookup,
+};
+
 /*
  * GPIOs for TWL are initialized by the I2C bus and need custom
  * handing until DSS has device tree bindings.
@@ -664,6 +671,11 @@ static struct of_dev_auxdata omap_auxdata_lookup[] = {
 	/* Common auxdata */
 	OF_DEV_AUXDATA("ti,sysc", 0, NULL, &ti_sysc_pdata),
 	OF_DEV_AUXDATA("pinctrl-single", 0, NULL, &pcs_pdata),
+	OF_DEV_AUXDATA("ti,omap4-prm-inst", 0, NULL, &ti_prm_pdata),
+	OF_DEV_AUXDATA("ti,omap5-prm-inst", 0, NULL, &ti_prm_pdata),
+	OF_DEV_AUXDATA("ti,dra7-prm-inst", 0, NULL, &ti_prm_pdata),
+	OF_DEV_AUXDATA("ti,am3-prm-inst", 0, NULL, &ti_prm_pdata),
+	OF_DEV_AUXDATA("ti,am4-prm-inst", 0, NULL, &ti_prm_pdata),
 	{ /* sentinel */ },
 };
 
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
