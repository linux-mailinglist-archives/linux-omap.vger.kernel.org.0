Return-Path: <linux-omap+bounces-697-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F098C85E1C0
	for <lists+linux-omap@lfdr.de>; Wed, 21 Feb 2024 16:46:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80A2DB21031
	for <lists+linux-omap@lfdr.de>; Wed, 21 Feb 2024 15:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E50380BED;
	Wed, 21 Feb 2024 15:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="ioXZiOfN"
X-Original-To: linux-omap@vger.kernel.org
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545E480BE4
	for <linux-omap@vger.kernel.org>; Wed, 21 Feb 2024 15:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708530385; cv=none; b=XgXcNylmdDY7BR0FOo3dIpBrG1oi+/9bueipTatVcRou93uvlANbTxEKOMFYQG3OyGsodkav5iPTwBlaYUSywns7li+6J4AyCXg3tOCMAYdAsYG+8pmOV6V1joEhZQj4Cet3LDe9FkZnLpywnEournN5onXhH2+Duet0KfSJYjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708530385; c=relaxed/simple;
	bh=TOe8zjPnYulZTH03Hkj1594nbNAkHvFV3+PLeXSice4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N3kcXHN3uS0m0kjbx8fh/K+5IFDdtVisyffXdjQOg3WqOjWAcBQMRR2OYij3pPKixRs1hgeQLDrdV5Co1kMkWnUbjl1hmx1070nH+f5cAC6UfNrkUGV78sFic2upsizQC7Q86OJiix5hx1ndPmufY8jgRwSPpFcSWDuopGwgZfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (1024-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=ioXZiOfN; arc=none smtp.client-ip=185.136.65.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20240221154619459e4c72bc0f2bc6cb
        for <linux-omap@vger.kernel.org>;
        Wed, 21 Feb 2024 16:46:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=66R2TQTJzmhGRQe2/ph0wKSL4VXGP/nSxWvviYDEaGk=;
 b=ioXZiOfN1cdfJhj+7xo6z/x4hEwVeW9uBWlVU6fs9zH4J6kRreYRgtR1PxIL/gaAD3RGyE
 JU45GGP0bndeS7fnmaKA/AMn9Tby3unat/I9pzIJ2OHbjlXuuaUmJvS6Z6P77Uvocf2q7hET
 Fwq7F4+GAPh+Gk5c0WuH1rvJd7JUA=;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-omap@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Paul Walmsley <paul@pwsan.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Matthias Michel <matthias.michel@siemens.com>
Subject: [PATCH 2/2] ARM: AM33xx: PRM: Implement REBOOT_COLD
Date: Wed, 21 Feb 2024 16:45:51 +0100
Message-ID: <20240221154614.3549951-2-alexander.sverdlin@siemens.com>
In-Reply-To: <20240221154614.3549951-1-alexander.sverdlin@siemens.com>
References: <20240221154614.3549951-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Historically AM33xx performed warm software reset even though requested
(and default) was REBOOT_COLD. Reflect the de-facto default mode in
/sys/kernel/reboot/mode correctly and implement the real REBOOT_COLD
(if configured explicitly).

Tested-by: Matthias Michel <matthias.michel@siemens.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 arch/arm/mach-omap2/am33xx-restart.c   |  3 ++-
 arch/arm/mach-omap2/board-generic.c    |  6 ++++++
 arch/arm/mach-omap2/prm-regbits-33xx.h |  1 +
 arch/arm/mach-omap2/prm.h              |  1 +
 arch/arm/mach-omap2/prm33xx.c          | 18 ++++++++++++++----
 arch/arm/mach-omap2/prm_common.c       |  6 ++++++
 6 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-omap2/am33xx-restart.c b/arch/arm/mach-omap2/am33xx-restart.c
index ef2f18a56b658..199845f4b12e4 100644
--- a/arch/arm/mach-omap2/am33xx-restart.c
+++ b/arch/arm/mach-omap2/am33xx-restart.c
@@ -18,7 +18,8 @@
  */
 void am33xx_restart(enum reboot_mode mode, const char *cmd)
 {
-	/* TODO: Handle mode and cmd if necessary */
+	/* TODO: Handle cmd if necessary */
+	prm_reboot_mode = mode;
 
 	omap_prm_reset_system();
 }
diff --git a/arch/arm/mach-omap2/board-generic.c b/arch/arm/mach-omap2/board-generic.c
index fde6ccb3df6eb..68e0baad2bbf6 100644
--- a/arch/arm/mach-omap2/board-generic.c
+++ b/arch/arm/mach-omap2/board-generic.c
@@ -246,6 +246,12 @@ DT_MACHINE_START(AM33XX_DT, "Generic AM33XX (Flattened Device Tree)")
 	.init_time	= omap_init_time_of,
 	.dt_compat	= am33xx_boards_compat,
 	.restart	= am33xx_restart,
+	/*
+	 * Historically am33xx supported only REBOOT_WARM even though default
+	 * reboot_mode was REBOOT_COLD. Reflect legacy de-facto behaviour in
+	 * SYSFS.
+	 */
+	.reboot_mode	= REBOOT_WARM,
 MACHINE_END
 #endif
 
diff --git a/arch/arm/mach-omap2/prm-regbits-33xx.h b/arch/arm/mach-omap2/prm-regbits-33xx.h
index 3748c5266ae12..9b97f8c76cd17 100644
--- a/arch/arm/mach-omap2/prm-regbits-33xx.h
+++ b/arch/arm/mach-omap2/prm-regbits-33xx.h
@@ -15,6 +15,7 @@
 #define AM33XX_GFX_MEM_STATEST_MASK			(0x3 << 4)
 #define AM33XX_GLOBAL_WARM_SW_RST_MASK			(1 << 1)
 #define AM33XX_RST_GLOBAL_WARM_SW_MASK			(1 << 0)
+#define AM33XX_RST_GLOBAL_COLD_SW_MASK			(1 << 1)
 #define AM33XX_PRUSS_MEM_ONSTATE_MASK			(0x3 << 5)
 #define AM33XX_PRUSS_MEM_RETSTATE_MASK			(1 << 7)
 #define AM33XX_PRUSS_MEM_STATEST_MASK			(0x3 << 23)
diff --git a/arch/arm/mach-omap2/prm.h b/arch/arm/mach-omap2/prm.h
index fc45a7ed09bb3..fc53a27eed013 100644
--- a/arch/arm/mach-omap2/prm.h
+++ b/arch/arm/mach-omap2/prm.h
@@ -15,6 +15,7 @@
 # ifndef __ASSEMBLER__
 extern struct omap_domain_base prm_base;
 extern u16 prm_features;
+extern enum reboot_mode prm_reboot_mode;
 int omap_prcm_init(void);
 int omap2_prcm_base_init(void);
 # endif
diff --git a/arch/arm/mach-omap2/prm33xx.c b/arch/arm/mach-omap2/prm33xx.c
index 4a462310a4b09..505d685d6792e 100644
--- a/arch/arm/mach-omap2/prm33xx.c
+++ b/arch/arm/mach-omap2/prm33xx.c
@@ -10,6 +10,7 @@
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/reboot.h>
 
 #include "powerdomain.h"
 #include "prm33xx.h"
@@ -318,10 +319,19 @@ static int am33xx_check_vcvp(void)
  *
  * Immediately reboots the device through warm reset.
  */
-static void am33xx_prm_global_warm_sw_reset(void)
+static void am33xx_prm_global_sw_reset(void)
 {
-	am33xx_prm_rmw_reg_bits(AM33XX_RST_GLOBAL_WARM_SW_MASK,
-				AM33XX_RST_GLOBAL_WARM_SW_MASK,
+	/*
+	 * Historically AM33xx performed warm reset for all requested reboot_mode.
+	 * Keep this behaviour unchanged for all except newly added REBOOT_COLD.
+	 */
+	u32 mask = AM33XX_RST_GLOBAL_WARM_SW_MASK;
+
+	if (prm_reboot_mode == REBOOT_COLD)
+		mask = AM33XX_RST_GLOBAL_COLD_SW_MASK;
+
+	am33xx_prm_rmw_reg_bits(mask,
+				mask,
 				AM33XX_PRM_DEVICE_MOD,
 				AM33XX_PRM_RSTCTRL_OFFSET);
 
@@ -382,7 +392,7 @@ static struct prm_ll_data am33xx_prm_ll_data = {
 	.assert_hardreset		= am33xx_prm_assert_hardreset,
 	.deassert_hardreset		= am33xx_prm_deassert_hardreset,
 	.is_hardreset_asserted		= am33xx_prm_is_hardreset_asserted,
-	.reset_system			= am33xx_prm_global_warm_sw_reset,
+	.reset_system			= am33xx_prm_global_sw_reset,
 };
 
 int __init am33xx_prm_init(const struct omap_prcm_init_data *data)
diff --git a/arch/arm/mach-omap2/prm_common.c b/arch/arm/mach-omap2/prm_common.c
index fd896f2295a11..f8771bdb5f068 100644
--- a/arch/arm/mach-omap2/prm_common.c
+++ b/arch/arm/mach-omap2/prm_common.c
@@ -66,6 +66,12 @@ struct omap_domain_base prm_base;
 
 u16 prm_features;
 
+/*
+ * Platforms that implement different reboot modes can store the requested
+ * mode here.
+ */
+enum reboot_mode prm_reboot_mode;
+
 /*
  * prm_ll_data: function pointers to SoC-specific implementations of
  * common PRM functions
-- 
2.43.0


