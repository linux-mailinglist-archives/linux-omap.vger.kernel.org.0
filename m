Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80EC457CD2B
	for <lists+linux-omap@lfdr.de>; Thu, 21 Jul 2022 16:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbiGUOSK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 Jul 2022 10:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbiGUOSJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 21 Jul 2022 10:18:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 991E68048A
        for <linux-omap@vger.kernel.org>; Thu, 21 Jul 2022 07:18:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 40C3861F9E
        for <linux-omap@vger.kernel.org>; Thu, 21 Jul 2022 14:18:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 446A0C3411E;
        Thu, 21 Jul 2022 14:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658413087;
        bh=sLWNSKj65c7gGoeZUasGthe/98uRof/jHHgQ29ErGFY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Gs9LL/4rrP/BUm3K0heEOZIK0NWG726OVAHJx9kSDbgGbWUaVDGDo4q9f/BwQqUi2
         iL9G1S/5MtpuwD+mpwRGk71fiqITQsICtTuGBKCe/gATUDJpWI9/Z1y1u//6TxWW3W
         OZTQ2KHsbgRMkDAOhc9LPgeQv41oysnOJ/yTu+FE03QrOixYdXAIh5cXYCZUmchVMO
         nbMMJY3IKTZ5RIyrSQCLIOoguDl8Z1H+ftCIQaTFWdKMOquyucVIdYaCUHdGjBYWYF
         c/+M0TCM+hbSVTK2cc08+27UXYUB5RAaaqaxzz0lJV6ANgF7Qi7oMPL6nVUgjo/DgO
         4DbaMpNtTYExQ==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Subject: [PATCH 10/13] ARM: omap1: add Kconfig dependencies for unused boards
Date:   Thu, 21 Jul 2022 16:17:19 +0200
Message-Id: <20220721141722.2414719-11-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220721141722.2414719-1-arnd@kernel.org>
References: <20220721141722.2414719-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Legacy board files with no known users are planned to get removed in
early 2023, and this covers the majority of the omap1 boards as well.

According to Tony, the actual users are all on OSK, Nokia770, and
AMS-Delta. Additionally, the sx1 and palmte boards are supported by qemu,
which is convenient for testing, so all five stay around past the initial
board removal.

As omap1 is now part of the multiplatform build and uses the common-clk
framework, it has become easier to convert these to use devicetree
based booting in the future.

Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/configs/omap1_defconfig |  9 ---------
 arch/arm/mach-omap1/Kconfig      | 10 ++++++++++
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/arm/configs/omap1_defconfig b/arch/arm/configs/omap1_defconfig
index 3f72d2ff7644..54a9f50122af 100644
--- a/arch/arm/configs/omap1_defconfig
+++ b/arch/arm/configs/omap1_defconfig
@@ -25,17 +25,8 @@ CONFIG_ARCH_OMAP850=y
 CONFIG_ARCH_OMAP16XX=y
 # CONFIG_OMAP_MUX is not set
 CONFIG_OMAP_RESET_CLOCKS=y
-CONFIG_MACH_OMAP_INNOVATOR=y
-CONFIG_MACH_OMAP_H2=y
-CONFIG_MACH_OMAP_H3=y
-CONFIG_MACH_HERALD=y
 CONFIG_MACH_OMAP_OSK=y
-CONFIG_MACH_OMAP_PERSEUS2=y
-CONFIG_MACH_OMAP_FSAMPLE=y
-CONFIG_MACH_VOICEBLUE=y
 CONFIG_MACH_OMAP_PALMTE=y
-CONFIG_MACH_OMAP_PALMZ71=y
-CONFIG_MACH_OMAP_PALMTT=y
 CONFIG_MACH_SX1=y
 CONFIG_MACH_NOKIA770=y
 CONFIG_MACH_AMS_DELTA=y
diff --git a/arch/arm/mach-omap1/Kconfig b/arch/arm/mach-omap1/Kconfig
index cbeb2b3ba86e..538a960257cc 100644
--- a/arch/arm/mach-omap1/Kconfig
+++ b/arch/arm/mach-omap1/Kconfig
@@ -132,6 +132,7 @@ comment "OMAP Board Type"
 config MACH_OMAP_INNOVATOR
 	bool "TI Innovator"
 	depends on ARCH_OMAP15XX || ARCH_OMAP16XX
+	depends on UNUSED_BOARD_FILES
 	help
           TI OMAP 1510 or 1610 Innovator board support. Say Y here if you
           have such a board.
@@ -139,6 +140,7 @@ config MACH_OMAP_INNOVATOR
 config MACH_OMAP_H2
 	bool "TI H2 Support"
 	depends on ARCH_OMAP16XX
+	depends on UNUSED_BOARD_FILES
 	help
 	  TI OMAP 1610/1611B H2 board support. Say Y here if you have such
 	  a board.
@@ -146,6 +148,7 @@ config MACH_OMAP_H2
 config MACH_OMAP_H3
 	bool "TI H3 Support"
 	depends on ARCH_OMAP16XX
+	depends on UNUSED_BOARD_FILES
 	help
 	  TI OMAP 1710 H3 board support. Say Y here if you have such
 	  a board.
@@ -153,6 +156,7 @@ config MACH_OMAP_H3
 config MACH_HERALD
 	bool "HTC Herald"
 	depends on ARCH_OMAP850
+	depends on UNUSED_BOARD_FILES
 	help
 	  HTC Herald smartphone support (AKA T-Mobile Wing, ...)
 
@@ -166,6 +170,7 @@ config MACH_OMAP_OSK
 config OMAP_OSK_MISTRAL
 	bool "Mistral QVGA board Support"
 	depends on MACH_OMAP_OSK
+	depends on UNUSED_BOARD_FILES
 	help
 	  The OSK supports an optional add-on board with a Quarter-VGA
 	  touchscreen, PDA-ish buttons, a resume button, bicolor LED,
@@ -174,6 +179,7 @@ config OMAP_OSK_MISTRAL
 config MACH_OMAP_PERSEUS2
 	bool "TI Perseus2"
 	depends on ARCH_OMAP730
+	depends on UNUSED_BOARD_FILES
 	help
 	  Support for TI OMAP 730 Perseus2 board. Say Y here if you have such
 	  a board.
@@ -181,6 +187,7 @@ config MACH_OMAP_PERSEUS2
 config MACH_OMAP_FSAMPLE
 	bool "TI F-Sample"
 	depends on ARCH_OMAP730
+	depends on UNUSED_BOARD_FILES
 	help
 	  Support for TI OMAP 850 F-Sample board. Say Y here if you have such
 	  a board.
@@ -197,6 +204,7 @@ config MACH_OMAP_PALMTE
 config MACH_OMAP_PALMZ71
 	bool "Palm Zire71"
 	depends on ARCH_OMAP15XX
+	depends on UNUSED_BOARD_FILES
 	help
 	 Support for the Palm Zire71 PDA. To boot the kernel,
 	 you'll need a PalmOS compatible bootloader; check out
@@ -206,6 +214,7 @@ config MACH_OMAP_PALMZ71
 config MACH_OMAP_PALMTT
 	bool "Palm Tungsten|T"
 	depends on ARCH_OMAP15XX
+	depends on UNUSED_BOARD_FILES
 	help
 	  Support for the Palm Tungsten|T PDA. To boot the kernel, you'll
 	  need a PalmOS compatible bootloader (Garux); check out
@@ -246,6 +255,7 @@ config MACH_AMS_DELTA
 config MACH_OMAP_GENERIC
 	bool "Generic OMAP board"
 	depends on ARCH_OMAP15XX || ARCH_OMAP16XX
+	depends on UNUSED_BOARD_FILES
 	help
           Support for generic OMAP-1510, 1610 or 1710 board with
           no FPGA. Can be used as template for porting Linux to
-- 
2.29.2

