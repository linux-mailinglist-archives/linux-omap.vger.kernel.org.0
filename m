Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6042F7453
	for <lists+linux-omap@lfdr.de>; Fri, 15 Jan 2021 09:30:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730320AbhAOIaT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Jan 2021 03:30:19 -0500
Received: from muru.com ([72.249.23.125]:44952 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730067AbhAOIaT (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 15 Jan 2021 03:30:19 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1C013805C;
        Fri, 15 Jan 2021 08:29:39 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: [PATCH] ARM: OMAP2+: Fix booting for am335x after moving to simple-pm-bus
Date:   Fri, 15 Jan 2021 10:29:36 +0200
Message-Id: <20210115082936.44923-1-tony@atomide.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We now depend on SIMPLE_PM_BUS for probing devices. While we have it
selected in omap2plus_defconfig, custom configs can fail if it's missing.

As SIMPLE_PM_BUS depends on OF and PM, we must now select them in Kconfig.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reported-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Fixes: 5a230524f879 ("ARM: dts: Use simple-pm-bus for genpd for am3 l4_wkup")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
--- a/arch/arm/mach-omap2/Kconfig
+++ b/arch/arm/mach-omap2/Kconfig
@@ -105,8 +105,10 @@ config ARCH_OMAP2PLUS
 	select OMAP_DM_TIMER
 	select OMAP_GPMC
 	select PINCTRL
+	select PM
 	select PM_GENERIC_DOMAINS if PM
 	select PM_GENERIC_DOMAINS_OF if PM
+	select SIMPLE_PM_BUS if OF && PM
 	select RESET_CONTROLLER
 	select SOC_BUS
 	select TI_SYSC
@@ -133,7 +135,6 @@ config ARCH_OMAP2PLUS_TYPICAL
 	select I2C_OMAP
 	select MENELAUS if ARCH_OMAP2
 	select NEON if CPU_V7
-	select PM
 	select REGULATOR
 	select REGULATOR_FIXED_VOLTAGE
 	select TWL4030_CORE if ARCH_OMAP3 || ARCH_OMAP4
-- 
2.30.0
