Return-Path: <linux-omap+bounces-3865-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 954ECAD91E3
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 17:50:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BBCC18919E7
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 15:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5011FCCEB;
	Fri, 13 Jun 2025 15:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UCS0Yhp0"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6004F18DB29;
	Fri, 13 Jun 2025 15:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749829797; cv=none; b=mxOU4OkdbewztjPDuTA/muP56VFaACOhCEqX+BbXjYmQX6GauvR4i9MyRo5IYE3Vk7RH8KShhLNdCKk4J9jHs2pSn7IgEt3p8cyeofkBnt9H/998vWEGWJ/jatAB6L2+AGp64hlcQ6zhuatptqYNgBcvNwLI0aG+pzDvvQonrBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749829797; c=relaxed/simple;
	bh=kQEepNrhTMoeLkMWuKHbX1FQWB7KfGk67Nh0dUtM66U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=izsUmehcMS5Bp4cAovF/w1oL594/RUn9p0XWOfGAOhPa/B9uMDA5D8vCnl/HzyiGKRa0O88jUj5HstTMICrKxDfskcOGievwzxWzphnwE/XE3hvoE3jBujvFVhCXxIdhTvF3cTYVTg7FVB7lTlq7S5wQX3N54rsEYiWFNrsj6Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UCS0Yhp0; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0F7F4441C;
	Fri, 13 Jun 2025 15:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749829788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OOVi85YqZgwGXGhiKBANfYwAT8bk0/6cs0m4L0QZ5ww=;
	b=UCS0Yhp0BmMKUNuUyOR1T25Kcr7nlJYjEgZK7Ufhbcj4FHb/qXJeRN4v5mPpJFrUUd2oem
	fTzexFYkAKc3Kmfz2P1OQvLBE+rxYG/C49/ZWpML3/gowta2wgXwaugkZO9UfkCjyYXWDx
	RB6/pbV8Lk9OHGzj0x6TCeGHiOuWwOw/GqRXABCIgt30idmf0uSS81p/0VYG7O3uIIXuci
	oyU8nkw5n3EEIwKUqyshs1iZB8Srz5x5aWPAzF2rECrBLWduAsy0u7nADm+hGQEekGTeZN
	nOKckX4BRAxjjOjp2rEOrb5hE9vJqwJBHUL1+pi98FGvNMufLUkIapIRvlBCPw==
From: Kory Maincent <kory.maincent@bootlin.com>
Subject: [PATCH v3 0/7] Add support for BeagleBone Green Eco board
Date: Fri, 13 Jun 2025 17:49:43 +0200
Message-Id: <20250613-bbg-v3-0-514cdc768448@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJdITGgC/1WMQQ6CMBBFr0JmbU070Ja68h7GBYUBmig1LWk0h
 LtbcGGY3Zv89xaIFBxFuBQLBEouOj9lKE8FtGMzDcRclxmQo+QSS2btwLQyXNSd6LHRkJevQL1
 775XbPfPo4uzDZ48msX2PfhKMM+qrxpDUlO9qvZ8fbjq3/glbIeHfUtz8LMyWRF1zVFZXpj5a6
 7p+Acr49H7OAAAA
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeefhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudfhveduteffgfekvdfhveehgeehtdelgefhffduiefffedvheefgeeiiedvkeetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgduleemkeehkeejmeejuddttdemfedttgefmeektgehsgemfhdtkegumeegfeegsgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekheekjeemjedutddtmeeftdgtfeemkegthegsmehftdekugemgeefgegspdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhgvrghss
 ehkvghmnhgruggvrdhinhhfohdprhgtphhtthhopehmrghrtgdrmhhurhhphhihsehsrghntghlohhuugdrtghomhdprhgtphhtthhopehlihhnuhigqdhomhgrphesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjkhhrihgunhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhnhiesrghtohhmihguvgdrtghomhdprhgtphhtthhopehkhhhilhhmrghnsegsrgihlhhisghrvgdrtghomh
X-GND-Sasl: kory.maincent@bootlin.com

SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Green
(BBG). It has minor differences from the BBG, such as a different PMIC,
a different Ethernet PHY, and a larger eMMC.

Also update the omap.yaml binding to include missing compatible strings
that were previously undocumented.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Changes in v3:
- Update multi_v7_defconfig with TPS65219 config.
- Remove extraneous compatible strings.
- Replace BeagleBone compatible board name vendor to use "beagle" instead
  of "ti".
- Link to v2: https://lore.kernel.org/r/20250609-bbg-v2-0-5278026b7498@bootlin.com

Changes in v2:
- Add patch 1 to 3 to fix binding and devicetree inconsistencies.
- Rename tps node name to generic pmic node name in am335x-bone-common.
- Link to v1: https://lore.kernel.org/r/20250523-bbg-v1-0-ef4a9e57eeee@bootlin.com

---
Kory Maincent (7):
      dt-bindings: omap: Add missing AM33xx compatible strings
      ARM: dts: omap: Remove incorrect compatible strings from device trees
      arm: dts: omap: am335x-bone-common: Rename tps to generic pmic node
      dt-bindings: omap: Add Seeed BeagleBone Green Eco
      arm: dts: omap: Add support for BeagleBone Green Eco board
      arm: omap2plus_defconfig: Enable TPS65219 regulator
      arm: multi_v7_defconfig: Enable TPS65219 regulator

 Documentation/devicetree/bindings/arm/ti/omap.yaml |  23 ++-
 arch/arm/boot/dts/ti/omap/Makefile                 |   1 +
 arch/arm/boot/dts/ti/omap/am335x-base0033.dts      |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi  |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-bone.dts          |   4 +-
 .../boot/dts/ti/omap/am335x-boneblack-wireless.dts |   4 +-
 arch/arm/boot/dts/ti/omap/am335x-boneblack.dts     |   4 +-
 arch/arm/boot/dts/ti/omap/am335x-boneblue.dts      |   4 +-
 arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts | 169 +++++++++++++++++++++
 .../boot/dts/ti/omap/am335x-bonegreen-wireless.dts |   4 +-
 arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts     |   4 +-
 arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts    |   3 +-
 arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts  |   2 +-
 .../arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts  |   4 +-
 .../ti/omap/am335x-sancloud-bbe-extended-wifi.dts  |   5 +-
 .../boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts  |   5 +-
 arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts  |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-shc.dts           |   2 +-
 arch/arm/configs/multi_v7_defconfig                |   3 +
 arch/arm/configs/omap2plus_defconfig               |   3 +
 21 files changed, 221 insertions(+), 31 deletions(-)
---
base-commit: e22b9ddaf3afd031abc350c303c7c07a51c569d8
change-id: 20250523-bbg-769018d1f2a7

Best regards,
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


