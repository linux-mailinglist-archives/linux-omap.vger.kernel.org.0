Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E08F26634C
	for <lists+linux-omap@lfdr.de>; Fri, 11 Sep 2020 18:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbgIKQNq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Sep 2020 12:13:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbgIKQNk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Sep 2020 12:13:40 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50981C061573;
        Fri, 11 Sep 2020 09:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=mieaiSS+0BhtRy+uP0NJAzxIjFSZGneK1DCisX/Obgo=; b=V4Nb7efrp4tZ78hd7CxB4LTZtN
        ZA1wbO1uxaQZmTjZuaY4lfGJCUGq8E6fiAsLMfsKEA2W9Dyf9clJ/9FXwJLzAt5uUff0PZgrf4n2s
        w6Lor6ueydCj6SaT+tdNtGo5jUUSjzr88djKbyGHMn7HYwZN5WrzeahAqliHvXghraM8=;
Received: from p200300ccff0ce9001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0c:e900:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1kGlg1-00023Y-Pa; Fri, 11 Sep 2020 18:13:30 +0200
Received: from andi by aktux with local (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1kGlg1-0006dL-3I; Fri, 11 Sep 2020 18:13:29 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     khilman@kernel.org, tony@atomide.com, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2] omap3: enable off mode automatically
Date:   Fri, 11 Sep 2020 18:12:09 +0200
Message-Id: <20200911161209.25149-1-andreas@kemnade.info>
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

Changes in v2:
- fix compile without CONFIG_ARCH_OMAP3
  The variable enable_off_mode is now always a real one and not
  a preprocessor constant to avoid trouble with unusual configurations.

 arch/arm/mach-omap2/pm-debug.c |  2 --
 arch/arm/mach-omap2/pm.c       |  2 ++
 arch/arm/mach-omap2/pm.h       |  4 ----
 arch/arm/mach-omap2/pm34xx.c   | 25 ++++++++++++++++++++++++-
 4 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-omap2/pm-debug.c b/arch/arm/mach-omap2/pm-debug.c
index fceb1e525d26..919d35d5b325 100644
--- a/arch/arm/mach-omap2/pm-debug.c
+++ b/arch/arm/mach-omap2/pm-debug.c
@@ -34,8 +34,6 @@
 #include "prm2xxx_3xxx.h"
 #include "pm.h"
 
-u32 enable_off_mode;
-
 #ifdef CONFIG_DEBUG_FS
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
diff --git a/arch/arm/mach-omap2/pm.c b/arch/arm/mach-omap2/pm.c
index 01ec1ba4878b..da829a90fe8c 100644
--- a/arch/arm/mach-omap2/pm.c
+++ b/arch/arm/mach-omap2/pm.c
@@ -28,6 +28,8 @@
 #include "clockdomain.h"
 #include "pm.h"
 
+u32 enable_off_mode;
+
 #ifdef CONFIG_SUSPEND
 /*
  * omap_pm_suspend: points to a function that does the SoC-specific
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
index f5dfddf492e2..925b8efbf46c 100644
--- a/arch/arm/mach-omap2/pm34xx.c
+++ b/arch/arm/mach-omap2/pm34xx.c
@@ -25,6 +25,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
+#include <linux/of.h>
 #include <linux/omap-gpmc.h>
 
 #include <trace/events/power.h>
@@ -410,7 +411,12 @@ static int __init pwrdms_setup(struct powerdomain *pwrdm, void *unused)
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
@@ -444,6 +450,21 @@ static void __init pm_errata_configure(void)
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
@@ -477,6 +498,8 @@ int __init omap3_pm_init(void)
 		goto err2;
 	}
 
+	omap3_pm_check_pmic();
+
 	ret = pwrdm_for_each(pwrdms_setup, NULL);
 	if (ret) {
 		pr_err("Failed to setup powerdomains\n");
-- 
2.20.1

