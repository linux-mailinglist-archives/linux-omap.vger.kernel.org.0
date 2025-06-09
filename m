Return-Path: <linux-omap+bounces-3776-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F09AD22DF
	for <lists+linux-omap@lfdr.de>; Mon,  9 Jun 2025 17:47:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8EDA3B15FB
	for <lists+linux-omap@lfdr.de>; Mon,  9 Jun 2025 15:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895F7218589;
	Mon,  9 Jun 2025 15:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Icu8Aik3"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07421B6D06;
	Mon,  9 Jun 2025 15:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749483931; cv=none; b=cbsGy6wuW2RAPikeqi9jWxyxp4prNNqLa5NrmzxchX78FEZHaqv0sLU99nvCoYdp/KJ6LNqFkfyO7pO+UnA5IhbTMMolIS0rgzywEJoEA02ab1hv1rlsNAL+l+IacRIhgLbrqFXibpOdwAJ9FQ+blVSbYPBKNOSwm2WNxw/GbJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749483931; c=relaxed/simple;
	bh=vJvYY2QE6IvLetLlkByXZwmbhFTeJSqQtWMZL9VWryw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JDiJGVljkKBmVgnejJwr8ArVOQImp8/NM8O3vyfPXgrTBAv7Ypmdl0YUjAIlRerxuiF1Tg/JWrGXGPqdXcCSiUdvaexrVVtlwPJE8DK4BV0gJbxcamYHbGqwY2ZqQ33LlSSOjhkYYN4KwxtbN6vZJraY/hEolL33bOGlKzn8ltA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Icu8Aik3; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E942F1FCF0;
	Mon,  9 Jun 2025 15:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749483926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uICamvnlE4eYIYrX7UHBmV4OQ1J8YYFkcBFU8syPJIg=;
	b=Icu8Aik3up8SgL0spQPEfie2Rd9mIlmKO7N990ZKVgfxQnroTMdqO5+DQXR32Wj2zrwmbP
	8UFeVs6RWxuIbvKOL6+KMgPaqzIddiEBnD6iaL23OquXnitPfHj7uDLRX/Vy87iMZvPyKI
	cHDkSplf3QEWAUBrCohk2FL/xE8r8mDbk6x+WRxibZwL5FtdAlvcZnr9zVC1mCxzh9YmZv
	wg02vPUDkBIKOEuDWzx7VsGMmVC3PEltpGICYV8RTvhgIvDoHvBrDcpyAhL07S9EhK2Ot0
	KYaJ8w7cWZ6yzZei+Nn1xwywk91M/HAsvLYKSUnrN1Da7C//OJh8MdVdm3vGoA==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Mon, 09 Jun 2025 17:43:52 +0200
Subject: [PATCH v2 2/5] binding: omap: Add lots of missing omap AM33
 compatibles
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-bbg-v2-2-5278026b7498@bootlin.com>
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

Add several compatible strings that were missing from the binding
documentation. Add description for Bone, BoneBlack and BoneGreen
variants.

Add several compatible that were missing from the binding.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Change in v2:
- New patch
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index 3603edd7361d..c43fa4f4af81 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -104,12 +104,50 @@ properties:
       - description: TI AM33 based platform
         items:
           - enum:
+              - bosch,am335x-guardian
               - compulab,cm-t335
+              - grinn,am335x-chilisom
+              - gumstix,am335x-pepper
+              - moxa,uc-2101
               - moxa,uc-8100-me-t
+              - myir,myc-am335x
+              - myir,myd-am335x
               - novatech,am335x-lxm
+              - oct,osd3358-sm-refdesign
+              - tcl,am335x-sl50
               - ti,am335x-bone
               - ti,am335x-evm
+              - ti,am335x-evmsk
+              - ti,am335x-pocketbeagle
+              - ti,am335x-shc
               - ti,am3359-icev2
+              - vscom,onrisc
+          - const: ti,am33xx
+
+      - description: TI bone variants based on TI AM335
+        items:
+          - enum:
+              - ti,am335x-bone-black
+              - ti,am335x-bone-green
+              - ti,am335x-pocketbeagle
+          - const: ti,am335x-bone
+          - const: ti,am33xx
+
+      - description: TI bone black variants based on TI AM335
+        items:
+          - enum:
+              - sancloud,am335x-boneenhanced
+              - ti,am335x-bone-black-wireless
+          - const: ti,am335x-bone-black
+          - const: ti,am335x-bone
+          - const: ti,am33xx
+
+      - description: TI bone green variants based on TI AM335
+        items:
+          - enum:
+              - ti,am335x-bone-green-wireless
+          - const: ti,am335x-bone-green
+          - const: ti,am335x-bone
           - const: ti,am33xx
 
       - description: Compulab board variants based on TI AM33

-- 
2.43.0


