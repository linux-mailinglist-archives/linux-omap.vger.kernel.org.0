Return-Path: <linux-omap+bounces-3895-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 818F8ADCA41
	for <lists+linux-omap@lfdr.de>; Tue, 17 Jun 2025 14:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B24B189431D
	for <lists+linux-omap@lfdr.de>; Tue, 17 Jun 2025 12:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE3F2E425E;
	Tue, 17 Jun 2025 11:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bmyH/XkM"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433C82E06C6;
	Tue, 17 Jun 2025 11:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750161583; cv=none; b=GZ9mSx5d5kZR4bDGmpRD1A2OKpd6xLPndzOf/PIFmMTJifKp+hxrOGyHZ9hoxPRMhl9zUvEdR+x6y6FSaaD3jd73mfsYVj+gsRqvGFWhna/edJ0KFyywOayEU37yCOOqkzzxil+5jrjT7e7r0ceqf2f63QCNYrjcaRGbKqNgVGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750161583; c=relaxed/simple;
	bh=N2UYITogtfecT3kXHmGjJKBWnKKAGejg+NybZgL/OX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZRSqXQfvHW3GeJALvKNdH7Bg3JbuWhnmI9sgOSPBlFeTNei4M+5dUGgx9Sb51yoAEs9S+t0XQHele2cocIeqULv2fW6eZfSZZYdqb6WYFzedTnCfBIkXw3kx5DuJMpy0SkaBHanVFLKXs9Mp//dcfxSyQoUu0qWQPriQBfzRbzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bmyH/XkM; arc=none smtp.client-ip=217.70.178.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 990C54496B;
	Tue, 17 Jun 2025 11:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750161579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YLidNV2GFKH/2JeWLKry+LSYqYYCzq3L8dBLPFyZJ/4=;
	b=bmyH/XkMXfEywqLZu6X4RIPcL5M8jVhT4dbWL+PoCnRUDE7hxW94wiM+5WIMKn+col2lS8
	3CtiN5zXa01phYOmovz5iyDw7wVY/Y5NtmhiiunHU/rUNMEkqh50TPzIHps/nDoYd/quID
	FahaNGvgN5wr6gPIKhTsFGHiruyyNEa/hHUBjg0KXF1UJKV+URhV5eIvXnpDA2Xi4a6Vcn
	imrirDJfwe+8OpkCUbFwCFbacdBmssSRKS+swll5VqjMFNoJmVmLvWBtPsfeO/cJM2npLA
	KueeMPpcKjzsJ0ewK7hD4inAH2itmr4MM8NEIMfTU8/c8/ImRseymf/bxVqiew==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Tue, 17 Jun 2025 13:59:30 +0200
Subject: [PATCH v4 7/7] arm: multi_v7_defconfig: Enable TPS65219 regulator
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-bbg-v4-7-827cbd606db6@bootlin.com>
References: <20250617-bbg-v4-0-827cbd606db6@bootlin.com>
In-Reply-To: <20250617-bbg-v4-0-827cbd606db6@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvefgvdfgkeetgfefgfegkedugffghfdtffeftdeuteehjedtvdelvddvleehtdevnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtoheprghnughrvggrsheskhgvmhhnrgguvgdrihhnfhhopdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqohhmrghpsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehjkhhrihgunhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhnhiesrghtohhmihguvgdrtghomhdprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhm

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


