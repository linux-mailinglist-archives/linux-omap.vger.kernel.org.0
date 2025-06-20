Return-Path: <linux-omap+bounces-3935-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F76EAE15D7
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 10:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E15CC7A7925
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 08:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9202C2376E1;
	Fri, 20 Jun 2025 08:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YQcZUHmI"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C622367A8;
	Fri, 20 Jun 2025 08:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750407916; cv=none; b=SzdhWubEuCtKuMNgb2JycNYCGA7pRBhDf5ish2pUqpDV065oiUHwWXD9YwBj9uGNggpUG26XZiKIps/AYaR/jOpKwD0lUXd09BYeJqAq7uqmFnNIEDSEo4k65oQ/ImRSKBmsr5l3ZKZ69m2NaMbn059XVage3uXCvY8ZqhNub0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750407916; c=relaxed/simple;
	bh=5mhU+zy1iqiq6WLa137lYMb1TjyKTTWMxd8F1lamkCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EpeJDYemR+j/jxQMcDIdDPo71ONL3Ly3Ezt+3+nzklBuqxkPh8248zsVofbsgiMx3US/LnAX30/a3O4j98DUbvcNMmRDI8KrQI3qK5WpEXCMwTRS24VqKb4X2Hh2WZ6HM8NVbBhv9IW2IkKsKMHLMGsCNtp2crWYat67pd7DnuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YQcZUHmI; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 71944432B8;
	Fri, 20 Jun 2025 08:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750407911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2/+9JmWWxm4DGTrHspWkgeCTwy2Jd8ENsZDMgJXDZ1k=;
	b=YQcZUHmIECBwkMnXRfYChBNnrkMDHgUz5U+RFw3ZmqTIpcKzFDm6pwdGDOC7RwjFOcptMV
	dZujTciZmEUR5nYcr8u+aBJArscARQClAcf3Yof0GGGbcPeI0WyPoiz/LDr1npCD/5ZB9i
	opictUx/7hsMc/D6XzqkgULbxAJIUBNffRguOBLB7OgS4oY/bDehrzSEwDHlVH9LE4Nnkx
	G5FXQY+z1DlulLWdXPWNtxf0IRXKK30ECkYgv8BivPtQcpsVPx5tbbjJ0OaPARdeXZcjzl
	3nIzaajvu338yZGjhfniDsYbgEfgmYm9TXWpKC+klxS3OxgMdf3VnVzFyX/G2A==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Fri, 20 Jun 2025 10:24:08 +0200
Subject: [PATCH 1/2] dt-bindings: omap: Add missing AM33xx compatible
 strings
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-ti_dts_clean-v1-1-786a3059bca7@bootlin.com>
References: <20250620-ti_dts_clean-v1-0-786a3059bca7@bootlin.com>
In-Reply-To: <20250620-ti_dts_clean-v1-0-786a3059bca7@bootlin.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Barker <paul.barker@sancloud.com>, 
 Marc Murphy <marc.murphy@sancloud.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Kory Maincent <kory.maincent@bootlin.com>, Andrew Davis <afd@ti.com>
X-Mailer: b4 0.15-dev-dd21f
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdejleduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgfdvgfektefgfefggeekudfggffhtdfffedtueetheejtddvledvvdelhedtveenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepphgruhhlrdgsrghrkhgvrhesshgrnhgtlhhouhgurdgtohhmpdhrtghpthhtoheprghnughrvggrsheskhgvmhhnrgguvgdrihhnfhhopdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhot
 hhlihhnrdgtohhmpdhrtghpthhtohepphhrrghnvggvthhhsehtihdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: kory.maincent@bootlin.com

Add several compatible strings that were missing from the binding
documentation for AM33xx-based boards. Update vendor prefix from
"ti" to "beagle" for BeagleBone to match actual hardware vendors.

Reviewed-by: Andrew Davis <afd@ti.com>
Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
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


