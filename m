Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 315E929D8C2
	for <lists+linux-omap@lfdr.de>; Wed, 28 Oct 2020 23:36:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388337AbgJ1WgN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Oct 2020 18:36:13 -0400
Received: from muru.com ([72.249.23.125]:47076 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388458AbgJ1Wdx (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Oct 2020 18:33:53 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 147A3807E;
        Wed, 28 Oct 2020 06:05:06 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: OMAP2+: Manage MPU state properly for omap_enter_idle_coupled()
Date:   Wed, 28 Oct 2020 08:04:57 +0200
Message-Id: <20201028060457.55899-1-tony@atomide.com>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Based on more testing, commit 8ca5ee624b4c ("ARM: OMAP2+: Restore MPU
power domain if cpu_cluster_pm_enter() fails") is a poor fix for handling
cpu_cluster_pm_enter() returned errors.

We should not override the cpuidle states with a hardcoded PWRDM_POWER_ON
value. Instead, we should use a configured idle state that does not cause
the context to be lost. Otherwise we end up configuring a potentially
improper state for the MPUSS. We also want to update the returned state
index for the selected state.

Let's just select the highest power idle state C1 to ensure no context
loss is allowed on cpu_cluster_pm_enter() errors. With these changes we
can now unconditionally call omap4_enter_lowpower() for WFI like we did
earlier before commit 55be2f50336f ("ARM: OMAP2+: Handle errors for
cpu_pm"). And we can return the selected state index.

Fixes: 8ca5ee624b4c ("ARM: OMAP2+: Restore MPU power domain if cpu_cluster_pm_enter() fails")
Fixes: 55be2f50336f ("ARM: OMAP2+: Handle errors for cpu_pm")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/cpuidle44xx.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-omap2/cpuidle44xx.c b/arch/arm/mach-omap2/cpuidle44xx.c
--- a/arch/arm/mach-omap2/cpuidle44xx.c
+++ b/arch/arm/mach-omap2/cpuidle44xx.c
@@ -175,8 +175,11 @@ static int omap_enter_idle_coupled(struct cpuidle_device *dev,
 		if (mpuss_can_lose_context) {
 			error = cpu_cluster_pm_enter();
 			if (error) {
-				omap_set_pwrdm_state(mpu_pd, PWRDM_POWER_ON);
-				goto cpu_cluster_pm_out;
+				index = 0;
+				cx = state_ptr + index;
+				pwrdm_set_logic_retst(mpu_pd, cx->mpu_logic_state);
+				omap_set_pwrdm_state(mpu_pd, cx->mpu_state);
+				mpuss_can_lose_context = 0;
 			}
 		}
 	}
@@ -184,7 +187,6 @@ static int omap_enter_idle_coupled(struct cpuidle_device *dev,
 	omap4_enter_lowpower(dev->cpu, cx->cpu_state);
 	cpu_done[dev->cpu] = true;
 
-cpu_cluster_pm_out:
 	/* Wakeup CPU1 only if it is not offlined */
 	if (dev->cpu == 0 && cpumask_test_cpu(1, cpu_online_mask)) {
 
-- 
2.29.1
