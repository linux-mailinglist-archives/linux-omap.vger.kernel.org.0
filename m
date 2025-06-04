Return-Path: <linux-omap+bounces-3764-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C545EACDD29
	for <lists+linux-omap@lfdr.de>; Wed,  4 Jun 2025 13:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F3D83A36F4
	for <lists+linux-omap@lfdr.de>; Wed,  4 Jun 2025 11:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A754A28FA88;
	Wed,  4 Jun 2025 11:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jgsk9207"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B7A28F95A;
	Wed,  4 Jun 2025 11:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749037839; cv=none; b=d1ADzcnJA3Gbp8soeezTBRzAyz8K9O7GIccGKe6sZPoci1Vsrs8x6LZmY67CIaSEbC4OupTmH6oe4rQ61HYMuU7yJeXs58pXlU7K4jTqbu758AqLcR28uxnW9kgk7JKdQbnFIVqMzByPNKSVbocpDVHAyaIuilI2PVhtHxEEblk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749037839; c=relaxed/simple;
	bh=MHb0T8EvRB2rgtEWggawV/NaKnjOHlkVsRie8KiLPrc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iLHoJLiFyoHPqNQTp2HyI981GuJsyVBNh7i+Em9b4oXylvtF2YAGqkACr4He0pzjGiqA1PVsA8vjB5Q+SbdxVChfF/LTE1f+TkW72/WqLlLQkKbd/KRpDo95BBwlqgnKpgCBcyfLjqeJz9l+PEFle9M0Qh1YPSOwQSf8xuSVDkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jgsk9207; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B65C4CEEF;
	Wed,  4 Jun 2025 11:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749037838;
	bh=MHb0T8EvRB2rgtEWggawV/NaKnjOHlkVsRie8KiLPrc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jgsk920717lozvJe/jSfZ98fEgyGvXUwX5FTa9hY1dL3XYukGL6FlgRX5gWJU1VGw
	 e3Y3iqbMXtRyEqEkfVy/HYhG21jqj7vhpP3i69ovKBwHKL12zxCVKp9XfcXE+LuuMG
	 eIsBc/BTldBiyYHPg0z3peFLjEv1p4t5SY2YrJZK68bLap6vKK8RJ0/tTPLPA+fM5G
	 wBRVoRkZ6vUvjk6Vxmumrrs7WvlQXZ+3hmn9mr0RfhJskclstuKjoJzOnKM0CoFbs3
	 WMcKKjn92Fl2LzB+A3MiXiyCcIPKWUr4BKM7IV+uuGX30rsRHrPVcgEQpCNybMFs5M
	 H2jE8LnBcdztg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Sukrut Bellary <sbellary@baylibre.com>,
	Judith Mendez <jm@ti.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Sasha Levin <sashal@kernel.org>,
	paul@pwsan.com,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	rogerq@kernel.org,
	tony@atomide.com,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 3/5] ARM: OMAP2+: Fix l4ls clk domain handling in STANDBY
Date: Wed,  4 Jun 2025 07:50:31 -0400
Message-Id: <20250604115033.209492-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604115033.209492-1-sashal@kernel.org>
References: <20250604115033.209492-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.184
Content-Transfer-Encoding: 8bit

From: Sukrut Bellary <sbellary@baylibre.com>

[ Upstream commit 47fe74098f3dadba2f9cc1e507d813a4aa93f5f3 ]

Don't put the l4ls clk domain to sleep in case of standby.
Since CM3 PM FW[1](ti-v4.1.y) doesn't wake-up/enable the l4ls clk domain
upon wake-up, CM3 PM FW fails to wake-up the MPU.

[1] https://git.ti.com/cgit/processor-firmware/ti-amx3-cm3-pm-firmware/

Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
Tested-by: Judith Mendez <jm@ti.com>
Link: https://lore.kernel.org/r/20250318230042.3138542-2-sbellary@baylibre.com
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees. Here's
my detailed analysis: ## Analysis of the Bug Fix **Critical Power
Management Issue**: This commit fixes a fundamental system hang
condition where the AM33xx SoC cannot resume from standby mode. The l4ls
(L4 Low Speed) clock domain is being incorrectly put to sleep during
standby, which prevents the CM3 PM firmware from communicating with the
MPU to wake it up. ## Code Changes Analysis **1. Minimal and Targeted
Changes**: - Adds a single new flag `CLKDM_STANDBY_FORCE_WAKEUP` in
clockdomain.h - Applies this flag only to the l4ls clock domain in
clockdomains33xx_data.c - Modifies am33xx_clkdm_clk_disable() to check
for standby state and avoid sleeping this specific domain **2.
Conservative Approach**: The fix only prevents the problematic behavior
(putting l4ls to sleep during standby) rather than changing the overall
power management architecture. It follows the existing pattern already
documented in the codebase for similar GFX_L4LS workarounds. **3. Well-
Contained Risk**: - Changes are limited to AM33xx-specific code paths -
No changes to external APIs or device tree bindings - The conditional
check `pm_suspend_target_state == PM_SUSPEND_STANDBY` ensures the change
only affects standby mode ## Backport Justification **Meets Stable Tree
Criteria**: 1. **Important Bug Fix**: Resolves critical system hang
during suspend/resume 2. **Minimal Risk**: Surgical change with very low
regression potential 3. **No New Features**: Pure bug fix with no
architectural changes 4. **Platform-Specific**: Contained to AM33xx
SoCs, no cross-platform impact **High Impact for Users**: This affects
fundamental system reliability for devices using AM335x chips
(BeagleBone, industrial IoT systems). The current bug makes standby mode
unusable, requiring users to avoid this power saving feature entirely.
**Low Regression Risk**: The only potential side effect is marginally
higher standby power consumption from keeping one clock domain awake,
which is acceptable given the critical nature of the fix. This is
exactly the type of targeted, low-risk fix that stable trees are
designed for - addressing a critical functional issue with minimal code
changes and clear benefit to users.

 arch/arm/mach-omap2/clockdomain.h           |  1 +
 arch/arm/mach-omap2/clockdomains33xx_data.c |  2 +-
 arch/arm/mach-omap2/cm33xx.c                | 14 +++++++++++++-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/clockdomain.h b/arch/arm/mach-omap2/clockdomain.h
index 68550b23c938d..eb6ca2ea80679 100644
--- a/arch/arm/mach-omap2/clockdomain.h
+++ b/arch/arm/mach-omap2/clockdomain.h
@@ -48,6 +48,7 @@
 #define CLKDM_NO_AUTODEPS			(1 << 4)
 #define CLKDM_ACTIVE_WITH_MPU			(1 << 5)
 #define CLKDM_MISSING_IDLE_REPORTING		(1 << 6)
+#define CLKDM_STANDBY_FORCE_WAKEUP		BIT(7)
 
 #define CLKDM_CAN_HWSUP		(CLKDM_CAN_ENABLE_AUTO | CLKDM_CAN_DISABLE_AUTO)
 #define CLKDM_CAN_SWSUP		(CLKDM_CAN_FORCE_SLEEP | CLKDM_CAN_FORCE_WAKEUP)
diff --git a/arch/arm/mach-omap2/clockdomains33xx_data.c b/arch/arm/mach-omap2/clockdomains33xx_data.c
index b4d5144df4454..c53df9d42ecf8 100644
--- a/arch/arm/mach-omap2/clockdomains33xx_data.c
+++ b/arch/arm/mach-omap2/clockdomains33xx_data.c
@@ -27,7 +27,7 @@ static struct clockdomain l4ls_am33xx_clkdm = {
 	.pwrdm		= { .name = "per_pwrdm" },
 	.cm_inst	= AM33XX_CM_PER_MOD,
 	.clkdm_offs	= AM33XX_CM_PER_L4LS_CLKSTCTRL_OFFSET,
-	.flags		= CLKDM_CAN_SWSUP,
+	.flags		= CLKDM_CAN_SWSUP | CLKDM_STANDBY_FORCE_WAKEUP,
 };
 
 static struct clockdomain l3s_am33xx_clkdm = {
diff --git a/arch/arm/mach-omap2/cm33xx.c b/arch/arm/mach-omap2/cm33xx.c
index ac4882ebdca33..be84c6750026e 100644
--- a/arch/arm/mach-omap2/cm33xx.c
+++ b/arch/arm/mach-omap2/cm33xx.c
@@ -28,6 +28,9 @@
 #include "cm-regbits-34xx.h"
 #include "cm-regbits-33xx.h"
 #include "prm33xx.h"
+#if IS_ENABLED(CONFIG_SUSPEND)
+#include <linux/suspend.h>
+#endif
 
 /*
  * CLKCTRL_IDLEST_*: possible values for the CM_*_CLKCTRL.IDLEST bitfield:
@@ -336,8 +339,17 @@ static int am33xx_clkdm_clk_disable(struct clockdomain *clkdm)
 {
 	bool hwsup = false;
 
+#if IS_ENABLED(CONFIG_SUSPEND)
+	/*
+	 * In case of standby, Don't put the l4ls clk domain to sleep.
+	 * Since CM3 PM FW doesn't wake-up/enable the l4ls clk domain
+	 * upon wake-up, CM3 PM FW fails to wake-up th MPU.
+	 */
+	if (pm_suspend_target_state == PM_SUSPEND_STANDBY &&
+	    (clkdm->flags & CLKDM_STANDBY_FORCE_WAKEUP))
+		return 0;
+#endif
 	hwsup = am33xx_cm_is_clkdm_in_hwsup(clkdm->cm_inst, clkdm->clkdm_offs);
-
 	if (!hwsup && (clkdm->flags & CLKDM_CAN_FORCE_SLEEP))
 		am33xx_clkdm_sleep(clkdm);
 
-- 
2.39.5


