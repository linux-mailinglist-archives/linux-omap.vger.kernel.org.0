Return-Path: <linux-omap+bounces-3617-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BD9A9DF2A
	for <lists+linux-omap@lfdr.de>; Sun, 27 Apr 2025 07:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 015D65A5DD4
	for <lists+linux-omap@lfdr.de>; Sun, 27 Apr 2025 05:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A4D32288C0;
	Sun, 27 Apr 2025 05:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="kLybqRWD"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A791A1FF5EA;
	Sun, 27 Apr 2025 05:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745731667; cv=none; b=UhbeIYAPGODej6l1iT9tZjZTcQpfDUZbkswAREHcBf4AwN9pfqqz3GCCU0PHfjRSCaCd7bXU04Bh/cJrMivGoBNbBkyywIH3roywtEj13LyQiuvaEnJMwBzGTjRVv4E7TeGZGf8AUc5FZAZwUNfGwEgj0owZYeYecDI9ngfLMw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745731667; c=relaxed/simple;
	bh=CN5cORl45Pm7GGozDnA8fgjxJb9dGeiTgZrk/Bg3kWw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GzD+JS9x8Zvk72gBkBMOCKzI6mUgLlGAourHTFMl5tII96lOjNh0BhLd+bCNsOoiE4tFcHrEN8knjnGzMg5SKc7dYE7z/Jvvqr2ztIEzXgsH7USddVojFGVFy3F2uxJ9YYXLvyHY4f3nBeAXBEHBQx09HKjxZnRS2mQIFOFLUFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=kLybqRWD; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=TFI6xwIhNpUpAdLw227pae0Xtnqh797v9lwYBKCrCRk=; b=kLybqRWDLb5NMYqdRQRLQG6g2S
	0bNUYTc/EruEkbSs6W+LTUtGYMjuuS8pe+QfQNw7TenZA782lfCVeplFVeBRC1dFxdlT1Jstm+Po2
	SX5No1tVIZnSD13SJMEgAzRgFHnlJbIweadaV0BBiX7p0IHVf3312gPQid/ohD0vn+ZXhRAYD77jp
	IzT180ABcons5TnznglMJeGA5yejPwGdwdd2DhgYtIHwOOcN79qnigttByBlDasWXbYgGRGOgj/SA
	MHKaHqnRJNQGlLw1RC41QpIbAYgfNYw7NKbjVrgbk1fIwLgCyPX5qfXk/rUMdP6v/TxSRDohK104Z
	UtQyBNzQ==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>,
	Roger Quadros <rogerq@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 1/2] ARM: dts: omap4: panda: fix resources needed for Wifi
Date: Sun, 27 Apr 2025 07:27:34 +0200
Message-Id: <20250427052735.88133-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250427052735.88133-1-andreas@kemnade.info>
References: <20250427052735.88133-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Pandaboard needs a 32k clock in the TWL6030 to be enabled
for Wifi to work.
With some luck, it is enabled by some U-Boot fork.
Do not rely on it and properly specify the requirement.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
Reviewed-by: Roger Quadros <rogerq@kernel.org>
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


