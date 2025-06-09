Return-Path: <linux-omap+bounces-3774-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CCBAD22CA
	for <lists+linux-omap@lfdr.de>; Mon,  9 Jun 2025 17:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17E65162F4E
	for <lists+linux-omap@lfdr.de>; Mon,  9 Jun 2025 15:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4AAF211A2A;
	Mon,  9 Jun 2025 15:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Q1xfhvoZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4131D63F5;
	Mon,  9 Jun 2025 15:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749483929; cv=none; b=PEujV7cwqYD+OYaNel9lHoK/zPYlaOc7T6cYttzu5WdijrWsngpSHSF+iWxevD78wFXLUAJqaoYqx9SCKyKwffjKZ75RVbSIf00yzG27QtXELZNILEIQPNBi1FRo+cLBWDR9gSQ/SSQPtIyMu4VU6FSnHeJRk+CkAkAqCblEIZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749483929; c=relaxed/simple;
	bh=6PjEAD3RDNws1qU7noPgM8k6oU9CmCMLwJ2Py+MuuYM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jYydHG1/QQYPhkDWrGeqh5lC9Qb77gbjttBw3ZQixu0a0c9IueUjia5UaiK17S9+z5K3QuTicGxcUnQyLnjJnDrg+WI5TMxIdCU4pFqdovnj0Q999Njl1gsuk7Hig5nn3UpUP6GLrsWSPyaho484G0Lxr++pNjqku9YE8JVIRZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Q1xfhvoZ; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BAF461F65B;
	Mon,  9 Jun 2025 15:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749483924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dlGWUhva3kGs1RISxq/rd4pyC6pmuyqH7UPyu/eBX5c=;
	b=Q1xfhvoZ8rA/smOkbSOAIh7DQTHIBcSCZnvb2wZBDuYUiLJMo+tWWVQvepnf/92ocriULE
	4ETt1WPgrZJ6TSCZrJD8IQKeBXJY9l7k8WNOK97vDmWNLpkvjBbZ6jyhMkp/9z3msaHeCp
	1n71iZxTpar0LbHtJ7DHAbKMQzm//vmM0dGnVLZ5XbVCzkdSx7kjK3AbhSVV5cU0qtu6jM
	ewqiGIaZZNHbpFh4psTkuCT6Mw86KKrwNFg/Nl5u9n6pgffY8Zxw+ElhLQaG4IurDREfo5
	qKiYq2PyGj/o1JDYs7aFmxTb8lJxk6Bu8itNvjmPVE5l+I5qMGhjm6sqSopyPg==
From: Kory Maincent <kory.maincent@bootlin.com>
Subject: [PATCH v2 0/5] Add support for BeagleBone Green Eco board
Date: Mon, 09 Jun 2025 17:43:50 +0200
Message-Id: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADYBR2gC/1WMQQ7CIBREr9L8tRigItaV9zBdQPtpf6LQQENsG
 u4udufs3mTm7ZAwEia4NztEzJQo+Ary1MAwGz8ho7EySC4VV7Jl1k5MXzsubqNw0mioyyWio89
 hefaVZ0priNshzeLX/v+zYJyhu5gOlcaahw1hfZE/D+ENfSnlCxzCmgeYAAAA
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdelgeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduhfevudetfffgkedvhfevheeghedtleeghfffudeiffefvdehfeegieeivdekteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtoheprhhoghgvrhhqsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheplhhinhhugidqohhmrghpsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhto
 heprggrrhhordhkohhskhhinhgvnhesihhkihdrfhhipdhrtghpthhtohepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtohhnhiesrghtohhmihguvgdrtghomhdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: kory.maincent@bootlin.com

SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Green
(BBG). It has minor differences from the BBG, such as a different PMIC,
a different Ethernet PHY, and a larger eMMC.

Also update the omap.yaml binding to include missing compatible strings
that were previously undocumented.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Changes in v2:
- Add patch 1 to 3 to fix binding and devicetree inconsistencies.
- Rename tps node name to generic pmic node name in am335x-bone-common.
- Link to v1: https://lore.kernel.org/r/20250523-bbg-v1-0-ef4a9e57eeee@bootlin.com

---
Kory Maincent (5):
      arm: dts: omap: Remove incorrect compatible strings from device trees
      binding: omap: Add lots of missing omap AM33 compatibles
      arm: dts: omap: am335x-bone-common: Rename tps to generic pmic node
      arm: dts: omap: Add support for BeagleBone Green Eco board
      arm: omap2plus_defconfig: Enable TPS65219 regulator

 Documentation/devicetree/bindings/arm/ti/omap.yaml |  39 +++++
 arch/arm/boot/dts/ti/omap/Makefile                 |   1 +
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi  |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts | 170 +++++++++++++++++++++
 .../boot/dts/ti/omap/am335x-bonegreen-wireless.dts |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts     |   2 +-
 .../arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts  |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-shc.dts           |   2 +-
 arch/arm/configs/omap2plus_defconfig               |   3 +
 10 files changed, 219 insertions(+), 6 deletions(-)
---
base-commit: e22b9ddaf3afd031abc350c303c7c07a51c569d8
change-id: 20250523-bbg-769018d1f2a7

Best regards,
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


