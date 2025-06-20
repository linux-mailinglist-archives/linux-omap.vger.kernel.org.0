Return-Path: <linux-omap+bounces-3928-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF2DAE15A5
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 10:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 362A93AB6E5
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 08:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B6F23507C;
	Fri, 20 Jun 2025 08:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GD6uArs9"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF33D235052;
	Fri, 20 Jun 2025 08:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750407367; cv=none; b=TBWtHQTqwQJcpPanUQ63vYzLpfWyVJ0mM5XwMfmg8BIbAXYxhFpe6zqIF47MnbLW/42OzTH4XJ6ed3227sG911ZHZFxCEJWLBrosgIcydHDLPFfHzgJB36ocjEbUaI2O39n70Pt9Mf62sRYIreGdC9SFzR0PZxRysm5b4QdW9Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750407367; c=relaxed/simple;
	bh=ERsEyCdS6V266eXdQIdkuTWzZ+BkZEWMo6Bl74nG3OA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Me+D8KPm6+HDJVcOVF562/V0Spg5lUBUPho8QbjLxIdnZqC3IuKz3CbihjwBH/D8LzHPtXpYIwmn5hHUOasoKo+Co6NElHUqa78u6msWy/6kwkr7Fgo9I8zr35qoYjrl4bam8DRGI4OHvHtXvbnHbu+WAELK13BwrAdq8VaVk5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GD6uArs9; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3EDAF4341B;
	Fri, 20 Jun 2025 08:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750407362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QUDJU35AM9kzHk4YIR5DF+IBht1+rCZRXjiyPtd5Ts0=;
	b=GD6uArs9646hiod0S1X8K4P5IhI8vi4OLk0U+9Ny4tPI0Utvm0+k8Enl9zygdQjVTyJb+T
	oL4CkbHjzVwGjKP8sR1sgrNXRfyb86MPmK3Lb0Cy459jQ5dP3i0tXB5ZSNxCJo3pqxAp9U
	R88GepDtgFl/7i6utHMNvfBRzGLieoTWz+qr0AsvAHUofzB9G+XzgaHaiC8SMXl8FidKxL
	JKosLQ3sbNIoCxflYnUVEQhy3XIWHLLGlMjzmDdOwfd8Y0SlCO3m0QoW1i7g5+K2UtXJZB
	z7tmMHrGD5nwOuSLEmps4inhl+4lCi0aTviiyUFJgD/nbYIMo8Pd2p7KN2ktMw==
From: Kory Maincent <kory.maincent@bootlin.com>
Subject: [PATCH v5 0/5] Add support for BeagleBone Green Eco board
Date: Fri, 20 Jun 2025 10:15:51 +0200
Message-Id: <20250620-bbg-v5-0-84f9b9a2e3a8@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALcYVWgC/23Nyw6CMBAF0F8hXVvTDn3hyv8wLugDaKLUFEI0h
 H+3gIkQnd2dzLkzos5F7zp0ykYU3eA7H9oU+CFDpinb2mFvU0ZAgBMOOda6xlIUhCpLKyglSpe
 P6Cr/XFou15Qb3/UhvpbSgc7bvR8oJthVrCwcly7NWYfQ33x7NOGO5oYBvkqQYlWQFAepCAgtW
 aF+Vb5R9PMrnxVlxhopFGN/FNsquSqWlAJptBVEWC32apqmN/9g31w6AQAA
X-Change-ID: 20250523-bbg-769018d1f2a7
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdejkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhgfeiieefgedtvdehvdeujeffleetveehueeuveeiteduveekvdetvdeigeegvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdguvggsihgrnhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehmrghrtgdrmhhurhhphhihsehsrghntghlohhuugdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepphhrrghnvggvthhhsehtihdrtghomhdprhgtphhtthhopehlghhirhgufihoohgusehgmhgrihhlrdgto
 hhmpdhrtghpthhtoheprhhoghgvrhhqsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtoheprghnughrvggrsheskhgvmhhnrgguvgdrihhnfhho
X-GND-Sasl: kory.maincent@bootlin.com

SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Green
(BBG). It has minor differences from the BBG, such as a different PMIC,
a different Ethernet PHY, and a larger eMMC.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Changes in v5:
- Split the patch series. As the cleaning process faced some pushback,
  I prefer to first get this support accepted and separately work on the
  devicetree and binding cleaning process.
- Link to v4: https://lore.kernel.org/r/20250617-bbg-v4-0-827cbd606db6@bootlin.com

Changes in v4:
- Drop model value change to avoid conflict with script based on this
  value like:
  https://salsa.debian.org/installer-team/flash-kernel/-/blob/master/db/all.db?ref_type=heads
- Rename ti,am335x-shc to bosch,am335x-shc
- Forgot to change to "Seeed" in BeagleBone Green Eco model description.
- Link to v3: https://lore.kernel.org/r/20250613-bbg-v3-0-514cdc768448@bootlin.com

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
Kory Maincent (5):
      arm: dts: omap: am335x-bone-common: Rename tps to generic pmic node
      dt-bindings: omap: Add Seeed BeagleBone Green Eco
      arm: dts: omap: Add support for BeagleBone Green Eco board
      arm: omap2plus_defconfig: Enable TPS65219 regulator
      arm: multi_v7_defconfig: Enable TPS65219 regulator

 Documentation/devicetree/bindings/arm/ti/omap.yaml |   1 +
 arch/arm/boot/dts/ti/omap/Makefile                 |   1 +
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi  |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts | 169 +++++++++++++++++++++
 arch/arm/configs/multi_v7_defconfig                |   3 +
 arch/arm/configs/omap2plus_defconfig               |   3 +
 6 files changed, 178 insertions(+), 1 deletion(-)
---
base-commit: e22b9ddaf3afd031abc350c303c7c07a51c569d8
change-id: 20250523-bbg-769018d1f2a7

Best regards,
--  
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


