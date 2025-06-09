Return-Path: <linux-omap+bounces-3775-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF54AD22CD
	for <lists+linux-omap@lfdr.de>; Mon,  9 Jun 2025 17:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 527AA16261A
	for <lists+linux-omap@lfdr.de>; Mon,  9 Jun 2025 15:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77343215F53;
	Mon,  9 Jun 2025 15:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ObhGNNdK"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9FF7261B;
	Mon,  9 Jun 2025 15:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749483930; cv=none; b=cDbMPcwqOBjQ+Ct4qGjQ1uyghVHmz1YeykKYYPrMDaP2spp10B3+kh9c23NmuCNqrYTwhGcF6mVlAjbQ4PrE94yKqxIhWqkYTJBECsW+Zc/ZWWORpk6ygz06tWdTV9r39RNEif2Fk+Hq+SfyiIDGblGs4o3Rl+4H+04qKQ5eD5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749483930; c=relaxed/simple;
	bh=XL7WdZ+e9Wqbgp+T6seL+0rj1v5BV3EtREWlrCuJ668=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lIW/GdcsqPSFfDdWAxvMU2b74FkOKv8ZQpDrPOl8vYVVSaOvGyCqQlnX9AWfgY8uGEFKckIJNSmMN0FFhHi79A5crxTaq3q0zaDMClyiUz81uAPn7gx+RMex0y1TfhVrnTWRb8YZu60UHIqy68duBig7PzprBSVJ1u+6a2QiCaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ObhGNNdK; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7DD341FCEF;
	Mon,  9 Jun 2025 15:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749483925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q0h5TtXCbR7pZbVKCneQTrZghH/H8RZNkfWr2OofCu4=;
	b=ObhGNNdK/VD7+Ua2NKS1rQnIPe+9NT2xUoyNLEsA2FbUikEsVblxmlEffjsvxdu6mszh3b
	GtKIWYOUeCXfOkRO2ozUlK0rrGlTPcUynZhKatW0tTIJ2R7r6eY/6dgkqg0Z0xigEO2t5M
	G3zniKlwBWw8fC8rYlPjBAdnuKgdwsLbx4hLmHajpdiarb5cvyZhc4gVjqLs6GLfSuwH4E
	2YfLY8boid7o2YvOOZ3+pceRcLJMdT1XIdmqBVVQ/qtqRtBfUY0kYEsVZbZszbY9u9VC/m
	iHjYRPLxkL/a+jH7BwtaCf0o5SpCy05lM4lBUBM6G2IrWP01IV+gImE7ffmXlw==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Mon, 09 Jun 2025 17:43:51 +0200
Subject: [PATCH v2 1/5] arm: dts: omap: Remove incorrect compatible strings
 from device trees
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-bbg-v2-1-5278026b7498@bootlin.com>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
In-Reply-To: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
To: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.15-dev-8cb71
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdelgeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgfdvgfektefgfefggeekudfggffhtdfffedtueetheejtddvledvvdelhedtveenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedukedprhgtphhtthhopehrohhgvghrqheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehlihhnuhigqdhomhgrphesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrghrohdrkhhoshhkihhnvghnsehikhhirdhfihdprhgtphhtthhop
 ehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: kory.maincent@bootlin.com

Several device trees incorrectly included ti,am335x-bone-black or
ti,am335x-bone in their compatible lists without including the
corresponding bone-black-common or bone-common device tree files.
Remove these incompatible strings to fix the inconsistency.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Change in v2:
- New patch
---
 arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts          | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts     | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts       | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-shc.dts                | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
index a4f5b5262645..fb88eebb8c5d 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
@@ -11,7 +11,7 @@
 
 / {
 	model = "TI AM335x BeagleBone Green Wireless";
-	compatible = "ti,am335x-bone-green-wireless", "ti,am335x-bone-green", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
+	compatible = "ti,am335x-bone-green-wireless", "ti,am335x-bone", "ti,am33xx";
 
 	wlan_en_reg: fixedregulator@2 {
 		compatible = "regulator-fixed";
diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts b/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts
index 18cc0f49e999..022ecc971476 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts
@@ -10,5 +10,5 @@
 
 / {
 	model = "TI AM335x BeagleBone Green";
-	compatible = "ti,am335x-bone-green", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
+	compatible = "ti,am335x-bone-green", "ti,am335x-bone", "ti,am33xx";
 };
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
index 78ce860e59b3..0c8a120a1811 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts
@@ -12,7 +12,7 @@
 
 / {
 	model = "TI AM335x PocketBeagle";
-	compatible = "ti,am335x-pocketbeagle", "ti,am335x-bone", "ti,am33xx";
+	compatible = "ti,am335x-pocketbeagle", "ti,am33xx";
 
 	chosen {
 		stdout-path = &uart0;
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


