Return-Path: <linux-omap+bounces-3929-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC11AE15A8
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 10:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 430961899981
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 08:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D429A235BF1;
	Fri, 20 Jun 2025 08:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kwCVz345"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10E2235056;
	Fri, 20 Jun 2025 08:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750407370; cv=none; b=XOfWdWCCQhlkEKV1AnQH1FBMKFWqU723yQxX5RWIE0EHo9bUEa+TbYrqg0au8HKmZan4xrd0P/GhJiAD60sLD00OU5eW4mt+4gcqOepL735zi3QXHBHBMqPOota3cWScDCz3lY2ELM/hWN218QP+Y0x6tdIJkWN7Lpz3iJrNZSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750407370; c=relaxed/simple;
	bh=+PpIRcZms24h+KLaI6t6uUDI1mZcrO2+iLKOdb1aWIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E+2/elAPc1Ka+CX+X5wUrdLLy0Lm7ykYFIH+bXFBQioIP3X95AygNH88nqfydnlzDj0pKCHSLgD8zgPA/stEsGVcXnDTZuQogP83wpdqwPKDqlMBhztmUj0yWdHtc2tOLXiz31T1WJYlxJOU4R5NpIpAdgCCp3JFFdSC1Kji1Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kwCVz345; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 36132433F1;
	Fri, 20 Jun 2025 08:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750407365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wE63LoVDPWCa0QMdvT4TmnO/F7iQTH1SWzFz1ZbwKGo=;
	b=kwCVz3451E2JKDHiZtUrySRjTxpiEWrbLUhMuqigelChaoGpMCFQo7E+/yyK8byoQvlbhT
	5pbnP4NaMntnRufmh1tXWsvvIy086xo8fKAcM5X4uVGPh0T7Y5/rCpSE8pd6jNdci+oomG
	4AZSaTPn2uYfcdPklrDwWfGgOoCBPYh8r6Vnq8tRcP6UYkskC1nVrBjMN/4zKnHETyt/sQ
	t9ZJOGtGLFIeLXuIpyAgsO/RytnNKfKa2fFN5Pj1GLHLt9LGoIkE7IyHcq86BHS0eqIiNe
	Oz4Ts0kbvd5ahqymX3TtmZg6/keBwy+PaW11edGClJDfAbo8q2MqgHDPZl0H5g==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Fri, 20 Jun 2025 10:15:53 +0200
Subject: [PATCH v5 2/5] dt-bindings: omap: Add Seeed BeagleBone Green Eco
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-bbg-v5-2-84f9b9a2e3a8@bootlin.com>
References: <20250620-bbg-v5-0-84f9b9a2e3a8@bootlin.com>
In-Reply-To: <20250620-bbg-v5-0-84f9b9a2e3a8@bootlin.com>
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
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Romain Gantois <romain.gantois@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15-dev-dd21f
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdejkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgfdvgfektefgfefggeekudfggffhtdfffedtueetheejtddvledvvdelhedtveenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehmrghrtgdrmhhurhhphhihsehsrghntghlohhuugdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepphhrrghnvggvthhhsehtihdrtghomhdprhgtphhtthhopehlghhirhgufihoohgusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhoghgvrhhqsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkohhrhidrm
 hgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtoheprghnughrvggrsheskhgvmhhnrgguvgdrihhnfhho
X-GND-Sasl: kory.maincent@bootlin.com

Document the seeed,am335x-bone-green-eco compatible string in the
appropriate place within the omap family binding file.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Changes in v4:
- Forgot a 'e' to seeed in the commit message.

Changes in v3:
- New patch
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index 3603edd7361d..aa5df4692e37 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -107,6 +107,7 @@ properties:
               - compulab,cm-t335
               - moxa,uc-8100-me-t
               - novatech,am335x-lxm
+              - seeed,am335x-bone-green-eco
               - ti,am335x-bone
               - ti,am335x-evm
               - ti,am3359-icev2

-- 
2.43.0


