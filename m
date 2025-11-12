Return-Path: <linux-omap+bounces-4910-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 46574C5332F
	for <lists+linux-omap@lfdr.de>; Wed, 12 Nov 2025 16:54:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C6E3D5069B6
	for <lists+linux-omap@lfdr.de>; Wed, 12 Nov 2025 15:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFB3342507;
	Wed, 12 Nov 2025 15:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MRUJtnmY"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469FF33E372;
	Wed, 12 Nov 2025 15:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762960480; cv=none; b=oznvNcgqLjXFFBZYSzBbcEEmcVmQh5IR+jp2NwZpoe2Mmh7c96/JADKr4/Qx7ILzEELpBgKjCTG0pwrBpAzB4MNynSRXrP8WshWPRXjrOYYZZP+id536DDwyIFRw7gznL5ZAjrlII2pMElFrPRHPecj6SeXOMUNx52T4x3mG4mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762960480; c=relaxed/simple;
	bh=hMJzIR4lZEcblXjR0I9hzQzbHScfcP0F6rIKaU7ffA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R4kWchd6GjLlD+s/RPtuVL5ee4da9e/UGnndE23a+IWsHg5QCwjMITXkPuo7vUJ+XofRFflDnwlA4WZbNND2VTKrWNjVAvgm+mtMSx7SwRC8STKSWiOkFdgU7j1IFpgA75bgyD1SzcOWE89+GORaY5aJcmVLAspz2Ljr/w0v4NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MRUJtnmY; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BE4D64E4166C;
	Wed, 12 Nov 2025 15:14:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8FAC560710;
	Wed, 12 Nov 2025 15:14:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9A4F102F1A2B;
	Wed, 12 Nov 2025 16:14:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762960475; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Hi/5WmyJVI8+IqSzvn7iNXPzQu9SoH12tl/3+e8BE4I=;
	b=MRUJtnmYyUioxknI08eCMhkw5KitvAMdyhFReE5y3ycgW3b8R8zwNXzJGidOWAcoDwmGp2
	4LKspJ/prvz2mwNBddvkgxg4ucfmuQJJEShP0ZVEpRLROP85YtJYqFOp/SWBiR0/7dI+X/
	Z5TU/LsW4RLUAxJeYAElocwS4p8p7y2aFXJjmKKwIglWZ3w+gksK67qt9UU34bi0FrtdaP
	sB7QO3fPrEw6W0RNPcf6iAOo/NOsOF8pjube/ef5YHPgmjIPKwGrAGsaS/twIyr8mqE8sY
	xQll78eaoWFuWPdSQYamn0EtdRbMI4K7Pf3bYk3q7h/OCVoL6hCXmL5Z0hcu+g==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Wed, 12 Nov 2025 16:14:21 +0100
Subject: [PATCH v4 2/2] ARM: dts: am335x-bonegreen-eco: Enable 1GHz OPP by
 increasing vdd_mpu voltage
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-fix_tps65219-v4-2-696a0f55d5d8@bootlin.com>
References: <20251112-fix_tps65219-v4-0-696a0f55d5d8@bootlin.com>
In-Reply-To: <20251112-fix_tps65219-v4-0-696a0f55d5d8@bootlin.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Lee Jones <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andrew Davis <afd@ti.com>, Bajjuri Praneeth <praneeth@ti.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The vdd_mpu regulator maximum voltage was previously limited to 1.2985V,
which prevented the CPU from reaching the 1GHz operating point. This
limitation was put in place because voltage changes were not working
correctly, causing the board to stall when attempting higher frequencies.

With the recent TPS65219 PMIC driver fixes that properly implement the
LOCK register handling, voltage transitions now work reliably. Increase
the maximum voltage to 1.3515V to allow the full 1GHz OPP to be used.

Reviewed-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts
index d21118cdb6c2c..f00abfdd2cbd4 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts
@@ -63,7 +63,7 @@ regulators {
 			buck1: buck1 {
 				regulator-name = "vdd_mpu";
 				regulator-min-microvolt = <925000>;
-				regulator-max-microvolt = <1298500>;
+				regulator-max-microvolt = <1351500>;
 				regulator-boot-on;
 				regulator-always-on;
 			};

-- 
2.43.0


