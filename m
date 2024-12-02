Return-Path: <linux-omap+bounces-2749-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 775969E07EB
	for <lists+linux-omap@lfdr.de>; Mon,  2 Dec 2024 17:06:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD6DFB83D26
	for <lists+linux-omap@lfdr.de>; Mon,  2 Dec 2024 14:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1489621C183;
	Mon,  2 Dec 2024 14:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b="av1JCfeT"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D482194BE
	for <linux-omap@vger.kernel.org>; Mon,  2 Dec 2024 14:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733150021; cv=none; b=J1+1poNWDR8Fva7VZQBA3sdYPEaDfgdhX5Lx+xjobWhaf46fouSUFuaWElN+9aETguRnGgBEGNs0A/dSpnkczFBSLfvBl0OImjeZW0xF88523QINNjQ9fBS4v0zN664diV85TkwriFzZRQM/jaJjImeteA3GruDoFtiMZdEy7oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733150021; c=relaxed/simple;
	bh=hcnvZNIn9mD/rvmfANePOJ3+hvdxq601+qI3ubhZ3SI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oX4VYj8dpBldZdlbiPkCltWZtpZ1UGR6IUDx6cPOOZizWx8TVDeZiMW8FI6esqoreH9m9RSBEVSBzcMCZZniz+9Cib9HGWq7h2kVqCr9LF7FfNK8bnecvkyDyjoFTGJ4JxvZEfYZTv8D4Nyv06NptMZVjsLKYYz8li1NyAGm73U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b=av1JCfeT; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so1094907f8f.1
        for <linux-omap@vger.kernel.org>; Mon, 02 Dec 2024 06:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1733150017; x=1733754817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OcRP67UkWqEX1kfwylj4ZfjPBj6iFSQEtH2rLKeSLI=;
        b=av1JCfeTg5qo1JerzK/cBIP5b8oWQw/xBNPMt29zNKtS0YfcaySo4aLc4NtMGC3nih
         vk8jSbsM4+7p8uzwPM9wgwvJBpbH4hXVP75oyiyYPAac18hCGZLZR/WGLYGV/mJ4E83D
         rZmWPQZSu83pS3aIXF6160gZaEV0lDUZa7Yco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733150017; x=1733754817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9OcRP67UkWqEX1kfwylj4ZfjPBj6iFSQEtH2rLKeSLI=;
        b=ZWlBxPb9/t6B3wFgavrr2ndiUQRkqvVDDRe5gLMV2AeUpdNQlgHLbHEykRC1i9sJ2t
         P5OcEZ9icvxd1bWbnX7zUV6L/SYbQ0v85x3pq4iTXTaZXmz9LVsPMP1YglYF1ZRbKrBq
         MPSWgaO85ZUKIei+HW5OKm+hW8G2e5VPA4GxTLM013jyAm0RvOLJsgLMhWBbW9M23W8x
         ozbh4wtFMUpTmpH5Z90Y8PHvuBpAO8v/HrA8jdj/1dkXKivy0kNULZX9GCu27yT061ei
         /YSsm4NzE2c3cy39gdX+/o26uZLNuyHSHwiGfAEzEGaaWlcgWyYf6z79igicuLw6m6Ix
         pJNA==
X-Forwarded-Encrypted: i=1; AJvYcCVYldEE6Wgh5dIz0HAljcR9xHBGv7wsvj7Z2fuWuIWj+JX0zI1JfrVzfd3UN4b/VMcO5pHEb4WaRLqm@vger.kernel.org
X-Gm-Message-State: AOJu0YwZow9ZzGWL1lAUPDexIfFATRnbTAEmOX5vJW6/pf4Cc5NOtfxP
	UDZ5geLLksqzTOJCneIzmtz2gsc6wcotFW+k7c4aP510TiDAuDXaWlpVTzN0WDI=
X-Gm-Gg: ASbGnctTqF1KVQxbt7KPvG7XzTvuMXLvYQO1qe509k1w37Ad0e550P6rCIZBxfLUS4I
	tNs7vadxiJBovlCqfdBwVscQTQHWetGCLCmwAfD4SFaU61k5HOU8HmaxRxNwazT1pH1Ni4qFsdJ
	u2kbIJmvY58sbejK0Aq1MSEcdJXiI3LbImcFL9klLkGh2EJ9Z8L7y6hm05FPVD1BO7M/h/2037e
	F7+cbD53GW0pKoh0I956zQ2bhNuM2kc4UYhvpl3UznKC6iZFoj8IGcYUWHQiu2OadwOxBiiXHNb
	BIu0B2do38WvfcW55FaIT22bWOpu1+l8OgRWLptAS8TT/ik=
X-Google-Smtp-Source: AGHT+IHIRiUC7pSf2CvIWjZMDX19I1R/wO3AhDavAhcZNTvCN4vMWcNnrOsyDB3TFGYdPtnX4ejb3g==
X-Received: by 2002:a5d:59ab:0:b0:385:f23a:2fe1 with SMTP id ffacd0b85a97d-385f23a32e6mr4087650f8f.26.1733150017155;
        Mon, 02 Dec 2024 06:33:37 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385eed2510esm4312569f8f.69.2024.12.02.06.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:33:36 -0800 (PST)
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
	Romain Naour <romain.naour@skf.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>
Subject: [PATCHv3 2/2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable ACSPCIE output for PCIe1
Date: Mon,  2 Dec 2024 15:33:31 +0100
Message-ID: <20241202143331.126800-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241202143331.126800-1-romain.naour@smile.fr>
References: <20241202143331.126800-1-romain.naour@smile.fr>
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

Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Romain Naour <romain.naour@skf.com>
---
With this patch, we can remove "HACK: Sierra: Drive clock out" patch
applied on vendor kernel for BeagleBone AI-64:
https://openbeagle.org/beagleboard/linux/-/commit/ad65d7ef675966cdbc5d75f2bd545fad1914ba9b

v3:
 - update "acspcie0_proxy_ctrl" compatible to "ti,j721e-acspcie-proxy-ctrl"
   since this property is specific to j721e variant.

v2:
 - use generic style comments
 - use "syscon" as generic node name for "acspcie0_proxy_ctrl" node
 - Keep the compatible "ti,j784s4-acspcie-proxy-ctrl" since the
   ACSPCIE buffer and its functionality is the same across all K3 SoCs.
   (Siddharth Vadapalli)

   "The compatible "ti,j784s4-acspcie-pcie-ctrl" should be reused for
   J721E and all other K3 SoCs.
   For example, see:
   https://lore.kernel.org/r/20240402105708.4114146-1-s-vadapalli@ti.com/
   which introduced "ti,am62p-cpsw-mac-efuse" compatible.

   The same compatible is reused across all K3 SoCs:
   https://lore.kernel.org/r/20240628151518.40100-1-afd@ti.com/ "
---
 arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts |  5 +++++
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi          | 10 ++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
index fb899c99753e..741ad2ba6fdb 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
@@ -859,6 +859,11 @@ &pcie1_rc {
 	num-lanes = <2>;
 	max-link-speed = <3>;
 	reset-gpios = <&main_gpio0 22 GPIO_ACTIVE_HIGH>;
+	/*
+	 * There is no on-board or external reference clock generators,
+	 * use refclk from the ACSPCIE module's PAD IO Buffers.
+	 */
+	ti,syscon-acspcie-proxy-ctrl = <&acspcie0_proxy_ctrl 0x3>;
 };
 
 &ufs_wrapper {
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index af3d730154ac..32a232a90100 100644
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
+		acspcie0_proxy_ctrl: syscon@18090 {
+			compatible = "ti,j721e-acspcie-proxy-ctrl", "syscon";
+			reg = <0x18090 0x4>;
+		};
 	};
 
 	main_ehrpwm0: pwm@3000000 {
@@ -979,8 +985,8 @@ pcie1_rc: pcie@2910000 {
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


