Return-Path: <linux-omap+bounces-4870-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F82C3A66B
	for <lists+linux-omap@lfdr.de>; Thu, 06 Nov 2025 11:56:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 096BE3AF39E
	for <lists+linux-omap@lfdr.de>; Thu,  6 Nov 2025 10:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8714830CD85;
	Thu,  6 Nov 2025 10:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CdT/M/jw"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E93D2EFD9B;
	Thu,  6 Nov 2025 10:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762426211; cv=none; b=gBzJfHKK+AdMHKBUigTldAchCXU0N9M9ALlVtoCVrawx1ZGv5DTflpVXTdvnuRg2KbEuszse/c/igB/uUwj1k3mCJJexi4IlyCjg7IaE33h9ntQJkFEGFBtKxj1pokI/pwHpmNTJHwSzbIwrym6FddEqJpaPGrr88b7wARSI5+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762426211; c=relaxed/simple;
	bh=8UIsRhUEFzinLUGc744IWvO0O91rZDhgOYbtZ7rTnY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ajZfvEi10c19asny+qxlNqOv+wqm126aQ1qKJKczAi+RVY6FuP6gaKGUgzu1hvIB+bWxt6b6rBkU84xWXtQddZWtIEanwgd5tJZE7i1iCKZ3EzruZmKMJme72UUBW4OvyaUHxBDuIjCSNV7/VQDBrx2HqsLZ4biblfzsSI+lrw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CdT/M/jw; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5DDD2C0FA88;
	Thu,  6 Nov 2025 10:49:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6C9CB6068C;
	Thu,  6 Nov 2025 10:50:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0289411850A0A;
	Thu,  6 Nov 2025 11:50:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762426206; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=c62G9irREdApF+2GHPJ1kR7br9S2AzEZ2ez6tWbkWpM=;
	b=CdT/M/jwIeIIynO3JmpdYWf9Syh3sbg2E8K/AI4CiZwGaIt+/SIZtbqhQKFnzYVUrMS6Pg
	WbOpWAQIJpQtfQJLEexDyFWYbSxu9LpsgqVzoIJFyjLQ/Nkt3p9SOmOvxz8yZEjYo3w/qV
	oV1WIFDyIaTJMw1twULYNSIAQ166edBwNYyZGY27lx9tg39GYY01ThA4hkCTZOX8Ku1mqw
	Qp5wJdlgk2jA5aiXfPdYRjwHt0QF8U4x6nkyp0qKG3Ir5nfz1DdexClD83RQfgIEDVrwnV
	/steLX9mcGXvHcyp+s7UV83pSEm7M2or8sTErQcQATr3387maKZBeW6nP/82NA==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Thu, 06 Nov 2025 11:49:03 +0100
Subject: [PATCH v2 2/2] ARM: dts: am335x-bonegreen-eco: Enable 1GHz OPP by
 increasing vdd_mpu voltage
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-fix_tps65219-v2-2-a7d608c4272f@bootlin.com>
References: <20251106-fix_tps65219-v2-0-a7d608c4272f@bootlin.com>
In-Reply-To: <20251106-fix_tps65219-v2-0-a7d608c4272f@bootlin.com>
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


