Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 131A210491B
	for <lists+linux-omap@lfdr.de>; Thu, 21 Nov 2019 04:20:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbfKUDUd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 20 Nov 2019 22:20:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:34218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726784AbfKUDUd (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 20 Nov 2019 22:20:33 -0500
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 02BFE208CE;
        Thu, 21 Nov 2019 03:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574306431;
        bh=ftRET4RNb6kAqNE39N3HuUbJnQ5P1/hxqDOIlBh9dmI=;
        h=From:To:Cc:Subject:Date:From;
        b=SlLX/4ELrvuP5iZEtDHk8IunpjiQ7KaWkPHIAiGlmcgRm3XzTIeLmBT3AteDQc1rH
         g1IBW2vDXTp7qot0Z3gTBdgYx+8f4/3TO88w5cNUQ6XjAG1ioTDBoeoAXCOw6RjY/F
         DjMxLO1RAzu2M5LRxUAUKZ7iSQpDMJrq+1n9+tSk=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Barry Song <baohua@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2] ARM: Fix Kconfig indentation
Date:   Thu, 21 Nov 2019 04:20:25 +0100
Message-Id: <1574306426-25221-1-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
	$ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com> # for EP93xx

---

Changes since v1:
1. Fix also 7-space and tab+1 space indentation issues.
---
 arch/arm/Kconfig              | 14 +++++++-------
 arch/arm/Kconfig-nommu        | 18 +++++++++---------
 arch/arm/Kconfig.debug        |  4 ++--
 arch/arm/mach-ep93xx/Kconfig  |  8 ++++----
 arch/arm/mach-ixp4xx/Kconfig  | 16 ++++++++--------
 arch/arm/mach-mmp/Kconfig     |  2 +-
 arch/arm/mach-omap1/Kconfig   | 14 +++++++-------
 arch/arm/mach-omap2/Kconfig   | 12 ++++++------
 arch/arm/mach-prima2/Kconfig  |  6 +++---
 arch/arm/mach-s3c24xx/Kconfig | 10 +++++-----
 arch/arm/mach-s3c64xx/Kconfig |  8 ++++----
 arch/arm/plat-samsung/Kconfig |  8 ++++----
 12 files changed, 60 insertions(+), 60 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 9771b56e79f1..4b3f8bca96cf 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1015,9 +1015,9 @@ config ARM_ERRATA_764369
 	  in the diagnostic control register of the SCU.
 
 config ARM_ERRATA_775420
-       bool "ARM errata: A data cache maintenance operation which aborts, might lead to deadlock"
-       depends on CPU_V7
-       help
+	bool "ARM errata: A data cache maintenance operation which aborts, might lead to deadlock"
+	depends on CPU_V7
+	help
 	 This option enables the workaround for the 775420 Cortex-A9 (r2p2,
 	 r2p6,r2p8,r2p10,r3p0) erratum. In case a data cache maintenance
 	 operation aborts with MMU exception, it might cause the processor
@@ -1573,12 +1573,12 @@ config HW_PERF_EVENTS
 	depends on ARM_PMU
 
 config SYS_SUPPORTS_HUGETLBFS
-       def_bool y
-       depends on ARM_LPAE
+	def_bool y
+	depends on ARM_LPAE
 
 config HAVE_ARCH_TRANSPARENT_HUGEPAGE
-       def_bool y
-       depends on ARM_LPAE
+	def_bool y
+	depends on ARM_LPAE
 
 config ARCH_WANT_GENERAL_HUGETLB
 	def_bool y
diff --git a/arch/arm/Kconfig-nommu b/arch/arm/Kconfig-nommu
index 36c80d3dd93f..3eae40d7b51b 100644
--- a/arch/arm/Kconfig-nommu
+++ b/arch/arm/Kconfig-nommu
@@ -54,13 +54,13 @@ config REMAP_VECTORS_TO_RAM
 	  the writable versions located at DRAM_BASE.
 
 config ARM_MPU
-       bool 'Use the ARM v7 PMSA Compliant MPU'
-       depends on CPU_V7 || CPU_V7M
-       default y if CPU_V7
-       help
-         Some ARM systems without an MMU have instead a Memory Protection
-         Unit (MPU) that defines the type and permissions for regions of
-         memory.
+	bool 'Use the ARM v7 PMSA Compliant MPU'
+	depends on CPU_V7 || CPU_V7M
+	default y if CPU_V7
+	help
+	 Some ARM systems without an MMU have instead a Memory Protection
+	 Unit (MPU) that defines the type and permissions for regions of
+	 memory.
 
-         If your CPU has an MPU then you should choose 'y' here unless you
-         know that you do not want to use the MPU.
+	 If your CPU has an MPU then you should choose 'y' here unless you
+	 know that you do not want to use the MPU.
diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 8bcbd0cd739b..0e5d52fbddbd 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -274,7 +274,7 @@ choice
 		select DEBUG_UART_8250
 		help
 		  Say Y here if you want the debug print routines to direct
-                  their output to the CNS3xxx UART0.
+	          their output to the CNS3xxx UART0.
 
 	config DEBUG_DAVINCI_DA8XX_UART1
 		bool "Kernel low-level debugging on DaVinci DA8XX using UART1"
@@ -828,7 +828,7 @@ choice
 		select DEBUG_UART_8250
 		help
 		  Say Y here if you want kernel low-level debugging support
-                  on Rockchip RV1108 based platforms.
+	          on Rockchip RV1108 based platforms.
 
 	config DEBUG_RV1108_UART1
 		bool "Kernel low-level debugging messages via Rockchip RV1108 UART1"
diff --git a/arch/arm/mach-ep93xx/Kconfig b/arch/arm/mach-ep93xx/Kconfig
index f2db5fd38145..bf81dfab7f1b 100644
--- a/arch/arm/mach-ep93xx/Kconfig
+++ b/arch/arm/mach-ep93xx/Kconfig
@@ -126,10 +126,10 @@ config MACH_MICRO9S
 	  Contec Micro9-Slim board.
 
 config MACH_SIM_ONE
-        bool "Support Simplemachines Sim.One board"
-        help
-          Say 'Y' here if you want your kernel to support the
-          Simplemachines Sim.One board.
+	bool "Support Simplemachines Sim.One board"
+	help
+	  Say 'Y' here if you want your kernel to support the
+	  Simplemachines Sim.One board.
 
 config MACH_SNAPPER_CL15
 	bool "Support Bluewater Systems Snapper CL15 Module"
diff --git a/arch/arm/mach-ixp4xx/Kconfig b/arch/arm/mach-ixp4xx/Kconfig
index f7211b57b1e7..484e8eb16baa 100644
--- a/arch/arm/mach-ixp4xx/Kconfig
+++ b/arch/arm/mach-ixp4xx/Kconfig
@@ -214,14 +214,14 @@ config IXP4XX_INDIRECT_PCI
 	bool "Use indirect PCI memory access"
 	depends on PCI
 	help
-          IXP4xx provides two methods of accessing PCI memory space:
-
-          1) A direct mapped window from 0x48000000 to 0x4BFFFFFF (64MB).
-             To access PCI via this space, we simply ioremap() the BAR
-             into the kernel and we can use the standard read[bwl]/write[bwl]
-             macros. This is the preferred method due to speed but it
-             limits the system to just 64MB of PCI memory. This can be
-             problematic if using video cards and other memory-heavy devices.
+	  IXP4xx provides two methods of accessing PCI memory space:
+
+	  1) A direct mapped window from 0x48000000 to 0x4BFFFFFF (64MB).
+	     To access PCI via this space, we simply ioremap() the BAR
+	     into the kernel and we can use the standard read[bwl]/write[bwl]
+	     macros. This is the preferred method due to speed but it
+	     limits the system to just 64MB of PCI memory. This can be
+	     problematic if using video cards and other memory-heavy devices.
 
 	  2) If > 64MB of memory space is required, the IXP4xx can be
 	     configured to use indirect registers to access the whole PCI
diff --git a/arch/arm/mach-mmp/Kconfig b/arch/arm/mach-mmp/Kconfig
index b58a03b18bde..1192aaaf5e90 100644
--- a/arch/arm/mach-mmp/Kconfig
+++ b/arch/arm/mach-mmp/Kconfig
@@ -168,7 +168,7 @@ config CPU_MMP2
 	  Select code specific to MMP2. MMP2 is ARMv7 compatible.
 
 config USB_EHCI_MV_U2O
-        bool "EHCI support for PXA USB OTG controller"
+	bool "EHCI support for PXA USB OTG controller"
 	depends on USB_EHCI_MV
 	help
 	  Enables support for OTG controller which can be switched to host mode.
diff --git a/arch/arm/mach-omap1/Kconfig b/arch/arm/mach-omap1/Kconfig
index 948da556162e..d169efee7402 100644
--- a/arch/arm/mach-omap1/Kconfig
+++ b/arch/arm/mach-omap1/Kconfig
@@ -59,8 +59,8 @@ config MACH_OMAP_INNOVATOR
 	bool "TI Innovator"
 	depends on ARCH_OMAP15XX || ARCH_OMAP16XX
 	help
-          TI OMAP 1510 or 1610 Innovator board support. Say Y here if you
-          have such a board.
+	  TI OMAP 1510 or 1610 Innovator board support. Say Y here if you
+	  have such a board.
 
 config MACH_OMAP_H2
 	bool "TI H2 Support"
@@ -87,7 +87,7 @@ config MACH_OMAP_OSK
 	depends on ARCH_OMAP16XX
     	help
 	  TI OMAP 5912 OSK (OMAP Starter Kit) board support. Say Y here
-          if you have such a board.
+	  if you have such a board.
 
 config OMAP_OSK_MISTRAL
 	bool "Mistral QVGA board Support"
@@ -173,10 +173,10 @@ config MACH_OMAP_GENERIC
 	bool "Generic OMAP board"
 	depends on ARCH_OMAP15XX || ARCH_OMAP16XX
 	help
-          Support for generic OMAP-1510, 1610 or 1710 board with
-          no FPGA. Can be used as template for porting Linux to
-          custom OMAP boards. Say Y here if you have a custom
-          board.
+	  Support for generic OMAP-1510, 1610 or 1710 board with
+	  no FPGA. Can be used as template for porting Linux to
+	  custom OMAP boards. Say Y here if you have a custom
+	  board.
 
 endmenu
 
diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
index ad08d470a2ca..8a218c2b71e1 100644
--- a/arch/arm/mach-omap2/Kconfig
+++ b/arch/arm/mach-omap2/Kconfig
@@ -176,16 +176,16 @@ config SOC_TI81XX
 	default y
 
 config OMAP_PACKAGE_CBC
-       bool
+	bool
 
 config OMAP_PACKAGE_CBB
-       bool
+	bool
 
 config OMAP_PACKAGE_CUS
-       bool
+	bool
 
 config OMAP_PACKAGE_CBP
-       bool
+	bool
 
 comment "OMAP Legacy Platform Data Board Type"
 	depends on ARCH_OMAP2PLUS
@@ -210,10 +210,10 @@ config MACH_OMAP3_PANDORA
 	select OMAP_PACKAGE_CBB
 
 config MACH_NOKIA_N810
-       bool
+	bool
 
 config MACH_NOKIA_N810_WIMAX
-       bool
+	bool
 
 config MACH_NOKIA_N8X0
 	bool "Nokia N800/N810"
diff --git a/arch/arm/mach-prima2/Kconfig b/arch/arm/mach-prima2/Kconfig
index 6f66785fab01..88a76d265fd9 100644
--- a/arch/arm/mach-prima2/Kconfig
+++ b/arch/arm/mach-prima2/Kconfig
@@ -22,7 +22,7 @@ config ARCH_ATLAS6
 	default y
 	select SIRF_IRQ
 	help
-          Support for CSR SiRFSoC ARM Cortex A9 Platform
+	  Support for CSR SiRFSoC ARM Cortex A9 Platform
 
 config ARCH_ATLAS7
 	bool "CSR SiRFSoC ATLAS7 ARM Cortex A7 Platform"
@@ -32,7 +32,7 @@ config ARCH_ATLAS7
 	select HAVE_ARM_SCU if SMP
 	select HAVE_SMP
 	help
-          Support for CSR SiRFSoC ARM Cortex A7 Platform
+	  Support for CSR SiRFSoC ARM Cortex A7 Platform
 
 config ARCH_PRIMA2
 	bool "CSR SiRFSoC PRIMA2 ARM Cortex A9 Platform"
@@ -41,7 +41,7 @@ config ARCH_PRIMA2
 	select ZONE_DMA
 	select PRIMA2_TIMER
 	help
-          Support for CSR SiRFSoC ARM Cortex A9 Platform
+	  Support for CSR SiRFSoC ARM Cortex A9 Platform
 
 config SIRF_IRQ
 	bool
diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kconfig
index 686f0bbde998..0e25471ca47c 100644
--- a/arch/arm/mach-s3c24xx/Kconfig
+++ b/arch/arm/mach-s3c24xx/Kconfig
@@ -138,11 +138,11 @@ config S3C2410_IOTIMING
 	  and s3c2440/s3c2442 cpu frequency support.
 
 config S3C2410_CPUFREQ_UTILS
-       bool
-       depends on ARM_S3C24XX_CPUFREQ
-       help
-         Internal node to select timing code that is common to the s3c2410
-         and s3c2440/s3c244 cpu frequency support.
+	bool
+	depends on ARM_S3C24XX_CPUFREQ
+	help
+	 Internal node to select timing code that is common to the s3c2410
+	 and s3c2440/s3c244 cpu frequency support.
 
 # cpu frequency support common to s3c2412, s3c2413 and s3c2442
 
diff --git a/arch/arm/mach-s3c64xx/Kconfig b/arch/arm/mach-s3c64xx/Kconfig
index 5700822e3c74..385c5cbe74d2 100644
--- a/arch/arm/mach-s3c64xx/Kconfig
+++ b/arch/arm/mach-s3c64xx/Kconfig
@@ -110,7 +110,7 @@ config S3C64XX_SETUP_USB_PHY
 # S36400 Macchine support
 
 config MACH_SMDK6400
-       bool "SMDK6400"
+	bool "SMDK6400"
 	depends on ATAGS
 	select CPU_S3C6400
 	select S3C64XX_SETUP_SDHCI
@@ -202,7 +202,7 @@ config SMDK6410_SD_CH0
 	bool "Use channel 0 only"
 	depends on MACH_SMDK6410
 	help
-          Select CON7 (channel 0) as the MMC/SD slot, as
+	  Select CON7 (channel 0) as the MMC/SD slot, as
 	  at least some SMDK6410 boards come with the
 	  resistors fitted so that the card detects for
 	  channels 0 and 1 are the same.
@@ -211,7 +211,7 @@ config SMDK6410_SD_CH1
 	bool "Use channel 1 only"
 	depends on MACH_SMDK6410
 	help
-          Select CON6 (channel 1) as the MMC/SD slot, as
+	  Select CON6 (channel 1) as the MMC/SD slot, as
 	  at least some SMDK6410 boards come with the
 	  resistors fitted so that the card detects for
 	  channels 0 and 1 are the same.
@@ -257,7 +257,7 @@ config MACH_NCP
 	select S3C_DEV_HSMMC1
 	select S3C_DEV_I2C1
 	help
-          Machine support for the Samsung NCP
+	  Machine support for the Samsung NCP
 
 config MACH_HMT
 	bool "Airgoo HMT"
diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index 301e572651c0..76bbe0273242 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -247,10 +247,10 @@ config SAMSUNG_PM_DEBUG
 	  for more information.
 
 config S3C_PM_DEBUG_LED_SMDK
-       bool "SMDK LED suspend/resume debugging"
-       depends on PM && (MACH_SMDK6410)
-       help
-         Say Y here to enable the use of the SMDK LEDs on the baseboard
+	bool "SMDK LED suspend/resume debugging"
+	depends on PM && (MACH_SMDK6410)
+	help
+	 Say Y here to enable the use of the SMDK LEDs on the baseboard
 	 for debugging of the state of the suspend and resume process.
 
 	 Note, this currently only works for S3C64XX based SMDK boards.
-- 
2.7.4

