Return-Path: <linux-omap+bounces-2271-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DD698AF1B
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2024 23:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EFFC281D44
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2024 21:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04348183CD6;
	Mon, 30 Sep 2024 21:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="U+AdBBPh"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C35A150997;
	Mon, 30 Sep 2024 21:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727731821; cv=none; b=nPkJOmEydLGYcjAzVdwVlArfDHwjQdNERr5dJG/214tl5DxQVRHnSWr/17rW4slUoAoBRVEc2gelISNl7Ys54SLLXH+UdOaEIyzsgXffd6wvmm0Q3CnxKRuYKIhSXNIQDGFAkXyFp2LI55E7gmwoKr0yh00m3tihf47vy85kyxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727731821; c=relaxed/simple;
	bh=EJTETnOE6TbCVs5t6pDRYT702r7Gc54n+28Nn2vuWNA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VhH59Q/WZBQMbdHiensiHAuO41yfYRqKV9wZ4Tn+UVQGmV8uQDi1BpQbIqrJzwuYm2s2yj0YpaR7NLggsYOQeW+uaaGihAOEpa+mnQkifUPNCKh+27b9KLbnmE4RGW5VftJkK6zuD2sGNhHsyagyI0u7upjvzH3vRiet/o6VPYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=U+AdBBPh; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=aNyYVkrcJo+A/3YRdv8grml7z7DmMHYukmGbkLpDXmc=; b=U+AdBBPhAUNj706Qrs8+Wt4AHx
	XUDrOBlh1M8+LoJ+QM5UexKkwXnooaamrVMgNMxBfxgVx8ue0gtmuTqx/Fj6MBwoxvqF/OjpBJoQM
	6xEm19DZtC3GpTT4JcNYAW1rFu7bGsru9BCMAQeeuyyS/fyWLI7dB5uHdHbbR58O/weZHq/9WNK53
	ByOKVFORS8n8l2KsLbNMz8/M/X+IaaFlNa3rNSKfdgscEYD9ggYrTvW1VeP/8eeMKb60zr6G+Wz1r
	l/14lt65t5+ugOVEhFGKIQYXo/MJUWtHYsIESXTUZPud+fruZDEjMmhy7R3hx0cn2hf5bEyCemY9h
	1l5PDvRA==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	khilman@baylibre.com,
	devicetree@vger.kernel.org,
	tony@atomide.com,
	rogerq@kernel.org,
	aaro.koskinen@iki.fi,
	linux-omap@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 2/4] ARM: dts: omap: omap4-epson-embt2ws: wire up regulators
Date: Mon, 30 Sep 2024 23:30:06 +0200
Message-Id: <20240930213008.159647-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240930213008.159647-1-andreas@kemnade.info>
References: <20240930213008.159647-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wire up the regulators where usage is plausible. Do not
wire them if purpose/usage is unclear like 5V for
many things requiring lower voltages.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
index d6b0abba19f6..cc1b6080bf95 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
+++ b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
@@ -20,13 +20,13 @@ memory@80000000 {
 	backlight-left {
 		compatible = "pwm-backlight";
 		pwms = <&twl_pwm 1 7812500>;
-		power-supply = <&unknown_supply>;
+		power-supply = <&lb_v50>;
 	};
 
 	backlight-right {
 		compatible = "pwm-backlight";
 		pwms = <&twl_pwm 0 7812500>;
-		power-supply = <&unknown_supply>;
+		power-supply = <&lb_v50>;
 	};
 
 	cb_v18: cb-v18 {
@@ -95,11 +95,6 @@ lb_v50: lb-v50 {
 		enable-active-high;
 	};
 
-	unknown_supply: unknown-supply {
-		compatible = "regulator-fixed";
-		regulator-name = "unknown";
-	};
-
 	wl12xx_pwrseq: wl12xx-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		clocks = <&twl 1>;
@@ -308,6 +303,8 @@ mpu9150: imu@68 {
 		pinctrl-0 = <&mpu9150_pins>;
 		interrupt-parent = <&gpio2>;
 		interrupt = <7 IRQ_TYPE_LEVEL_HIGH>;
+		vddio-supply = <&cb_v18>;
+		vdd-supply = <&cb_v33>;
 		invensense,level-shifter;
 	};
 };
-- 
2.39.5


