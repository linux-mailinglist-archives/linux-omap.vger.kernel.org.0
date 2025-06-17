Return-Path: <linux-omap+bounces-3896-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCEDADCA46
	for <lists+linux-omap@lfdr.de>; Tue, 17 Jun 2025 14:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 221363BAB37
	for <lists+linux-omap@lfdr.de>; Tue, 17 Jun 2025 12:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE7F2E6D16;
	Tue, 17 Jun 2025 11:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oA1DORcl"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4330F2DF3FE;
	Tue, 17 Jun 2025 11:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750161583; cv=none; b=hoyOasMer6CbYPNalCViooOzGkA30iRtOgEGSZGZEALL9nylBBs027U5K2wzcAI5IUSh2ug0N+s7MRRMPAjn7QMgw156Kx7ImixiSQa8gk/P9nd+Jd5JyzCho5E2l+5yWARZgeGw48NuVx9e7DL4+kkjRxVtSoveFIpjwWNf6bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750161583; c=relaxed/simple;
	bh=r9AIjv3eVJJCNo7+dZHXwfTClj6zQQ2Sgkyqt8tBqC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F9CM83dagaT2fc1Ts9DeqLeSt1BzsaVEbaMqjzIZWXoRgUxni4eL53o0ENrJEL6fAs2mC/+3u+tEl86jzy6wJtFQ5POWppCBemaBV8rYceuE/4La4QqT9KwmbpO8q4Oo/o+37OHgQt9dH60TDpMzrmZ6HtQ/DPHwSiL/DCkyDnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oA1DORcl; arc=none smtp.client-ip=217.70.178.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C6B2143881;
	Tue, 17 Jun 2025 11:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750161573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OLGcoG1SBhExgMa7CCAIDuzbEQ1srM9l/xvaam3KIPw=;
	b=oA1DORclaov1cXV/8G6Op6VIOXSA9UF1vu0H6+jFfhsc6ZMjaNdNP0Eeo+qNHjFS7D4YcV
	CBkZz7U2vPZTIo0XoCUwF1Vr39KlS8dGV3upEsQ8K5Pzc3jtL9nV1aTzAfMWcMdynOC9ny
	zSwjqCNC08ePWaVDFbvLRi/g74F7FgO7rlMUIzpzy4o/ZumyQSArUcOmCqiiCLIij4LzGD
	arS2DtciyGY7MRm9HBMCgnqb+EXkTPzFcoaiBqO3Z4t1nGNvoUbxGxacUfKL7jOZFh2wNu
	mDqK4dAGKhf+ahfqW9XgtQ8dUwOhk7i4zAP5p79BppdY6TM61V6dYfSzfjeN4A==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Tue, 17 Jun 2025 13:59:25 +0200
Subject: [PATCH v4 2/7] arm: dts: omap: Remove incorrect compatible strings
 from device trees
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-bbg-v4-2-827cbd606db6@bootlin.com>
References: <20250617-bbg-v4-0-827cbd606db6@bootlin.com>
In-Reply-To: <20250617-bbg-v4-0-827cbd606db6@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdegvdetieeugedvteefjedvffffjeehkeelleeggeehueeghfeihefhvdevfeehnecuffhomhgrihhnpeguvggsihgrnhdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopegrnhgurhgvrghssehkvghmnhgruggvrdhinhhfohdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhomhgrphesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghro
 hhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhkrhhiughnvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtohepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomh

Several device trees incorrectly included extraneous compatible strings
in their compatible property lists. The policy is to only describe the
specific board name and SoC name to avoid confusion.

Remove these incorrect compatible strings to fix the inconsistency.

Also fix board vendor prefixes for BeagleBoard variants that were
incorrectly using "ti" instead of "beagle" or "seeed".

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Changes in v4:
- Rename ti,am335x-shc to bosch,am335x-shc
- Drop model value change to avoid conflict with script based on this
  value like:
  https://salsa.debian.org/installer-team/flash-kernel/-/blob/master/db/all.db?ref_type=heads

Changes in v3:
- Remove extraneous compatible strings.
- Replace BeagleBone board name vendor.

Changes in v2:
- New patch
---
 arch/arm/boot/dts/ti/omap/am335x-base0033.dts                   | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-bone.dts                       | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts         | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-boneblack.dts                  | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-boneblue.dts                   | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts         | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts                  | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts                 | 3 +--
 arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts               | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts             | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts               | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts | 5 +----
 arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts          | 5 +----
 arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts               | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-shc.dts                        | 2 +-
 15 files changed, 15 insertions(+), 22 deletions(-)

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
index b5d85ef51a02..08616d449f95 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-bone.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-bone.dts
@@ -9,7 +9,7 @@
 
 / {
 	model = "TI AM335x BeagleBone";
-	compatible = "ti,am335x-bone", "ti,am33xx";
+	compatible = "beagle,am335x-bone", "ti,am33xx";
 };
 
 &ldo3_reg {
diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts b/arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts
index b4b4b80df08c..aa668dfa1c6a 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts
@@ -12,7 +12,7 @@
 
 / {
 	model = "TI AM335x BeagleBone Black Wireless";
-	compatible = "ti,am335x-bone-black-wireless", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
+	compatible = "beagle,am335x-bone-black-wireless", "ti,am33xx";
 
 	wlan_en_reg: fixedregulator@2 {
 		compatible = "regulator-fixed";
diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts b/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts
index 16b567e3cb47..476fb6677203 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts
@@ -11,7 +11,7 @@
 
 / {
 	model = "TI AM335x BeagleBone Black";
-	compatible = "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
+	compatible = "beagle,am335x-bone-black", "ti,am33xx";
 };
 
 &cpu0_opp_table {
diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts b/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
index f579df4c2c54..56f9042a5bfb 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
@@ -10,7 +10,7 @@
 
 / {
 	model = "TI AM335x BeagleBone Blue";
-	compatible = "ti,am335x-bone-blue", "ti,am33xx";
+	compatible = "beagle,am335x-bone-blue", "ti,am33xx";
 
 	chosen {
 		stdout-path = &uart0;
diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
index a4f5b5262645..37d4d5a3edf6 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
@@ -11,7 +11,7 @@
 
 / {
 	model = "TI AM335x BeagleBone Green Wireless";
-	compatible = "ti,am335x-bone-green-wireless", "ti,am335x-bone-green", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
+	compatible = "seeed,am335x-bone-green-wireless", "ti,am33xx";
 
 	wlan_en_reg: fixedregulator@2 {
 		compatible = "regulator-fixed";
diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts b/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts
index 18cc0f49e999..3d6404653816 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts
@@ -10,5 +10,5 @@
 
 / {
 	model = "TI AM335x BeagleBone Green";
-	compatible = "ti,am335x-bone-green", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
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
index 78ce860e59b3..908203fd9190 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts
@@ -12,7 +12,7 @@
 
 / {
 	model = "TI AM335x PocketBeagle";
-	compatible = "ti,am335x-pocketbeagle", "ti,am335x-bone", "ti,am33xx";
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
index 597482822608..47b1db476cf3 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-shc.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-shc.dts
@@ -12,7 +12,7 @@
 
 / {
 	model = "Bosch SHC";
-	compatible = "ti,am335x-shc", "ti,am335x-bone", "ti,am33xx";
+	compatible = "bosch,am335x-shc", "ti,am33xx";
 
 	aliases {
 		mmcblk0 = &mmc1;

-- 
2.43.0


