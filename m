Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37B961C592A
	for <lists+linux-omap@lfdr.de>; Tue,  5 May 2020 16:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729453AbgEEOOb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 May 2020 10:14:31 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:36381 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729559AbgEEOOW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 May 2020 10:14:22 -0400
Received: from localhost.localdomain ([149.172.19.189]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MBDrM-1jQzi83buY-00CePX; Tue, 05 May 2020 16:14:02 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Kevin Hilman <khilman@kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: omap1: fix irq setup
Date:   Tue,  5 May 2020 16:13:48 +0200
Message-Id: <20200505141400.767312-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LvLPepcWVA3cOq/dneR4EUFbqygTCx28UhrDXt4MYSPcNJ4mrgn
 +QPxmj7Yxy4NuRDL2I3gKatumDNFanxLYw86EEXLQeaxf2uHxTPjdRxsZ0nyaJR+ncJanxy
 4nbOjM2H44/xEfwf5IKaHiR31MSIY7ePR1EXQ4Pd0jnyhEqjx5026Ue0/bycDgRv8VJvbSE
 z15LpjYn+K1X0KpouEG5A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HMPeHO7MWj0=:QCVLcwagAi7moRTbEI8t4o
 uzWUr479RSv5Yd9emDprIzlpJRBuT53YlMq5+Ph3I8BO22ZitbEGM7a0XAZV1RVBCFf25N678
 TSSXd/DZRqPeNA1XgKo27ZE4YfC4aoy7CMpcWIcubWLSwahc2Xd649/RRCJ1m2OeQSpcVNUVy
 0S4sfhFaScwVX+oUmWSX3LSejHiSqhMTHxBHagCNqDQkYUgvY7Lk1ZLRLLfo5qI9Tgegs8PwV
 kV18Qh/OM9PwyUWsjmUIMGZZdeyBpHb7wox2LZZQ/jMUiOLhxzFzpIn3U0Vd/3+pBq1tSf40P
 ijm0zpuP258+KqWNNf26tgKSlX70j7WNSfTQw5lEjoGpNy0LG3ZHY2lDnbNHOrzrGDkVma1ZW
 QAUaXOEPlSk2TUXpiNbWsdDdJRKkkz6tSZFsz+tcZa1mCrVp06VXvlpZCDUqidndoJUdqcqTR
 tTRJSfP9TXKy9QTHkPTSZVr8WxIrcvil34FhEJeiuF0CYUXDWOQLlegPiXAfQ7qD7AHXkTvKh
 KU3SyvnFld/2S3Ux5n9p6oUgmDcLzE+N+w34hvIMfikZPCamItyAGjJX08clxNMQae1cg+qed
 2mMf1XNBAplayot4r50g5EN56RUtCME/8OHkIuIDeQa8l75/AnBimnkj6cz1aPm+9W2i1Pw2N
 CaQwxqyVNrY45q70PsMqbGXLktumgD0UiY3EMai9x6tPj3+vvsDz+XHg9FtGCe2SDKjL/V6UJ
 xSbQ3spM4NH7kQgc9kGalLumeO36TZI2qKqiV1K/BSrh2/DKj2yWD0pmUoP6MYOEwQAs1t/cO
 nDRnVmQi9zqpnZnWAibQPwqWUIJdJXK6XyLcf6VORR8tpPigNQ=
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

A recent cleanup introduced a bug on any omap1 machine that has
no wakeup IRQ, i.e. omap15xx:

arch/arm/mach-omap1/pm.c:656:11: error: variable 'irq' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
        else if (cpu_is_omap16xx())
                 ^~~~~~~~~~~~~~~~~
include/linux/soc/ti/omap1-soc.h:115:30: note: expanded from macro 'cpu_is_omap16xx'
 #  define cpu_is_omap16xx()             is_omap16xx()
                                        ^~~~~~~~~~~~~
arch/arm/mach-omap1/pm.c:658:18: note: uninitialized use occurs here
        if (request_irq(irq, omap_wakeup_interrupt, 0, "peripheral wakeup",
                        ^~~
arch/arm/mach-omap1/pm.c:656:7: note: remove the 'if' if its condition is always true
        else if (cpu_is_omap16xx())
             ^~~~~~~~~~~~~~~~~~~~~~
arch/arm/mach-omap1/pm.c:611:9: note: initialize the variable 'irq' to silence this warning
        int irq;
               ^

Move this code into a separate function to deal with it cleanly.

Fixes: b75ca5217743 ("ARM: OMAP: replace setup_irq() by request_irq()")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/pm.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-omap1/pm.c b/arch/arm/mach-omap1/pm.c
index 0f8064bd40ae..266aa08aa8ed 100644
--- a/arch/arm/mach-omap1/pm.c
+++ b/arch/arm/mach-omap1/pm.c
@@ -605,10 +605,25 @@ static const struct platform_suspend_ops omap_pm_ops = {
 	.valid		= suspend_valid_only_mem,
 };
 
+static void omap_wakeup_init(void)
+{
+	int irq;
+
+	if (cpu_is_omap7xx())
+		irq = INT_7XX_WAKE_UP_REQ;
+	else if (cpu_is_omap16xx())
+		irq = INT_1610_WAKE_UP_REQ;
+	else
+		return;
+
+	if (request_irq(irq, omap_wakeup_interrupt, 0, "peripheral wakeup",
+			NULL))
+		pr_err("Failed to request irq %d (peripheral wakeup)\n", irq);
+}
+
 static int __init omap_pm_init(void)
 {
 	int error = 0;
-	int irq;
 
 	if (!cpu_class_is_omap1())
 		return -ENODEV;
@@ -651,13 +666,7 @@ static int __init omap_pm_init(void)
 
 	arm_pm_idle = omap1_pm_idle;
 
-	if (cpu_is_omap7xx())
-		irq = INT_7XX_WAKE_UP_REQ;
-	else if (cpu_is_omap16xx())
-		irq = INT_1610_WAKE_UP_REQ;
-	if (request_irq(irq, omap_wakeup_interrupt, 0, "peripheral wakeup",
-			NULL))
-		pr_err("Failed to request irq %d (peripheral wakeup)\n", irq);
+	omap_wakeup_init();
 
 	/* Program new power ramp-up time
 	 * (0 for most boards since we don't lower voltage when in deep sleep)
-- 
2.26.0

