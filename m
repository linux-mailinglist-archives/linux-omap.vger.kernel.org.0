Return-Path: <linux-omap+bounces-3866-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CE9AD91E7
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 17:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 933B317BC61
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 15:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D490B1FFC5F;
	Fri, 13 Jun 2025 15:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OiSjPB07"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E62C19E7E2;
	Fri, 13 Jun 2025 15:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749829798; cv=none; b=scSpP9bP9Yghu81R3W+SYl2vgere8lFxmZN//6kc1LfpYV2ZHS7LIEn2ryMrugEw6gp1gnvOF9EZTuQt1fMbB9DYnFcIULUcwVIUc70LzbueSRUqTPDaTNkFLaLl72TaUEOx7Y4IH/sQMLsviqfHy9hexv+wi/Uh9DQ8TwLZrpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749829798; c=relaxed/simple;
	bh=FXfbB0p3TZjvLWCI56plJ+O9Ys9PRG3l9mxRe1SZ94I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KKMKSwq4KsQ8lUOyoUYH3Jkwpy3zQ0yrXDchrKmEdcwIYoE3ylkCAnnnLjUWgIIGqOEuhJwYynYgkqHziB+spyVKm+zVuWb/j+6/16urqoKWsY2eS7BdZ945JK1O4CnwVZRzcoznK763GMA7HerA6f7vF4D/L13nLvMZtYW4p9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OiSjPB07; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 401AC44442;
	Fri, 13 Jun 2025 15:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749829789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1vmdIHdbOmeoonnadlmOHGKHVDgOQGVeKLjeKUbgyLI=;
	b=OiSjPB0712lJRjWWiBkSb43D9iIVA3qwdEzQeTNL0kNU/BQ8xCk8ITRfAfmPXaBxnrib13
	UpXuQrQadmw+S+B+HC4UuNqct9WIaki5YLRFdRw2IBJpZ+uiVthfmgeHnN1sJO2qc9t2LF
	sjLVrHAGLAjKIcwxnYlW+Sm68GrjijaOvl0EeYRxXUQ5IQKnoevGWDamHMTx+1ed1JpN5p
	865cG3m19eRP/Eav3KsbNno1zoUrPHZHRjNQEvk4pxVIJ/QJC32dVJRK6k5bf9AmFkb8k0
	6UIyYDuhryNSyEib9lG39nS1cyAth0I8gF5bcmbneG53mOAwc4PQ150jSXjN8w==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Fri, 13 Jun 2025 17:49:44 +0200
Subject: [PATCH v3 1/7] dt-bindings: omap: Add missing AM33xx compatible
 strings
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-bbg-v3-1-514cdc768448@bootlin.com>
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

Add several compatible strings that were missing from the binding
documentation for AM33xx-based boards. Update vendor prefix from
"ti" to "beagle" for BeagleBone to match actual hardware vendors.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Change in v3:
- Change vendor prefix from ti to beagle
- Remove BeagleBone board variant description.

Change in v2:
- New patch
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index 3603edd7361d..45fa1c61cafd 100644
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
+              - ti,am335x-shc
               - ti,am3359-icev2
+              - vscom,onrisc
           - const: ti,am33xx
 
       - description: Compulab board variants based on TI AM33

-- 
2.43.0


