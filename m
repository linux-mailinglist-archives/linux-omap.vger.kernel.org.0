Return-Path: <linux-omap+bounces-4906-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCC6C51725
	for <lists+linux-omap@lfdr.de>; Wed, 12 Nov 2025 10:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 512BE189F5C9
	for <lists+linux-omap@lfdr.de>; Wed, 12 Nov 2025 09:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB113002BD;
	Wed, 12 Nov 2025 09:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="p+3jHZwp"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FA42FF66C
	for <linux-omap@vger.kernel.org>; Wed, 12 Nov 2025 09:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762940739; cv=none; b=Obw2dvgFfl9lwF6hSnHEad9S+YN+/n7gCv4fTJbrxJvY4VFTBM6j6iS5FPMiFSv//ibgFDiWvZUidaRx13BDT2kFlLscFRNm3e03gotHGl/2dk6Kn3ADyFk+Ec6upZRpu/Hh3kAE31UYX49Kc+ERSZX0ejWDdnLBM1U49GG30MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762940739; c=relaxed/simple;
	bh=hMJzIR4lZEcblXjR0I9hzQzbHScfcP0F6rIKaU7ffA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BdOj4hVp4w1VxrBF28SDHfeNZkEI4d1IpaNdlsRd2+bjMXKxYz0V2TKzsR5LGcNg8+Uj42mhkUlPhyIjJkQeov5htP7wEN9JXfwR48h3dXATewhfSgzSHeacWeONSEwZ6defuzr0awGCwkMQJB1qRygNBHooC8SeKNChEcBb2wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=p+3jHZwp; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 686E0C0F567;
	Wed, 12 Nov 2025 09:45:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 07ECD6070B;
	Wed, 12 Nov 2025 09:45:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 208C810371997;
	Wed, 12 Nov 2025 10:45:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762940735; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Hi/5WmyJVI8+IqSzvn7iNXPzQu9SoH12tl/3+e8BE4I=;
	b=p+3jHZwp/F/hDJYWcsKK2sHZ1LrLMeUS570EZnkVw6var4BvdZeI8zx3O3tgU6pTXx7k7R
	j8FkxliIWs7H3+HK6zyItES3GsFgEj5KpUoS5WisYgjg5WWxvMcW4B0XFVn/yPpjS4QReI
	CyGJ9hsUBnPpNx3i08+xdNAUnMCtf7hYlJoeg6BOHKxAy8W4CSlQZfheoPTaaCwgYb9R4x
	pyb+Q0PSHbao5YON3asqQVV10kXLlYB2ScnNJ6fOfm8752kWiZ9kOVY7Tmrcu0lrw0Q+85
	+HTAZ/ecBYocdMlsy5LsdQmYhaDrMsGdlCLHXTRhQYZsIF/COpcFEy7bHyt8YQ==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Wed, 12 Nov 2025 10:45:25 +0100
Subject: [PATCH v3 2/2] ARM: dts: am335x-bonegreen-eco: Enable 1GHz OPP by
 increasing vdd_mpu voltage
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-fix_tps65219-v3-2-e49bab4c01ce@bootlin.com>
References: <20251112-fix_tps65219-v3-0-e49bab4c01ce@bootlin.com>
In-Reply-To: <20251112-fix_tps65219-v3-0-e49bab4c01ce@bootlin.com>
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


