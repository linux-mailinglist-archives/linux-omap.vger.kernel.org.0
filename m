Return-Path: <linux-omap+bounces-2388-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB6C998600
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 14:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE4A51C22CCC
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 12:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC5A1C5783;
	Thu, 10 Oct 2024 12:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="8WvAq21m"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F9A1C57A0;
	Thu, 10 Oct 2024 12:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728563409; cv=none; b=t2EpKTbqpNHwxgIbFk/x3/6r7LoO1er2RrO5mYBjwAosDjaGDCK9OiDG/eS2zoDWPEMheWQQFzUKBEStAQWbXqy6FYFtc5ZACjxkVXr4v/UHbsK/Cd89ZyiD5rV9Q+0Y0Eg+iO0mEdYAPN1gvPPZqic2lLOpCBxrosR2wjHvids=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728563409; c=relaxed/simple;
	bh=9VRc1Ko4cSUt7WK0esOrxKx6wc5jMZJeIkkq0nsxIYE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cweekS2lJlAwW2I+H5BqPwxNmoXZQZYMLv5MHInTuC18QLdRftqa/AZvrAGqUljBTZn6Zlp7K7ynhOwo5Lw02jLN1coCrCCCY3XaFes3aL9/9qebhQaq7DyeyR8QKxct0GYtPWrOWTCG48CEIhDblUb+Hzp0VllX6E/gc5+akTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=8WvAq21m; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Vi8UbiIYcOyzGZG/tfi9Ux79C8vfhxPLrFUF/1JgUU0=; b=8WvAq21mi/ZfUUYf+Jk+rvg8W7
	V9Nfxboda85BTh+1wooU9JASyIVRHxt7yOlUY2M4071EqPIhuLOUDdWRjwMy5HBtJEADq8RcjiyEo
	ajc9oCvLzty+srY4upv3i2obvafmWtje2AZtrPTdYs77WZBVYKmIgOv/VuohqdGH2fbokZpqEz61K
	AwU8Fm7wZxhStG+HoxGSZamPtiiSO8CE/vm3kRqlTg1BB9zSRttQTJLv4+okq2Fp/KYu1cUT9x6KL
	3WvIZ1BHKRa/8UfMcF74mAwqIFXygkMVZlOYRXGpSIUbsQxDPJdTP0pTmrw0agU/VQ/MYk+LoACAX
	86ATYU/g==;
From: Andreas Kemnade <andreas@kemnade.info>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	rogerq@kernel.org,
	linux-omap@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	tony@atomide.com,
	devicetree@vger.kernel.org,
	khilman@baylibre.com,
	Conor Dooley <conor+dt@kernel.org>,
	aaro.koskinen@iki.fi
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 2/4] ARM: dts: omap: omap4-epson-embt2ws: wire up regulators
Date: Thu, 10 Oct 2024 14:29:55 +0200
Message-Id: <20241010122957.85164-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241010122957.85164-1-andreas@kemnade.info>
References: <20241010122957.85164-1-andreas@kemnade.info>
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

Tested on vendor kernel that backlight definitively does not react
on blc_[rl] GPIOs.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
index 4462747b5cf5..7684868a2eed 100644
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
 
 	chosen {
@@ -95,11 +95,6 @@ lb_v50: regulator-lb-v50 {
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


