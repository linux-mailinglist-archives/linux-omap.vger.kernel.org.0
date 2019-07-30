Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A338979EDB
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jul 2019 04:44:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730921AbfG3Cod (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Jul 2019 22:44:33 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45086 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729571AbfG3Cod (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 29 Jul 2019 22:44:33 -0400
Received: by mail-pg1-f193.google.com with SMTP id o13so29210432pgp.12;
        Mon, 29 Jul 2019 19:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gbduh9qXQG5zebANMhUSUtAHLLBB9b10oy7d6gIG3NA=;
        b=f7ELYVC8j5D0tLUUetiVmx3kCb2WF8cqBUcyXWAla4Jcq1yin/m1nzTqXb1Q91rMxr
         QT6CyW2EePoH/7DV4ifoNY1n8LXPrriS2w6kyJ7VCht7ET4KC4E1ETL0Igbz4u+nb50Z
         2uTcUNtLkt+GHZiilu59TiiGDr6xYjpdHvDCf9CxPh8uzk2Zciovl2NbQfpqvXXDyjo3
         Aa06I5GVlGixiZYS61iXIilAqwH0IjWCWv7sNAQ2W3PKSZp+BVM7fBqfraffkVPULAq2
         nuh5U2uICGuUvVXIDlMD3vms56ZYxJWMEue+3M+cPs+vAEEKYcZZ+zz0K/lmcjgF7Ue5
         7j1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gbduh9qXQG5zebANMhUSUtAHLLBB9b10oy7d6gIG3NA=;
        b=eohdTKTzLH9iFV3wCbKuqwjnDS6bIicXRzBMCv58FxcWHyFs60bn1WAbWRNoCsGw4J
         IDzOD4F3u827VF594KFmFppUAoxy/zSoUVRI4sdW//yghP5YIxGc3RaVzZ94HkB9smAf
         hYBL4+WWEol+okokoZ4FOuSSqtZZfGjEf2v7OZllESKSIkH/oGUHApPEDGqXbcc/JWyh
         Rv2POjEkJAbMsBP1RquelSHGGnF9GeBbEeQ9o7ugJSWiRFFTXqlGOWfiFP7Dg7GVJ4qn
         REFhL6dB3WEgHQojUJuvSJ69MfRYbnhUl7f0NKE6SlNOYP/mSLkUePi/GE9Fw0o8zmFX
         SNEw==
X-Gm-Message-State: APjAAAXsmGOoqmx/vZdbajqGP1aj0DyWUPWlkl+scyNNB4sEFApxkkkl
        n7OId3zWRtQ83/sDbgOVtfk=
X-Google-Smtp-Source: APXvYqwIT3cd6WWHAW1VAowcbvg3ZO9itoDM/gXawGxFbxbfwmo/faBnvmfWBvxyXUM0RwniBS4J9A==
X-Received: by 2002:a62:cdc3:: with SMTP id o186mr40016504pfg.168.1564454672683;
        Mon, 29 Jul 2019 19:44:32 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
        by smtp.gmail.com with ESMTPSA id i123sm86096732pfe.147.2019.07.29.19.44.29
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 29 Jul 2019 19:44:32 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Tony Lindgren <tony@atomide.com>,
        Kevin Hilman <khilman@kernel.org>,
        Alexander Clouter <alex@digriz.org.uk>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] ARM: Replace strncmp with str_has_prefix
Date:   Tue, 30 Jul 2019 10:44:26 +0800
Message-Id: <20190730024426.17262-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In commit b6b2735514bc
("tracing: Use str_has_prefix() instead of using fixed sizes")
the newly introduced str_has_prefix() was used
to replace error-prone strncmp(str, const, len).
Here fix codes with the same pattern.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 arch/arm/kernel/module-plts.c        | 2 +-
 arch/arm/mach-omap2/omap_device.c    | 4 ++--
 arch/arm/mach-omap2/pm-debug.c       | 8 ++++----
 arch/arm/mach-omap2/pm.c             | 2 +-
 arch/arm/mach-omap2/pm44xx.c         | 2 +-
 arch/arm/mach-omap2/sr_device.c      | 8 ++++----
 arch/arm/mach-orion5x/ts78xx-setup.c | 4 ++--
 7 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm/kernel/module-plts.c b/arch/arm/kernel/module-plts.c
index b647741c0ab0..92485a90fb63 100644
--- a/arch/arm/kernel/module-plts.c
+++ b/arch/arm/kernel/module-plts.c
@@ -230,7 +230,7 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 		/* sort by type and symbol index */
 		sort(rels, numrels, sizeof(Elf32_Rel), cmp_rel, NULL);
 
-		if (strncmp(secstrings + dstsec->sh_name, ".init", 5) != 0)
+		if (!str_has_prefix(secstrings + dstsec->sh_name, ".init"))
 			core_plts += count_plts(syms, dstsec->sh_addr, rels,
 						numrels, s->sh_info);
 		else
diff --git a/arch/arm/mach-omap2/omap_device.c b/arch/arm/mach-omap2/omap_device.c
index 3acb4192918d..8ef38529f0a7 100644
--- a/arch/arm/mach-omap2/omap_device.c
+++ b/arch/arm/mach-omap2/omap_device.c
@@ -492,8 +492,8 @@ struct platform_device __init *omap_device_build(const char *pdev_name,
 	if (!pdata && pdata_len > 0)
 		return ERR_PTR(-EINVAL);
 
-	if (strncmp(oh->name, "smartreflex", 11) &&
-	    strncmp(oh->name, "dma", 3)) {
+	if (!str_has_prefix(oh->name, "smartreflex") &&
+	    !str_has_prefix(oh->name, "dma")) {
 		pr_warn("%s need to update %s to probe with dt\na",
 			__func__, pdev_name);
 		ret = -ENODEV;
diff --git a/arch/arm/mach-omap2/pm-debug.c b/arch/arm/mach-omap2/pm-debug.c
index fceb1e525d26..5aeac364c3de 100644
--- a/arch/arm/mach-omap2/pm-debug.c
+++ b/arch/arm/mach-omap2/pm-debug.c
@@ -72,7 +72,7 @@ static int clkdm_dbg_show_counter(struct clockdomain *clkdm, void *user)
 
 	if (strcmp(clkdm->name, "emu_clkdm") == 0 ||
 		strcmp(clkdm->name, "wkup_clkdm") == 0 ||
-		strncmp(clkdm->name, "dpll", 4) == 0)
+		str_has_prefix(clkdm->name, "dpll"))
 		return 0;
 
 	seq_printf(s, "%s->%s (%d)\n", clkdm->name, clkdm->pwrdm.ptr->name,
@@ -88,7 +88,7 @@ static int pwrdm_dbg_show_counter(struct powerdomain *pwrdm, void *user)
 
 	if (strcmp(pwrdm->name, "emu_pwrdm") == 0 ||
 		strcmp(pwrdm->name, "wkup_pwrdm") == 0 ||
-		strncmp(pwrdm->name, "dpll", 4) == 0)
+		str_has_prefix(pwrdm->name, "dpll"))
 		return 0;
 
 	if (pwrdm->state != pwrdm_read_pwrst(pwrdm))
@@ -117,7 +117,7 @@ static int pwrdm_dbg_show_timer(struct powerdomain *pwrdm, void *user)
 
 	if (strcmp(pwrdm->name, "emu_pwrdm") == 0 ||
 		strcmp(pwrdm->name, "wkup_pwrdm") == 0 ||
-		strncmp(pwrdm->name, "dpll", 4) == 0)
+		str_has_prefix(pwrdm->name, "dpll"))
 		return 0;
 
 	pwrdm_state_switch(pwrdm);
@@ -186,7 +186,7 @@ static int __init pwrdms_setup(struct powerdomain *pwrdm, void *dir)
 
 	pwrdm->timer = t;
 
-	if (strncmp(pwrdm->name, "dpll", 4) == 0)
+	if (str_has_prefix(pwrdm->name, "dpll"))
 		return 0;
 
 	d = debugfs_create_dir(pwrdm->name, (struct dentry *)dir);
diff --git a/arch/arm/mach-omap2/pm.c b/arch/arm/mach-omap2/pm.c
index 1fde1bf53fb6..d3287ec5d8da 100644
--- a/arch/arm/mach-omap2/pm.c
+++ b/arch/arm/mach-omap2/pm.c
@@ -96,7 +96,7 @@ static int __init omap2_set_init_voltage(char *vdd_name, char *clk_name,
 		goto exit;
 	}
 
-	if (!strncmp(oh_name, "mpu", 3))
+	if (str_has_prefix(oh_name, "mpu"))
 		/* 
 		 * All current OMAPs share voltage rail and clock
 		 * source, so CPU0 is used to represent the MPU-SS.
diff --git a/arch/arm/mach-omap2/pm44xx.c b/arch/arm/mach-omap2/pm44xx.c
index 485550af2506..4ba30e690b5a 100644
--- a/arch/arm/mach-omap2/pm44xx.c
+++ b/arch/arm/mach-omap2/pm44xx.c
@@ -122,7 +122,7 @@ static int __init pwrdms_setup(struct powerdomain *pwrdm, void *unused)
 	 * through hotplug path and CPU0 explicitly programmed
 	 * further down in the code path
 	 */
-	if (!strncmp(pwrdm->name, "cpu", 3)) {
+	if (str_has_prefix(pwrdm->name, "cpu")) {
 		if (IS_PM44XX_ERRATUM(PM_OMAP4_CPU_OSWR_DISABLE))
 			cpu_suspend_state = PWRDM_POWER_RET;
 		return 0;
diff --git a/arch/arm/mach-omap2/sr_device.c b/arch/arm/mach-omap2/sr_device.c
index 62df666c2bd0..885c75e26a2f 100644
--- a/arch/arm/mach-omap2/sr_device.c
+++ b/arch/arm/mach-omap2/sr_device.c
@@ -95,12 +95,12 @@ static int __init sr_dev_init(struct omap_hwmod *oh, void *user)
 	struct omap_smartreflex_dev_attr *sr_dev_attr;
 	static int i;
 
-	if (!strncmp(oh->name, "smartreflex_mpu_iva", 20) ||
-	    !strncmp(oh->name, "smartreflex_mpu", 16))
+	if (str_has_prefix(oh->name, "smartreflex_mpu_iva") ||
+	    str_has_prefix(oh->name, "smartreflex_mpu"))
 		sr_data = &omap_sr_pdata[OMAP_SR_MPU];
-	else if (!strncmp(oh->name, "smartreflex_core", 17))
+	else if (str_has_prefix(oh->name, "smartreflex_core"))
 		sr_data = &omap_sr_pdata[OMAP_SR_CORE];
-	else if (!strncmp(oh->name, "smartreflex_iva", 16))
+	else if (str_has_prefix(oh->name, "smartreflex_iva"))
 		sr_data = &omap_sr_pdata[OMAP_SR_IVA];
 
 	if (!sr_data) {
diff --git a/arch/arm/mach-orion5x/ts78xx-setup.c b/arch/arm/mach-orion5x/ts78xx-setup.c
index fda9b75c3a33..d83791f0e2da 100644
--- a/arch/arm/mach-orion5x/ts78xx-setup.c
+++ b/arch/arm/mach-orion5x/ts78xx-setup.c
@@ -477,9 +477,9 @@ static ssize_t ts78xx_fpga_store(struct kobject *kobj,
 		return -EBUSY;
 	}
 
-	if (strncmp(buf, "online", sizeof("online") - 1) == 0)
+	if (str_has_prefix(buf, "online"))
 		value = 1;
-	else if (strncmp(buf, "offline", sizeof("offline") - 1) == 0)
+	else if (str_has_prefix(buf, "offline"))
 		value = 0;
 	else
 		return -EINVAL;
-- 
2.20.1

