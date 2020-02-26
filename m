Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB5EB170366
	for <lists+linux-omap@lfdr.de>; Wed, 26 Feb 2020 16:57:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728903AbgBZP5s (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Feb 2020 10:57:48 -0500
Received: from muru.com ([72.249.23.125]:57694 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728897AbgBZP5s (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 26 Feb 2020 10:57:48 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id EDB40819C;
        Wed, 26 Feb 2020 15:58:31 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        kbuild test robot <lkp@intel.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        "Andrew F . Davis" <afd@ti.com>, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Steven Price <steven.price@arm.com>,
        Will Deacon <will@kernel.org>
Subject: [PATCH] ARM: OMAP2+: Fix compile if CONFIG_HAVE_ARM_SMCCC is not set
Date:   Wed, 26 Feb 2020 07:57:44 -0800
Message-Id: <20200226155744.38769-1-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Recent omap changes added runtime checks to use omap_smccc_smc()
when optee is configured in dts. As the omap-secure code can be
built for ARMv6 only without ARMv7 and use custom smc calls, we
now get a build error:

omap-secure.c:(.text+0x94): undefined reference to `__arm_smccc_smc'

As there secure calls are not used for ARMv6, we should not build
secure-common, and not call omap_secure_init() for omap2.

Fixes: c37baa06f8a9 ("ARM: OMAP2+: Fix undefined reference to omap_secure_init")
Reported-by: kbuild test robot <lkp@intel.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Andrew F. Davis <afd@ti.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Steven Price <steven.price@arm.com>
Cc: Will Deacon <will@kernel.org>
Acked-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/Makefile | 2 +-
 arch/arm/mach-omap2/io.c     | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/mach-omap2/Makefile b/arch/arm/mach-omap2/Makefile
--- a/arch/arm/mach-omap2/Makefile
+++ b/arch/arm/mach-omap2/Makefile
@@ -16,7 +16,7 @@ hwmod-common				= omap_hwmod.o omap_hwmod_reset.o \
 clock-common				= clock.o
 secure-common				= omap-smc.o omap-secure.o
 
-obj-$(CONFIG_ARCH_OMAP2) += $(omap-2-3-common) $(hwmod-common) $(secure-common)
+obj-$(CONFIG_ARCH_OMAP2) += $(omap-2-3-common) $(hwmod-common)
 obj-$(CONFIG_ARCH_OMAP3) += $(omap-2-3-common) $(hwmod-common) $(secure-common)
 obj-$(CONFIG_ARCH_OMAP4) += $(hwmod-common) $(secure-common)
 obj-$(CONFIG_SOC_AM33XX) += $(hwmod-common) $(secure-common)
diff --git a/arch/arm/mach-omap2/io.c b/arch/arm/mach-omap2/io.c
--- a/arch/arm/mach-omap2/io.c
+++ b/arch/arm/mach-omap2/io.c
@@ -431,7 +431,6 @@ void __init omap2420_init_early(void)
 	omap_hwmod_init_postsetup();
 	omap_clk_soc_init = omap2420_dt_clk_init;
 	rate_table = omap2420_rate_table;
-	omap_secure_init();
 }
 
 void __init omap2420_init_late(void)
@@ -456,7 +455,6 @@ void __init omap2430_init_early(void)
 	omap_hwmod_init_postsetup();
 	omap_clk_soc_init = omap2430_dt_clk_init;
 	rate_table = omap2430_rate_table;
-	omap_secure_init();
 }
 
 void __init omap2430_init_late(void)
-- 
2.25.1
