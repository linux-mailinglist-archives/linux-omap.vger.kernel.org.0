Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C234F22BF9A
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 09:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726904AbgGXHlk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 03:41:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:35012 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726835AbgGXHlj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Jul 2020 03:41:39 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9D86620771;
        Fri, 24 Jul 2020 07:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595576499;
        bh=ql0CHegasFSQGJgvTSSp9JSCFehu4rCFn5R0ye++nJ0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qwx8yX0qlsoRoU5lOSPa8Vqp7zJm6l/SDXLx3O2EOmgpKE4QSpFABMG7Y/f9FVkXI
         qlCgUU/Lit0ee3EhKQSl0YMqiyiJ+q4za5lircu2Lh24rWlUOrkzIYXpTvg28hRaw2
         dyjJzixNg3OXmDwYIlvqjPRVehasmb8CZy8M9y8E=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Markus Mayer <mmayer@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Roger Quadros <rogerq@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Kukjin Kim <kgene@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 06/29] memory: Enable compile testing for most of the drivers
Date:   Fri, 24 Jul 2020 09:40:15 +0200
Message-Id: <20200724074038.5597-7-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Most of the memory controller drivers do not depend on architecture
specific code so can be compile tested to increase build coverage.

When compile tested, do not enable them by default.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. When compile tested, do not enable them by default.
---
 drivers/memory/Kconfig | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index 5a225ca66c4e..c37752d5f26d 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -26,8 +26,9 @@ config ARM_PL172_MPMC
 
 config ATMEL_SDRAMC
 	bool "Atmel (Multi-port DDR-)SDRAM Controller"
-	default y
-	depends on ARCH_AT91 && OF
+	default y if ARCH_AT91
+	depends on ARCH_AT91 || COMPILE_TEST
+	depends on OF
 	help
 	  This driver is for Atmel SDRAM Controller or Atmel Multi-port
 	  DDR-SDRAM Controller available on Atmel AT91SAM9 and SAMA5 SoCs.
@@ -36,8 +37,9 @@ config ATMEL_SDRAMC
 
 config ATMEL_EBI
 	bool "Atmel EBI driver"
-	default y
-	depends on ARCH_AT91 && OF
+	default y if ARCH_AT91
+	depends on ARCH_AT91 || COMPILE_TEST
+	depends on OF
 	select MFD_SYSCON
 	select MFD_ATMEL_SMC
 	help
@@ -59,7 +61,8 @@ config BT1_L2_CTL
 
 config TI_AEMIF
 	tristate "Texas Instruments AEMIF driver"
-	depends on (ARCH_DAVINCI || ARCH_KEYSTONE) && OF
+	depends on ARCH_DAVINCI || ARCH_KEYSTONE || COMPILE_TEST
+	depends on OF
 	help
 	  This driver is for the AEMIF module available in Texas Instruments
 	  SoCs. AEMIF stands for Asynchronous External Memory Interface and
@@ -70,7 +73,7 @@ config TI_AEMIF
 
 config TI_EMIF
 	tristate "Texas Instruments EMIF driver"
-	depends on ARCH_OMAP2PLUS
+	depends on ARCH_OMAP2PLUS || COMPILE_TEST
 	select DDR
 	help
 	  This driver is for the EMIF module available in Texas Instruments
@@ -82,7 +85,7 @@ config TI_EMIF
 	  temperature changes
 
 config OMAP_GPMC
-	bool
+	bool "Texas Instruments OMAP SoC GPMC driver" if COMPILE_TEST
 	select GPIOLIB
 	help
 	  This driver is for the General Purpose Memory Controller (GPMC)
@@ -106,7 +109,8 @@ config OMAP_GPMC_DEBUG
 
 config TI_EMIF_SRAM
 	tristate "Texas Instruments EMIF SRAM driver"
-	depends on (SOC_AM33XX || SOC_AM43XX) && SRAM
+	depends on SOC_AM33XX || SOC_AM43XX || (ARM && COMPILE_TEST)
+	depends on SRAM
 	help
 	  This driver is for the EMIF module available on Texas Instruments
 	  AM33XX and AM43XX SoCs and is required for PM. Certain parts of
@@ -116,8 +120,9 @@ config TI_EMIF_SRAM
 
 config MVEBU_DEVBUS
 	bool "Marvell EBU Device Bus Controller"
-	default y
-	depends on PLAT_ORION && OF
+	default y if PLAT_ORION
+	depends on PLAT_ORION || COMPILE_TEST
+	depends on OF
 	help
 	  This driver is for the Device Bus controller available in some
 	  Marvell EBU SoCs such as Discovery (mv78xx0), Orion (88f5xxx) and
@@ -126,7 +131,7 @@ config MVEBU_DEVBUS
 
 config FSL_CORENET_CF
 	tristate "Freescale CoreNet Error Reporting"
-	depends on FSL_SOC_BOOKE
+	depends on FSL_SOC_BOOKE || COMPILE_TEST
 	help
 	  Say Y for reporting of errors from the Freescale CoreNet
 	  Coherency Fabric.  Errors reported include accesses to
@@ -135,7 +140,7 @@ config FSL_CORENET_CF
 	  represents a coherency violation.
 
 config FSL_IFC
-	bool
+	bool "Freescale IFC driver" if COMPILE_TEST
 	depends on FSL_SOC || ARCH_LAYERSCAPE || SOC_LS1021A || COMPILE_TEST
 	depends on HAS_IOMEM
 
@@ -150,7 +155,7 @@ config JZ4780_NEMC
 	  memory devices such as NAND and SRAM.
 
 config MTK_SMI
-	bool
+	bool "Mediatek SoC Memory Controller driver" if COMPILE_TEST
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	help
 	  This driver is for the Memory Controller module in MediaTek SoCs,
@@ -159,7 +164,7 @@ config MTK_SMI
 
 config DA8XX_DDRCTL
 	bool "Texas Instruments da8xx DDR2/mDDR driver"
-	depends on ARCH_DAVINCI_DA8XX
+	depends on ARCH_DAVINCI_DA8XX || COMPILE_TEST
 	help
 	  This driver is for the DDR2/mDDR Memory Controller present on
 	  Texas Instruments da8xx SoCs. It's used to tweak various memory
@@ -167,16 +172,16 @@ config DA8XX_DDRCTL
 
 config PL353_SMC
 	tristate "ARM PL35X Static Memory Controller(SMC) driver"
-	default y
+	default y if ARM
 	depends on ARM
-	depends on ARM_AMBA
+	depends on ARM_AMBA || COMPILE_TEST
 	help
 	  This driver is for the ARM PL351/PL353 Static Memory
 	  Controller(SMC) module.
 
 config RENESAS_RPCIF
 	tristate "Renesas RPC-IF driver"
-	depends on ARCH_RENESAS
+	depends on ARCH_RENESAS || COMPILE_TEST
 	select REGMAP_MMIO
 	help
 	  This supports Renesas R-Car Gen3 RPC-IF which provides either SPI
-- 
2.17.1

