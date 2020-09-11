Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC144265996
	for <lists+linux-omap@lfdr.de>; Fri, 11 Sep 2020 08:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725536AbgIKGuz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Sep 2020 02:50:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbgIKGuw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Sep 2020 02:50:52 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEB2DC061573;
        Thu, 10 Sep 2020 23:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=hDqq1JG175ppowfS+5K7leNlHt/omHY888LR3V06tR4=; b=NtGcTdUU4w/N2X72+BK9qqwB3w
        eIGqZeu5gBNG0wuBvXicLERsQ5yAlTJ+2zVMP2biOwDnt4dhR/Zswk2JNlYVhboOKhMggMo6aHV4A
        sW9VY1j70XdcXO97NFV3TQZZew8XUr01hkQlAyzFD9S7GYUOKAwfrvR8d8c2lzRmAQMw=;
Received: from p200300ccff0ce9001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0c:e900:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1kGctL-0005Do-2W; Fri, 11 Sep 2020 08:50:39 +0200
Received: from andi by aktux with local (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1kGctK-0006qj-JJ; Fri, 11 Sep 2020 08:50:38 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     khilman@kernel.org, tony@atomide.com, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH] omap3: enable off mode automatically
Date:   Fri, 11 Sep 2020 08:49:24 +0200
Message-Id: <20200911064924.26281-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Enabling off mode was only reachable deeply hidden
in the debugfs. As powersaving is an important feature,
move the option out of its shady place.
The debugfs file can still be used to override the default.

Use the presence of a device compatible to ti,twl4030-idle or
ti,twl4030-idle-osc-off as an indicator that the board is wired correctly
for off mode.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
An earlier version of this patch was here:
https://patchwork.kernel.org/patch/10794121/

A config option was used instead of the suggested devicetree check.

 arch/arm/mach-omap2/pm.h     |  4 ----
 arch/arm/mach-omap2/pm34xx.c | 29 ++++++++++++++++++++++++++++-
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-omap2/pm.h b/arch/arm/mach-omap2/pm.h
index 2a883a0c1fcd..80e84ae66aee 100644
--- a/arch/arm/mach-omap2/pm.h
+++ b/arch/arm/mach-omap2/pm.h
@@ -49,11 +49,7 @@ static inline int omap4_opp_init(void)
 extern int omap3_pm_get_suspend_state(struct powerdomain *pwrdm);
 extern int omap3_pm_set_suspend_state(struct powerdomain *pwrdm, int state);
 
-#ifdef CONFIG_PM_DEBUG
 extern u32 enable_off_mode;
-#else
-#define enable_off_mode 0
-#endif
 
 #if defined(CONFIG_PM_DEBUG) && defined(CONFIG_DEBUG_FS)
 extern void pm_dbg_update_time(struct powerdomain *pwrdm, int prev);
diff --git a/arch/arm/mach-omap2/pm34xx.c b/arch/arm/mach-omap2/pm34xx.c
index f5dfddf492e2..d069d581c372 100644
--- a/arch/arm/mach-omap2/pm34xx.c
+++ b/arch/arm/mach-omap2/pm34xx.c
@@ -25,6 +25,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
+#include <linux/of.h>
 #include <linux/omap-gpmc.h>
 
 #include <trace/events/power.h>
@@ -51,6 +52,10 @@
 /* pm34xx errata defined in pm.h */
 u16 pm34xx_errata;
 
+#ifndef CONFIG_PM_DEBUG
+u32 enable_off_mode;
+#endif
+
 struct power_state {
 	struct powerdomain *pwrdm;
 	u32 next_state;
@@ -410,7 +415,12 @@ static int __init pwrdms_setup(struct powerdomain *pwrdm, void *unused)
 	if (!pwrst)
 		return -ENOMEM;
 	pwrst->pwrdm = pwrdm;
-	pwrst->next_state = PWRDM_POWER_RET;
+
+	if (enable_off_mode)
+		pwrst->next_state = PWRDM_POWER_OFF;
+	else
+		pwrst->next_state = PWRDM_POWER_RET;
+
 	list_add(&pwrst->node, &pwrst_list);
 
 	if (pwrdm_has_hdwr_sar(pwrdm))
@@ -444,6 +454,21 @@ static void __init pm_errata_configure(void)
 	}
 }
 
+static void __init omap3_pm_check_pmic(void)
+{
+	struct device_node *np;
+
+	np = of_find_compatible_node(NULL, NULL, "ti,twl4030-power-idle");
+	if (!np)
+		np = of_find_compatible_node(NULL, NULL, "ti,twl4030-power-idle-osc-off");
+
+	if (np) {
+		of_node_put(np);
+		enable_off_mode = 1;
+	} else
+		enable_off_mode = 0;
+}
+
 int __init omap3_pm_init(void)
 {
 	struct power_state *pwrst, *tmp;
@@ -477,6 +502,8 @@ int __init omap3_pm_init(void)
 		goto err2;
 	}
 
+	omap3_pm_check_pmic();
+
 	ret = pwrdm_for_each(pwrdms_setup, NULL);
 	if (ret) {
 		pr_err("Failed to setup powerdomains\n");
-- 
2.20.1

