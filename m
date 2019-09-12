Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50AFDB0E11
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2019 13:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731428AbfILLjx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Sep 2019 07:39:53 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:48336 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731375AbfILLjx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Sep 2019 07:39:53 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CBdkfr116608;
        Thu, 12 Sep 2019 06:39:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568288386;
        bh=YLleoDeFe+/39hjFYAaiNlP+EU5/AACmJxmEmj1xr2o=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=UKfYta98/Cb+jehL2iHDW+IaIaAYBTcg4S3XxUVBitRtIWUsnJQnZAArtgGPcKQO+
         ogYND/kzWQKNLTTVX/Z9pGz8K1AwX0DfdvS+YZtE55gzMIg8ztgscClffOxcasqJt3
         HQ+iNT6ltMRrf2zVNxm/PMfXKqZ8J02UIVkBW+2g=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8CBdkwk050898
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Sep 2019 06:39:46 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 12
 Sep 2019 06:39:46 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 12 Sep 2019 06:39:46 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CBdKd1120606;
        Thu, 12 Sep 2019 06:39:44 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <ssantosh@kernel.org>,
        <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <tony@atomide.com>,
        <s-anna@ti.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCHv5 10/10] ARM: OMAP2+: pdata-quirks: add PRM data for reset support
Date:   Thu, 12 Sep 2019 14:39:16 +0300
Message-ID: <20190912113916.20093-11-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190912113916.20093-1-t-kristo@ti.com>
References: <20190912113916.20093-1-t-kristo@ti.com>
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
