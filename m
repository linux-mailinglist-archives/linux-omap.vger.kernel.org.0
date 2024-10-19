Return-Path: <linux-omap+bounces-2462-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFA89A4CF2
	for <lists+linux-omap@lfdr.de>; Sat, 19 Oct 2024 13:12:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BD341C2143C
	for <lists+linux-omap@lfdr.de>; Sat, 19 Oct 2024 11:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 701A81DF96B;
	Sat, 19 Oct 2024 11:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="eQKWuXLH"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4358017BB3F;
	Sat, 19 Oct 2024 11:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729336314; cv=none; b=MQRfNGnmImCYPQp7pHqodLlmu/uAvbgCVhelryW+JvHLAZrTb3XAoXF3fa4RoRhdmBUr5GY23dzUkOmubs+Itx6Hsza7UkWfDldLaQB/m+ZTpkkcdhPIKqaAv2uYWkoa92peePNKqSUVbNodmPVw2nmwGcZ9G9t3zdj7hX5aE1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729336314; c=relaxed/simple;
	bh=+Znl7udYsby1/ZbrW23K5tfSc02/nhO7vkOijqLyuP4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=snn3WQFZ6jvqEN17MxSVpWHh5UYYZLnwTF57H8YGKrE+J54O+J9tAmis23wl7bmmosr4L69bdBt+97l6aJaiUWiZ4GEiYtZBOCqhOgO68KUZs2IZbLv6yx8M3WjnURo9S7Kij6IVogdMzcdXTmMg8HaXJ1K/rH96fa616oGyBts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=eQKWuXLH; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=KzS/lrMPI8bnJVJeAs/gylf+o2SxkgLZL1IoOva2gG8=; b=eQKWuXLHb9NaSeddkSMqhRSket
	qEkgiiLfLRVVnZ0bXDuembXv9oWj++mpJl9Lzzml2wr+bF00/OLxyel2AAshs85EJoAulHQ0HFX1w
	VgkQP8WxE3mT4rst4DfT6vU6Wsb3lZwen8lNKcR2xW4ggRGvV4Ea7oxGMfFYsO5AaP4cHK3N2DD10
	msND8EWlyeTTead0VM4ERDS7uFbep8G3ZPzdzaROVM0tzR3YCplOVeFLBXM2qtIg0v/92KydLYxP6
	lSLTt6OR3clK57R+xHqOrZqwM9Yqiy9MEOMo4F7vfUt+VU1zbuLKeZpBKLL0xF8CX+pDwUtwStVTS
	55xUC27A==;
From: Andreas Kemnade <andreas@kemnade.info>
To: tony@atomide.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aaro.koskinen@iki.fi,
	khilman@baylibre.com,
	Roger Quadros <rogerq@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH] ARM: dts: ti/omap: omap4-epson-embt2ws: add charger
Date: Sat, 19 Oct 2024 13:11:21 +0200
Message-Id: <20241019111121.331477-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add charger and battery definition for the Epson Moverio BT-200 to make
charging working.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 .../boot/dts/ti/omap/omap4-epson-embt2ws.dts  | 28 ++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
index 339e52ba3614b..5d4c10325b322 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
+++ b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
@@ -17,6 +17,24 @@ memory@80000000 {
 		reg = <0x80000000 0x40000000>; /* 1024M */
 	};
 
+	battery: battery {
+		compatible = "simple-battery";
+		device-chemistry = "lithium-ion";
+		charge-full-design-microamp-hours = <2720000>;
+		voltage-max-design-microvolt = <4200000>;
+		voltage-min-design-microvolt = <3300000>;
+
+		constant-charge-voltage-max-microvolt = <4200000>;
+		/*
+		 * vendor kernel says max charge 1400000, input limit 900000
+		 * and charges only with dcp chargers. So it is unclear what
+		 * is really allowed. Play safe for now and restrict things
+		 * here. Maybe 900000 is just the limit of the vendor charger?
+		 */
+		constant-charge-current-max-microamp = <900000>;
+		charge-term-current-microamp = <200000>;
+	};
+
 	backlight-left {
 		compatible = "pwm-backlight";
 		pwms = <&twl_pwm 1 7812500>;
@@ -87,6 +105,14 @@ twl: pmic@48 {
 		#interrupt-cells = <1>;
 		system-power-controller;
 
+		charger {
+			compatible = "ti,twl6032-charger", "ti,twl6030-charger";
+			interrupts = <2>, <5>;
+			io-channels = <&gpadc 10>;
+			io-channel-names = "vusb";
+			monitored-battery = <&battery>;
+		};
+
 		rtc {
 			compatible = "ti,twl4030-rtc";
 			interrupts = <11>;
@@ -166,7 +192,7 @@ twl_pwmled: pwmled {
 			#pwm-cells = <2>;
 		};
 
-		gpadc {
+		gpadc: gpadc {
 			compatible = "ti,twl6032-gpadc";
 			interrupts = <3>;
 			#io-channel-cells = <1>;
-- 
2.39.2


