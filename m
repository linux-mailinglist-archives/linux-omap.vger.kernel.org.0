Return-Path: <linux-omap+bounces-3516-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A60AA75BFA
	for <lists+linux-omap@lfdr.de>; Sun, 30 Mar 2025 21:39:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 029373A8564
	for <lists+linux-omap@lfdr.de>; Sun, 30 Mar 2025 19:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9899C1DDC11;
	Sun, 30 Mar 2025 19:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="EwMBV0mK"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6567364A8F
	for <linux-omap@vger.kernel.org>; Sun, 30 Mar 2025 19:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743363558; cv=none; b=RijFcbTuel+FXGytOs2ntjIqUcZS9uTgUrRFVgLmGYfmlWg9RcRLAQelYJsWoiVc6MRTY8+QW8/dSGfViXg72vZ+pLkSO2rN+GbgYP+8IprPqLcfFmqyLl7Q39ca5/35MGB4zAuAVgUduH7DY4v9X9GYKCSGWxMNZgNCR4hVFlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743363558; c=relaxed/simple;
	bh=Pu3XnOmuOsuenROzY+fwWH0MnQAWIv/xzJa4/R+mM80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gVSSIWd6ZrSs/Ulo6jC9crrgnLazg0aPndio0IGUIkj9nWspQQIiW9jXyCaGDS3IIqYfsTnAkPDPT5cxr6CpOTqO19x5NEfH8JIZCyYGJS/j+aHYTfEYYhj+hDcqcL7aTjIENMCgUfT5oMxPXIlcr+F/RAgIjNOVFGGeKFgzPek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=EwMBV0mK; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=0ZE35oNxFm+cLFtskkk1IPsKgn9aJpsHDgF40rmaSN4=; b=EwMBV0
	mKkExS95rgBuS9b+06LY6/mgrHb40RxDjdB6ANo/IYxOZ9UvFHFyjowg1lUbbU3E
	a5B1mqZOs7uocKD1FI5CeSX8s/Uv49eFLCOKX6pcX9L6q1EATbLP66sElGlvMccb
	VNbDZFVJfpNj5VW6g01L1QXtR+rlBZhYrUbA0JQ3I/bCgTzAf3O3cZlCFT5FodI3
	wOByNZ6qa5p1xuHGlyRyfZpZ31BG2RkPmKhkYdNaXzbVxIJKoMBCuKMjVocSicuE
	5/bLk0snCP4/U6Cz7C5COp39ck2q7ovJ7hOdrIe4UYPMzo5eAsiXfFfu+EN6Doyi
	C5WBQAkcZlNKoSAw==
Received: (qmail 964929 invoked from network); 30 Mar 2025 21:39:08 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Mar 2025 21:39:08 +0200
X-UD-Smtp-Session: l3s3148p1@HvX8dJQxAKxQ8qei
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 4/5] ARM: dts: ti: omap: use correct ohci/ehci node names
Date: Sun, 30 Mar 2025 21:38:35 +0200
Message-ID: <20250330193833.21970-11-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250330193833.21970-7-wsa+renesas@sang-engineering.com>
References: <20250330193833.21970-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They should be named "usb@".

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/ti/omap/omap3.dtsi    | 4 ++--
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi | 4 ++--
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap3.dtsi b/arch/arm/boot/dts/ti/omap/omap3.dtsi
index 92cd4c99dae7..817474ee2d13 100644
--- a/arch/arm/boot/dts/ti/omap/omap3.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3.dtsi
@@ -862,14 +862,14 @@ usbhshost: usbhshost@48064000 {
 			#size-cells = <1>;
 			ranges;
 
-			usbhsohci: ohci@48064400 {
+			usbhsohci: usb@48064400 {
 				compatible = "ti,ohci-omap3";
 				reg = <0x48064400 0x400>;
 				interrupts = <76>;
 				remote-wakeup-connected;
 			};
 
-			usbhsehci: ehci@48064800 {
+			usbhsehci: usb@48064800 {
 				compatible = "ti,ehci-omap";
 				reg = <0x48064800 0x400>;
 				interrupts = <77>;
diff --git a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
index 150dd84c9e0f..4ee53dfb71b4 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
@@ -302,14 +302,14 @@ usbhshost: usbhshost@0 {
 					      "refclk_60m_ext_p1",
 					      "refclk_60m_ext_p2";
 
-				usbhsohci: ohci@800 {
+				usbhsohci: usb@800 {
 					compatible = "ti,ohci-omap3";
 					reg = <0x800 0x400>;
 					interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
 					remote-wakeup-connected;
 				};
 
-				usbhsehci: ehci@c00 {
+				usbhsehci: usb@c00 {
 					compatible = "ti,ehci-omap";
 					reg = <0xc00 0x400>;
 					interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi b/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi
index 3b505fe415ed..9f6100c7c34d 100644
--- a/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi
@@ -331,14 +331,14 @@ usbhshost: usbhshost@0 {
 					      "refclk_60m_ext_p1",
 					      "refclk_60m_ext_p2";
 
-				usbhsohci: ohci@800 {
+				usbhsohci: usb@800 {
 					compatible = "ti,ohci-omap3";
 					reg = <0x800 0x400>;
 					interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
 					remote-wakeup-connected;
 				};
 
-				usbhsehci: ehci@c00 {
+				usbhsehci: usb@c00 {
 					compatible = "ti,ehci-omap";
 					reg = <0xc00 0x400>;
 					interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.47.2


