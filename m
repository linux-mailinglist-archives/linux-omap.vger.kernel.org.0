Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC33DF15C5
	for <lists+linux-omap@lfdr.de>; Wed,  6 Nov 2019 13:06:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730784AbfKFMGL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Nov 2019 07:06:11 -0500
Received: from imap1.codethink.co.uk ([176.9.8.82]:46741 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728550AbfKFMGL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 6 Nov 2019 07:06:11 -0500
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iSK4c-0000dA-9S; Wed, 06 Nov 2019 12:06:06 +0000
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.3)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iSK4b-00031O-QP; Wed, 06 Nov 2019 12:06:05 +0000
From:   "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
To:     linux-kernel@lists.codethink.co.uk
Cc:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] OMAP2: remove unused wakeup_cpu
Date:   Wed,  6 Nov 2019 12:06:05 +0000
Message-Id: <20191106120605.11571-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The wakeup_cpu variable in omap4_enter_lowpower() is set
but then is not used after this. Remove it to fix
the compiler warning:

arch/arm/mach-omap2/omap-mpuss-lowpower.c: In function âomap4_enter_lowpowerâ:
arch/arm/mach-omap2/omap-mpuss-lowpower.c:230:15: warning: variable âwakeup_cpuâ set but not used [-Wunused-but-set-variable]

Signed-off-by: Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>
---
Cc: Tony Lindgren <tony@atomide.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-omap@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/mach-omap2/omap-mpuss-lowpower.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/mach-omap2/omap-mpuss-lowpower.c b/arch/arm/mach-omap2/omap-mpuss-lowpower.c
index 2d8f90546591..67fa28532a3a 100644
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
2.24.0.rc1

