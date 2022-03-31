Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 160F84EDF83
	for <lists+linux-omap@lfdr.de>; Thu, 31 Mar 2022 19:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230238AbiCaRTk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 31 Mar 2022 13:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbiCaRTj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 31 Mar 2022 13:19:39 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1C3F339830
        for <linux-omap@vger.kernel.org>; Thu, 31 Mar 2022 10:17:44 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D744F80DB;
        Thu, 31 Mar 2022 17:15:33 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCHv2] ARM: OMAP2+: Fix regression for smc calls for vmap stack
Date:   Thu, 31 Mar 2022 20:17:37 +0300
Message-Id: <20220331171737.48211-1-tony@atomide.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Commit 9c46929e7989 ("ARM: implement THREAD_INFO_IN_TASK for uniprocessor
systems") started triggering an issue with smc calls hanging on boot as
VMAP_STACK is now enabled by default.

Based on discussions on the #armlinux irc channel, Arnd noticed that omaps
are using __pa() for stack for smc calls. This does not work with vmap
stack.

Let's fix the issue by changing the param arrays to use static param[5] for
each function for __pa() to work. This consumes a bit more memory compared
to adding a single static buffer, but avoids potential races with the smc
calls initializing the shared buffer. For omap_secure_dispatcher(), we need
to use a cpu specific buffer as there's nothing currently ensuring it only
gets called from cpu0.

Fixes: 9c46929e7989 ("ARM: implement THREAD_INFO_IN_TASK for uniprocessor systems")
Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/omap-secure.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-omap2/omap-secure.c b/arch/arm/mach-omap2/omap-secure.c
--- a/arch/arm/mach-omap2/omap-secure.c
+++ b/arch/arm/mach-omap2/omap-secure.c
@@ -59,8 +59,13 @@ static void __init omap_optee_init_check(void)
 u32 omap_secure_dispatcher(u32 idx, u32 flag, u32 nargs, u32 arg1, u32 arg2,
 							 u32 arg3, u32 arg4)
 {
+	static u32 buf[NR_CPUS][5];
+	u32 *param;
+	int cpu;
 	u32 ret;
-	u32 param[5];
+
+	cpu = get_cpu();
+	param = buf[cpu];
 
 	param[0] = nargs;
 	param[1] = arg1;
@@ -76,6 +81,8 @@ u32 omap_secure_dispatcher(u32 idx, u32 flag, u32 nargs, u32 arg1, u32 arg2,
 	outer_clean_range(__pa(param), __pa(param + 5));
 	ret = omap_smc2(idx, flag, __pa(param));
 
+	put_cpu();
+
 	return ret;
 }
 
@@ -119,8 +126,8 @@ phys_addr_t omap_secure_ram_mempool_base(void)
 #if defined(CONFIG_ARCH_OMAP3) && defined(CONFIG_PM)
 u32 omap3_save_secure_ram(void __iomem *addr, int size)
 {
+	static u32 param[5];
 	u32 ret;
-	u32 param[5];
 
 	if (size != OMAP3_SAVE_SECURE_RAM_SZ)
 		return OMAP3_SAVE_SECURE_RAM_SZ;
@@ -153,8 +160,8 @@ u32 omap3_save_secure_ram(void __iomem *addr, int size)
 u32 rx51_secure_dispatcher(u32 idx, u32 process, u32 flag, u32 nargs,
 			   u32 arg1, u32 arg2, u32 arg3, u32 arg4)
 {
+	static u32 param[5];
 	u32 ret;
-	u32 param[5];
 
 	param[0] = nargs+1; /* RX-51 needs number of arguments + 1 */
 	param[1] = arg1;
-- 
2.35.1
