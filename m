Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D748275157
	for <lists+linux-omap@lfdr.de>; Wed, 23 Sep 2020 08:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgIWGW6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 23 Sep 2020 02:22:58 -0400
Received: from muru.com ([72.249.23.125]:45072 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726448AbgIWGW6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 23 Sep 2020 02:22:58 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 8AF0B80C1;
        Wed, 23 Sep 2020 06:23:00 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: OMAP2+: Restore MPU power domain if cpu_cluster_pm_enter() fails
Date:   Wed, 23 Sep 2020 09:22:53 +0300
Message-Id: <20200923062253.43095-1-tony@atomide.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

If cpu_cluster_pm_enter() fails, we need to set MPU power domain back
to enabled to prevent the next WFI from potentially triggering an
undesired MPU power domain state change.

We already do this for omap_enter_idle_smp() but are missing it for
omap_enter_idle_coupled().

Fixes: 55be2f50336f ("ARM: OMAP2+: Handle errors for cpu_pm")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/cpuidle44xx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/cpuidle44xx.c b/arch/arm/mach-omap2/cpuidle44xx.c
--- a/arch/arm/mach-omap2/cpuidle44xx.c
+++ b/arch/arm/mach-omap2/cpuidle44xx.c
@@ -174,8 +174,10 @@ static int omap_enter_idle_coupled(struct cpuidle_device *dev,
 		 */
 		if (mpuss_can_lose_context) {
 			error = cpu_cluster_pm_enter();
-			if (error)
+			if (error) {
+				omap_set_pwrdm_state(mpu_pd, PWRDM_POWER_ON);
 				goto cpu_cluster_pm_out;
+			}
 		}
 	}
 
-- 
2.28.0
