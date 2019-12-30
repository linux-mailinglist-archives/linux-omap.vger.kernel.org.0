Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0D6F12D38E
	for <lists+linux-omap@lfdr.de>; Mon, 30 Dec 2019 19:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727655AbfL3Suk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Dec 2019 13:50:40 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58020 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbfL3Suk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Dec 2019 13:50:40 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBUIoarO095142;
        Mon, 30 Dec 2019 12:50:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1577731836;
        bh=U05d7LZJRVvEL3Gttj/8aeTMezf1Mq8fFt4LuuHqwLw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=SYFhu2ft7Mk0MJfNHZDwVj6D9txz1/6AklixZLRr61JD2XpeONiIDqMlPVwREzIQQ
         S/LBefj9RpCYrXTeNEYmv5UkRdDT7SwXfFZ+5e9sW76WZ4XEE+w1xTAsy6f+VeQRPQ
         pX0zcy6SK3Oc/qbrzLxttw6Qc9sNxii59kQ9t7SI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBUIoaYP047995
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 30 Dec 2019 12:50:36 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 30
 Dec 2019 12:50:36 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 30 Dec 2019 12:50:36 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBUIoarN043929;
        Mon, 30 Dec 2019 12:50:36 -0600
Received: from localhost ([10.250.65.50])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id xBUIoZu06881;
        Mon, 30 Dec 2019 12:50:35 -0600 (CST)
From:   "Andrew F. Davis" <afd@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Andrew F . Davis" <afd@ti.com>
Subject: [PATCH v3 2/4] ARM: OMAP2+: Introduce check for OP-TEE in omap_secure_init()
Date:   Mon, 30 Dec 2019 13:50:02 -0500
Message-ID: <20191230185004.32279-3-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191230185004.32279-1-afd@ti.com>
References: <20191230185004.32279-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This check and associated flag can be used to signal the presence
of OP-TEE on the platform. This can be used to determine which
SMC calls to make to perform secure operations.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 arch/arm/mach-omap2/omap-secure.c | 14 ++++++++++++++
 arch/arm/mach-omap2/omap-secure.h |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm/mach-omap2/omap-secure.c b/arch/arm/mach-omap2/omap-secure.c
index e936732cdc4f..39d8070aede6 100644
--- a/arch/arm/mach-omap2/omap-secure.c
+++ b/arch/arm/mach-omap2/omap-secure.c
@@ -12,6 +12,7 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/memblock.h>
+#include <linux/of.h>
 
 #include <asm/cacheflush.h>
 #include <asm/memblock.h>
@@ -20,6 +21,18 @@
 
 static phys_addr_t omap_secure_memblock_base;
 
+bool optee_available;
+
+static void __init omap_optee_init_check(void)
+{
+	struct device_node *np;
+
+	np = of_find_node_by_path("/firmware/optee");
+	if (np && of_device_is_available(np))
+		optee_available = true;
+	of_node_put(np);
+}
+
 /**
  * omap_sec_dispatcher: Routine to dispatch low power secure
  * service routines
@@ -166,4 +179,5 @@ u32 rx51_secure_rng_call(u32 ptr, u32 count, u32 flag)
 
 void __init omap_secure_init(void)
 {
+	omap_optee_init_check();
 }
diff --git a/arch/arm/mach-omap2/omap-secure.h b/arch/arm/mach-omap2/omap-secure.h
index 9aeeb236a224..78a1c4f04bbe 100644
--- a/arch/arm/mach-omap2/omap-secure.h
+++ b/arch/arm/mach-omap2/omap-secure.h
@@ -10,6 +10,8 @@
 #ifndef OMAP_ARCH_OMAP_SECURE_H
 #define OMAP_ARCH_OMAP_SECURE_H
 
+#include <linux/types.h>
+
 /* Monitor error code */
 #define  API_HAL_RET_VALUE_NS2S_CONVERSION_ERROR	0xFFFFFFFE
 #define  API_HAL_RET_VALUE_SERVICE_UNKNWON		0xFFFFFFFF
@@ -72,6 +74,7 @@ extern u32 rx51_secure_dispatcher(u32 idx, u32 process, u32 flag, u32 nargs,
 extern u32 rx51_secure_update_aux_cr(u32 set_bits, u32 clear_bits);
 extern u32 rx51_secure_rng_call(u32 ptr, u32 count, u32 flag);
 
+extern bool optee_available;
 void omap_secure_init(void);
 
 #ifdef CONFIG_SOC_HAS_REALTIME_COUNTER
-- 
2.17.1

