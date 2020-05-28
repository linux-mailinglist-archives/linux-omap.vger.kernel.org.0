Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81F671E5BB6
	for <lists+linux-omap@lfdr.de>; Thu, 28 May 2020 11:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728239AbgE1JTo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 May 2020 05:19:44 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:52751 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728190AbgE1JTn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 28 May 2020 05:19:43 -0400
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1M7v18-1ji6JC3P7K-004y2k; Thu, 28 May 2020 11:19:24 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     arm@kernel.org, Tony Lindgren <tony@atomide.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Rob Herring <robh@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        Santosh Shilimkar <santosh.shilimkar@oracle.com>,
        Olof Johansson <olof@lixom.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: omap2: drop broken broadcast timer hack
Date:   Thu, 28 May 2020 11:19:12 +0200
Message-Id: <20200528091923.2951100-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ATdn30GjCa5VNK5LMgEqCYCr6k0Rv5NDMW8ItvRx618qB5cT2J7
 7iWumw21v50yEnwmwJL287o1FpY+SfqpqZcPQyoXstzll+OuO4d9LDvoPrPq7EKMugUFnsv
 XqHZQ5OWZaVxwTaun9JU1+YtBJJMQX7BoRjjZdSz7ZxY/O3Hmz/HuafwO5ZmWknK+NIKnIa
 51GT45DLpjVPdKAO4RVXw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CXAD4bL1BoM=:+Z/iCh1MkE4iwHBSzVAxnC
 9iR6ZNpgbrqVHr5ok5qJuQRQS7466T1SOncy+46ZYlL6Y4vk2ibvIjjwViG+Z0PP4U90TTs58
 PtR1WVwhvLfiYmyeL+Zr2jlgN5WCSuBXLunvXUfvjQel/7/L+OP2mXEZF1ZpO9ZD2mVnKh1OK
 s4Hyus0alRsaDVSX0mFI5RsM5PojO2piEDPe+A5IcuuFO/dx84G4kJFaotR6i3T3NxIo7x2kO
 iJndMivXR/Hr8neplvXE7lSbS040emeds6mtkztoiVAnN0J4G4AttA8n+YFz3rMKpg9s9LLRu
 GY86NDFpcHmhy6A+42U5b7V4lmI598W/+mZEd28eh8bPCjG+5NdQEnlEWiDUnr7xzUupOOK7E
 feSqZas5/lcvj5IdB/cm+GDuZZ+4TfJw3XQf4EAQ1vZNyFQwl1WSubqQ6mrfKqmtWEqROq0tu
 iYbTrYJSHLXIJ5zLmklhKKwUGQWuCMfjRagLDjghnkKvNQkuujujTsJ7tgU8E+R+2lvfw+oOt
 7DSIL5kC2Hf/qVQQtUshSD7kpbTTDR93jNfwPxcSPbejwdOACJUZ6u+DSgUtgAMukg3zmsRbd
 ywRAXGS+UTP8rUSv2R2ty26wJhknv21rAlNm1UPUt2xSdhPvDTd5vP9qdyafbWxYfB2JpScnP
 ChEnT4d63fjbgibQQs1qj61w/9onh82UK+JfIyUIYs0wjxf4g2HCAevlH/G140vszM8Wehq/G
 tLmt+1LnMzu2RgYC0tfHywhF3V6vpqHrE5gZATc3xh+7FDR1AGo/jB73/IprjsCQk7ccRIFEs
 hpbloZCOtR9o+1dIje+0DvDpm5TTKTk6IW1SUUvfpzZOk1hyGA=
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The OMAP4 timer code had a special hack for using the broadcast timer
without SMP. Since the dmtimer is now gone, this also needs to be dropped
to avoid a link failure for non-SMP AM43xx configurations:

kernel/time/tick-broadcast.o: in function `tick_device_uses_broadcast':
tick-broadcast.c:(.text+0x130): undefined reference to `tick_broadcast'

Fixes: 2ee04b88547a ("ARM: OMAP2+: Drop old timer code for dmtimer and 32k counter")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap2/Kconfig | 1 -
 arch/arm/mach-omap2/timer.c | 6 ------
 2 files changed, 7 deletions(-)

diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
index ca74473f01df..ec4450a5c296 100644
--- a/arch/arm/mach-omap2/Kconfig
+++ b/arch/arm/mach-omap2/Kconfig
@@ -67,7 +67,6 @@ config SOC_AM43XX
 	select ARM_GIC
 	select MACH_OMAP_GENERIC
 	select HAVE_ARM_SCU
-	select GENERIC_CLOCKEVENTS_BROADCAST
 	select HAVE_ARM_TWD
 	select ARM_ERRATA_754322
 	select ARM_ERRATA_775420
diff --git a/arch/arm/mach-omap2/timer.c b/arch/arm/mach-omap2/timer.c
index 2d4ea386fc38..786336ee27ef 100644
--- a/arch/arm/mach-omap2/timer.c
+++ b/arch/arm/mach-omap2/timer.c
@@ -46,12 +46,6 @@ void set_cntfreq(void)
 	omap_smc1(OMAP5_DRA7_MON_SET_CNTFRQ_INDEX, arch_timer_freq);
 }
 
-#if !defined(CONFIG_SMP) && defined(CONFIG_GENERIC_CLOCKEVENTS_BROADCAST)
-void tick_broadcast(const struct cpumask *mask)
-{
-}
-#endif
-
 #if defined(CONFIG_SOC_OMAP5) || defined(CONFIG_SOC_DRA7XX)
 
 /*
-- 
2.26.2

