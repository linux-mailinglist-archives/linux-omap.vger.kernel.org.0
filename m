Return-Path: <linux-omap+bounces-3869-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A9EAD91EE
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 17:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 402AC17D2BD
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 15:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6258F20F080;
	Fri, 13 Jun 2025 15:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WXQNqti3"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE731F03DE;
	Fri, 13 Jun 2025 15:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749829800; cv=none; b=LisXldHsqi2Z7WyaGPm8bKrNAD8+rxg5TIaW5rcV57KtdJq2+9pHOkzjk9sjn6sRB8zDCXyJALRevIuB40hzMs1wcv2jl3kgAMk7Wv5XuPrxV621OdQxnr+MJkEgZZZV//0SPtG9E6EGi5ljxuCcxhAzwZ64cz7dFsk1qYtzWAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749829800; c=relaxed/simple;
	bh=Ho9WUdUq4dE9CodwkzaNAXuptrYf/mR8lmxugbEGPZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KDf4s+zb5H/SCXZlB3WRVZEX3C3vYBEzXVaRyQVSXze1Q6PVv9JOtjSbYoSnsvcY9H1SKnSq+FINMBrXC/tv6shDKxV92Z5GD2B8cqPoyuvsqjAMs2qxbanT78GR3fQ3HMRDPhLpx3+frrTXqIixQ8w032xRDN7S0iI7luaqOh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WXQNqti3; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5CEE844438;
	Fri, 13 Jun 2025 15:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749829790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZSH9/JObnPTVLPPYQSol8VAyWy/AC5Rlv6pQLcORTck=;
	b=WXQNqti3VNRR/NbclSJdoWUJWiTjuH9hKt82evHmEW0/TChCLJfbS7AaDVzH/h189zxmi/
	AreEkejH6oel2uav9d/XvIx2nxrZy22r6aFKo23SKnlMkfF+OSFEytg2k2n/yHUDD4THKe
	8zfKaYFJq/YZj6j1XhK/8u+RJytUhbXWOMCVw9ifqF1hUio4zpVQm+1mmYgYGhY1+qCF48
	9NGyOvWBR19cWQMdq8SFxqXa8+ZM1hPdyalKZ4ue+HxfT4MFZxaX/gMPx8kSN64i96Ev6V
	yaVektx2ErG/p4CA28ke4A7YBwAIpGCjsbwANLrAq1z1cHyDSKdt3+O3UEJEoA==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Fri, 13 Jun 2025 17:49:45 +0200
Subject: [PATCH v3 2/7] ARM: dts: omap: Remove incorrect compatible strings
 from device trees
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-bbg-v3-2-514cdc768448@bootlin.com>
References: <20250613-bbg-v3-0-514cdc768448@bootlin.com>
In-Reply-To: <20250613-bbg-v3-0-514cdc768448@bootlin.com>
To: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Paul Barker <paul.barker@sancloud.com>, 
 Marc Murphy <marc.murphy@sancloud.com>
Cc: Jason Kridner <jkridner@gmail.com>, Andrew Davis <afd@ti.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.15-dev-8cb71
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeefhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvefgvdfgkeetgfefgfegkedugffghfdtffeftdeuteehjedtvdelvddvleehtdevnecukfhppedvrgdtudemtggsudelmeekheekjeemjedutddtmeeftdgtfeemkegthegsmehftdekugemgeefgegsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkeehkeejmeejuddttdemfedttgefmeektgehsgemfhdtkegumeegfeegsgdphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvggrsheskhgvmhhnrgguvgdrihhnfhhopdhrtghpthhtohepmhgrrhgtrdhmuhhrp
 hhhhiesshgrnhgtlhhouhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqohhmrghpsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhkrhhiughnvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtohepkhhhihhlmhgrnhessggrhihlihgsrhgvrdgtohhm
X-GND-Sasl: kory.maincent@bootlin.com

Several device trees incorrectly included extraneous compatible strings
in their compatible property lists. The policy is to only describe the
specific board name and SoC name to avoid confusion.

Remove these incorrect compatible strings to fix the inconsistency.

Also fix board vendor prefixes for BeagleBoard variants that were
incorrectly using "ti" instead of "beagle" or "seeed".

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Changes in v3:
- Remove extraneous compatible strings.
- Replace BeagleBone board name vendor.

Changes in v2:
- New patch
---
 arch/arm/boot/dts/ti/omap/am335x-base0033.dts                   | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-bone.dts                       | 4 ++--
 arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts         | 4 ++--
 arch/arm/boot/dts/ti/omap/am335x-boneblack.dts                  | 4 ++--
 arch/arm/boot/dts/ti/omap/am335x-boneblue.dts                   | 4 ++--
 arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts         | 4 ++--
 arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts                  | 4 ++--
 arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts                 | 3 +--
 arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts               | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts             | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts               | 4 ++--
 arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts | 5 +----
 arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts          | 5 +----
 arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts               | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-shc.dts                        | 2 +-
 15 files changed, 22 insertions(+), 29 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-base0033.dts b/arch/arm/boot/dts/ti/omap/am335x-base0033.dts
index 46078af4b7a3..176de29de2a6 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-base0033.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-base0033.dts
@@ -9,7 +9,7 @@
 
 / {
 	model = "IGEP COM AM335x on AQUILA Expansion";
-	compatible = "isee,am335x-base0033", "isee,am335x-igep0033", "ti,am33xx";
+	compatible = "isee,am335x-base0033", "ti,am33xx";
 
 	hdmi {
 		compatible = "ti,tilcdc,slave";
diff --git a/arch/arm/boot/dts/ti/omap/am335x-bone.dts b/arch/arm/boot/dts/ti/omap/am335x-bone.dts
index b5d85ef51a02..2790c0c5a473 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-bone.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-bone.dts
@@ -8,8 +8,8 @@
 #include "am335x-bone-common.dtsi"
 
 / {
-	model = "TI AM335x BeagleBone";
-	compatible = "ti,am335x-bone", "ti,am33xx";
+	model = "AM335x BeagleBone";
+	compatible = "beagle,am335x-bone", "ti,am33xx";
 };
 
 &ldo3_reg {
diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts b/arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts
index b4b4b80df08c..d78b6427b8f2 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts
@@ -11,8 +11,8 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 
 / {
-	model = "TI AM335x BeagleBone Black Wireless";
-	compatible = "ti,am335x-bone-black-wireless", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
+	model = "AM335x BeagleBone Black Wireless";
+	compatible = "beagle,am335x-bone-black-wireless", "ti,am33xx";
 
 	wlan_en_reg: fixedregulator@2 {
 		compatible = "regulator-fixed";
diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts b/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts
index 16b567e3cb47..70c26d090ecb 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts
@@ -10,8 +10,8 @@
 #include "am335x-boneblack-hdmi.dtsi"
 
 / {
-	model = "TI AM335x BeagleBone Black";
-	compatible = "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
+	model = "AM335x BeagleBone Black";
+	compatible = "beagle,am335x-bone-black", "ti,am33xx";
 };
 
 &cpu0_opp_table {
diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts b/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
index f579df4c2c54..779e74218b57 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
@@ -9,8 +9,8 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 
 / {
-	model = "TI AM335x BeagleBone Blue";
-	compatible = "ti,am335x-bone-blue", "ti,am33xx";
+	model = "AM335x BeagleBone Blue";
+	compatible = "beagle,am335x-bone-blue", "ti,am33xx";
 
 	chosen {
 		stdout-path = &uart0;
diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
index a4f5b5262645..ee92abf43175 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
@@ -10,8 +10,8 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 
 / {
-	model = "TI AM335x BeagleBone Green Wireless";
-	compatible = "ti,am335x-bone-green-wireless", "ti,am335x-bone-green", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
+	model = "Seeed AM335x BeagleBone Green Wireless";
+	compatible = "seeed,am335x-bone-green-wireless", "ti,am33xx";
 
 	wlan_en_reg: fixedregulator@2 {
 		compatible = "regulator-fixed";
diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts b/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts
index 18cc0f49e999..3d771721dcb8 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts
@@ -9,6 +9,6 @@
 #include "am335x-bonegreen-common.dtsi"
 
 / {
-	model = "TI AM335x BeagleBone Green";
-	compatible = "ti,am335x-bone-green", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
+	model = "Seeed AM335x BeagleBone Green";
+	compatible = "seeed,am335x-bone-green", "ti,am33xx";
 };
diff --git a/arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts b/arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts
index 648e97fe1dfd..224095304ef3 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts
@@ -8,8 +8,7 @@
 
 / {
 	model = "AM335x Chiliboard";
-	compatible = "grinn,am335x-chiliboard", "grinn,am335x-chilisom",
-		     "ti,am33xx";
+	compatible = "grinn,am335x-chiliboard", "ti,am33xx";
 
 	chosen {
 		stdout-path = &uart0;
diff --git a/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts b/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts
index fd91a3c01a63..55a454f51148 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts
@@ -12,7 +12,7 @@
 
 / {
 	model = "MYIR MYD-AM335X";
-	compatible = "myir,myd-am335x", "myir,myc-am335x", "ti,am33xx";
+	compatible = "myir,myd-am335x", "ti,am33xx";
 
 	chosen {
 		stdout-path = &uart0;
diff --git a/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts b/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts
index d28d39728847..d87ac31a16a9 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts
@@ -16,7 +16,7 @@
 
 / {
 	model = "Octavo Systems OSD3358-SM-RED";
-	compatible = "oct,osd3358-sm-refdesign", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
+	compatible = "oct,osd3358-sm-refdesign", "ti,am33xx";
 };
 
 &ldo3_reg {
diff --git a/arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts b/arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts
index 78ce860e59b3..c2f26687790c 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts
@@ -11,8 +11,8 @@
 #include <dt-bindings/leds/common.h>
 
 / {
-	model = "TI AM335x PocketBeagle";
-	compatible = "ti,am335x-pocketbeagle", "ti,am335x-bone", "ti,am33xx";
+	model = "AM335x PocketBeagle";
+	compatible = "beagle,am335x-pocketbeagle", "ti,am33xx";
 
 	chosen {
 		stdout-path = &uart0;
diff --git a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts b/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts
index 7c9f65126c63..61210f975542 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts
@@ -13,10 +13,7 @@
 
 / {
 	model = "SanCloud BeagleBone Enhanced Extended WiFi";
-	compatible = "sancloud,am335x-boneenhanced",
-		     "ti,am335x-bone-black",
-		     "ti,am335x-bone",
-		     "ti,am33xx";
+	compatible = "sancloud,am335x-boneenhanced", "ti,am33xx";
 
 	wlan_en_reg: fixedregulator@2 {
 		compatible = "regulator-fixed";
diff --git a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts b/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts
index c6c96f6182a8..10488b55689c 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts
@@ -12,10 +12,7 @@
 
 / {
 	model = "SanCloud BeagleBone Enhanced Lite";
-	compatible = "sancloud,am335x-boneenhanced",
-		     "ti,am335x-bone-black",
-		     "ti,am335x-bone",
-		     "ti,am33xx";
+	compatible = "sancloud,am335x-boneenhanced", "ti,am33xx";
 };
 
 &am33xx_pinmux {
diff --git a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts b/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts
index 32669346cefe..f1bdbf053fb2 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts
@@ -13,7 +13,7 @@
 
 / {
 	model = "SanCloud BeagleBone Enhanced";
-	compatible = "sancloud,am335x-boneenhanced", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
+	compatible = "sancloud,am335x-boneenhanced", "ti,am33xx";
 };
 
 &am33xx_pinmux {
diff --git a/arch/arm/boot/dts/ti/omap/am335x-shc.dts b/arch/arm/boot/dts/ti/omap/am335x-shc.dts
index 597482822608..f2393ff3f4d7 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-shc.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-shc.dts
@@ -12,7 +12,7 @@
 
 / {
 	model = "Bosch SHC";
-	compatible = "ti,am335x-shc", "ti,am335x-bone", "ti,am33xx";
+	compatible = "ti,am335x-shc", "ti,am33xx";
 
 	aliases {
 		mmcblk0 = &mmc1;

-- 
2.43.0


