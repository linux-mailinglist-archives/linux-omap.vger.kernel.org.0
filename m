Return-Path: <linux-omap+bounces-2361-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F056B996B9B
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2024 15:17:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75AB21F21C04
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2024 13:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B2F198E9E;
	Wed,  9 Oct 2024 13:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MK0eK47l"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95151EA91;
	Wed,  9 Oct 2024 13:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728479828; cv=none; b=ky0TYTvXO8zRJXNOiGTRdE9PxIS7XF5lsM8pa94gUHF4rK/pKDClPIqgS8xx2ZPFOVR8PcM0TqH9rGyBXIGT94Ly2fdicGIom92U8wdjw8iIxbhxZ86uATaOTYwNhzG6nydL6ukim8PxCVTB/l82SqANFRgBUnPLu+bv0LhFbrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728479828; c=relaxed/simple;
	bh=yB+ZqdYujlKLXJmi3tVqKgywYiWSpIyOrARIe91Qnjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Boh7R5P3qfGNN0JPVxcS7FrPQJJwkOOsgQEpVG+Mwsjs6N2jyIznz2BR1c+FHMUi4yiBr+V834UJHuyUWIUBTpI3gTXYv0L+OGDEFFyuRx1m1kIyn1ru+G323MMx52pjNMTX6++CtrHoKIPI3BxmM3mN7sopAnckJAtWrJe97R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MK0eK47l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C0C6C4CECD;
	Wed,  9 Oct 2024 13:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728479827;
	bh=yB+ZqdYujlKLXJmi3tVqKgywYiWSpIyOrARIe91Qnjc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MK0eK47lZMcXFVwy49jLBmRdIM4021HDmyIs1zLqAak31k83HnOclhEoIwzRq07mM
	 tfrIL3Rg0beOQiZvsAf63EyrYUwKYM6wmVoGy17/BmUjLNEto4YLW10pquIqPbVdB1
	 aic1KxENUo0vHMvrlsFI5zpMH/rEzZEIHG9RinHm9fk3wdMZUqUUFmnjqLSndsqIpM
	 VF/x7FrPRaKitoaXKwxDwSBvVJt/nQZ+SkntMMrcCf99qnm7zI0c//I0NJp3mjxqee
	 X0hC0MDFIgB6L12KnYIYLuvAktYfS9HFnxVqQGG0xGxSco/3I35TZhJdeUyCX5IzzX
	 066TlWsNLD1KA==
From: Roger Quadros <rogerq@kernel.org>
Date: Wed, 09 Oct 2024 16:16:54 +0300
Subject: [PATCH v2 1/3] ARM: dts: ti: drop linux,mtd-name from NAND nodes
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-gpmc-omap-dtbx-v2-1-fc68124a090a@kernel.org>
References: <20241009-gpmc-omap-dtbx-v2-0-fc68124a090a@kernel.org>
In-Reply-To: <20241009-gpmc-omap-dtbx-v2-0-fc68124a090a@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Enric Balletbo i Serra <eballetbo@gmail.com>, 
 Javier Martinez Canillas <javier@dowhile0.org>
Cc: Nishanth Menon <nm@ti.com>, srk@ti.com, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7430; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=yB+ZqdYujlKLXJmi3tVqKgywYiWSpIyOrARIe91Qnjc=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBnBoJMre/I+KpRpvX3E4HHLZ/2CWugedEnCBjjJ
 sq7HDxJN82JAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZwaCTAAKCRDSWmvTvnYw
 kwwTEACmLcV1C1O56asJFdJx/vbBzaZ4/2GtwhlGg+0uV2GCU/+Sto1BdLDgzWrSL6jGcIoIv8G
 YLqRGVpPUiT/Pt4O+aN5tOaXBy2O6TdQXiv8WoQo7KqvnA5RetH1BU6h7VeeKjX9fyvTVVQV72W
 EkNoqae+O7tL8fLMUQiBcRTAyt43rO5Rt0s1rJf5Jk0wALvHjr4Zm0+lRf50qOOIjMQ/m5oV7/+
 hLHJozx7Q+mKNuVMqLT6N+rpVZqu6DvuWtlVIlF38iIPEQd4Vk82nWtel6tIAziYJeQ7ojruwUp
 8GfwFd9GMLOyt5od2FR9dbSkNjWT3+JbZkmvbO3XRL0n/qafyklLAaC2b7Zcrl4Ze3RnYOoDWGJ
 1S0LbOOVd5AK2q/4o6GQ3A8U0YpIWTdxu75hrxnE8bbO1FOjYaoD/skKkI3HsEA1fM1xjlf+3Z1
 Z/4dCXmMqoToBjWW8H7I8ZhQODDJ3Je288JIgnkTeM9VSKqdcdLzWBZ4VkIOEITRt+amfF2D9I8
 HsQ0KlmdF9eGw+QeyMqxHfKn8QC9kV0kIW+j/LrjejBx/TdauNh8Scw4x+gVEZZhx2wE0xGFHgd
 qLUqwpXzpOK1ju8C3X9ATHAFV1+aR/BCdJtznO4yrYS2YpVdCtLEYCaQCjOzo7PPquZSs0AlJl/
 z5UhgaMN7s+Iyvg==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

linux,mtd-name is only supported by PHYSMAP driver and not applicable
to NAND controller/flash nodes.

Fixes the below dtbs_check warning on many OMAP boards.

"nand@0,0: Unevaluated properties are not allowed ('linux,mtd-name' was unexpected)"

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 arch/arm/boot/dts/ti/omap/am3517-som.dtsi          | 1 -
 arch/arm/boot/dts/ti/omap/dm8148-evm.dts           | 1 -
 arch/arm/boot/dts/ti/omap/dm8168-evm.dts           | 1 -
 arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dts     | 1 -
 arch/arm/boot/dts/ti/omap/logicpd-som-lv.dtsi      | 1 -
 arch/arm/boot/dts/ti/omap/logicpd-torpedo-som.dtsi | 1 -
 arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dts       | 1 -
 arch/arm/boot/dts/ti/omap/omap3-evm.dts            | 1 -
 arch/arm/boot/dts/ti/omap/omap3-igep.dtsi          | 1 -
 arch/arm/boot/dts/ti/omap/omap3-ldp.dts            | 1 -
 arch/arm/boot/dts/ti/omap/omap3-overo-base.dtsi    | 1 -
 arch/arm/boot/dts/ti/omap/omap3430-sdp.dts         | 1 -
 12 files changed, 12 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am3517-som.dtsi b/arch/arm/boot/dts/ti/omap/am3517-som.dtsi
index bd0a6c95afa1..e36cd98f57fa 100644
--- a/arch/arm/boot/dts/ti/omap/am3517-som.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am3517-som.dtsi
@@ -44,7 +44,6 @@ &gpmc {
 
 	nand@0,0 {
 		compatible = "ti,omap2-nand";
-		linux,mtd-name = "micron,mt29f4g16abchch";
 		reg = <0 0 4>; /* CS0, offset 0, IO size 4 */
 		nand-bus-width = <16>;
 		ti,nand-ecc-opt = "bch8";
diff --git a/arch/arm/boot/dts/ti/omap/dm8148-evm.dts b/arch/arm/boot/dts/ti/omap/dm8148-evm.dts
index ae8d9fa09d16..57a9eef09f6f 100644
--- a/arch/arm/boot/dts/ti/omap/dm8148-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/dm8148-evm.dts
@@ -51,7 +51,6 @@ nand@0,0 {
 		interrupt-parent = <&gpmc>;
 		interrupts = <0 IRQ_TYPE_NONE>, /* fifoevent */
 			     <1 IRQ_TYPE_NONE>; /* termcount */
-		linux,mtd-name = "micron,mt29f2g16aadwp";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ti,nand-ecc-opt = "bch8";
diff --git a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
index 1d80288f6ba5..6130b9a5f660 100644
--- a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
@@ -119,7 +119,6 @@ &gpmc {
 
 	nand@0,0 {
 		compatible = "ti,omap2-nand";
-		linux,mtd-name = "micron,mt29f2g16aadwp";
 		reg = <0 0 4>; /* CS0, offset 0, IO size 4 */
 		interrupt-parent = <&gpmc>;
 		interrupts = <0 IRQ_TYPE_NONE>, /* fifoevent */
diff --git a/arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dts b/arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dts
index 2f6ac267fc15..df05a0682322 100644
--- a/arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dts
@@ -51,7 +51,6 @@ nand@0,0 {
 		interrupt-parent = <&gpmc>;
 		interrupts = <0 IRQ_TYPE_NONE>, /* fifoevent */
 			     <1 IRQ_TYPE_NONE>; /* termcount */
-		linux,mtd-name = "micron,mt29f2g16aadwp";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ti,nand-ecc-opt = "bch8";
diff --git a/arch/arm/boot/dts/ti/omap/logicpd-som-lv.dtsi b/arch/arm/boot/dts/ti/omap/logicpd-som-lv.dtsi
index c0e6b73fa472..d51a436d9774 100644
--- a/arch/arm/boot/dts/ti/omap/logicpd-som-lv.dtsi
+++ b/arch/arm/boot/dts/ti/omap/logicpd-som-lv.dtsi
@@ -51,7 +51,6 @@ nand@0,0 {
 		interrupt-parent = <&gpmc>;
 		interrupts = <0 IRQ_TYPE_NONE>, /* fifoevent */
 			     <1 IRQ_TYPE_NONE>;	/* termcount */
-		linux,mtd-name = "micron,mt29f4g16abbda3w";
 		nand-bus-width = <16>;
 		ti,nand-ecc-opt = "bch8";
 		rb-gpios = <&gpmc 0 GPIO_ACTIVE_HIGH>; /* gpmc_wait0 */
diff --git a/arch/arm/boot/dts/ti/omap/logicpd-torpedo-som.dtsi b/arch/arm/boot/dts/ti/omap/logicpd-torpedo-som.dtsi
index 227699890890..28feb235482d 100644
--- a/arch/arm/boot/dts/ti/omap/logicpd-torpedo-som.dtsi
+++ b/arch/arm/boot/dts/ti/omap/logicpd-torpedo-som.dtsi
@@ -49,7 +49,6 @@ nand@0,0 {
 		interrupt-parent = <&gpmc>;
 		interrupts = <0 IRQ_TYPE_NONE>, /* fifoevent */
 			     <1 IRQ_TYPE_NONE>;	/* termcount */
-		linux,mtd-name = "micron,mt29f4g16abbda3w";
 		nand-bus-width = <16>;
 		ti,nand-ecc-opt = "bch8";
 		rb-gpios = <&gpmc 0 GPIO_ACTIVE_HIGH>; /* gpmc_wait0 */
diff --git a/arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dts b/arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dts
index e0346bf842fc..9c60ac853a40 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dts
@@ -60,7 +60,6 @@ nand@0,0 {
 		interrupt-parent = <&gpmc>;
 		interrupts = <0 IRQ_TYPE_NONE>, /* fifoevent */
 			     <1 IRQ_TYPE_NONE>;	/* termcount */
-		linux,mtd-name = "hynix,h8kds0un0mer-4em";
 		nand-bus-width = <16>;
 		gpmc,device-width = <2>;
 		ti,nand-ecc-opt = "bch8";
diff --git a/arch/arm/boot/dts/ti/omap/omap3-evm.dts b/arch/arm/boot/dts/ti/omap/omap3-evm.dts
index a2a1613c45c3..28caa5d93b87 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-evm.dts
@@ -60,7 +60,6 @@ nand@0,0 {
 		interrupt-parent = <&gpmc>;
 		interrupts = <0 IRQ_TYPE_NONE>, /* fifoevent */
 			     <1 IRQ_TYPE_NONE>;	/* termcount */
-		linux,mtd-name = "micron,mt29f2g16abdhc";
 		nand-bus-width = <16>;
 		gpmc,device-width = <2>;
 		ti,nand-ecc-opt = "bch8";
diff --git a/arch/arm/boot/dts/ti/omap/omap3-igep.dtsi b/arch/arm/boot/dts/ti/omap/omap3-igep.dtsi
index e068ecf86b8f..7346cad84eda 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-igep.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-igep.dtsi
@@ -111,7 +111,6 @@ nand@0,0 {
 		interrupt-parent = <&gpmc>;
 		interrupts = <0 IRQ_TYPE_NONE>, /* fifoevent */
 			     <1 IRQ_TYPE_NONE>;	/* termcount */
-		linux,mtd-name = "micron,mt29c4g96maz";
 		nand-bus-width = <16>;
 		gpmc,device-width = <2>;
 		ti,nand-ecc-opt = "bch8";
diff --git a/arch/arm/boot/dts/ti/omap/omap3-ldp.dts b/arch/arm/boot/dts/ti/omap/omap3-ldp.dts
index bb6fab9fa47d..cf325f56b464 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-ldp.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-ldp.dts
@@ -103,7 +103,6 @@ nand@0,0 {
 		interrupt-parent = <&gpmc>;
 		interrupts = <0 IRQ_TYPE_NONE>, /* fifoevent */
 			     <1 IRQ_TYPE_NONE>;	/* termcount */
-		linux,mtd-name = "micron,nand";
 		nand-bus-width = <16>;
 		gpmc,device-width = <2>;
 		ti,nand-ecc-opt = "bch8";
diff --git a/arch/arm/boot/dts/ti/omap/omap3-overo-base.dtsi b/arch/arm/boot/dts/ti/omap/omap3-overo-base.dtsi
index cc57626ea607..2793821b2c33 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-overo-base.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-overo-base.dtsi
@@ -222,7 +222,6 @@ &gpmc {
 
 	nand@0,0 {
 		compatible = "ti,omap2-nand";
-		linux,mtd-name = "micron,mt29c4g96maz";
 		reg = <0 0 4>;	/* CS0, offset 0, IO size 4 */
 		interrupt-parent = <&gpmc>;
 		interrupts = <0 IRQ_TYPE_NONE>, /* fifoevent */
diff --git a/arch/arm/boot/dts/ti/omap/omap3430-sdp.dts b/arch/arm/boot/dts/ti/omap/omap3430-sdp.dts
index 258ecd9e4519..1454a89aa980 100644
--- a/arch/arm/boot/dts/ti/omap/omap3430-sdp.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3430-sdp.dts
@@ -105,7 +105,6 @@ nand@1,0 {
 		interrupt-parent = <&gpmc>;
 		interrupts = <0 IRQ_TYPE_NONE>, /* fifoevent */
 			     <1 IRQ_TYPE_NONE>;	/* termcount */
-		linux,mtd-name = "micron,mt29f1g08abb";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ti,nand-ecc-opt = "sw";

-- 
2.34.1


