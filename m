Return-Path: <linux-omap+bounces-219-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D68827799
	for <lists+linux-omap@lfdr.de>; Mon,  8 Jan 2024 19:34:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 716AC28491F
	for <lists+linux-omap@lfdr.de>; Mon,  8 Jan 2024 18:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E35354FA1;
	Mon,  8 Jan 2024 18:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KME0vviq"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF5B38DC3;
	Mon,  8 Jan 2024 18:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 408IXDoB041796;
	Mon, 8 Jan 2024 12:33:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1704738794;
	bh=K3M9sI7ldpwxKdZlqbzDASUN2Gy2vGqDMV0YI/zfTo4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KME0vviqbdcwJlAQ8bWNbObioH1VBKu2jzYv6sic48MxvNnBTDeOtUlPIRWvdytmn
	 0MOjzIFmD1VMrfQRNjSAJwSIcl7B9VHdiv9N+ZlY7wIa6dtrQqFYhOO+FxpDm0ZOru
	 r0juZZMEEBEg4w89gXIoKG5h4Wicb02AOTBcTJkI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 408IXD7f022473
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jan 2024 12:33:13 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 Jan 2024 12:33:13 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 Jan 2024 12:33:13 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.40.136])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 408IX3hJ051691;
	Mon, 8 Jan 2024 12:33:12 -0600
From: Andrew Davis <afd@ti.com>
To: Frank Binns <frank.binns@imgtec.com>,
        Donald Robson
	<donald.robson@imgtec.com>,
        Matt Coster <matt.coster@imgtec.com>,
        "H .
 Nikolaus Schaller" <hns@goldelico.com>,
        Adam Ford <aford173@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec
	<jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren
	<tony@atomide.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Paul Cercueil
	<paul@crapouillou.net>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-sunxi@lists.linux.dev>, <linux-omap@vger.kernel.org>,
        <linux-mips@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH RFC v2 10/11] ARM: dts: sun6i: Add device tree entry for SGX GPU
Date: Mon, 8 Jan 2024 12:33:01 -0600
Message-ID: <20240108183302.255055-11-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240108183302.255055-1-afd@ti.com>
References: <20240108183302.255055-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Add SGX GPU device entry to base sun6i-a31 dtsi file.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 arch/arm/boot/dts/allwinner/sun6i-a31.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun6i-a31.dtsi b/arch/arm/boot/dts/allwinner/sun6i-a31.dtsi
index 5cce4918f84c9..e6998783b89aa 100644
--- a/arch/arm/boot/dts/allwinner/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun6i-a31.dtsi
@@ -962,6 +962,15 @@ mdio: mdio {
 			};
 		};
 
+		gpu: gpu@1c40000 {
+			compatible = "allwinner,sun6i-a31-gpu", "img,powervr-sgx544";
+			reg = <0x01c40000 0x10000>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_GPU_CORE>, <&ccu CLK_GPU_MEMORY>;
+			clock-names = "core", "mem";
+			status = "disabled";
+		};
+
 		crypto: crypto-engine@1c15000 {
 			compatible = "allwinner,sun6i-a31-crypto",
 				     "allwinner,sun4i-a10-crypto";
-- 
2.39.2


