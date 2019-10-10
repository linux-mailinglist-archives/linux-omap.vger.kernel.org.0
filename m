Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9002D1D2F
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 02:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731166AbfJJAM3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 20:12:29 -0400
Received: from muru.com ([72.249.23.125]:36726 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730815AbfJJAM3 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 9 Oct 2019 20:12:29 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9C4348162;
        Thu, 10 Oct 2019 00:13:02 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 1/8] ARM: OMAP2+: Remove unused wakeup_cpu
Date:   Wed,  9 Oct 2019 17:12:17 -0700
Message-Id: <20191010001224.41826-2-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191010001224.41826-1-tony@atomide.com>
References: <20191010001224.41826-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

After commit 32d174ed1bd7 ("ARM: OMAP4: MPUSS PM: remove unnecessary
shim functions for powerdomain control") this is no longer used.

The code continues execution after context restore on the same CPU,
so we can just use pm_info->pwrdm.

Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/omap-mpuss-lowpower.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/mach-omap2/omap-mpuss-lowpower.c b/arch/arm/mach-omap2/omap-mpuss-lowpower.c
--- a/arch/arm/mach-omap2/omap-mpuss-lowpower.c
+++ b/arch/arm/mach-omap2/omap-mpuss-lowpower.c
@@ -227,7 +227,6 @@ int omap4_enter_lowpower(unsigned int cpu, unsigned int power_state)
 {
 	struct omap4_cpu_pm_info *pm_info = &per_cpu(omap4_pm_info, cpu);
 	unsigned int save_state = 0, cpu_logic_state = PWRDM_POWER_RET;
-	unsigned int wakeup_cpu;
 
 	if (omap_rev() == OMAP4430_REV_ES1_0)
 		return -ENXIO;
@@ -292,7 +291,6 @@ int omap4_enter_lowpower(unsigned int cpu, unsigned int power_state)
 	 * secure devices, CPUx does WFI which can result in
 	 * domain transition
 	 */
-	wakeup_cpu = smp_processor_id();
 	pwrdm_set_next_pwrst(pm_info->pwrdm, PWRDM_POWER_ON);
 
 	pwrdm_post_transition(NULL);
-- 
2.23.0
