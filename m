Return-Path: <linux-omap+bounces-4651-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC89EBB384E
	for <lists+linux-omap@lfdr.de>; Thu, 02 Oct 2025 11:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 618D53BB99D
	for <lists+linux-omap@lfdr.de>; Thu,  2 Oct 2025 09:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9539F305970;
	Thu,  2 Oct 2025 09:53:28 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510882E2DF4;
	Thu,  2 Oct 2025 09:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759398808; cv=none; b=RSXynEWBvjh1593tf4Zg4Io0bInKANoOpwJdPG1B6k35X9NGaT8l9FfqfKlNoCSC/IRQ/Y7uBbIDheqTQcQ7igki+oqaFWJZjR2Hjgdi5HD2Sro0cAkcL6zLBuIEsAU7doTwPXaxT2VBo3nCprzOBE9hjDKqlQhhIpiWrYgTQ4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759398808; c=relaxed/simple;
	bh=4kfuvC13t63S84C7ovIfJYDka4R+IiFQly82xuAWVE4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oCAO6tBc+WgYHppA/1n0BbdVwLK6s+2Y06qyEC5Prd1xaz59Ldbq5FNETHoGkoqCvhktdaASYU5mO6xlwPkc8BpqeO5j6aJDf3YcaEy/5jXVb4Gxb/6RaLpuxn/OvT0bOo1gIFcvB8HTERRxtDu2L5KJPRKK4iEG4YTRLj6HGwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06357C4CEF4;
	Thu,  2 Oct 2025 09:53:25 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Tony Lindgren <tony@atomide.com>,
	Bruno Thomsen <bruno.thomsen@gmail.com>,
	Judith Mendez <jm@ti.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: am33xx: Add missing serial console speed
Date: Thu,  2 Oct 2025 11:53:05 +0200
Message-ID: <63cef5c3643d359e8ec13366ca79377f12dd73b1.1759398641.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Without a serial console speed specified in chosen/stdout-path in the
DTB, the serial console uses the default speed of the serial driver,
unless explicitly overridden in a legacy console= kernel command-line
parameter.

After dropping "ti,omap3-uart" from the list of compatible values in DT,
AM33xx serial ports can no longer be used with the legacy OMAP serial
driver, but only with the OMAP-flavored 8250 serial driver (which is
mutually-exclusive with the former).  However, replacing
CONFIG_SERIAL_OMAP=y by CONFIG_SERIAL_8250_OMAP=y (with/without enabling
CONFIG_SERIAL_8250_OMAP_TTYO_FIXUP) may not be sufficient to restore
serial console functionality: the legacy OMAP serial driver defaults to
115200 bps, while the 8250 serial driver defaults to 9600 bps, causing
no visible output on the serial console when no appropriate console=
kernel command-line parameter is specified.

Fix this for all AM33xx boards by adding ":115200n8" to
chosen/stdout-path.  This requires replacing the "&uartN" reference by
the corresponding "serialN" DT alias.

Fixes: ca8be8fc2c306efb ("ARM: dts: am33xx-l4: fix UART compatible")
Fixes: 077e1cde78c3f904 ("ARM: omap2plus_defconfig: Enable 8250_OMAP")
Closes: https://lore.kernel.org/CAMuHMdUb7Jb2=GqK3=Rn+Gv5G9KogcQieqDvjDCkJA4zyX4VcA@mail.gmail.com
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested on BeagleBone Black.
I only updated DTS files affected by commit ca8be8fc2c306efb.
Probably more DTS files for other SoCs should be updated, too.
---
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi   | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-boneblue.dts       | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts     | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-evm.dts            | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-evmsk.dts          | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-guardian.dts       | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-icev2.dts          | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts   | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts         | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts   | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-sl50.dts           | 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi b/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
index ad1e60a9b6fde8f9..b75dabfa56ae7605 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
@@ -16,7 +16,7 @@ memory@80000000 {
 	};
 
 	chosen {
-		stdout-path = &uart0;
+		stdout-path = "serial0:115200n8";
 	};
 
 	leds {
diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts b/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
index f579df4c2c540dd7..d430f0bef1653782 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
@@ -13,7 +13,7 @@ / {
 	compatible = "ti,am335x-bone-blue", "ti,am33xx";
 
 	chosen {
-		stdout-path = &uart0;
+		stdout-path = "serial0:115200n8";
 	};
 
 	leds {
diff --git a/arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts b/arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts
index 648e97fe1dfd5e5b..ae5bc589849722f5 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts
@@ -12,7 +12,7 @@ / {
 		     "ti,am33xx";
 
 	chosen {
-		stdout-path = &uart0;
+		stdout-path = "serial0:115200n8";
 	};
 
 	leds {
diff --git a/arch/arm/boot/dts/ti/omap/am335x-evm.dts b/arch/arm/boot/dts/ti/omap/am335x-evm.dts
index 20222f82f21bfd9d..856fa1191ed24ea3 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-evm.dts
@@ -23,7 +23,7 @@ memory@80000000 {
 	};
 
 	chosen {
-		stdout-path = &uart0;
+		stdout-path = "serial0:115200n8";
 	};
 
 	vbat: fixedregulator0 {
diff --git a/arch/arm/boot/dts/ti/omap/am335x-evmsk.dts b/arch/arm/boot/dts/ti/omap/am335x-evmsk.dts
index eba888dcd60e7fa2..d8baccdf8bc46302 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-evmsk.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-evmsk.dts
@@ -30,7 +30,7 @@ memory@80000000 {
 	};
 
 	chosen {
-		stdout-path = &uart0;
+		stdout-path = "serial0:115200n8";
 	};
 
 	vbat: fixedregulator0 {
diff --git a/arch/arm/boot/dts/ti/omap/am335x-guardian.dts b/arch/arm/boot/dts/ti/omap/am335x-guardian.dts
index 4b070e634b28100b..6ce3a2d029eedc8c 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-guardian.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-guardian.dts
@@ -14,7 +14,7 @@ / {
 	compatible = "bosch,am335x-guardian", "ti,am33xx";
 
 	chosen {
-		stdout-path = &uart0;
+		stdout-path = "serial0:115200n8";
 		tick-timer = &timer2;
 	};
 
diff --git a/arch/arm/boot/dts/ti/omap/am335x-icev2.dts b/arch/arm/boot/dts/ti/omap/am335x-icev2.dts
index 6f0f4fba043b96e9..ba488bba6925dec3 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-icev2.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-icev2.dts
@@ -22,7 +22,7 @@ memory@80000000 {
 	};
 
 	chosen {
-		stdout-path = &uart3;
+		stdout-path = "serial3:115200n8";
 	};
 
 	vbat: fixedregulator0 {
diff --git a/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts b/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts
index 06a352f98b220bc4..476a6bdaf43f38e4 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts
@@ -15,7 +15,7 @@ / {
 	compatible = "myir,myd-am335x", "myir,myc-am335x", "ti,am33xx";
 
 	chosen {
-		stdout-path = &uart0;
+		stdout-path = "serial0:115200n8";
 	};
 
 	clk12m: clk12m {
diff --git a/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts b/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts
index d28d397288476504..23caaaabf35134a6 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts
@@ -147,7 +147,7 @@ simple-audio-card,codec {
 	};
 
 	chosen {
-		stdout-path = &uart0;
+		stdout-path = "serial0:115200n8";
 	};
 
 	leds {
diff --git a/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts b/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
index c9ccb9de21ad7b10..9f611debc209072c 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
@@ -21,7 +21,7 @@ / {
 	compatible = "ti,am33xx";
 
 	chosen {
-		stdout-path = &uart3;
+		stdout-path = "serial3:115200n8";
 	};
 
 	cpus {
diff --git a/arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts b/arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts
index 78ce860e59b3de4f..24d9f90fad01f768 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts
@@ -15,7 +15,7 @@ / {
 	compatible = "ti,am335x-pocketbeagle", "ti,am335x-bone", "ti,am33xx";
 
 	chosen {
-		stdout-path = &uart0;
+		stdout-path = "serial0:115200n8";
 	};
 
 	leds {
diff --git a/arch/arm/boot/dts/ti/omap/am335x-sl50.dts b/arch/arm/boot/dts/ti/omap/am335x-sl50.dts
index f3524e5ee43e276d..1dc4e344efd63e4e 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-sl50.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-sl50.dts
@@ -25,7 +25,7 @@ memory@80000000 {
 	};
 
 	chosen {
-		stdout-path = &uart0;
+		stdout-path = "serial0:115200n8";
 	};
 
 	leds {
-- 
2.43.0


