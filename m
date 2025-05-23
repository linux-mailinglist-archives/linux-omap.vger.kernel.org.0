Return-Path: <linux-omap+bounces-3732-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C32E8AC26F4
	for <lists+linux-omap@lfdr.de>; Fri, 23 May 2025 17:58:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E960D1C031FF
	for <lists+linux-omap@lfdr.de>; Fri, 23 May 2025 15:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD507296703;
	Fri, 23 May 2025 15:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lfjWGPXI"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDAE295530;
	Fri, 23 May 2025 15:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748015901; cv=none; b=L6+UcXa0LF/S1GvTrCm7ky9YxRMOThAMiUZbuXtAJXL5oNopoA1pBnK8H4g+GszZguywjK7nTFPDGFfXfqIuloElKiTHw+YCpQfUd0lhL9NdfMlhbIf5bQ5IxXbXoWOPexs0IMV76XbVsRNpl+vd2BWP8HBHykfDU4MIBSR5vvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748015901; c=relaxed/simple;
	bh=ipjqphh0tJIAcw0lWU+mtW2r01rYgIJDvAe7i6wsK8o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NpzXJLYDXhZmusjyeoj0m3d3vzeUy+qRqXT9RHw3ZEV1TjEcF/T0uGRZHipk7NZcdatvEVHy1OEetP6gj/Ue3QAcmrnNx6uJr60crzcFT+eDKzRBIK//UU8DOlb6O4GNuhOExWExeqkFr8RsY9ygv6bEdgYquZQtm3e1Bt4V4pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lfjWGPXI; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4EC4F438E6;
	Fri, 23 May 2025 15:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748015895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=x1PlknqqM+1yIeM2n6wW7shdhnBezxlzPct37zV+Mzw=;
	b=lfjWGPXIAtGNpoNgqVtN1Aglz8E0XSr55Pze2zyeuBJX+hpIwPXeCwCHMpO6OiyOGKKJFP
	CuwFHUbgPxHbEBny1wq+iuWG1fh1yIdJ7Ibna7q2z7QIoViCZgSsh3ZVkNPkPbQgLAYSNY
	iY1EMKuwec2fwDCNlNzdd+e+zPUfsb576WWHkOoxAVwJBzfKHLGHYnE2WJwRF2FN9BJ1PK
	IssgOmIR9iVk0dLPpJ2NGLjm8utDcZgUvLZ3YxyvDYwfuJMERlqBWztvC7bqCj01b+9bHL
	XDwpZgTuQ6Ky7y5NoF37HxbvCWR0t1lNzIW3VyYa+VJovHh4LEVtgeFebe5PpA==
From: Kory Maincent <kory.maincent@bootlin.com>
Subject: [PATCH 0/2] Add support for BeagleBone Green Eco board
Date: Fri, 23 May 2025 17:57:41 +0200
Message-Id: <20250523-bbg-v1-0-ef4a9e57eeee@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPWaMGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyNj3aSkdF1zM0sDQ4sUwzSjRHMloMqCotS0zAqwKdGxtbUASq/OY1U
 AAAA=
X-Change-ID: 20250523-bbg-769018d1f2a7
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
X-Mailer: b4 0.14.3-dev-d7477
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdelvdejucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedugefgudfftefhtdeghedtieeiueevleeludeiieetjeekteehleehfeetuefggeenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedukedprhgtphhtthhopehkhhhilhhmrghnsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehrohhgvghrqheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhorhihrdhmrghinhgtvghnthess
 ghoohhtlhhinhdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprhgtphhtthhopehprhgrnhgvvghthhesthhirdgtohhm
X-GND-Sasl: kory.maincent@bootlin.com

SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Green
(BBG). It has minor differences from the BBG, such as a different PMIC,
a different Ethernet PHY, and a larger eMMC.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Kory Maincent (2):
      arm: dts: omap: Add support for BeagleBone Green Eco board
      arm: omap2plus_defconfig: Enable TPS65219 regulator

 arch/arm/boot/dts/ti/omap/Makefile                 |   1 +
 arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts | 170 +++++++++++++++++++++
 arch/arm/configs/omap2plus_defconfig               |   3 +
 3 files changed, 174 insertions(+)
---
base-commit: a02c7665c216471413ed5442637a34364221e91c
change-id: 20250523-bbg-769018d1f2a7

Best regards,
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


