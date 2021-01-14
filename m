Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 328662F602C
	for <lists+linux-omap@lfdr.de>; Thu, 14 Jan 2021 12:39:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728630AbhANLgY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 Jan 2021 06:36:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728604AbhANLgW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 14 Jan 2021 06:36:22 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D98C061757
        for <linux-omap@vger.kernel.org>; Thu, 14 Jan 2021 03:35:42 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id m6so3185641pfk.1
        for <linux-omap@vger.kernel.org>; Thu, 14 Jan 2021 03:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jUEHHOcx6Gjoib97ZDAcN91Clp+WhuCuAHwtBS1mIRA=;
        b=lFslJ9zbgtil8Bml61Fh0rSlroB37M/Jmuu9MytMpg1tx2/y8HN6keQGR9jmjMG4Hc
         V+elM7eA7RyWN2iCxDgTHALnUNv2F2GNrQ3wTnGmWfcQVKzuS89MjlpKX+IwaFFw/LNm
         vRsi3oBN+7HTTvuxD1fuIpQa2LDQLv9Oac2O0/WlC2eMSJcaJ4nQ1lgt7RKiaOOt2XOT
         XI4kk+mtAlz6jQey3akWRGBOE6T5teMRWhetWDThFgOrQ2AjUvgQ2FF548YLQkMnJWN/
         C9kQZcCpJ5uT12jHJwuuj034FusMyryU248MNu6ZbQ2vOWDBBza+1JzgeYBxCE/y4fdy
         zA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jUEHHOcx6Gjoib97ZDAcN91Clp+WhuCuAHwtBS1mIRA=;
        b=fk28dQzTAWtbOiKZbh66zqUu4gwz+ILe/FXeL4/VSpJ35MMRpAHAZ0AtJQyqKw+aGI
         vdE5C8rPu/80w3vGOXEL5vYYJRnWKJ/x6ACB3msTmr6dbDEQ7s+6QhD2ZwXWNxM5eib8
         HE8TWoFTbgxOru1PULcIIOfuGvWm8s9irOdmGgX5Y20lIdmK9pLJlZqXQXCUtoBFpTiN
         Y7AvYwN5pNsCzk8XYVMeMYswEafHH0eb80hm5Z85bDjyEyPCcue1Jjgwe6sS1jnt0mL5
         zC0dbTK05wqYkL7jf4PqM23Qrtv2/UjDNePzxxbaSqesMD4ECIVTzE/0BevtaamtFnhH
         sGgA==
X-Gm-Message-State: AOAM533GZaKiSDdkXiTvfKRiOBjU8C/yHKCODjFEu6yJvjcnDTv53V3R
        V+K5XPDiHGWnE/TTkS0MXWMn5Q==
X-Google-Smtp-Source: ABdhPJzJPLtfBIpDeIRabqShqxSCBN6KTQD/58rvKp28TTDsU6AS3Ul8gjAZ7ohFCm4ELU2PBxRJ2A==
X-Received: by 2002:a63:2265:: with SMTP id t37mr7043628pgm.336.1610624141401;
        Thu, 14 Jan 2021 03:35:41 -0800 (PST)
Received: from localhost ([122.172.85.111])
        by smtp.gmail.com with ESMTPSA id z15sm4967441pfn.34.2021.01.14.03.35.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jan 2021 03:35:40 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Robert Richter <rric@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Dinh Nguyen <dinguyen@kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Arnd Bergmann <arnd@kernel.org>, oprofile-list@lists.sf.net,
        William Cohen <wcohen@redhat.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        anmar.oueja@linaro.org, Christoph Hellwig <hch@infradead.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: [PATCH 02/18] arch: arm: Remove CONFIG_OPROFILE support
Date:   Thu, 14 Jan 2021 17:05:15 +0530
Message-Id: <c7b32291f65f7f1c268f36b87fb997948d575eb6.1610622251.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1610622251.git.viresh.kumar@linaro.org>
References: <cover.1610622251.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The "oprofile" user-space tools don't use the kernel OPROFILE support
any more, and haven't in a long time. User-space has been converted to
the perf interfaces.

Remove the old oprofile's architecture specific support.

Suggested-by: Christoph Hellwig <hch@infradead.org>
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 arch/arm/Kconfig                     |   1 -
 arch/arm/Makefile                    |   2 -
 arch/arm/configs/bcm2835_defconfig   |   1 -
 arch/arm/configs/cns3420vb_defconfig |   1 -
 arch/arm/configs/corgi_defconfig     |   1 -
 arch/arm/configs/imx_v4_v5_defconfig |   1 -
 arch/arm/configs/keystone_defconfig  |   1 -
 arch/arm/configs/multi_v5_defconfig  |   1 -
 arch/arm/configs/mv78xx0_defconfig   |   1 -
 arch/arm/configs/mvebu_v5_defconfig  |   1 -
 arch/arm/configs/omap1_defconfig     |   1 -
 arch/arm/configs/omap2plus_defconfig |   1 -
 arch/arm/configs/orion5x_defconfig   |   1 -
 arch/arm/configs/pxa_defconfig       |   1 -
 arch/arm/configs/qcom_defconfig      |   1 -
 arch/arm/configs/socfpga_defconfig   |   1 -
 arch/arm/configs/spitz_defconfig     |   1 -
 arch/arm/configs/vexpress_defconfig  |   1 -
 arch/arm/oprofile/Makefile           |  14 ---
 arch/arm/oprofile/common.c           | 132 ---------------------------
 20 files changed, 165 deletions(-)
 delete mode 100644 arch/arm/oprofile/Makefile
 delete mode 100644 arch/arm/oprofile/common.c

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 138248999df7..c9d43d415d54 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -102,7 +102,6 @@ config ARM
 	select HAVE_KRETPROBES if HAVE_KPROBES
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_NMI
-	select HAVE_OPROFILE if HAVE_PERF_EVENTS
 	select HAVE_OPTPROBES if !THUMB2_KERNEL
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_REGS
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 4aaec9599e8a..e06fee171ab1 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -266,8 +266,6 @@ core-y				+= $(machdirs) $(platdirs)
 core-				+= $(patsubst %,arch/arm/mach-%/, $(machine-))
 core-				+= $(patsubst %,arch/arm/plat-%/, $(plat-))
 
-drivers-$(CONFIG_OPROFILE)      += arch/arm/oprofile/
-
 libs-y				:= arch/arm/lib/ $(libs-y)
 
 # Default target when executing plain make
diff --git a/arch/arm/configs/bcm2835_defconfig b/arch/arm/configs/bcm2835_defconfig
index 44ff9cd88d81..1ef2bc4c7f69 100644
--- a/arch/arm/configs/bcm2835_defconfig
+++ b/arch/arm/configs/bcm2835_defconfig
@@ -21,7 +21,6 @@ CONFIG_KALLSYMS_ALL=y
 CONFIG_EMBEDDED=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=y
-CONFIG_OPROFILE=y
 CONFIG_JUMP_LABEL=y
 CONFIG_CC_STACKPROTECTOR_REGULAR=y
 CONFIG_MODULES=y
diff --git a/arch/arm/configs/cns3420vb_defconfig b/arch/arm/configs/cns3420vb_defconfig
index 66a80b46038d..63fa2eb21b75 100644
--- a/arch/arm/configs/cns3420vb_defconfig
+++ b/arch/arm/configs/cns3420vb_defconfig
@@ -11,7 +11,6 @@ CONFIG_BLK_DEV_INITRD=y
 # CONFIG_PERF_EVENTS is not set
 CONFIG_SLAB=y
 CONFIG_PROFILING=y
-CONFIG_OPROFILE=m
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
diff --git a/arch/arm/configs/corgi_defconfig b/arch/arm/configs/corgi_defconfig
index 911e880f06ed..15b749f6996d 100644
--- a/arch/arm/configs/corgi_defconfig
+++ b/arch/arm/configs/corgi_defconfig
@@ -5,7 +5,6 @@ CONFIG_SYSFS_DEPRECATED_V2=y
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
 CONFIG_EXPERT=y
 CONFIG_PROFILING=y
-CONFIG_OPROFILE=m
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
diff --git a/arch/arm/configs/imx_v4_v5_defconfig b/arch/arm/configs/imx_v4_v5_defconfig
index bb70acc6b526..1d9fa77bbafc 100644
--- a/arch/arm/configs/imx_v4_v5_defconfig
+++ b/arch/arm/configs/imx_v4_v5_defconfig
@@ -27,7 +27,6 @@ CONFIG_AEABI=y
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
 CONFIG_PM_DEBUG=y
-CONFIG_OPROFILE=y
 CONFIG_KPROBES=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/arch/arm/configs/keystone_defconfig b/arch/arm/configs/keystone_defconfig
index 84a3b055f253..33c917df7b32 100644
--- a/arch/arm/configs/keystone_defconfig
+++ b/arch/arm/configs/keystone_defconfig
@@ -16,7 +16,6 @@ CONFIG_KALLSYMS_ALL=y
 # CONFIG_BASE_FULL is not set
 CONFIG_EMBEDDED=y
 CONFIG_PROFILING=y
-CONFIG_OPROFILE=y
 CONFIG_KPROBES=y
 CONFIG_MODULES=y
 CONFIG_MODULE_FORCE_LOAD=y
diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
index e00be9faa23b..5170a1059a11 100644
--- a/arch/arm/configs/multi_v5_defconfig
+++ b/arch/arm/configs/multi_v5_defconfig
@@ -67,7 +67,6 @@ CONFIG_CPU_FREQ_STAT=y
 CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
 CONFIG_CPU_IDLE=y
 CONFIG_ARM_KIRKWOOD_CPUIDLE=y
-CONFIG_OPROFILE=y
 CONFIG_KPROBES=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/arch/arm/configs/mv78xx0_defconfig b/arch/arm/configs/mv78xx0_defconfig
index b39b1300a459..cd703c15798f 100644
--- a/arch/arm/configs/mv78xx0_defconfig
+++ b/arch/arm/configs/mv78xx0_defconfig
@@ -5,7 +5,6 @@ CONFIG_EXPERT=y
 CONFIG_KALLSYMS_ALL=y
 # CONFIG_SLUB_DEBUG is not set
 CONFIG_PROFILING=y
-CONFIG_OPROFILE=y
 CONFIG_KPROBES=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/arch/arm/configs/mvebu_v5_defconfig b/arch/arm/configs/mvebu_v5_defconfig
index 226f2e97c6e2..4f16716bfc32 100644
--- a/arch/arm/configs/mvebu_v5_defconfig
+++ b/arch/arm/configs/mvebu_v5_defconfig
@@ -4,7 +4,6 @@ CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_LOG_BUF_SHIFT=19
 CONFIG_PROFILING=y
-CONFIG_OPROFILE=y
 CONFIG_KPROBES=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/arch/arm/configs/omap1_defconfig b/arch/arm/configs/omap1_defconfig
index 3b6e7452609b..3148567b66b6 100644
--- a/arch/arm/configs/omap1_defconfig
+++ b/arch/arm/configs/omap1_defconfig
@@ -13,7 +13,6 @@ CONFIG_EXPERT=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 CONFIG_SLOB=y
 CONFIG_PROFILING=y
-CONFIG_OPROFILE=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index b515c31f0ab7..eb353ece7bac 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -68,7 +68,6 @@ CONFIG_CRYPTO_AES_ARM=m
 CONFIG_CRYPTO_AES_ARM_BS=m
 CONFIG_CRYPTO_GHASH_ARM_CE=m
 CONFIG_CRYPTO_CHACHA20_NEON=m
-CONFIG_OPROFILE=y
 CONFIG_KPROBES=y
 CONFIG_MODULES=y
 CONFIG_MODULE_FORCE_LOAD=y
diff --git a/arch/arm/configs/orion5x_defconfig b/arch/arm/configs/orion5x_defconfig
index 4bdbb036ac26..b9e3b647e732 100644
--- a/arch/arm/configs/orion5x_defconfig
+++ b/arch/arm/configs/orion5x_defconfig
@@ -5,7 +5,6 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_EXPERT=y
 # CONFIG_SLUB_DEBUG is not set
 CONFIG_PROFILING=y
-CONFIG_OPROFILE=y
 CONFIG_KPROBES=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index 8654ece13004..bd7dd81c9c54 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -13,7 +13,6 @@ CONFIG_KALLSYMS_ALL=y
 CONFIG_EMBEDDED=y
 CONFIG_SLOB=y
 CONFIG_PROFILING=y
-CONFIG_OPROFILE=m
 CONFIG_KPROBES=y
 CONFIG_MODULES=y
 CONFIG_MODULE_FORCE_LOAD=y
diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index d6733e745b80..43e3668f4bf0 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -10,7 +10,6 @@ CONFIG_EMBEDDED=y
 # CONFIG_SLUB_DEBUG is not set
 # CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=y
-CONFIG_OPROFILE=y
 CONFIG_KPROBES=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/arch/arm/configs/socfpga_defconfig b/arch/arm/configs/socfpga_defconfig
index e73c97b0f5b0..0c60eb382c80 100644
--- a/arch/arm/configs/socfpga_defconfig
+++ b/arch/arm/configs/socfpga_defconfig
@@ -18,7 +18,6 @@ CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
 CONFIG_VFP=y
 CONFIG_NEON=y
-CONFIG_OPROFILE=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/arm/configs/spitz_defconfig b/arch/arm/configs/spitz_defconfig
index 8b2c14424927..f42c7a502b6e 100644
--- a/arch/arm/configs/spitz_defconfig
+++ b/arch/arm/configs/spitz_defconfig
@@ -5,7 +5,6 @@ CONFIG_SYSFS_DEPRECATED_V2=y
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
 CONFIG_EXPERT=y
 CONFIG_PROFILING=y
-CONFIG_OPROFILE=m
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
diff --git a/arch/arm/configs/vexpress_defconfig b/arch/arm/configs/vexpress_defconfig
index c01baf7d6e37..4479369540f2 100644
--- a/arch/arm/configs/vexpress_defconfig
+++ b/arch/arm/configs/vexpress_defconfig
@@ -11,7 +11,6 @@ CONFIG_CPUSETS=y
 # CONFIG_NET_NS is not set
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_PROFILING=y
-CONFIG_OPROFILE=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/arm/oprofile/Makefile b/arch/arm/oprofile/Makefile
deleted file mode 100644
index 39688dc9f181..000000000000
--- a/arch/arm/oprofile/Makefile
+++ /dev/null
@@ -1,14 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_OPROFILE) += oprofile.o
-
-DRIVER_OBJS = $(addprefix ../../../drivers/oprofile/, \
-		oprof.o cpu_buffer.o buffer_sync.o \
-		event_buffer.o oprofile_files.o \
-		oprofilefs.o oprofile_stats.o \
-		timer_int.o )
-
-ifeq ($(CONFIG_HW_PERF_EVENTS),y)
-DRIVER_OBJS += $(addprefix ../../../drivers/oprofile/, oprofile_perf.o)
-endif
-
-oprofile-y				:= $(DRIVER_OBJS) common.o
diff --git a/arch/arm/oprofile/common.c b/arch/arm/oprofile/common.c
deleted file mode 100644
index 7cb3e0453fcd..000000000000
--- a/arch/arm/oprofile/common.c
+++ /dev/null
@@ -1,132 +0,0 @@
-/**
- * @file common.c
- *
- * @remark Copyright 2004 Oprofile Authors
- * @remark Copyright 2010 ARM Ltd.
- * @remark Read the file COPYING
- *
- * @author Zwane Mwaikambo
- * @author Will Deacon [move to perf]
- */
-
-#include <linux/cpumask.h>
-#include <linux/init.h>
-#include <linux/mutex.h>
-#include <linux/oprofile.h>
-#include <linux/perf_event.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-#include <asm/stacktrace.h>
-#include <linux/uaccess.h>
-
-#include <asm/perf_event.h>
-#include <asm/ptrace.h>
-
-#ifdef CONFIG_HW_PERF_EVENTS
-
-/*
- * OProfile has a curious naming scheme for the ARM PMUs, but they are
- * part of the user ABI so we need to map from the perf PMU name for
- * supported PMUs.
- */
-static struct op_perf_name {
-	char *perf_name;
-	char *op_name;
-} op_perf_name_map[] = {
-	{ "armv5_xscale1",	"arm/xscale1"	},
-	{ "armv5_xscale2",	"arm/xscale2"	},
-	{ "armv6_1136",		"arm/armv6"	},
-	{ "armv6_1156",		"arm/armv6"	},
-	{ "armv6_1176",		"arm/armv6"	},
-	{ "armv6_11mpcore",	"arm/mpcore"	},
-	{ "armv7_cortex_a8",	"arm/armv7"	},
-	{ "armv7_cortex_a9",	"arm/armv7-ca9"	},
-};
-
-char *op_name_from_perf_id(void)
-{
-	int i;
-	struct op_perf_name names;
-	const char *perf_name = perf_pmu_name();
-
-	for (i = 0; i < ARRAY_SIZE(op_perf_name_map); ++i) {
-		names = op_perf_name_map[i];
-		if (!strcmp(names.perf_name, perf_name))
-			return names.op_name;
-	}
-
-	return NULL;
-}
-#endif
-
-static int report_trace(struct stackframe *frame, void *d)
-{
-	unsigned int *depth = d;
-
-	if (*depth) {
-		oprofile_add_trace(frame->pc);
-		(*depth)--;
-	}
-
-	return *depth == 0;
-}
-
-/*
- * The registers we're interested in are at the end of the variable
- * length saved register structure. The fp points at the end of this
- * structure so the address of this struct is:
- * (struct frame_tail *)(xxx->fp)-1
- */
-struct frame_tail {
-	struct frame_tail *fp;
-	unsigned long sp;
-	unsigned long lr;
-} __attribute__((packed));
-
-static struct frame_tail* user_backtrace(struct frame_tail *tail)
-{
-	struct frame_tail buftail[2];
-
-	/* Also check accessibility of one struct frame_tail beyond */
-	if (!access_ok(tail, sizeof(buftail)))
-		return NULL;
-	if (__copy_from_user_inatomic(buftail, tail, sizeof(buftail)))
-		return NULL;
-
-	oprofile_add_trace(buftail[0].lr);
-
-	/* frame pointers should strictly progress back up the stack
-	 * (towards higher addresses) */
-	if (tail + 1 >= buftail[0].fp)
-		return NULL;
-
-	return buftail[0].fp-1;
-}
-
-static void arm_backtrace(struct pt_regs * const regs, unsigned int depth)
-{
-	struct frame_tail *tail = ((struct frame_tail *) regs->ARM_fp) - 1;
-
-	if (!user_mode(regs)) {
-		struct stackframe frame;
-		arm_get_current_stackframe(regs, &frame);
-		walk_stackframe(&frame, report_trace, &depth);
-		return;
-	}
-
-	while (depth-- && tail && !((unsigned long) tail & 3))
-		tail = user_backtrace(tail);
-}
-
-int __init oprofile_arch_init(struct oprofile_operations *ops)
-{
-	/* provide backtrace support also in timer mode: */
-	ops->backtrace		= arm_backtrace;
-
-	return oprofile_perf_init(ops);
-}
-
-void oprofile_arch_exit(void)
-{
-	oprofile_perf_exit();
-}
-- 
2.25.0.rc1.19.g042ed3e048af

