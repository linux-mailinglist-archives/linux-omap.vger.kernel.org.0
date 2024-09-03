Return-Path: <linux-omap+bounces-2093-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAF896A4BA
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2024 18:44:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7694281D8B
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2024 16:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A9418DF62;
	Tue,  3 Sep 2024 16:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmYxaJm7"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7460518C920;
	Tue,  3 Sep 2024 16:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725381835; cv=none; b=Mktwf/Ie1qUBBIyN0+q1CiOprnkPdxewNUk4L/ddTLxwpTrntGXajbUyyd16M/VlOEj37Hhg2xtfsgBuSHGNroMgGJCSqgtTpTKFHiNeeoKoTwyRgHX8/wuwpkh3G9ZNHuJuf5VsHFt8VKjOJLbb6urRAif94RDEebpXPVJbXos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725381835; c=relaxed/simple;
	bh=yB+ZqdYujlKLXJmi3tVqKgywYiWSpIyOrARIe91Qnjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BZXXVfuWlPCEz+PHqlpMNA0aNJ6b4usX4rOMW5t1Y2BLYa61NmP1JHcwhn7PTDfHfHiTIyyt16fMADSPp5sQlJoYyrmtBQn6t8rGVZHVE/fk0keHgIudz0o+7DxmfSaKPf8mLlFmkfiIJBvi1AH7jKnz8jdKu1cJK/urxGKwveQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmYxaJm7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF16C4CEC8;
	Tue,  3 Sep 2024 16:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725381835;
	bh=yB+ZqdYujlKLXJmi3tVqKgywYiWSpIyOrARIe91Qnjc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bmYxaJm7FlVzIsyBJKoxFYo+o3xe12rlJ+COGc09tE3TBmsOuT4JbjpTovyCFYB4g
	 4W5vRdRWqUtcufoPYgDIQDvF0rZWNteg7rCGQs3fKrzfwcCm/wY88rDWUW/FvjDT0C
	 2AhuaK/3wtGtJvv/iRcAUK+gyN8RXuQROPkMSkVePiBZNoSdeHTCDr5fQ4QEM2n/tY
	 0Bs6pXuhQF7FS6fqdjCMQURERsh5zG/o7MukOjX8KMeJGnAtAeqqRPinDppCXY84f0
	 EpfOOGlAZH8YOYd+vCz7rXmu/FWtQptQm9+SP+avtskrHHx4cD5s8UqRk1KPxV+ZFN
	 A+reaCA3JIdaw==
From: Roger Quadros <rogerq@kernel.org>
Date: Tue, 03 Sep 2024 19:43:44 +0300
Subject: [PATCH 1/3] ARM: dts: ti: drop linux,mtd-name from NAND nodes
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-gpmc-dtb-v1-1-380952952e34@kernel.org>
References: <20240903-gpmc-dtb-v1-0-380952952e34@kernel.org>
In-Reply-To: <20240903-gpmc-dtb-v1-0-380952952e34@kernel.org>
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
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBm1zzEsnxRylYu+Pc3ZUd8nNHpWN3LCnKc7TRBv
 cfNw8mQD/2JAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZtc8xAAKCRDSWmvTvnYw
 kz5mEACTu3xnPwptSz28WCmXfuLiahnBR9o8fhwi/uBTDcOFP1TibR4EYWKn2LsgZTziYdWv7nl
 BZsu/yC1qWX/HbIGRKpCJ4ndiQzLkLrdoJs5zxADXQ6hbxYRWnwh2wTpcyZNhZbw2JLXpSNDRk/
 5YWo2/rNC9SyiDc6C0V83Ie6OR3oClVXa0+aokNdvN0QxX3hR6iTtnNfVCoNYzHa3lDgfFduZlR
 G8yPIYz+QkUpeTscnna/iMPlXX/DvrQR8DLvSwyD63hpkO8lsLxMc8u6QCksKNA9LremVnIkLeg
 c7sdTh7gTPePTg1em0rmq8YJQL8tOAnEhzRRL9NHKl1xn2PqtoXtFDzI2ClLGEIUX61TwuiQiCt
 wbi6BRuy1ZE+USPHO+ZDGu7onqlWL///F3TQ7Cj7ey5RrZJLR5TnlUodfU3/EZfA2Z22txKVaYB
 wpiIhqE2UFoB6bAoF3tyQAt5ArXSRUP/q2pkClSqCUC0JLACrtjdiXcOamG9br8A/JQcGj3ZApa
 YIbjSnDHV9quLsXFPXDpvtfJeVjY2Bb6QfUj2dJSfCShm1PZopag0SNwumUXWV1qFuUfluRAzDO
 iQShTUZKDgdHysmwFChvyGFRvtexh9Us2zUtDMQqr8BDReWxW4Yb5CtshPFjpBjPbqyuBGO5Wso
 ABdyld572NrZrxQ==
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


