Return-Path: <linux-omap+bounces-3933-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DC9AE15B5
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 10:17:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FC191760B0
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 08:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2819D23816B;
	Fri, 20 Jun 2025 08:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MPN2HDts"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B56235052;
	Fri, 20 Jun 2025 08:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750407372; cv=none; b=Es1zypeISxwhLd8i7wIfV1jIZMiO++q8aqICmRNYVE82Pbcx2RClaqlGyqRdbzhdDSLTxFhcsBLJ/pQcCDQrs79OTtm5M0O17eJysQ4RIic+xa7sUnnPQB3SELbvJ2+cX6hpGscpY3O9UjRsdoQFwJHDaDIhEnabOJEGYVaVcgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750407372; c=relaxed/simple;
	bh=N2UYITogtfecT3kXHmGjJKBWnKKAGejg+NybZgL/OX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JXiagBTcng1I85UKOtKTRCl1rlVM4hLnSisc50/bopAL/ren3jsKCBH5IwtW4XOMDmGe3desG/m3B3a6j4VqguYTWjpwtZdijuoAugO4SMjIFnvCec/P5bWRizsVHbKLzqCtqdcM/nSugrbIHVDu6309i/Dq7dsFKsac1Lusm/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MPN2HDts; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BFF85433E7;
	Fri, 20 Jun 2025 08:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750407368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YLidNV2GFKH/2JeWLKry+LSYqYYCzq3L8dBLPFyZJ/4=;
	b=MPN2HDtsCL1dwJuckN92q4SJWXy96NkLHlJeDY7PHiZCB++gpMXZEthvvctL/s8l4S0VGj
	WJIpz43ALTsGSJSzKUCECwFFWbB9Sctj47dENNjSDSl8G0n/Zj2ejfqlF3PXJ4EEFbEb/h
	leyL2omxvDqxcLAnM7AP68y9mP9YNk9pCM2e19LHyQOxbtAzRHSDnYR8zgk0Msx7JLCXRT
	f2M4Z9cQW5sJyjuRNkIvpB4r+AzYBQi3LJsCHBuC64mne1gRaALsdZkoYd+cAxlUMmJ1kf
	IzqA/myb6RiyZj+lOvpdNEpjtCGk/Ed6qa+PMhH5/mR7Z0K0dDDMYFusbQplUw==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Fri, 20 Jun 2025 10:15:56 +0200
Subject: [PATCH v5 5/5] arm: multi_v7_defconfig: Enable TPS65219 regulator
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-bbg-v5-5-84f9b9a2e3a8@bootlin.com>
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
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.15-dev-dd21f
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdejkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgfdvgfektefgfefggeekudfggffhtdfffedtueetheejtddvledvvdelhedtveenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvgedprhgtphhtthhopehmrghrtgdrmhhurhhphhihsehsrghntghlohhuugdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepphhrrghnvggvthhhsehtihdrtghomhdprhgtphhtthhopehlghhirhgufihoohgusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhoghgvrhhqsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkohhrhidrm
 hgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtoheprghnughrvggrsheskhgvmhhnrgguvgdrihhnfhho
X-GND-Sasl: kory.maincent@bootlin.com

Enable the TPS65219 regulator in the defconfig, as the TPS65214
variant is used by the newly introduced BeagleBoard Green Eco board.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Change in v3:
- New patch.
---
 arch/arm/configs/multi_v7_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 50c170b4619f..76f74103c1f0 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -344,6 +344,7 @@ CONFIG_INPUT_MAX77693_HAPTIC=m
 CONFIG_INPUT_MAX8997_HAPTIC=m
 CONFIG_INPUT_GPIO_DECODER=m
 CONFIG_INPUT_CPCAP_PWRBUTTON=m
+CONFIG_INPUT_TPS65219_PWRBUTTON=m
 CONFIG_INPUT_AXP20X_PEK=m
 CONFIG_INPUT_DA9063_ONKEY=m
 CONFIG_INPUT_ADXL34X=m
@@ -618,6 +619,7 @@ CONFIG_MFD_PALMAS=y
 CONFIG_MFD_TPS65090=y
 CONFIG_MFD_TPS65217=y
 CONFIG_MFD_TPS65218=y
+CONFIG_MFD_TPS65219=y
 CONFIG_MFD_TPS6586X=y
 CONFIG_MFD_TPS65910=y
 CONFIG_MFD_STM32_LPTIMER=m
@@ -667,6 +669,7 @@ CONFIG_REGULATOR_TPS62360=y
 CONFIG_REGULATOR_TPS65090=y
 CONFIG_REGULATOR_TPS65217=y
 CONFIG_REGULATOR_TPS65218=y
+CONFIG_REGULATOR_TPS65219=y
 CONFIG_REGULATOR_TPS6586X=y
 CONFIG_REGULATOR_TPS65910=y
 CONFIG_REGULATOR_TWL4030=y

-- 
2.43.0


