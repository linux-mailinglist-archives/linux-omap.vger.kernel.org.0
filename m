Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5293712EB3B
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2020 22:20:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbgABVTv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jan 2020 16:19:51 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:58378 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbgABVTt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Jan 2020 16:19:49 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 002LJkbR068800;
        Thu, 2 Jan 2020 15:19:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1577999986;
        bh=MEYDDz3kDFgKwoWQU27rEOnLkTFwKXkJqwP7W8tF1+Y=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=QnAwfNAmtvQLrLQVAHz0G80U1etfypY1PzoCD14NvV0ddIqLW+KUqTCWzdKCBywLd
         zDRjhsR6xHbHfKTGqRC2+zBVDAQkxOzjTg5Cl7hIOoaZI7uQpumDID/7hBZinTAWKy
         WxRkKxu27hGyaJJ66JuVeIroKHwzUbweVef4zmBQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 002LJkqF025659
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 2 Jan 2020 15:19:46 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 2 Jan
 2020 15:19:46 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 2 Jan 2020 15:19:46 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 002LJjXg038052;
        Thu, 2 Jan 2020 15:19:46 -0600
Received: from localhost ([10.250.65.50])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id 002LJju04884;
        Thu, 2 Jan 2020 15:19:45 -0600 (CST)
From:   "Andrew F. Davis" <afd@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Lokesh Vutla <lokeshvutla@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Andrew F . Davis" <afd@ti.com>
Subject: [PATCH v4 2/4] ARM: OMAP2+: Introduce check for OP-TEE in omap_secure_init()
Date:   Thu, 2 Jan 2020 16:19:41 -0500
Message-ID: <20200102211943.20480-3-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200102211943.20480-1-afd@ti.com>
References: <20200102211943.20480-1-afd@ti.com>
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
 arch/arm/mach-omap2/omap-secure.c | 19 +++++++++++++++++++
 arch/arm/mach-omap2/omap-secure.h |  3 +++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm/mach-omap2/omap-secure.c b/arch/arm/mach-omap2/omap-secure.c
index e936732cdc4f..568646660081 100644
--- a/arch/arm/mach-omap2/omap-secure.c
+++ b/arch/arm/mach-omap2/omap-secure.c
@@ -12,6 +12,7 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/memblock.h>
+#include <linux/of.h>
 
 #include <asm/cacheflush.h>
 #include <asm/memblock.h>
@@ -20,6 +21,23 @@
 
 static phys_addr_t omap_secure_memblock_base;
 
+bool optee_available;
+
+static void __init omap_optee_init_check(void)
+{
+	struct device_node *np;
+
+	/*
+	 * We only check that the OP-TEE node is present and available. The
+	 * OP-TEE kernel driver is not needed for the type of interaction made
+	 * with OP-TEE here so the driver's status is not checked.
+	 */
+	np = of_find_node_by_path("/firmware/optee");
+	if (np && of_device_is_available(np))
+		optee_available = true;
+	of_node_put(np);
+}
+
 /**
  * omap_sec_dispatcher: Routine to dispatch low power secure
  * service routines
@@ -166,4 +184,5 @@ u32 rx51_secure_rng_call(u32 ptr, u32 count, u32 flag)
 
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

