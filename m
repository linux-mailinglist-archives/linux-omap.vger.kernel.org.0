Return-Path: <linux-omap+bounces-3867-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9742EAD91E9
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 17:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABCCF17B978
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 15:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A20F202C52;
	Fri, 13 Jun 2025 15:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YQ5haUf4"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD011C5F2C;
	Fri, 13 Jun 2025 15:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749829798; cv=none; b=gDtkO7xsFVn7kiNAaTwFn1m49JAQIIGw2/4tuwFXyTZNEaf2aNn9KOzdPBuKwfBgvzyu1rxI+dnRu0TqOG74vQtVQ5MkV7YbJiF/i1P/5hzjh3kn+DLEgD72b92iU6430loHjEZFFLIHQIEr7fFQq8FIND8Z/YS006ObrA/QD3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749829798; c=relaxed/simple;
	bh=xdCDFsY7fHfgyuBIW40huzR//1ytnbFa21uQW+dNB+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m5c6TGvU8wezrHI8yqiviI9atK+0kVImOpitC4VYSklKr+QbmrcyKRVA8Ox1uvStY3vuXJ0uksk/Y74cagpzzS38ce1T5gyYg6OaMCGSugtANnRIetRp8UFExYnH1hXWeEVBGT1vldePPbBLyqSAhZT0hnbzahNDWvMCR4Sh6Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YQ5haUf4; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EAFA344423;
	Fri, 13 Jun 2025 15:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749829794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v1FemFSObCbEVYAn/hTqf4EyYMN6hadEZQLG7F20BzM=;
	b=YQ5haUf4MGZknhpKqWKmRoydgFIHIXX7eOIPMF19aFHD1E7AtPH0r+fIDAzdUQ+viOLOzS
	Z0/JPIt4JvvLiF3NSz18rw3a88z6uu+RIcpsq3zCnlu6WgsWtgcbr3SetKiJtQeMxFKcy/
	D688E3Ijw4RLK4pGhJOeeR4WcO3WL/rI10Hc891qn0VGEa0SSL2MszPiJm634wKkHe1yp/
	sZZxcSJMG5g44KAocIzsQEk6mfe2K3jE7PamlO3J44rGWIfTGbC67y5hxnWEe+k5z9s4NW
	Yrxrct8tih8J5mTn0kvqMYBwwR2Zs4WvVgxAlyHSujJRKraZVeRMa/91pUfCUg==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Fri, 13 Jun 2025 17:49:49 +0200
Subject: [PATCH v3 6/7] arm: omap2plus_defconfig: Enable TPS65219 regulator
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-bbg-v3-6-514cdc768448@bootlin.com>
References: <20250613-bbg-v3-0-514cdc768448@bootlin.com>
In-Reply-To: <20250613-bbg-v3-0-514cdc768448@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeefhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvefgvdfgkeetgfefgfegkedugffghfdtffeftdeuteehjedtvdelvddvleehtdevnecukfhppedvrgdtudemtggsudelmeekheekjeemjedutddtmeeftdgtfeemkegthegsmehftdekugemgeefgegsnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkeehkeejmeejuddttdemfedttgefmeektgehsgemfhdtkegumeegfeegsgdphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvggrsheskhgvmhhnrgguvgdrihhnfhhopdhrtghpthhtohepmhgrrhgtrdhmuhhrp
 hhhhiesshgrnhgtlhhouhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqohhmrghpsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhkrhhiughnvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtohepkhhhihhlmhgrnhessggrhihlihgsrhgvrdgtohhm
X-GND-Sasl: kory.maincent@bootlin.com

Enable the TPS65219 regulator in the defconfig, as the TPS65214
variant is used by the newly introduced BeagleBoard Green Eco board.

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 arch/arm/configs/omap2plus_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 9f9780c8e62a..2ad669f7b202 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -385,6 +385,7 @@ CONFIG_TOUCHSCREEN_TSC2007=m
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_CPCAP_PWRBUTTON=m
 CONFIG_INPUT_TPS65218_PWRBUTTON=m
+CONFIG_INPUT_TPS65219_PWRBUTTON=m
 CONFIG_INPUT_TWL4030_PWRBUTTON=m
 CONFIG_INPUT_UINPUT=m
 CONFIG_INPUT_PALMAS_PWRBUTTON=m
@@ -454,6 +455,7 @@ CONFIG_MFD_TPS65217=y
 CONFIG_MFD_TI_LP873X=y
 CONFIG_MFD_TI_LP87565=y
 CONFIG_MFD_TPS65218=y
+CONFIG_MFD_TPS65219=y
 CONFIG_MFD_TPS65910=y
 CONFIG_TWL6040_CORE=y
 CONFIG_REGULATOR_CPCAP=y
@@ -470,6 +472,7 @@ CONFIG_REGULATOR_TPS65023=y
 CONFIG_REGULATOR_TPS6507X=y
 CONFIG_REGULATOR_TPS65217=y
 CONFIG_REGULATOR_TPS65218=y
+CONFIG_REGULATOR_TPS65219=y
 CONFIG_REGULATOR_TPS65910=y
 CONFIG_REGULATOR_TWL4030=y
 CONFIG_RC_CORE=m

-- 
2.43.0


