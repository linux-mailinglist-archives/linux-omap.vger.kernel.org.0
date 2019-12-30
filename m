Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E105F12D390
	for <lists+linux-omap@lfdr.de>; Mon, 30 Dec 2019 19:50:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727673AbfL3Sup (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Dec 2019 13:50:45 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:44330 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbfL3Suo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Dec 2019 13:50:44 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBUIogDP033123;
        Mon, 30 Dec 2019 12:50:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1577731842;
        bh=oq06FeNTSrVdnZTZ0YySVTawPG99vf9FqZbFKv4Mw80=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=h9SkhOD6XwQ1f5O6Vv2JTYW0vIhhWhTiu944vPTogW44wholL1bvRjc1PuURidvbi
         O2EzkUmm/vVzgvqEtjwVMlqZQr+QBwL8vJnWPksqr6a/RgtlpUD/e1n1eickymo8k7
         RX7K9ea+AeqQDq3HoOzENyb05MRjf7r1bzpsUmBI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBUIogml048226
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 30 Dec 2019 12:50:42 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 30
 Dec 2019 12:50:42 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 30 Dec 2019 12:50:42 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBUIofMv044153;
        Mon, 30 Dec 2019 12:50:41 -0600
Received: from localhost ([10.250.65.50])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id xBUIofu06990;
        Mon, 30 Dec 2019 12:50:41 -0600 (CST)
From:   "Andrew F. Davis" <afd@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Andrew F . Davis" <afd@ti.com>
Subject: [PATCH v3 3/4] ARM: OMAP2+: Use ARM SMC Calling Convention when OP-TEE is available
Date:   Mon, 30 Dec 2019 13:50:03 -0500
Message-ID: <20191230185004.32279-4-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191230185004.32279-1-afd@ti.com>
References: <20191230185004.32279-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On High-Security(HS) OMAP2+ class devices a couple actions must be
performed from the ARM TrustZone during boot. These traditionally can be
performed by calling into the secure ROM code resident in this secure
world using legacy SMC calls. Optionally OP-TEE can replace this secure
world functionality by replacing the ROM after boot. ARM recommends a
standard calling convention is used for this interaction (SMC Calling
Convention). We check for the presence of OP-TEE and use this type of
call to perform the needed actions, falling back to the legacy OMAP ROM
call if OP-TEE is not available.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 arch/arm/mach-omap2/common.h      |  2 +-
 arch/arm/mach-omap2/omap-secure.c | 27 +++++++++++++++++++++++++++
 arch/arm/mach-omap2/omap-secure.h |  2 ++
 arch/arm/mach-omap2/omap-smc.S    |  6 +++---
 4 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-omap2/common.h b/arch/arm/mach-omap2/common.h
index 223b37c48389..3b1fd8e7d705 100644
--- a/arch/arm/mach-omap2/common.h
+++ b/arch/arm/mach-omap2/common.h
@@ -255,7 +255,7 @@ extern void gic_dist_disable(void);
 extern void gic_dist_enable(void);
 extern bool gic_dist_disabled(void);
 extern void gic_timer_retrigger(void);
-extern void omap_smc1(u32 fn, u32 arg);
+extern void _omap_smc1(u32 fn, u32 arg);
 extern void omap4_sar_ram_init(void);
 extern void __iomem *omap4_get_sar_ram_base(void);
 extern void omap4_mpuss_early_init(void);
diff --git a/arch/arm/mach-omap2/omap-secure.c b/arch/arm/mach-omap2/omap-secure.c
index 39d8070aede6..3a09d860c7a9 100644
--- a/arch/arm/mach-omap2/omap-secure.c
+++ b/arch/arm/mach-omap2/omap-secure.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2013 Pali Rohár <pali.rohar@gmail.com>
  */
 
+#include <linux/arm-smccc.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -17,12 +18,17 @@
 #include <asm/cacheflush.h>
 #include <asm/memblock.h>
 
+#include "common.h"
 #include "omap-secure.h"
 
 static phys_addr_t omap_secure_memblock_base;
 
 bool optee_available;
 
+#define OMAP_SIP_SMC_STD_CALL_VAL(func_num) \
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_STD_CALL, ARM_SMCCC_SMC_32, \
+	ARM_SMCCC_OWNER_SIP, (func_num))
+
 static void __init omap_optee_init_check(void)
 {
 	struct device_node *np;
@@ -66,6 +72,27 @@ u32 omap_secure_dispatcher(u32 idx, u32 flag, u32 nargs, u32 arg1, u32 arg2,
 	return ret;
 }
 
+void omap_smccc_smc(u32 fn, u32 arg)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(OMAP_SIP_SMC_STD_CALL_VAL(fn), arg,
+		      0, 0, 0, 0, 0, 0, &res);
+	WARN(res.a0, "Secure function call 0x%08x failed\n", fn);
+}
+
+void omap_smc1(u32 fn, u32 arg)
+{
+	/*
+	 * If this platform has OP-TEE installed we use ARM SMC calls
+	 * otherwise fall back to the OMAP ROM style calls.
+	 */
+	if (optee_available)
+		omap_smccc_smc(fn, arg);
+	else
+		_omap_smc1(fn, arg);
+}
+
 /* Allocate the memory to save secure ram */
 int __init omap_secure_ram_reserve_memblock(void)
 {
diff --git a/arch/arm/mach-omap2/omap-secure.h b/arch/arm/mach-omap2/omap-secure.h
index 78a1c4f04bbe..736e594365f4 100644
--- a/arch/arm/mach-omap2/omap-secure.h
+++ b/arch/arm/mach-omap2/omap-secure.h
@@ -62,6 +62,8 @@
 
 extern u32 omap_secure_dispatcher(u32 idx, u32 flag, u32 nargs,
 				u32 arg1, u32 arg2, u32 arg3, u32 arg4);
+extern void omap_smccc_smc(u32 fn, u32 arg);
+extern void omap_smc1(u32 fn, u32 arg);
 extern u32 omap_smc2(u32 id, u32 falg, u32 pargs);
 extern u32 omap_smc3(u32 id, u32 process, u32 flag, u32 pargs);
 extern phys_addr_t omap_secure_ram_mempool_base(void);
diff --git a/arch/arm/mach-omap2/omap-smc.S b/arch/arm/mach-omap2/omap-smc.S
index fd2bcd91f4a1..d4832845a4e8 100644
--- a/arch/arm/mach-omap2/omap-smc.S
+++ b/arch/arm/mach-omap2/omap-smc.S
@@ -18,18 +18,18 @@
  * the monitor API number. It uses few CPU registers
  * internally and hence they need be backed up including
  * link register "lr".
- * Function signature : void omap_smc1(u32 fn, u32 arg)
+ * Function signature : void _omap_smc1(u32 fn, u32 arg)
  */
 	.arch armv7-a
 	.arch_extension sec
-ENTRY(omap_smc1)
+ENTRY(_omap_smc1)
 	stmfd   sp!, {r2-r12, lr}
 	mov	r12, r0
 	mov 	r0, r1
 	dsb
 	smc	#0
 	ldmfd   sp!, {r2-r12, pc}
-ENDPROC(omap_smc1)
+ENDPROC(_omap_smc1)
 
 /**
  * u32 omap_smc2(u32 id, u32 falg, u32 pargs)
-- 
2.17.1

