Return-Path: <linux-omap+bounces-4608-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D04B494F2
	for <lists+linux-omap@lfdr.de>; Mon,  8 Sep 2025 18:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 499F516B507
	for <lists+linux-omap@lfdr.de>; Mon,  8 Sep 2025 16:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11CA830F7E9;
	Mon,  8 Sep 2025 16:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PI4q5ism"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C84830EF8F;
	Mon,  8 Sep 2025 16:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757348289; cv=none; b=AJvU32Q6T2lW+TZFNXWiKoKtWLf4vEn2yy+RUSD7iKqqDNa/uq4vdW3vF3rLLTxgzGKrzQGQSPXqKu+5CCMjRSgBMsYPb8YIyF4NU4yx/ZBE/o4Dtfvz84grrruGReSxN1DHqsoYn1Y2TkszIPXJM+yok/6iHTDNYqR3wBWvG7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757348289; c=relaxed/simple;
	bh=0dzR3fd+h3fafN3tzZUIttMoA5Vj0MCEKygtyr+yyrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D35GsbOcbkYNVod9IGDmW5zVzPUdp8DDe8NEFoTli0mHWG7PiA1a2mv5leyvdkaCLrC7XBrfKVnPGfdhhv9NK3ujjLUe5uwf6e71R4zY8tXN25UxOjtrDd0vF+UiJswCN24t8oFoP3KGGdSZ1/dnrLuL71H1YI2N/up69p8MphE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PI4q5ism; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7722c88fc5fso4073828b3a.2;
        Mon, 08 Sep 2025 09:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757348287; x=1757953087; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6GjrByxYOP9sPm2GtPCzQbF34RsPUSHq8OKSEglxxQ=;
        b=PI4q5ismzH35yxsv3YReqiM5UBPDcs6E7cy944GL0SrhG1lCmGKWqeJHT6ZOFipujG
         t+XVAXxnwMIa0GIcPHcaeoG6FkOeucQsZs7p4PwH7+eBzuK9KW+BITs2hksU+5JZjFiH
         ZF5yi1pF4bz+PRdy/QafTLnFTw5PHTtlnBIyqFDKA2qxkPmZy+SFkvZus2mGZn9BA6ga
         4WUNMdS/3Hzuj/U3uGyup+DuZvY1/liP+7fP3hMV1NOsLKulumBurjtHToDLqDW2nonT
         sGiB/Mxo+hGVN6vlG3xzNDolPtyYBFrccA4oTfOrLs1LZcSqiPiP42+d6cDF3pQDzKA3
         gsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757348287; x=1757953087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f6GjrByxYOP9sPm2GtPCzQbF34RsPUSHq8OKSEglxxQ=;
        b=abOJfD+yQmIn47NEZo6AgxJpuoONs0YbjsOZF+/pmZ4nYmS1TP8dSlMlfV2F/S5Tkz
         tHwC9fxIUjJkPvb+essBmv+48K3DIBqQ7EDXTYmCXE3FDYWZhkN6U43yUFso1f6N5/ZS
         k895yeI1qtVvSFqjAkjA9QIfSfSVN9otOGsScxRJ83rNG/ItZVjqFSRyebsNRWVVPGma
         oahABpjQNC3LUaGn77pj8YNABws/WPQV3TnxyjldBLKtfVtuBEC9OCaWrTDUjsreGpN7
         infrBVgufT/CKMnU6gdFiU72kNRxWn1mbQ7UyLshZwj4ls1ox8/KUOMy83pOoUsTwq9B
         zc8g==
X-Forwarded-Encrypted: i=1; AJvYcCU+oUejM6o9QtFBhjWQL1YXHQuqE3U5l5RirUwi4x+RV6pLSMoSEmHz4waHhaYw/kHvTXkwAhYYH7Ad@vger.kernel.org, AJvYcCX4gYYnnzF2TFVfPGKyBOs8UJPFTh6hVj7pXx4Z559vSkSbwpznKcA4Edfa/zwP4iJ7MkpuONwDU+1Zbg==@vger.kernel.org, AJvYcCXXCRlIqOp3Z/8z7sTiVAo34zGSUBNQG4azvUklu/1NJIdJ5ZKs3PP91RyOCJdfQxqqs4I/hqx1L1WAKo+E@vger.kernel.org
X-Gm-Message-State: AOJu0YzijqnQK4OmHx/mN+iUv6OwqXiPEvjmJ9VkNVLMZGhQHcoOpBX4
	gMN+0RgFMZmnR9fzIt4EPa61ECM9dnuXhck6gb/gWcakMMstxZQf3+QF
X-Gm-Gg: ASbGnctIiqJFGr5C8njJBfTxM9JIK8wtutdfQ8lln5tbhkZTErEJJlUcQlmwEC8rKhr
	MUfkDTf8+Vi+maDdgL/mKgrn+snRcnHWmVxdz/DAAzC0QTLE/IHbUFDCkFl1GT3KCyQp2exH3HB
	fVSnx45bx2ehyBUr1ILua9zdbnSTfESyEobLW3VzdRyrdkUc24p74iwXUG09W/hpr1OzzysT/Rl
	fNQVuC2Tt05OVF0qrXMjPq7WTM9AQ8641NO+IEzqwByYRv4U2Qm85pg2vCn7fSHPhDuo96zyaTy
	YA30n29RXEz6GnPniLJlNgXH6O9B8dElpNk7bnASyypdL2IUINk+Rz3MjNWK+srv5+u+pT5u7eR
	IC5+KYwGJTI9WTSf30NtL4nD4R5SnDGuf+z+vIOdcdVw=
X-Google-Smtp-Source: AGHT+IH8wck0p5QkU0f1jf2SLsUKx+8m9RCM9tQfhgZvO/PTQoyii1O4IIttb4Gytz6G+ry0b5arWg==
X-Received: by 2002:a05:6a00:14c2:b0:771:ece5:f3fe with SMTP id d2e1a72fcca58-7742dd0f089mr10216555b3a.2.1757348287061;
        Mon, 08 Sep 2025 09:18:07 -0700 (PDT)
Received: from Black-Pearl.localdomain ([27.7.158.204])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-772608b1b5asm21319074b3a.46.2025.09.08.09.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 09:18:06 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Mon, 08 Sep 2025 16:17:12 +0000
Subject: [PATCH v2 1/2] arm: dts: ti: omap: Drop unnecessary or unused
 properties
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ti-sdhci-omap-v2-1-72927890482f@gmail.com>
References: <20250908-ti-sdhci-omap-v2-0-72927890482f@gmail.com>
In-Reply-To: <20250908-ti-sdhci-omap-v2-0-72927890482f@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Barker <paul.barker@sancloud.com>, 
 Marc Murphy <marc.murphy@sancloud.com>, Tony Lindgren <tony@atomide.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.2

Remove unnecessary properties like ti,needs-special-reset,
ti,needs-special-hs-handling and cap-mmc-dual-data-rate from the DTS
files as there is no user of them.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts | 1 -
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi                        | 2 --
 arch/arm/boot/dts/ti/omap/am33xx.dtsi                           | 1 -
 arch/arm/boot/dts/ti/omap/am4372.dtsi                           | 1 -
 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi                        | 2 --
 arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts               | 2 --
 arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dts               | 1 -
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi                         | 5 -----
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi                         | 5 -----
 9 files changed, 20 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts b/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts
index 7c9f65126c636178a5bee305480ed503ba40a5b6..8b47f45a9959c683cb821dd639ab7e17ffdda838 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts
@@ -87,7 +87,6 @@ &mmc3 {
 	bus-width = <4>;
 	non-removable;
 	cap-power-off-card;
-	ti,needs-special-hs-handling;
 	keep-power-in-suspend;
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc3_pins>;
diff --git a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
index d6a143abae5f6bec8041e27d5469727d641a0a1d..39278667a5a456613d0545f7e18438f73c8a3cf9 100644
--- a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
@@ -1501,7 +1501,6 @@ SYSC_OMAP2_SOFTRESET |
 
 			mmc1: mmc@0 {
 				compatible = "ti,am335-sdhci";
-				ti,needs-special-reset;
 				dmas = <&edma 24 0>, <&edma 25 0>;
 				dma-names = "tx", "rx";
 				interrupts = <64>;
@@ -1987,7 +1986,6 @@ SYSC_OMAP2_SOFTRESET |
 
 			mmc2: mmc@0 {
 				compatible = "ti,am335-sdhci";
-				ti,needs-special-reset;
 				dmas = <&edma 2 0
 					&edma 3 0>;
 				dma-names = "tx", "rx";
diff --git a/arch/arm/boot/dts/ti/omap/am33xx.dtsi b/arch/arm/boot/dts/ti/omap/am33xx.dtsi
index 0614ffdc1578f9a288683c59e4807e6adcab9466..f35f6b56e8f5a60741fd9a3e55933538814bb599 100644
--- a/arch/arm/boot/dts/ti/omap/am33xx.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am33xx.dtsi
@@ -338,7 +338,6 @@ SYSC_OMAP2_SOFTRESET |
 
 			mmc3: mmc@0 {
 				compatible = "ti,am335-sdhci";
-				ti,needs-special-reset;
 				interrupts = <29>;
 				reg = <0x0 0x1000>;
 				status = "disabled";
diff --git a/arch/arm/boot/dts/ti/omap/am4372.dtsi b/arch/arm/boot/dts/ti/omap/am4372.dtsi
index 0a1df30f2818b2619d510773b95c773a97fe973e..504fa6b57d39bebee7140b4c7e3b475f69e2de81 100644
--- a/arch/arm/boot/dts/ti/omap/am4372.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am4372.dtsi
@@ -321,7 +321,6 @@ SYSC_OMAP2_SOFTRESET |
 
 			mmc3: mmc@0 {
 				compatible = "ti,am437-sdhci";
-				ti,needs-special-reset;
 				interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x0 0x1000>;
 				status = "disabled";
diff --git a/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi b/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi
index fd4634f8c629370447425f3d5b9102802a753a76..e08f356e71cb0cf54830c3517209ede2acf11ab0 100644
--- a/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi
@@ -1103,7 +1103,6 @@ SYSC_OMAP2_SOFTRESET |
 			mmc1: mmc@0 {
 				compatible = "ti,am437-sdhci";
 				reg = <0x0 0x1000>;
-				ti,needs-special-reset;
 				dmas = <&edma 24 0>,
 					<&edma 25 0>;
 				dma-names = "tx", "rx";
@@ -1620,7 +1619,6 @@ SYSC_OMAP2_SOFTRESET |
 			mmc2: mmc@0 {
 				compatible = "ti,am437-sdhci";
 				reg = <0x0 0x1000>;
-				ti,needs-special-reset;
 				dmas = <&edma 2 0>,
 					<&edma 3 0>;
 				dma-names = "tx", "rx";
diff --git a/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts b/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
index e6a18954e449e4b665bfb9ad8c67761347a93204..43cf4ade950b648408060cd8d1dd20c755b5ca06 100644
--- a/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
+++ b/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
@@ -545,7 +545,6 @@ &mmc2 {
 	non-removable;
 	mmc-pwrseq = <&emmc_pwrseq>;
 
-	ti,needs-special-reset;
 	dmas = <&sdma_xbar 47>, <&sdma_xbar 48>;
 	dma-names = "tx", "rx";
 
@@ -561,7 +560,6 @@ &mmc4 {
 	/* DDR50: DDR up to 50 MHz (1.8 V signaling). */
 	status = "okay";
 
-	ti,needs-special-reset;
 	vmmc-supply = <&vdd_3v3>;
 	cap-power-off-card;
 	keep-power-in-suspend;
diff --git a/arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dts b/arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dts
index 3dd898955e767ea506b85648224812454b2b1045..77c9fbb3bfbd82c3ed74be6b5222b1c94c074bdd 100644
--- a/arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dts
+++ b/arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dts
@@ -481,7 +481,6 @@ &mmc2 {
 	vmmc-supply = <&vdd_3v3>;
 	bus-width = <8>;
 	ti,non-removable;
-	cap-mmc-dual-data-rate;
 };
 
 &qspi {
diff --git a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
index 150dd84c9e0f749585de5fd4edb3bc673a8209ea..6a09166843694292cd4c37edd081ea89c28e1003 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
@@ -2153,7 +2153,6 @@ mmc1: mmc@0 {
 				reg = <0x0 0x400>;
 				interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
 				ti,dual-volt;
-				ti,needs-special-reset;
 				dmas = <&sdma 61>, <&sdma 62>;
 				dma-names = "tx", "rx";
 				pbias-supply = <&pbias_mmc_reg>;
@@ -2248,7 +2247,6 @@ mmc3: mmc@0 {
 				compatible = "ti,omap4-hsmmc";
 				reg = <0x0 0x400>;
 				interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
-				ti,needs-special-reset;
 				dmas = <&sdma 77>, <&sdma 78>;
 				dma-names = "tx", "rx";
 			};
@@ -2312,7 +2310,6 @@ mmc2: mmc@0 {
 				compatible = "ti,omap4-hsmmc";
 				reg = <0x0 0x400>;
 				interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
-				ti,needs-special-reset;
 				dmas = <&sdma 47>, <&sdma 48>;
 				dma-names = "tx", "rx";
 			};
@@ -2404,7 +2401,6 @@ mmc4: mmc@0 {
 				compatible = "ti,omap4-hsmmc";
 				reg = <0x0 0x400>;
 				interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
-				ti,needs-special-reset;
 				dmas = <&sdma 57>, <&sdma 58>;
 				dma-names = "tx", "rx";
 			};
@@ -2436,7 +2432,6 @@ mmc5: mmc@0 {
 				compatible = "ti,omap4-hsmmc";
 				reg = <0x0 0x400>;
 				interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
-				ti,needs-special-reset;
 				dmas = <&sdma 59>, <&sdma 60>;
 				dma-names = "tx", "rx";
 			};
diff --git a/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi b/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi
index 3b505fe415ed9e0f27f27080ddfec561be7eadc4..5a32296abdb925f651cab532e890f8659ef1b55c 100644
--- a/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi
@@ -1916,7 +1916,6 @@ mmc1: mmc@0 {
 				reg = <0x0 0x400>;
 				interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
 				ti,dual-volt;
-				ti,needs-special-reset;
 				dmas = <&sdma 61>, <&sdma 62>;
 				dma-names = "tx", "rx";
 				pbias-supply = <&pbias_mmc_reg>;
@@ -2004,7 +2003,6 @@ mmc3: mmc@0 {
 				compatible = "ti,omap4-hsmmc";
 				reg = <0x0 0x400>;
 				interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
-				ti,needs-special-reset;
 				dmas = <&sdma 77>, <&sdma 78>;
 				dma-names = "tx", "rx";
 			};
@@ -2044,7 +2042,6 @@ mmc2: mmc@0 {
 				compatible = "ti,omap4-hsmmc";
 				reg = <0x0 0x400>;
 				interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
-				ti,needs-special-reset;
 				dmas = <&sdma 47>, <&sdma 48>;
 				dma-names = "tx", "rx";
 			};
@@ -2136,7 +2133,6 @@ mmc4: mmc@0 {
 				compatible = "ti,omap4-hsmmc";
 				reg = <0x0 0x400>;
 				interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
-				ti,needs-special-reset;
 				dmas = <&sdma 57>, <&sdma 58>;
 				dma-names = "tx", "rx";
 			};
@@ -2168,7 +2164,6 @@ mmc5: mmc@0 {
 				compatible = "ti,omap4-hsmmc";
 				reg = <0x0 0x400>;
 				interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
-				ti,needs-special-reset;
 				dmas = <&sdma 59>, <&sdma 60>;
 				dma-names = "tx", "rx";
 			};

-- 
2.51.0


