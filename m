Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 246E21009BB
	for <lists+linux-omap@lfdr.de>; Mon, 18 Nov 2019 17:52:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbfKRQwp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Nov 2019 11:52:45 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:47976 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfKRQwo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 Nov 2019 11:52:44 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAIGqfrj027838;
        Mon, 18 Nov 2019 10:52:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574095961;
        bh=T0jwubZARFh2P0HEYYSKFxEnV3oeuSI/NoPWSUEdeEw=;
        h=From:To:CC:Subject:Date;
        b=CTxmilHg2Y/SUfRPI+iiv2HCRd/685wEn4QkP2eQqBNvpbXIl9jR9NiHKADN7F3Wx
         DwYLbmy0q0ESN6Q7HmIfGQBK+F0NEu9OJss7V4U8MuoCVVPSndIXX0VfWrOQ+1gbBg
         EFRHF6VMFbxiRt5ueYKi4/J1QlvY3/1cYsjXTDj0=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAIGqfEe063485
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 18 Nov 2019 10:52:41 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 18
 Nov 2019 10:52:41 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 18 Nov 2019 10:52:41 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAIGqfdt102820;
        Mon, 18 Nov 2019 10:52:41 -0600
Received: from localhost ([10.250.45.147])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id xAIGqeu07617;
        Mon, 18 Nov 2019 10:52:40 -0600 (CST)
From:   "Andrew F. Davis" <afd@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Andrew F . Davis" <afd@ti.com>
Subject: [PATCH] ARM: OMAP: Use ARM SMC Calling Convention when OP-TEE is available
Date:   Mon, 18 Nov 2019 11:52:36 -0500
Message-ID: <20191118165236.22136-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On High-Security(HS) OMAP2+ class devices a couple actions must be performed
from the ARM TrustZone during boot. These traditionally can be performed by
calling into the secure ROM code resident in this secure world using legacy
SMC calls. Optionally OP-TEE can replace this secure world functionality by
replacing the ROM after boot. ARM recommends a standard calling convention
is used for this interaction (SMC Calling Convention). We check DT for the
presence of OP-TEE and use this type of call to perform the needed actions,
falling back to the legacy OMAP ROM call if OP-TEE is not available.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 arch/arm/mach-omap2/common.h      |  2 +-
 arch/arm/mach-omap2/omap-secure.c | 27 ++++++++++++++++++++++++++-
 arch/arm/mach-omap2/omap-secure.h |  1 +
 arch/arm/mach-omap2/omap-smc.S    |  6 +++---
 4 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-omap2/common.h b/arch/arm/mach-omap2/common.h
index 6316da3623b3..ffcc580aef01 100644
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
index 24298e47b9f1..a2df3cb74bc3 100644
--- a/arch/arm/mach-omap2/omap-secure.c
+++ b/arch/arm/mach-omap2/omap-secure.c
@@ -12,10 +12,12 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/memblock.h>
-
+#include <linux/of.h>
+#include <linux/arm-smccc.h>
 #include <asm/cacheflush.h>
 #include <asm/memblock.h>
 
+#include "common.h"
 #include "omap-secure.h"
 
 static phys_addr_t omap_secure_memblock_base;
@@ -53,6 +55,29 @@ u32 omap_secure_dispatcher(u32 idx, u32 flag, u32 nargs, u32 arg1, u32 arg2,
 	return ret;
 }
 
+#define OMAP_SIP_SMC_STD_CALL_VAL(func_num) \
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_STD_CALL, ARM_SMCCC_SMC_32, \
+	ARM_SMCCC_OWNER_SIP, (func_num))
+
+void omap_smc1(u32 fn, u32 arg)
+{
+	struct device_node *optee;
+	struct arm_smccc_res res;
+
+	/*
+	 * If this platform has OP-TEE installed we use ARM SMC calls
+	 * otherwise fall back to the OMAP ROM style calls.
+	 */
+	optee = of_find_node_by_path("/firmware/optee");
+	if (optee) {
+		arm_smccc_smc(OMAP_SIP_SMC_STD_CALL_VAL(fn), arg,
+			      0, 0, 0, 0, 0, 0, &res);
+		WARN(res.a0, "Secure function call 0x%08x failed\n", fn);
+	} else {
+		_omap_smc1(fn, arg);
+	}
+}
+
 /* Allocate the memory to save secure ram */
 int __init omap_secure_ram_reserve_memblock(void)
 {
diff --git a/arch/arm/mach-omap2/omap-secure.h b/arch/arm/mach-omap2/omap-secure.h
index 20046e8f8ecb..601d64b2c744 100644
--- a/arch/arm/mach-omap2/omap-secure.h
+++ b/arch/arm/mach-omap2/omap-secure.h
@@ -60,6 +60,7 @@
 
 extern u32 omap_secure_dispatcher(u32 idx, u32 flag, u32 nargs,
 				u32 arg1, u32 arg2, u32 arg3, u32 arg4);
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

