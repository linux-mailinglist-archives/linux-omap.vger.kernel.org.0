Return-Path: <linux-omap+bounces-3508-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ADAA759F8
	for <lists+linux-omap@lfdr.de>; Sun, 30 Mar 2025 14:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7A283A91D3
	for <lists+linux-omap@lfdr.de>; Sun, 30 Mar 2025 12:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE5A1C8FB5;
	Sun, 30 Mar 2025 12:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="efXm5kMs"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FDE1C8637
	for <linux-omap@vger.kernel.org>; Sun, 30 Mar 2025 12:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743336868; cv=none; b=kUmyBxTQ8u2m75uPLR8bioo1D0UM9lXEt0fxKN0sckvb6it1Ipw8lTTxCMGYqW2+NdNBxvgeO5Hvk6y9AKvQ7LvBl5OMOpo2n25+L4Fsann3d0bdA8jrk1mXYqH9Bi0iMYIArenCNc9PxI5NHQCthGZHQ9xLMd9iKo5mdpNA8cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743336868; c=relaxed/simple;
	bh=yLvyLHXfSWBNteC0GpGSVDGDn4nTOQdXHVuo8m0z460=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CQTgwLGn6IzS09rcZsjMQtUghn2MwggrfmDFNzmgTS19jNrQsX4O2jU3pOSesw5P/XyqtrQ+8g98a6UcX3nmC+1hgtLtcgkcKpgt6L89gHWcepSgEsbGouEMcyy4xdXOtaWBWvx0+eDsQDVYIoflvH/bofzFaH0cR8AdR7qNTck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=efXm5kMs; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Fk2+WE9/QQiHjGgAj8JE2BzqYSdLo3nPWFWef91RhrM=; b=efXm5k
	Ms340Ycs8lkEc85yZcLOQqucHA3SgmhX5zGV6HTC2mQ//GJD6QuCKEffuz2AQJDy
	IJ10yDKCPofi7YlOsgsjGCHBLZ0Kv/g0WzQ/Lfa7pzp0MVYSkoVQEE9e7zibcJ/T
	Yxv0SM000dyObsSGYxNieguEwY0Qd/fMFVEmnvnaiMhXnIKf//aXcigz6b6uaO9Z
	i+I8YtP78s13xpa0MSE3WRp6DDY7fGJpTCKdkhZkF97p02ZbvbLYXXj63gpDlMnO
	LXnh5RRukR8qgAPzaGP3zYwLBzlpdVgKiRy1EZHJDcRz7XldYTkOP8AzKIhDc21w
	Ds2dacqWFQaikiNA==
Received: (qmail 855887 invoked from network); 30 Mar 2025 14:14:22 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Mar 2025 14:14:22 +0200
X-UD-Smtp-Session: l3s3148p1@+qJmPo4xpDdtKjBa
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 4/5] ARM: dts: ti: omap: fix faulty ohci/ehci node names
Date: Sun, 30 Mar 2025 14:13:27 +0200
Message-ID: <20250330121326.9069-11-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250330121326.9069-7-wsa+renesas@sang-engineering.com>
References: <20250330121326.9069-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They should be named "usb@".

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


