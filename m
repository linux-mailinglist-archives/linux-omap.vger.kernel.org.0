Return-Path: <linux-omap+bounces-2920-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7489FE0C9
	for <lists+linux-omap@lfdr.de>; Mon, 30 Dec 2024 00:01:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C8163A1942
	for <lists+linux-omap@lfdr.de>; Sun, 29 Dec 2024 23:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E4BA19ABBB;
	Sun, 29 Dec 2024 23:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="qDdlT65S"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4F18F4A;
	Sun, 29 Dec 2024 23:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735513295; cv=none; b=GfyI0ZvudZwWzRrzsuObzQ3LubcO2P8tdC4CMntYNh99dZYEqHjJjpRmC4FTKFdocguXnEZi9oy2v74tIUoN5uDgNaoc11q1FGEeoHg3Ra75nwTTCIGhPbPFxXUjSOW8RVrdos/CVjK56hJO/0s6Lph2L+qtq8D6fMOTuJJVnbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735513295; c=relaxed/simple;
	bh=yeJKwrt9vrcPI3mzjTYdcKlmxtTQ72iJEWTX8ZNBTvc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X8O5HeJ4UbuvB+/pAhTXQNIFubY4OenvoyF+fUu4Z45FRK+ugDn4cUJkjEzaZu4ZZ3v7AOGmQGXksVpgU1WcKUOvwegd8stY/2lgo0wDUtfOqaRMSQ352vdLh+HXj2b6fWsp8DkXjLstmiCcZdisYIQBs1q4z2Xt/EzRE5qfBTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=qDdlT65S; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=TR5+fLXi7IOwdIvLEzgdp2rQbubqDgd+JsvxWrBPQCw=; b=qDdlT65SSjNqah6zbmp4vab+Zv
	70rgaiFDUWT+HKKImt/wSpodUXRevuc78mL0vU1y55qV4VcYZD5JxG3I8FnAOenrxZpuK9Sb9HV12
	oQdw2FZlNfm9IqkoKIvcyw3FJgmo34jlLng/eb5J5sYw/iP2IVuXgbIFI4onNeqpw0p/EFpjDyTgU
	EO3fhUZFxSOhzuM0UBSN+haiHle2is6AgFAa5HlqLrbJknH9wXzjhh3c4qM0JqU3EIyxqDn+22cW2
	ilDlooksDrozPwfJ/twssY37XsIUXZ5gAIbkv4nx/42NssCzJFW6CGjAGUjv5Y+seuzueVafrsX3U
	QtTzcmoQ==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Roger Quadros <rogerq@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 1/2] ARM: dts: omap4: panda: fix resources needed for Panda
Date: Mon, 30 Dec 2024 00:01:24 +0100
Message-Id: <20241229230125.85787-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241229230125.85787-1-andreas@kemnade.info>
References: <20241229230125.85787-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Pandaboard needs a 32k clock in the TWL6030 to be enabled
to work. With some luck, it is enabled by some U-Boot fork.
Do not rely on it and properly specify the requirement.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi b/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
index 97706d6296a6..c860b590142a 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
@@ -130,6 +130,12 @@ hsusb1_phy: hsusb1_phy {
 		clock-frequency = <19200000>;
 	};
 
+	wl12xx_pwrseq: wl12xx-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&twl 0>;
+		clock-names = "ext_clock";
+	};
+
 	/* regulator for wl12xx on sdio5 */
 	wl12xx_vmmc: wl12xx_vmmc {
 		pinctrl-names = "default";
@@ -408,6 +414,7 @@ twl: twl@48 {
 		reg = <0x48>;
 		/* IRQ# = 7 */
 		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>; /* IRQ_SYS_1N cascaded to gic */
+		#clock-cells = <1>;
 		system-power-controller;
 	};
 
@@ -488,6 +495,7 @@ &mmc5 {
 	non-removable;
 	bus-width = <4>;
 	cap-power-off-card;
+	mmc-pwrseq = <&wl12xx_pwrseq>;
 
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.39.5


