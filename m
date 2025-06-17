Return-Path: <linux-omap+bounces-3892-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5571ADCA34
	for <lists+linux-omap@lfdr.de>; Tue, 17 Jun 2025 13:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A5E4166F82
	for <lists+linux-omap@lfdr.de>; Tue, 17 Jun 2025 11:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 835902E06FF;
	Tue, 17 Jun 2025 11:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Vt01Nre3"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FFC2DF3C1;
	Tue, 17 Jun 2025 11:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750161582; cv=none; b=BzLC+8E48wjRrwfrtbmKOPHA/tEnEvVFwr8kj3z8KCtT58HFFQ3xF0U2UndiRC5WQ2NQWP7ky3gZngB4ksLDWgpktZolyMpRVhQPrf+ar1AtjSj3wqyrH8F06YCede2hHxgvz0CUPXeeVTx8QSkEmrHnLchfmNcJzry5m0Kr9hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750161582; c=relaxed/simple;
	bh=ZEZdT01ycHwNVlYTkoDA/lXI0JtNVBBiR8zRPwgoix0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lolifAtLeTcdlO/f+T/aVFYmTRwu4iDBJhTYd51Y+0NYmDUsUKOwTWgphrNpOudZ9Z/kd2mP84TZSneGH4vUDbPUV0VkNBpH/5LDYf3p7tZ7Uttd+mh7H/SYiYaf7/cc4lgu4F7Xw1QP6Ku8QfyMmTLZYoVzC3Amt3eStCBD8zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Vt01Nre3; arc=none smtp.client-ip=217.70.178.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41717424BB;
	Tue, 17 Jun 2025 11:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750161571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W6Pvni7Zs0uwK3wQbi9OBXyIZ+nOBBx/+O2vZSvueFw=;
	b=Vt01Nre3N3weW1j5b6mpQKCevzIeBd8IhkGB7MqVOybqKY9vj63AhoAAM7WC57Q4KAjkmp
	JkIrbTnwWwU7PYOKFreWuVr8CQQrYDI/ukvTPvWM9+T5LlJ10dN9SmjQqTJ8zbmLmvFqG3
	L91iNkBE8nLA6i8YKx8UfBLl8qdVDVJ1KDST8pZdlQlB1B1QW6ZsqkMTFAymMfmt5m/whP
	HCB4H/38TSYm9RTLYkoQq/a6zHuCo9BlIxbC/C2+4JL4/XwwJ7m1D4XA04t2BQdqK2ugXA
	6rQKw00O6rpMAx98wmSV1Chvx9YUOwEZ6MWiAx+JNZzU4FUb+HE5K5Ne0+TxIw==
From: Kory Maincent <kory.maincent@bootlin.com>
Subject: [PATCH v4 0/7] Add support for BeagleBone Green Eco board
Date: Tue, 17 Jun 2025 13:59:23 +0200
Message-Id: <20250617-bbg-v4-0-827cbd606db6@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJtYUWgC/2XNyw7CIBAF0F8xrMXAlKcr/8O4KJS2JFoMNETT9
 N+l1cTX7O5kzp0JJRe9S2i/mVB02ScfhhLYdoNsXw+dw74pGQEBTjhU2JgOS6EJVQ1toZaoXF6
 ja/1tbTmeSu59GkO8r6WZLttvnykm2LWs1o5LV+ZgQhjPftjZcEFLQ4a3EkQ/FRTFQSoCwkim1
 b+qPhR9/aoWRZltrBSKsR81z/MDTtMZnwQBAAA=
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
 Kory Maincent <kory.maincent@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15-dev-8cb71
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdefkeekjeevjeegffdtfeekkeetueejfedvtefgveekfeeifeejvdekfeetfffgnecuffhomhgrihhnpeguvggsihgrnhdrohhrghdpkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdefpdhrtghpthhtoheprghnughrvggrsheskhgvmhhnrgguvgdrihhnfhhopdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheptghonhhorhdrughoohhlvgihsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtoheplhhinhhug
 idqohhmrghpsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjkhhrihgunhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhnhiesrghtohhmihguvgdrtghomh

SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Green
(BBG). It has minor differences from the BBG, such as a different PMIC,
a different Ethernet PHY, and a larger eMMC.

Also update the omap.yaml binding to include missing compatible strings
that were previously undocumented.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
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
Kory Maincent (7):
      dt-bindings: omap: Add missing AM33xx compatible strings
      arm: dts: omap: Remove incorrect compatible strings from device trees
      arm: dts: omap: am335x-bone-common: Rename tps to generic pmic node
      dt-bindings: omap: Add Seeed BeagleBone Green Eco
      arm: dts: omap: Add support for BeagleBone Green Eco board
      arm: omap2plus_defconfig: Enable TPS65219 regulator
      arm: multi_v7_defconfig: Enable TPS65219 regulator

 Documentation/devicetree/bindings/arm/ti/omap.yaml |  23 ++-
 arch/arm/boot/dts/ti/omap/Makefile                 |   1 +
 arch/arm/boot/dts/ti/omap/am335x-base0033.dts      |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi  |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-bone.dts          |   2 +-
 .../boot/dts/ti/omap/am335x-boneblack-wireless.dts |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-boneblack.dts     |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-boneblue.dts      |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts | 169 +++++++++++++++++++++
 .../boot/dts/ti/omap/am335x-bonegreen-wireless.dts |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts     |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts    |   3 +-
 arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts  |   2 +-
 .../arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts  |   2 +-
 .../ti/omap/am335x-sancloud-bbe-extended-wifi.dts  |   5 +-
 .../boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts  |   5 +-
 arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts  |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-shc.dts           |   2 +-
 arch/arm/configs/multi_v7_defconfig                |   3 +
 arch/arm/configs/omap2plus_defconfig               |   3 +
 21 files changed, 214 insertions(+), 24 deletions(-)
---
base-commit: e22b9ddaf3afd031abc350c303c7c07a51c569d8
change-id: 20250523-bbg-769018d1f2a7

Best regards,
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


