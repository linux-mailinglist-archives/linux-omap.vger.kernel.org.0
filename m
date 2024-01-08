Return-Path: <linux-omap+bounces-225-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4368277B1
	for <lists+linux-omap@lfdr.de>; Mon,  8 Jan 2024 19:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68AEC1F23C0E
	for <lists+linux-omap@lfdr.de>; Mon,  8 Jan 2024 18:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7381455E71;
	Mon,  8 Jan 2024 18:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ugMGV91J"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52C455C0A;
	Mon,  8 Jan 2024 18:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 408IX4A1009950;
	Mon, 8 Jan 2024 12:33:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1704738784;
	bh=x6uvX602Jt/Rs9YtQk4an9e+qCtql8Sq4EaVGkXZJGw=;
	h=From:To:CC:Subject:Date;
	b=ugMGV91JJYCakOzuZLv1bqV6eoqhQNZINimPJ0tldhEpNliolPdHK5ebJVeUAe83d
	 DLK+b/0YEeoUDYRJS7pjduQyMrDwpIwwpbWuFoV7krUGDDCFqtLoT/1/PaitBQoiep
	 8q9pNfSyTLnH9WB9/JhcOkRoFqffFvemJMRj1LEo=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 408IX4x3022162
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jan 2024 12:33:04 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 Jan 2024 12:33:04 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 Jan 2024 12:33:04 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.40.136])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 408IX3h9051691;
	Mon, 8 Jan 2024 12:33:03 -0600
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
Subject: [PATCH RFC v2 00/11] Device tree support for Imagination Series5 GPU
Date: Mon, 8 Jan 2024 12:32:51 -0600
Message-ID: <20240108183302.255055-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hello all,

I know this has been tried before[0], but given the recent upstreaming of
the Series6+ GPU bindings I figured it might be time to give the Series5
bindings another try.

While there is currently no mainline driver for these binding, there is an
open source out-of-tree kernel-side driver available[1]. Having a stable
and upstream binding for these devices allows us to describe this hardware
in device tree.

This is my vision for how these bindings should look, along with some
example uses in several SoC DT files. The compatible names have been
updated to match what was decided on for Series6+, but otherwise most
is the same as we have been using in our vendor tree for many years.

Thanks,
Andrew

Based on next-20240108.

[0]: https://lkml.org/lkml/2020/4/24/1222
[1]: https://github.com/openpvrsgx-devgroup

Changes for RFC v2:
 - Added patch to rename Rogue+ binding to img,powervr-rogue.yaml
 - Locked all property item counts
 - Removed nodename pattern check

Andrew Davis (11):
  dt-bindings: gpu: Rename img,powervr to img,powervr-rogue
  dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
  ARM: dts: omap3: Add device tree entry for SGX GPU
  ARM: dts: omap4: Add device tree entry for SGX GPU
  ARM: dts: omap5: Add device tree entry for SGX GPU
  ARM: dts: AM33xx: Add device tree entry for SGX GPU
  ARM: dts: AM437x: Add device tree entry for SGX GPU
  ARM: dts: DRA7xx: Add device tree entry for SGX GPU
  arm64: dts: ti: k3-am654-main: Add device tree entry for SGX GPU
  ARM: dts: sun6i: Add device tree entry for SGX GPU
  MIPS: DTS: jz4780: Add device tree entry for SGX GPU

 ...mg,powervr.yaml => img,powervr-rogue.yaml} |   4 +-
 .../bindings/gpu/img,powervr-sgx.yaml         | 124 ++++++++++++++++++
 MAINTAINERS                                   |   3 +-
 arch/arm/boot/dts/allwinner/sun6i-a31.dtsi    |   9 ++
 arch/arm/boot/dts/ti/omap/am33xx.dtsi         |   9 +-
 arch/arm/boot/dts/ti/omap/am3517.dtsi         |  11 +-
 arch/arm/boot/dts/ti/omap/am4372.dtsi         |   6 +
 arch/arm/boot/dts/ti/omap/dra7.dtsi           |   9 +-
 arch/arm/boot/dts/ti/omap/omap34xx.dtsi       |  11 +-
 arch/arm/boot/dts/ti/omap/omap36xx.dtsi       |   9 +-
 arch/arm/boot/dts/ti/omap/omap4.dtsi          |   9 +-
 arch/arm/boot/dts/ti/omap/omap5.dtsi          |   9 +-
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi      |   7 +
 arch/mips/boot/dts/ingenic/jz4780.dtsi        |  11 ++
 14 files changed, 201 insertions(+), 30 deletions(-)
 rename Documentation/devicetree/bindings/gpu/{img,powervr.yaml => img,powervr-rogue.yaml} (91%)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,powervr-sgx.yaml

-- 
2.39.2


