Return-Path: <linux-omap+bounces-3934-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E111CAE15D2
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 10:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AF011788C5
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 08:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08AD82367B7;
	Fri, 20 Jun 2025 08:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ecNrct5h"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAEE4685;
	Fri, 20 Jun 2025 08:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750407914; cv=none; b=XSvBQIqyYMKxSeqDsFJAeN9rvMdIRyMUgntUI+yqZXfETMvMhrK0jS4JPFvTR7ZKsaAInkuugGx4DuqVItPPjHzx0j7mA6MjZvowMuecbdGYQOSyah32mqR5b8DLFy5UnadDraUMSD1cTqV2qDEPp5zQeOQZGqfbUnoA3wniagA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750407914; c=relaxed/simple;
	bh=8ABtenNmTJXm6OLMSEc4qgTfYHPuyEw5w8fRORSVstY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HcZd6Uvkj6fzDgPTZ/OcP1MMMLSQb36unL3xjJ5tXq2H20HDSNLex3jee0aY7QPauFkyXqK7/+vvo28WQbZXFDK/mKckF275OViL8O9A4Lie8q29B0qRhtjEN3UK8b4fAFIrcOQAhNIWDiIQofMTTNrF0+f+67hSBagTyBOl0q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ecNrct5h; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3CCD743290;
	Fri, 20 Jun 2025 08:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750407910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gDPNG7WMvm3bEoGApTr+1a6HMKuYycQMrui7vFgvIMc=;
	b=ecNrct5h/xPO0eM8VGijl260rKUqbBJIc1PzOfGIlY9Q1PACNqAh1P64dktpTA0/sEz/pB
	mYEqSIi5RDHRsNbCVFA51AlrOMRH9xkgFRadtOgXISSHY0qIIIJESo0G46t/aBQmbCaV0r
	JrJo1LyoCXCe48fFL3tbP2zfbRHgTg2+VQtFG44W1THprFY7gzu5HER1v3uGd/6MyQ+sJv
	FIVvuqYYb6QiFGfiMC1pOKabHQXChkQy7yvU2v9/5Te9kZwZvUXeDOYG6KqfvmlTAoEbQ7
	86HBfnjgeqkhxVdTbQSsNDIF03DXCZcRObWafbkqjnU9UEOpv1bjR0lJ+OQQsQ==
From: Kory Maincent <kory.maincent@bootlin.com>
Subject: [PATCH 0/2] arm: dts: OMAP: Clean up devicetree bindings and
 compatible strings
Date: Fri, 20 Jun 2025 10:24:07 +0200
Message-Id: <20250620-ti_dts_clean-v1-0-786a3059bca7@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKcaVWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0NL3ZLM+JSS4vjknNTEPN0UwxQLs2TLVDNz0zQloJaCotS0zAqwcdG
 xtbUAsd8+mF4AAAA=
X-Change-ID: 20250619-ti_dts_clean-d1d86c9e675f
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdejleduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduhfevudetfffgkedvhfevheeghedtleeghfffudeiffefvdehfeegieeivdekteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudelpdhrtghpthhtohepthhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehprghulhdrsggrrhhkvghrsehsrghntghlohhuugdrtghomhdprhgtphhtthhopegrnhgurhgvrghssehkvghmnhgruggvrdhinhhfohdprhgtphhtthhopehtohhnhiesrghtohhmihguvgdrtghom
 hdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehprhgrnhgvvghthhesthhirdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: kory.maincent@bootlin.com

This series addresses inconsistencies in OMAP devicetree bindings and
compatible strings for AM33xx-based boards:

- Add missing compatible strings to binding documentation
- Update vendor prefix from "ti" to "beagle" for BeagleBone boards
  to reflect actual hardware vendors
- Remove redundant compatible strings from device properties

Note: Originally attempted to align devicetree model descriptions but
received pushback due to Debian script dependencies (see thread at
https://lore.kernel.org/all/7e854232-f02f-4ad6-b65e-22c18d1d9fe5@jm0.eu/).
The compatible string changes may face similar concerns and would
benefit from devicetree maintainer review.

This work was split from a larger series to address feedback and allow
independent progression of each topic area. Original series:
https://lore.kernel.org/r/20250617-bbg-v4-0-827cbd606db6@bootlin.com

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Kory Maincent (2):
      dt-bindings: omap: Add missing AM33xx compatible strings
      arm: dts: omap: Remove incorrect compatible strings from device trees

 Documentation/devicetree/bindings/arm/ti/omap.yaml | 22 +++++++++++++++++++++-
 arch/arm/boot/dts/ti/omap/am335x-base0033.dts      |  2 +-
 arch/arm/boot/dts/ti/omap/am335x-bone.dts          |  2 +-
 .../boot/dts/ti/omap/am335x-boneblack-wireless.dts |  2 +-
 arch/arm/boot/dts/ti/omap/am335x-boneblack.dts     |  2 +-
 arch/arm/boot/dts/ti/omap/am335x-boneblue.dts      |  2 +-
 .../boot/dts/ti/omap/am335x-bonegreen-wireless.dts |  2 +-
 arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts     |  2 +-
 arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts    |  3 +--
 arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts  |  2 +-
 .../arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts |  2 +-
 arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts  |  2 +-
 .../ti/omap/am335x-sancloud-bbe-extended-wifi.dts  |  5 +----
 .../boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts  |  5 +----
 arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts  |  2 +-
 arch/arm/boot/dts/ti/omap/am335x-shc.dts           |  2 +-
 16 files changed, 36 insertions(+), 23 deletions(-)
---
base-commit: e22b9ddaf3afd031abc350c303c7c07a51c569d8
change-id: 20250619-ti_dts_clean-d1d86c9e675f

Best regards,
--  
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


