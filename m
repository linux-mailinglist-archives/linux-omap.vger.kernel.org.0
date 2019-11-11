Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2EC6F7982
	for <lists+linux-omap@lfdr.de>; Mon, 11 Nov 2019 18:10:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbfKKRKq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Nov 2019 12:10:46 -0500
Received: from antares.kleine-koenig.org ([94.130.110.236]:60020 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726845AbfKKRKq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 11 Nov 2019 12:10:46 -0500
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id 0747B82F315; Mon, 11 Nov 2019 18:10:43 +0100 (CET)
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: OMAP1: drop duplicated dependency on ARCH_OMAP1
Date:   Mon, 11 Nov 2019 18:10:34 +0100
Message-Id: <20191111171034.28896-1-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

All of arch/arm/mach-omap1/Kconfig is enclosed in a big "if ARCH_OMAP1"
and so every symbol already has a dependency on ARCH_OMAP1 even without
mentioning it in their list of dependencies.

Also dependencies on ARCH_OMAP can be dropped as it is selected by
ARCH_OMAP1.

Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
 arch/arm/mach-omap1/Kconfig | 33 +++++++++++++--------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/arch/arm/mach-omap1/Kconfig b/arch/arm/mach-omap1/Kconfig
index 2a17dc1d122c..948da556162e 100644
--- a/arch/arm/mach-omap1/Kconfig
+++ b/arch/arm/mach-omap1/Kconfig
@@ -4,30 +4,25 @@ if ARCH_OMAP1
 menu "TI OMAP1 specific features"
 
 comment "OMAP Core Type"
-	depends on ARCH_OMAP1
 
 config ARCH_OMAP730
-	depends on ARCH_OMAP1
 	bool "OMAP730 Based System"
 	select ARCH_OMAP_OTG
 	select CPU_ARM926T
 	select OMAP_MPU_TIMER
 
 config ARCH_OMAP850
-	depends on ARCH_OMAP1
 	bool "OMAP850 Based System"
 	select ARCH_OMAP_OTG
 	select CPU_ARM926T
 
 config ARCH_OMAP15XX
-	depends on ARCH_OMAP1
 	default y
 	bool "OMAP15xx Based System"
 	select CPU_ARM925T
 	select OMAP_MPU_TIMER
 
 config ARCH_OMAP16XX
-	depends on ARCH_OMAP1
 	bool "OMAP16xx Based System"
 	select ARCH_OMAP_OTG
 	select CPU_ARM926T
@@ -35,7 +30,6 @@ config ARCH_OMAP16XX
 
 config OMAP_MUX
 	bool "OMAP multiplexing support"
-	depends on ARCH_OMAP
 	default y
 	help
 	  Pin multiplexing support for OMAP boards. If your bootloader
@@ -60,25 +54,24 @@ config OMAP_MUX_WARNINGS
 	  printed, it's safe to deselect OMAP_MUX for your product.
 
 comment "OMAP Board Type"
-	depends on ARCH_OMAP1
 
 config MACH_OMAP_INNOVATOR
 	bool "TI Innovator"
-	depends on ARCH_OMAP1 && (ARCH_OMAP15XX || ARCH_OMAP16XX)
+	depends on ARCH_OMAP15XX || ARCH_OMAP16XX
 	help
           TI OMAP 1510 or 1610 Innovator board support. Say Y here if you
           have such a board.
 
 config MACH_OMAP_H2
 	bool "TI H2 Support"
-	depends on ARCH_OMAP1 && ARCH_OMAP16XX
+	depends on ARCH_OMAP16XX
     	help
 	  TI OMAP 1610/1611B H2 board support. Say Y here if you have such
 	  a board.
 
 config MACH_OMAP_H3
 	bool "TI H3 Support"
-	depends on ARCH_OMAP1 && ARCH_OMAP16XX
+	depends on ARCH_OMAP16XX
     	help
 	  TI OMAP 1710 H3 board support. Say Y here if you have such
 	  a board.
@@ -91,7 +84,7 @@ config MACH_HERALD
 
 config MACH_OMAP_OSK
 	bool "TI OSK Support"
-	depends on ARCH_OMAP1 && ARCH_OMAP16XX
+	depends on ARCH_OMAP16XX
     	help
 	  TI OMAP 5912 OSK (OMAP Starter Kit) board support. Say Y here
           if you have such a board.
@@ -106,21 +99,21 @@ config OMAP_OSK_MISTRAL
 
 config MACH_OMAP_PERSEUS2
 	bool "TI Perseus2"
-	depends on ARCH_OMAP1 && ARCH_OMAP730
+	depends on ARCH_OMAP730
     	help
 	  Support for TI OMAP 730 Perseus2 board. Say Y here if you have such
 	  a board.
 
 config MACH_OMAP_FSAMPLE
 	bool "TI F-Sample"
-	depends on ARCH_OMAP1 && ARCH_OMAP730
+	depends on ARCH_OMAP730
     	help
 	  Support for TI OMAP 850 F-Sample board. Say Y here if you have such
 	  a board.
 
 config MACH_OMAP_PALMTE
 	bool "Palm Tungsten E"
-	depends on ARCH_OMAP1 && ARCH_OMAP15XX
+	depends on ARCH_OMAP15XX
 	help
 	  Support for the Palm Tungsten E PDA.  To boot the kernel, you'll
 	  need a PalmOS compatible bootloader; check out
@@ -129,7 +122,7 @@ config MACH_OMAP_PALMTE
 
 config MACH_OMAP_PALMZ71
 	bool "Palm Zire71"
-	depends on ARCH_OMAP1 && ARCH_OMAP15XX
+	depends on ARCH_OMAP15XX
 	help
 	 Support for the Palm Zire71 PDA. To boot the kernel,
 	 you'll need a PalmOS compatible bootloader; check out
@@ -138,7 +131,7 @@ config MACH_OMAP_PALMZ71
 
 config MACH_OMAP_PALMTT
 	bool "Palm Tungsten|T"
-	depends on ARCH_OMAP1 && ARCH_OMAP15XX
+	depends on ARCH_OMAP15XX
 	help
 	  Support for the Palm Tungsten|T PDA. To boot the kernel, you'll
 	  need a PalmOS compatible bootloader (Garux); check out
@@ -147,7 +140,7 @@ config MACH_OMAP_PALMTT
 
 config MACH_SX1
 	bool "Siemens SX1"
-	depends on ARCH_OMAP1 && ARCH_OMAP15XX
+	depends on ARCH_OMAP15XX
 	select I2C
 	help
 	  Support for the Siemens SX1 phone. To boot the kernel,
@@ -159,14 +152,14 @@ config MACH_SX1
 
 config MACH_NOKIA770
 	bool "Nokia 770"
-	depends on ARCH_OMAP1 && ARCH_OMAP16XX
+	depends on ARCH_OMAP16XX
 	help
 	  Support for the Nokia 770 Internet Tablet. Say Y here if you
 	  have such a device.
 
 config MACH_AMS_DELTA
 	bool "Amstrad E3 (Delta)"
-	depends on ARCH_OMAP1 && ARCH_OMAP15XX
+	depends on ARCH_OMAP15XX
 	select FIQ
 	select GPIO_GENERIC_PLATFORM
 	select LEDS_GPIO_REGISTER
@@ -178,7 +171,7 @@ config MACH_AMS_DELTA
 
 config MACH_OMAP_GENERIC
 	bool "Generic OMAP board"
-	depends on ARCH_OMAP1 && (ARCH_OMAP15XX || ARCH_OMAP16XX)
+	depends on ARCH_OMAP15XX || ARCH_OMAP16XX
 	help
           Support for generic OMAP-1510, 1610 or 1710 board with
           no FPGA. Can be used as template for porting Linux to
-- 
2.23.0

