Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC0BF123B16
	for <lists+linux-omap@lfdr.de>; Wed, 18 Dec 2019 00:48:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbfLQXrt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Dec 2019 18:47:49 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:52394 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfLQXrt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 17 Dec 2019 18:47:49 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHNllFL031994;
        Tue, 17 Dec 2019 17:47:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576626467;
        bh=K/zgbiWOtXqQ9vevxL61UQfd+KZVNoS3lO85fhB6OJY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=r/1lkVaJvrVCrV4y6xHvKJBnNBzNvxKhBXrXUrbjGZb1+XDWjEv3PuTh0jhkRux2Z
         oMJv0mXtdtHMqlHWEJum/EePHEeNgFxDw/ROtYC3ojxE3W+rxjSphQTF587J/uuRUn
         /lZQghrdiQHk/uof6OLELjtTdsejE7yyU2Oydc1M=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBHNllm4047816
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Dec 2019 17:47:47 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 17:47:47 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Dec 2019 17:47:47 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHNllGh126881;
        Tue, 17 Dec 2019 17:47:47 -0600
Received: from localhost ([10.250.79.55])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id xBHNlku27112;
        Tue, 17 Dec 2019 17:47:46 -0600 (CST)
From:   "Andrew F. Davis" <afd@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Andrew F . Davis" <afd@ti.com>
Subject: [PATCH v2 1/3] ARM: OMAP2+: Add omap_secure_init callback hook for secure initialization
Date:   Tue, 17 Dec 2019 18:47:43 -0500
Message-ID: <20191217234745.4434-2-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217234745.4434-1-afd@ti.com>
References: <20191217234745.4434-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This can be used for detecting secure features or making early device
init sequence changes based on device security type.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 arch/arm/mach-omap2/io.c          | 11 +++++++++++
 arch/arm/mach-omap2/omap-secure.c |  4 ++++
 arch/arm/mach-omap2/omap-secure.h |  2 ++
 3 files changed, 17 insertions(+)

diff --git a/arch/arm/mach-omap2/io.c b/arch/arm/mach-omap2/io.c
index 349e48042982..f28047233665 100644
--- a/arch/arm/mach-omap2/io.c
+++ b/arch/arm/mach-omap2/io.c
@@ -51,6 +51,7 @@
 #include "prm33xx.h"
 #include "prm44xx.h"
 #include "opp2xxx.h"
+#include "omap-secure.h"
 
 /*
  * omap_clk_soc_init: points to a function that does the SoC-specific
@@ -430,6 +431,7 @@ void __init omap2420_init_early(void)
 	omap_hwmod_init_postsetup();
 	omap_clk_soc_init = omap2420_dt_clk_init;
 	rate_table = omap2420_rate_table;
+	omap_secure_init();
 }
 
 void __init omap2420_init_late(void)
@@ -454,6 +456,7 @@ void __init omap2430_init_early(void)
 	omap_hwmod_init_postsetup();
 	omap_clk_soc_init = omap2430_dt_clk_init;
 	rate_table = omap2430_rate_table;
+	omap_secure_init();
 }
 
 void __init omap2430_init_late(void)
@@ -481,6 +484,7 @@ void __init omap3_init_early(void)
 	omap3xxx_clockdomains_init();
 	omap3xxx_hwmod_init();
 	omap_hwmod_init_postsetup();
+	omap_secure_init();
 }
 
 void __init omap3430_init_early(void)
@@ -533,6 +537,7 @@ void __init ti814x_init_early(void)
 	dm814x_hwmod_init();
 	omap_hwmod_init_postsetup();
 	omap_clk_soc_init = dm814x_dt_clk_init;
+	omap_secure_init();
 }
 
 void __init ti816x_init_early(void)
@@ -549,6 +554,7 @@ void __init ti816x_init_early(void)
 	dm816x_hwmod_init();
 	omap_hwmod_init_postsetup();
 	omap_clk_soc_init = dm816x_dt_clk_init;
+	omap_secure_init();
 }
 #endif
 
@@ -566,6 +572,7 @@ void __init am33xx_init_early(void)
 	am33xx_hwmod_init();
 	omap_hwmod_init_postsetup();
 	omap_clk_soc_init = am33xx_dt_clk_init;
+	omap_secure_init();
 }
 
 void __init am33xx_init_late(void)
@@ -589,6 +596,7 @@ void __init am43xx_init_early(void)
 	omap_hwmod_init_postsetup();
 	omap_l2_cache_init();
 	omap_clk_soc_init = am43xx_dt_clk_init;
+	omap_secure_init();
 }
 
 void __init am43xx_init_late(void)
@@ -617,6 +625,7 @@ void __init omap4430_init_early(void)
 	omap_hwmod_init_postsetup();
 	omap_l2_cache_init();
 	omap_clk_soc_init = omap4xxx_dt_clk_init;
+	omap_secure_init();
 }
 
 void __init omap4430_init_late(void)
@@ -643,6 +652,7 @@ void __init omap5_init_early(void)
 	omap54xx_hwmod_init();
 	omap_hwmod_init_postsetup();
 	omap_clk_soc_init = omap5xxx_dt_clk_init;
+	omap_secure_init();
 }
 
 void __init omap5_init_late(void)
@@ -666,6 +676,7 @@ void __init dra7xx_init_early(void)
 	dra7xx_hwmod_init();
 	omap_hwmod_init_postsetup();
 	omap_clk_soc_init = dra7xx_dt_clk_init;
+	omap_secure_init();
 }
 
 void __init dra7xx_init_late(void)
diff --git a/arch/arm/mach-omap2/omap-secure.c b/arch/arm/mach-omap2/omap-secure.c
index 24298e47b9f1..e936732cdc4f 100644
--- a/arch/arm/mach-omap2/omap-secure.c
+++ b/arch/arm/mach-omap2/omap-secure.c
@@ -163,3 +163,7 @@ u32 rx51_secure_rng_call(u32 ptr, u32 count, u32 flag)
 				      NO_FLAG,
 				      3, ptr, count, flag, 0);
 }
+
+void __init omap_secure_init(void)
+{
+}
diff --git a/arch/arm/mach-omap2/omap-secure.h b/arch/arm/mach-omap2/omap-secure.h
index 20046e8f8ecb..9aeeb236a224 100644
--- a/arch/arm/mach-omap2/omap-secure.h
+++ b/arch/arm/mach-omap2/omap-secure.h
@@ -72,6 +72,8 @@ extern u32 rx51_secure_dispatcher(u32 idx, u32 process, u32 flag, u32 nargs,
 extern u32 rx51_secure_update_aux_cr(u32 set_bits, u32 clear_bits);
 extern u32 rx51_secure_rng_call(u32 ptr, u32 count, u32 flag);
 
+void omap_secure_init(void);
+
 #ifdef CONFIG_SOC_HAS_REALTIME_COUNTER
 void set_cntfreq(void);
 #else
-- 
2.17.1

