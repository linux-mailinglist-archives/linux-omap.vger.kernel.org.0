Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA3116861E
	for <lists+linux-omap@lfdr.de>; Fri, 21 Feb 2020 19:09:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgBUSJJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Feb 2020 13:09:09 -0500
Received: from muru.com ([72.249.23.125]:56804 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725995AbgBUSJJ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 21 Feb 2020 13:09:09 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 72836807E;
        Fri, 21 Feb 2020 18:09:52 +0000 (UTC)
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
Date:   Fri, 21 Feb 2020 10:09:01 -0800
Message-Id: <20200221180901.15812-1-tony@atomide.com>
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

Let's just ifdef out omap_smccc_smc() unless the CPU has selected
CONFIG_HAVE_ARM_SMCCC. The other option discussed was to add an
inline function to arm-smccc.h, but we'd still also have to add
ifdef around omap_smccc_smc() to avoid a warning for uninitialized
value for struct arm_smccc_res in omap_smccc_smc(). And we probably
should not start initializing values in arm-smccc.h if disabled.

Let's also warn on trying to use omap_smccc_smc() if disabled as
suggested by Andrew F. Davis <afd@ti.com>.

Fixes: 48840e16c299 ("ARM: OMAP2+: Use ARM SMC Calling Convention when OP-TEE is available")
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
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/omap-secure.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/mach-omap2/omap-secure.c b/arch/arm/mach-omap2/omap-secure.c
--- a/arch/arm/mach-omap2/omap-secure.c
+++ b/arch/arm/mach-omap2/omap-secure.c
@@ -77,6 +77,7 @@ u32 omap_secure_dispatcher(u32 idx, u32 flag, u32 nargs, u32 arg1, u32 arg2,
 	return ret;
 }
 
+#ifdef CONFIG_HAVE_ARM_SMCCC
 void omap_smccc_smc(u32 fn, u32 arg)
 {
 	struct arm_smccc_res res;
@@ -85,6 +86,12 @@ void omap_smccc_smc(u32 fn, u32 arg)
 		      0, 0, 0, 0, 0, 0, &res);
 	WARN(res.a0, "Secure function call 0x%08x failed\n", fn);
 }
+#else
+void omap_smccc_smc(u32 fn, u32 arg)
+{
+	WARN_ONCE(1, "smccc is disabled\n");
+}
+#endif
 
 void omap_smc1(u32 fn, u32 arg)
 {
-- 
2.25.1
