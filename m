Return-Path: <linux-omap+bounces-5261-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 796BECDBD0E
	for <lists+linux-omap@lfdr.de>; Wed, 24 Dec 2025 10:35:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67CB63023575
	for <lists+linux-omap@lfdr.de>; Wed, 24 Dec 2025 09:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98736332ED3;
	Wed, 24 Dec 2025 09:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="T5RUarH7"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66C2327BF7;
	Wed, 24 Dec 2025 09:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766568920; cv=none; b=CFho1MgMO/0HcUhaWCG8DRNCRob5auBuEmYnUVwY9dxMcGPhn7iuVhBeAHPwxNrUiL8XEzHe0/CJeABH+C/VVgVV1PXM2npv1ipeepaSmwcEXbyAti4iAsAhrtQzRQRkRZC3YJcY8T47GWIeFH+ouGCwjNRnlzyw34h2TjlbrVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766568920; c=relaxed/simple;
	bh=Fmjd7eyRnlV9XTCzyNEV2bPki8dqXkW1yALeD1EYLh8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=fmjW/nCNSBZkkVP+BVMvtVVQ+dad58xm7aWscDJFzB1JyiyGC7iIYz+vUSd8ITYn3fH4XFD/3gnwsvI8VnimOr1+uNLfc/slQBc3CpBfjGKNSghqUbWPOqkCGA1vjlU7t6W6t0zPyfuUdSpQo1KC+0VUNjJEtfJPRjgRfVdYHXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=T5RUarH7; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=MOZsQQoHQXrZlTx6X9yhr7Z6zefVXj/8USVC2Ec8vnk=; b=T5RUarH75vSiRSp7xX3oBD8aV4
	bM8zF1uFgt+wiCLvC0MfasjBl81ulLk/WmDT+OG6sElJyTRMJgpm09RMEl6/N/QVErbcaZp0Ngr09
	NSLlqp6QtXc/cSN58wum7ALao5Wevu30Ue/xLSXwjq3fb/e3VHlLMQ0566PfbxboUT2tcMeQ3CkWP
	1jbbYTKpy00848wTwuc1DCR7cq22noY2zVQPgH0dWgtcmTyBoX3wUX8EjVmYEPKuADNnmWYmCFuqX
	sweiKHlwP2mjudN/aZhwD6/u4LJk166XhThNOV2Z2bo0HeCmFl9uZkepSQ1wr5L08E7DVmUGldSrH
	ch7ApC/g==;
From: Andreas Kemnade <andreas@kemnade.info>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: ti/omap: omap*: fix watchdog node names
Date: Wed, 24 Dec 2025 10:34:57 +0100
Message-ID: <20251224093457.558477-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Watchdog nodes should be named watchdog@ and not wdg@. Fix that.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/ti/omap/omap2430.dtsi     | 2 +-
 arch/arm/boot/dts/ti/omap/omap3.dtsi        | 2 +-
 arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi | 2 +-
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi     | 2 +-
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap2430.dtsi b/arch/arm/boot/dts/ti/omap/omap2430.dtsi
index b9a9e6e45266..222613d2a4d1 100644
--- a/arch/arm/boot/dts/ti/omap/omap2430.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap2430.dtsi
@@ -332,7 +332,7 @@ usb_otg_hs: usb_otg_hs@480ac000 {
 			interrupts = <93>;
 		};
 
-		wd_timer2: wdt@49016000 {
+		wd_timer2: watchdog@49016000 {
 			compatible = "ti,omap2-wdt";
 			ti,hwmods = "wd_timer2";
 			reg = <0x49016000 0x80>;
diff --git a/arch/arm/boot/dts/ti/omap/omap3.dtsi b/arch/arm/boot/dts/ti/omap/omap3.dtsi
index 817474ee2d13..959069e24730 100644
--- a/arch/arm/boot/dts/ti/omap/omap3.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3.dtsi
@@ -553,7 +553,7 @@ mmu_iva: mmu@5d000000 {
 			status = "disabled";
 		};
 
-		wdt2: wdt@48314000 {
+		wdt2: watchdog@48314000 {
 			compatible = "ti,omap3-wdt";
 			reg = <0x48314000 0x80>;
 			ti,hwmods = "wd_timer2";
diff --git a/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi b/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi
index 59f546a278f8..78ac3d4eceb5 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi
@@ -279,7 +279,7 @@ target-module@30000 {			/* 0x40130000, ap 14 0e.0 */
 			ranges = <0x0 0x30000 0x1000>,
 				 <0x49030000 0x49030000 0x1000>;
 
-			wdt3: wdt@0 {
+			wdt3: watchdog@0 {
 				compatible = "ti,omap4-wdt", "ti,omap3-wdt";
 				reg = <0x0 0x80>;
 				interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
index 4ee53dfb71b4..4881dd674393 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
@@ -1133,7 +1133,7 @@ target-module@4000 {			/* 0x4a314000, ap 7 18.0 */
 			#size-cells = <1>;
 			ranges = <0x0 0x4000 0x1000>;
 
-			wdt2: wdt@0 {
+			wdt2: watchdog@0 {
 				compatible = "ti,omap4-wdt", "ti,omap3-wdt";
 				reg = <0x0 0x80>;
 				interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi b/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi
index 9f6100c7c34d..487259132ebf 100644
--- a/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi
@@ -2393,7 +2393,7 @@ target-module@4000 {			/* 0x4ae14000, ap 7 14.0 */
 			#size-cells = <1>;
 			ranges = <0x0 0x4000 0x1000>;
 
-			wdt2: wdt@0 {
+			wdt2: watchdog@0 {
 				compatible = "ti,omap5-wdt", "ti,omap3-wdt";
 				reg = <0x0 0x80>;
 				interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.47.3


