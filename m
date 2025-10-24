Return-Path: <linux-omap+bounces-4747-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDADC04E38
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 09:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 22FD83465B3
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 07:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A682FB0BD;
	Fri, 24 Oct 2025 07:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pbjv5FSb"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B052FAC07
	for <linux-omap@vger.kernel.org>; Fri, 24 Oct 2025 07:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761292651; cv=none; b=K9nPBKMtA46Ft23dkwB3J4HGuEGx5/4RwQgMuPGQbe5l5NVrtDLSME1OTm0XKzr9012S89LBpKciLIj69kErRm5K1aJlZscMx0+QxaJ6keqkKSFjp3x3SlSWBe87Yqvh7TUXyNdaB+iDa7McTfx+21AFDF0RUxjEjTtl0y+FEU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761292651; c=relaxed/simple;
	bh=3fOUjvWyPdLQupJigM7VabtL3miDrlYQ4ie+3GRBu0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kl9ebj6K+hQX8YhieKmbvbIRKL3Bw6GYfyLmaNcjLSsIbWv1yZ/Eth3ctVwJ0knsInribRW4iPOL/2u6ptfgZOLehvrtVidleNYS3e1pkKD9on5p4Emd/Og5GDXgfAbWgvZlxcdxZv6C7ZRoIohYF+0ruzE+awzOl493JlwaN5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pbjv5FSb; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-27d3540a43fso17219385ad.3
        for <linux-omap@vger.kernel.org>; Fri, 24 Oct 2025 00:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761292648; x=1761897448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8zJ/5Y26gbXOt35jdXlLCdG2ABnFj5sLixstcA/A5M=;
        b=Pbjv5FSb1G8vQpfjsSSw6/4T+c0kO5J/ByeLLV71aad8d9bVwzUQXiqAEHv5XJCb56
         hFowMd0B1DRaeDzmPY1VW9HPNWtYEUXaZaYW8wgjTmAM8s+IuBA5FqI9q2sWROsUbSwv
         GX2Oyus5eSEpCruhBrkXa2JJ5yja8fQ27WDXBktFiXRCG7y8+igvOLHyiOcztkkgiw1u
         69w2D9WTvk0Fgn/iHETz0S92ef5X/T/46xdfwquDOxlOXYxZ1xbSc05rj2SJ9VA9MW60
         bbt11KrzTznfY9w6VylYJuMeZICtXJ00pSfbBWStZVu6Qw340H2NG3roldSZlfQbJ6rJ
         iSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761292648; x=1761897448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G8zJ/5Y26gbXOt35jdXlLCdG2ABnFj5sLixstcA/A5M=;
        b=cl5H8sGFD5pAADIlQqy93U9K+wRXKX6k6d9Ne4DC3LUjVwiDQlt9RhdJDZ0unzWfRT
         J/r8IKDnE3jOcacSsmNA/DD+xQST/X9aZ4qeEj7nkJi2hxO1HN6MrW0n8qAnlopv6ZfA
         A9Mbx7/D05bOEO9rdnT171D5YmfjjaFnMFzZYciF7pz7rN3Kr3RXRI4mUNtyFJpU+NTF
         +hckNraVmMoyIZ+5vgKZnW/WpR837K5d932kw2WWGJIncC1yK/pCyzmmVdIJFI+eZuKQ
         BfsG9Sj9jfxFL1ID7eEmcuv4z01O8+Et/+Tku017ipR9WZCHMHapSXRy+8uMyVCIglq+
         o1oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIazWpc8HCfr3ZEfnp2MBdPryS0gPISwcEiGvf+oA0XXiHpcVPoui6IDt23BtE+hvlWL6RkbKZPRJW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8KeuBR5NqborC+22htlmjCmORSGZfve3X309LbKKr78T261lp
	eLiBKqlO5/EJQDCb1s7eIFqC0N6lj6h0ngsOY0NUHCCw0KoIdTtN8eRx
X-Gm-Gg: ASbGncvhuE6Avwtu7KyfVPy9Wz0QyxKBjePy1UPpI0qEG/jbzJnUV6OU+r68DpCMu5r
	6IGBXjafBKHvF7Q0eTbPeYOVUo1xPD7LWUDBbEidcH5yLjr7vntenhMMTFF1mlyUHgiea+qeFRg
	wx48oAZRzdEcuHD0PL4wezMoQogvw91/xhfPlXItSYhYBnmaPLCId3zn2ogMFBRcQlPVjxD1xgC
	rq8e+F/741500FqztFdpUYzF+qH3GVkNNYLzno45/+LvGSgsJSu9KabQgvGc/wyyHi7BHZ76igw
	GS4usRHT9e2q9qcK0mSWfLfrblgGaWWCTOk5cgjKn46E3eddJViinDdX6CUpW25zcexPwKFwc3B
	DtuhSbtRRlJSBHVKOODuI5nDcXQ29wjS66Qdjq7zGjjyTqr4DS2tbZLqAVVRIIskhR8pTrhN9Rx
	v7yTHQubNQc5QlMAnVfU2D
X-Google-Smtp-Source: AGHT+IEGUSE5fx9yz1SLPanBG7uzkXswR8U0AQER9O6+SjsnnXCgIsesPRtPPm/9zhCI36iWczIw6g==
X-Received: by 2002:a17:903:384c:b0:27e:d9a0:ba08 with SMTP id d9443c01a7336-290cb27dae5mr344257355ad.43.1761292648242;
        Fri, 24 Oct 2025 00:57:28 -0700 (PDT)
Received: from Black-Pearl.localdomain ([27.7.191.116])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2946dfd045esm46608205ad.64.2025.10.24.00.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 00:57:27 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Fri, 24 Oct 2025 07:57:09 +0000
Subject: [PATCH v5 2/3] arm: dts: ti: omap: Drop unnecessary properties for
 SDHCI node
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-ti-sdhci-omap-v5-2-df5f6f033a38@gmail.com>
References: <20251024-ti-sdhci-omap-v5-0-df5f6f033a38@gmail.com>
In-Reply-To: <20251024-ti-sdhci-omap-v5-0-df5f6f033a38@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Barker <paul.barker@sancloud.com>, 
 Marc Murphy <marc.murphy@sancloud.com>, Tony Lindgren <tony@atomide.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3

Remove the "ti,needs-special-reset", "ti,needs-special-hs-handling", and
"cap-mmc-dual-data-rate" properties from the DTS for the sdhci nodes,
as the sdhci-omap driver does not depend on these properties.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts | 1 -
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi                        | 2 --
 arch/arm/boot/dts/ti/omap/am33xx.dtsi                           | 1 -
 arch/arm/boot/dts/ti/omap/am4372.dtsi                           | 1 -
 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi                        | 2 --
 arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts               | 2 --
 arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dts               | 1 -
 7 files changed, 10 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts b/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts
index 7c9f65126c63..8b47f45a9959 100644
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
index d6a143abae5f..39278667a5a4 100644
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
index 0614ffdc1578..f35f6b56e8f5 100644
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
index 0a1df30f2818..504fa6b57d39 100644
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
index fd4634f8c629..e08f356e71cb 100644
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
index e6a18954e449..43cf4ade950b 100644
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
index 3dd898955e76..77c9fbb3bfbd 100644
--- a/arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dts
+++ b/arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dts
@@ -481,7 +481,6 @@ &mmc2 {
 	vmmc-supply = <&vdd_3v3>;
 	bus-width = <8>;
 	ti,non-removable;
-	cap-mmc-dual-data-rate;
 };
 
 &qspi {

-- 
2.51.1


