Return-Path: <linux-omap+bounces-3894-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E06EADCA3B
	for <lists+linux-omap@lfdr.de>; Tue, 17 Jun 2025 14:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6ED3418994E0
	for <lists+linux-omap@lfdr.de>; Tue, 17 Jun 2025 12:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082272E2F14;
	Tue, 17 Jun 2025 11:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mY9dJUqc"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760C72E06C5;
	Tue, 17 Jun 2025 11:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750161582; cv=none; b=PnGclWnGvEm9NOorrypD7k6tOKNLb+Zp36M1vBBduzEfWNFSK/tS7AcqAd1yIvBXWKBq50WowR7sLeR8vkEkqh5aLaaKy7iMlyhxynSICtd1j/4xODVqthM0HNytr5HNAd2/rKi51NMyKihaKjNPmiCtSMTigi0kzo0sQYVvd/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750161582; c=relaxed/simple;
	bh=4H6c+X2qoJgSP5fbF+I7rBIdV6qfLGv1nTF4n/Vd8zU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pfPrUMK02BcphUbOpjvbUANVs0gVuCo34Ne+CzDVghjpO3JL2F0TQWrDp68/SsG/xarue6/UYMK/aohw1Ka/RZ9QiLcOxZhi3i3Mnc2RrsuPd2dcB5rG2Jnn2qzJcUWpklgtOurzaFOEGVds4EHF0Fe4zOo2OhEkVX3dgTs8dZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mY9dJUqc; arc=none smtp.client-ip=217.70.178.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AEFC84389E;
	Tue, 17 Jun 2025 11:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750161572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lhfjLOpPcT6PTGeIpVH242ZZv4ym47po7gNPqcAoryU=;
	b=mY9dJUqc7JNAtL87rmqWSKxk7Ies8jOqBcGbru0oezsTNqR6YywT/hujs4QWEG8p1/jLng
	g+QwWJkdBGz7FB4hZ5ZqWrPn4gYnCkg1kSZjs0z0lvSbnxSryc5xJI07Jwbi7kfrjeAaM7
	hhuZ+G2T3rYTgrUrMG31QDf12Wh51+CD+Zvysp6tvUA6eMECHG9ZlW7hfP1d8tpn6nfrbg
	qUPket0XECEFhY7Giu5trnHy/r430EizMvxB3kxvUGNE/qHWVd7kxPp9BaiYJ7wmtPPd5n
	NnUTpGqZD56FUxMclWaqbgYH+YCvZm6aqGC43iN7XdeSyX4iHKwBBh1L6TfRSw==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Tue, 17 Jun 2025 13:59:24 +0200
Subject: [PATCH v4 1/7] dt-bindings: omap: Add missing AM33xx compatible
 strings
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-bbg-v4-1-827cbd606db6@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvefgvdfgkeetgfefgfegkedugffghfdtffeftdeuteehjedtvdelvddvleehtdevnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtoheprghnughrvggrsheskhgvmhhnrgguvgdrihhnfhhopdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqohhmrghpsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehjkhhrihgunhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhnhiesrghtohhmihguvgdrtghomhdprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhm

Add several compatible strings that were missing from the binding
documentation for AM33xx-based boards. Update vendor prefix from
"ti" to "beagle" for BeagleBone to match actual hardware vendors.

Reviewed-by: Andrew Davis <afd@ti.com>
Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Change in v4:
- Rename ti,am335x-shc to bosch,am335x-shc

Change in v3:
- Change vendor prefix from ti to beagle
- Remove BeagleBone board variant description.

Change in v2:
- New patch
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index 3603edd7361d..7e0d5d376d57 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -104,12 +104,32 @@ properties:
       - description: TI AM33 based platform
         items:
           - enum:
+              - beagle,am335x-bone
+              - beagle,am335x-bone-black
+              - beagle,am335x-bone-black-wireless
+              - beagle,am335x-bone-blue
+              - beagle,am335x-pocketbeagle
+              - bosch,am335x-guardian
+              - bosch,am335x-shc
               - compulab,cm-t335
+              - grinn,am335x-chiliboard
+              - grinn,am335x-chilisom
+              - gumstix,am335x-pepper
+              - isee,am335x-base0033
+              - moxa,uc-2101
               - moxa,uc-8100-me-t
+              - myir,myc-am335x
+              - myir,myd-am335x
               - novatech,am335x-lxm
-              - ti,am335x-bone
+              - oct,osd3358-sm-refdesign
+              - sancloud,am335x-boneenhanced
+              - seeed,am335x-bone-green
+              - seeed,am335x-bone-green-wireless
+              - tcl,am335x-sl50
               - ti,am335x-evm
+              - ti,am335x-evmsk
               - ti,am3359-icev2
+              - vscom,onrisc
           - const: ti,am33xx
 
       - description: Compulab board variants based on TI AM33

-- 
2.43.0


