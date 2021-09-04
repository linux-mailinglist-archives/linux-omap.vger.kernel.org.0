Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFC9E4008A1
	for <lists+linux-omap@lfdr.de>; Sat,  4 Sep 2021 02:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350665AbhIDAG4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 3 Sep 2021 20:06:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350810AbhIDAGy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 3 Sep 2021 20:06:54 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94496C061757
        for <linux-omap@vger.kernel.org>; Fri,  3 Sep 2021 17:05:53 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id e5-20020a255005000000b0059eef58e1eeso913565ybb.19
        for <linux-omap@vger.kernel.org>; Fri, 03 Sep 2021 17:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=SfbHJEWQeRliBoQsEhXHv1u4n2Ik1OMNCo9r1o66Q/M=;
        b=GZ0vA80A2Z6y+ef/rz+ER1DjhGiMBo8Unx54I5q93wBFk5a1Z+4+yOIbK6F8i6ml2Z
         huiMjvHV8w71Q3r8BTQ/7TSElsFnHWLQDvxTnX+hKAiCZ254RixITRjqZ/IkeQDEa6Xa
         ZHq5gAWBcLx2sATUvcX6LCd5uJwhAibNyPK+H1uI1wDW2vOEQs5tun/Diez11Orwu/Mj
         2YGwWwNS6bgr7AHu7BQ0hkDZZcShVMOj8cb659TQVcsEXS6doanhqlsyn3p8XcHOx0/l
         7WZRAHbvWGlOrm6KJSi1Nlvvtq8mjZIHmKkwItCNckxL3rBNLO4+NL0/ug488Wqf9rZm
         Ud7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=SfbHJEWQeRliBoQsEhXHv1u4n2Ik1OMNCo9r1o66Q/M=;
        b=MGV9m6dhFNIS+ykvWMVRb8pQ/mfLMP+rTJ755OgVY0/tXKphayj/hqoZao/5olKolm
         aM058AAcXyb0nfIriIx3U2uXbunWZ1bmfd1Wdb+E1ONN8hb21xHrnw60QOlH8rxgGjOB
         4LxldzjvgOLL7CU1VZJ21qpRokrrWzcoBjvMy3tYdBbRWjXjuOP+AcFcYpnT30HxCLmx
         iIIpxgUQjA75RjFTnVvXBUosFI3nj9vneMnJ/Jzld9pHk6dMfNNjcpIPmnBnOC5bfix7
         HNrPMzsGbSllIOA8Rwxlq2N8qB41ERwiMroD+Imr34oMZ/gVieYkOC6hPRl5xu8nafek
         pkjg==
X-Gm-Message-State: AOAM5312Vcoi7yMPP1mPcrlE8HitRqrM1BfH408AXkYcp2oqY5MJ+GcQ
        rjhQGvuv/KrsJqHSx/imGD7ZTd1Pys3ZFNw=
X-Google-Smtp-Source: ABdhPJxMnuM52qVl21b48kLxkv3AyKumezraz5sUmqPRmVkkOO34LbbxoyfV+PPzFtSDDybtmhFrOnQR8bYDu7Y=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:b45b:ca56:952a:2176])
 (user=saravanak job=sendgmr) by 2002:a25:268c:: with SMTP id
 m134mr2133217ybm.298.1630713952840; Fri, 03 Sep 2021 17:05:52 -0700 (PDT)
Date:   Fri,  3 Sep 2021 17:05:42 -0700
In-Reply-To: <20210904000543.2019010-1-saravanak@google.com>
Message-Id: <20210904000543.2019010-3-saravanak@google.com>
Mime-Version: 1.0
References: <20210904000543.2019010-1-saravanak@google.com>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
Subject: [PATCH v3 2/2] drivers: bus: Delete CONFIG_SIMPLE_PM_BUS
From:   Saravana Kannan <saravanak@google.com>
To:     Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Saravana Kannan <saravanak@google.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, kernel-team@android.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The simple-pm-bus driver is mandatory for CONFIG_OF based platforms to
work with fw_devlink. So, always compile it in for CONFIG_OF and delete
the config since it's no longer necessary.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 arch/arm/configs/multi_v7_defconfig |  1 -
 arch/arm/configs/oxnas_v6_defconfig |  1 -
 arch/arm/configs/shmobile_defconfig |  1 -
 arch/arm/mach-omap2/Kconfig         |  1 -
 arch/arm64/configs/defconfig        |  1 -
 drivers/bus/Kconfig                 | 12 ------------
 drivers/bus/Makefile                |  2 +-
 drivers/soc/canaan/Kconfig          |  1 -
 8 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index d9abaae118dd..362720ae8d65 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -196,7 +196,6 @@ CONFIG_PCI_EPF_TEST=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_OMAP_OCP2SCP=y
-CONFIG_SIMPLE_PM_BUS=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
diff --git a/arch/arm/configs/oxnas_v6_defconfig b/arch/arm/configs/oxnas_v6_defconfig
index cae0db6b4eaf..de37f7e90999 100644
--- a/arch/arm/configs/oxnas_v6_defconfig
+++ b/arch/arm/configs/oxnas_v6_defconfig
@@ -46,7 +46,6 @@ CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_DMA_CMA=y
 CONFIG_CMA_SIZE_MBYTES=64
-CONFIG_SIMPLE_PM_BUS=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index d9a27e4e0914..18d2a960b2d2 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -40,7 +40,6 @@ CONFIG_PCI_RCAR_GEN2=y
 CONFIG_PCIE_RCAR_HOST=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_SIMPLE_PM_BUS=y
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_CFI=y
diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
index 7df8f5276ddf..02f2f3157f07 100644
--- a/arch/arm/mach-omap2/Kconfig
+++ b/arch/arm/mach-omap2/Kconfig
@@ -112,7 +112,6 @@ config ARCH_OMAP2PLUS
 	select PM_GENERIC_DOMAINS
 	select PM_GENERIC_DOMAINS_OF
 	select RESET_CONTROLLER
-	select SIMPLE_PM_BUS
 	select SOC_BUS
 	select TI_SYSC
 	select OMAP_IRQCHIP
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f423d08b9a71..474b1f2e3f06 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -245,7 +245,6 @@ CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_FW_LOADER_USER_HELPER=y
 CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
 CONFIG_HISILICON_LPC=y
-CONFIG_SIMPLE_PM_BUS=y
 CONFIG_FSL_MC_BUS=y
 CONFIG_TEGRA_ACONNECT=m
 CONFIG_GNSS=m
diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index e7f7eee6ee9a..dc3801369488 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -141,18 +141,6 @@ config QCOM_EBI2
 	  Interface 2, which can be used to connect things like NAND Flash,
 	  SRAM, ethernet adapters, FPGAs and LCD displays.
 
-config SIMPLE_PM_BUS
-	tristate "Simple Power-Managed Bus Driver"
-	depends on OF && PM
-	help
-	  Driver for transparent busses that don't need a real driver, but
-	  where the bus controller is part of a PM domain, or under the control
-	  of a functional clock, and thus relies on runtime PM for managing
-	  this PM domain and/or clock.
-	  An example of such a bus controller is the Renesas Bus State
-	  Controller (BSC, sometimes called "LBSC within Bus Bridge", or
-	  "External Bus Interface") as found on several Renesas ARM SoCs.
-
 config SUN50I_DE2_BUS
 	bool "Allwinner A64 DE2 Bus Driver"
 	  default ARM64
diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
index 397e35392bff..86aacd36a56d 100644
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@ -26,7 +26,7 @@ obj-$(CONFIG_OMAP_OCP2SCP)	+= omap-ocp2scp.o
 obj-$(CONFIG_QCOM_EBI2)		+= qcom-ebi2.o
 obj-$(CONFIG_SUN50I_DE2_BUS)	+= sun50i-de2.o
 obj-$(CONFIG_SUNXI_RSB)		+= sunxi-rsb.o
-obj-$(CONFIG_SIMPLE_PM_BUS)	+= simple-pm-bus.o
+obj-$(CONFIG_OF)		+= simple-pm-bus.o
 obj-$(CONFIG_TEGRA_ACONNECT)	+= tegra-aconnect.o
 obj-$(CONFIG_TEGRA_GMI)		+= tegra-gmi.o
 obj-$(CONFIG_TI_PWMSS)		+= ti-pwmss.o
diff --git a/drivers/soc/canaan/Kconfig b/drivers/soc/canaan/Kconfig
index 8179b69518b4..853096b7e84c 100644
--- a/drivers/soc/canaan/Kconfig
+++ b/drivers/soc/canaan/Kconfig
@@ -5,7 +5,6 @@ config SOC_K210_SYSCTL
 	depends on RISCV && SOC_CANAAN && OF
 	default SOC_CANAAN
         select PM
-        select SIMPLE_PM_BUS
         select SYSCON
         select MFD_SYSCON
 	help
-- 
2.33.0.153.gba50c8fa24-goog

