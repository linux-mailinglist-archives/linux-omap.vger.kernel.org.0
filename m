Return-Path: <linux-omap+bounces-2730-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D43E19D9C9D
	for <lists+linux-omap@lfdr.de>; Tue, 26 Nov 2024 18:33:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F821167826
	for <lists+linux-omap@lfdr.de>; Tue, 26 Nov 2024 17:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46461DA2E5;
	Tue, 26 Nov 2024 17:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b="JoinQbsy"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADC61D63C4
	for <linux-omap@vger.kernel.org>; Tue, 26 Nov 2024 17:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732642396; cv=none; b=p2g/EbPjMcsI+SVBeh2m32YdnwX04janx/gOufy/GgeVvncw5M7TIfhGMUdTGNNVaRnHet/1UD1YXzA9iehtQGsJu9a6BlInkKHbQdsX1DHL8J0oU4pf2O0vfouleZfaDQPMKiPk+5urt8oRPfjNRyQrR7L5EuaAatY0ngHegPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732642396; c=relaxed/simple;
	bh=eHuuzWF/RBD95AGh3ZSbBDHlU1JgErlDYZ2iVCVoQCk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eMt5ddYLvgxncnYJIQFFLbKZunDsBB1fhLaOD9tMbwewSP97hfVY/soRcWabsF6KJhvo8ZcrlND0Izji8+LShNnY7KWZGOXaGT8eavuZlCxT3J1BGtfbtLhhionAG1jmQlkSBu5CdjTLEafARhf21OajnAJ2H+eZtXO9KOsLLlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b=JoinQbsy; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3824aef833bso4262071f8f.0
        for <linux-omap@vger.kernel.org>; Tue, 26 Nov 2024 09:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1732642392; x=1733247192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9oOV6Xf/f1fBBujFiCnK10GJBxK35mB0wxBS2n5gZfU=;
        b=JoinQbsy8YTH9AIbeBWuvutA+CMsxhnroeRA3jbDy6959dJ+Kz9fsFJhk1kdDJrEvk
         NokJOCaIPl39cHr7zznmSEjqDLl3OUBw/cil01PUfCa0PBu2t662+SM4x1ii3ikPKAx+
         AnqkYZ5Qu6PoYEVSJiu7riooknill1bLqe1qU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732642392; x=1733247192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9oOV6Xf/f1fBBujFiCnK10GJBxK35mB0wxBS2n5gZfU=;
        b=Z/cC9WuHQ8tMskGnrZseIkpHeiwREUeq+mCCDhD1xqTPbiKl+S3jOPxi48fJV9/8Ze
         dKFYrgZH3LEdiieWW8Io+15BN2UUJvum58evxb5g5uh/b2mTtFzdwS2xSZ6vGn7Bd30b
         ASLQXf6Z2JZa8x4/VOkbTootVIFvJJ1pZ9reQkiApSbnjQqi0L/dZxKjM0JCcpLkyYzE
         7MlQHn/MQ+fwwQ1zmo5hwmnblAfEzKaFFJ+rfAUUwQhWg2cXf066UZSngPpPypuz22GG
         bKguOtlqFhTE699IakbHGInaUo5RW0F1VTfEmGPhkYD8cQpLii9JbMENvjmUj7TpnHFS
         lm1Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8GyXJbigeV9pnDL3zRsdMk6Qjykpb+3tzdrswJoRcjnf2BSVBGKyQWlSjpEr2v3QIFal5F2++uz2a@vger.kernel.org
X-Gm-Message-State: AOJu0YySi1KH9423O7NMXfZ30GSPIUlsLNV6nAgpu9sjihDqQRCkJq3A
	PD+0tDaFwVh4NSzM/nHLop854Uy6T/c2gmkV0fPsc0vRYDsX8imMjev7ei70+r4=
X-Gm-Gg: ASbGncvFxj2/BBNCt+EgFTclNKssj2YVNtDQwCKtpysxhyOYgAEoswGvWfyauX/cmIj
	xw06zmQDu++ACN7Mm1opbjV3RpiEz+LnXgx22VR70LshP2eS+piftll1mt/mszPQ7xQGQBRAE4q
	ZVGA1xxhdVeQ2Ush+ZkN5Mz+G3XNhv2V/vlAZte9P7CLeaJ9+BJAxonq7aufyxNJKmaVfEa9t8t
	Vg2KyhvWOhkS/+OTNxk5icCJccAxwedDhHnOW0lJzwcJchH/ewqXrhnlPwXDNobl3DfunCtXhXd
	sVpS1KyXcZxVPE3KovheBfkGrwL8d1jmPu7eDX3csnn8++I=
X-Google-Smtp-Source: AGHT+IH+jDs/Oi/Yj699wtUEbjT8GQBWJI0mOVavIZ5Y1ZVm3lZYt0A+bSeHwUyDg6sCEgug0Vl6Ag==
X-Received: by 2002:a05:6000:18ac:b0:382:4b43:c3a with SMTP id ffacd0b85a97d-38260b45e0cmr16212760f8f.2.1732642391966;
        Tue, 26 Nov 2024 09:33:11 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbe901esm14043844f8f.87.2024.11.26.09.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 09:33:11 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	kristo@kernel.org,
	vigneshr@ti.com,
	nm@ti.com,
	Romain Naour <romain.naour@skf.com>
Subject: [PATCH] arm64: dts: ti: k3-j721e-beagleboneai64: Enable ACSPCIE output for PCIe1
Date: Tue, 26 Nov 2024 18:33:07 +0100
Message-ID: <20241126173307.4054601-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Romain Naour <romain.naour@skf.com>

Unlike the SK-TDA4VM (k3-j721e-sk) board, there is no clock generator
(CDCI6214RGET) on the BeagleBone AI-64 (k3-j721e-beagleboneai64) to
provide PCIe refclk signal to PCIe Endponts. So the ACSPCIE module must
provide refclk through PCIe_REFCLK pins.

Use the new "ti,syscon-acspcie-proxy-ctrl" property to enable ACSPCIE
module's PAD IO Buffers.

Signed-off-by: Romain Naour <romain.naour@skf.com>
---
With this patch, we can remove "HACK: Sierra: Drive clock out" patch
applied on vendor kernel for BeagleBone AI-64:
https://openbeagle.org/beagleboard/linux/-/commit/ad65d7ef675966cdbc5d75f2bd545fad1914ba9b
---
 arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts |  4 ++++
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi          | 10 ++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
index fb899c99753e..681e3af7ce6e 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
@@ -859,6 +859,10 @@ &pcie1_rc {
 	num-lanes = <2>;
 	max-link-speed = <3>;
 	reset-gpios = <&main_gpio0 22 GPIO_ACTIVE_HIGH>;
+	/* There is no on-board or external reference clock generators,
+	 * use refclk from the ACSPCIE module's PAD IO Buffers.
+	 */
+	ti,syscon-acspcie-proxy-ctrl = <&acspcie0_proxy_ctrl 0x3>;
 };
 
 &ufs_wrapper {
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index 0da785be80ff..9f47e7672922 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -5,6 +5,7 @@
  * Copyright (C) 2016-2024 Texas Instruments Incorporated - https://www.ti.com/
  */
 #include <dt-bindings/phy/phy.h>
+#include <dt-bindings/phy/phy-cadence.h>
 #include <dt-bindings/phy/phy-ti.h>
 #include <dt-bindings/mux/mux.h>
 
@@ -82,6 +83,11 @@ ehrpwm_tbclk: clock-controller@4140 {
 			reg = <0x4140 0x18>;
 			#clock-cells = <1>;
 		};
+
+		acspcie0_proxy_ctrl: acspcie0-ctrl@18090 {
+			compatible = "ti,j784s4-acspcie-proxy-ctrl", "syscon";
+			reg = <0x18090 0x4>;
+		};
 	};
 
 	main_ehrpwm0: pwm@3000000 {
@@ -978,8 +984,8 @@ pcie1_rc: pcie@2910000 {
 		max-link-speed = <3>;
 		num-lanes = <2>;
 		power-domains = <&k3_pds 240 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 240 1>;
-		clock-names = "fck";
+		clocks = <&k3_clks 240 1>, <&serdes1 CDNS_SIERRA_DERIVED_REFCLK>;
+		clock-names = "fck", "pcie_refclk";
 		#address-cells = <3>;
 		#size-cells = <2>;
 		bus-range = <0x0 0xff>;
-- 
2.45.0


