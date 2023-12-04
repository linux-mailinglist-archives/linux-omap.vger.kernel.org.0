Return-Path: <linux-omap+bounces-114-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1904803CE5
	for <lists+linux-omap@lfdr.de>; Mon,  4 Dec 2023 19:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C46D2810CF
	for <lists+linux-omap@lfdr.de>; Mon,  4 Dec 2023 18:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E532F86A;
	Mon,  4 Dec 2023 18:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="syULo6DI"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9A1C188;
	Mon,  4 Dec 2023 10:23:47 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3B4IMmEF056511;
	Mon, 4 Dec 2023 12:22:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1701714168;
	bh=+UzfahhmDwBPCn7TWWajz5gUYl9JjiSSOpzMGjXxwzA=;
	h=From:To:CC:Subject:Date;
	b=syULo6DI3uaKA7PmxusECJJaNHtLh0LWj7cBqvHZLyr5oA7ej6Zi1pfTkGRZREXir
	 IvUunMquSdI56ECGXuVQVIVV9tNQ1GkzrN5m96ZM8oLXKlHa52FXcnOqEYS6uTuaMN
	 yAy7NX5FY23zAUFvLf0eft+Cp+cZ0QOJZhp+bnh0=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3B4IMmjx013404
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 4 Dec 2023 12:22:48 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 4
 Dec 2023 12:22:48 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 4 Dec 2023 12:22:48 -0600
Received: from fllv0039.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3B4IMkx3042313;
	Mon, 4 Dec 2023 12:22:46 -0600
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
Subject: [PATCH RFC 00/10] Device tree support for Imagination Series5 GPU
Date: Mon, 4 Dec 2023 12:22:35 -0600
Message-ID: <20231204182245.33683-1-afd@ti.com>
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

Based on next-20231204.

[0]: https://lkml.org/lkml/2020/4/24/1222
[1]: https://github.com/openpvrsgx-devgroup

Andrew Davis (10):
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

 .../devicetree/bindings/gpu/img,powervr.yaml  | 69 +++++++++++++++++--
 arch/arm/boot/dts/allwinner/sun6i-a31.dtsi    |  9 +++
 arch/arm/boot/dts/ti/omap/am33xx.dtsi         |  9 +--
 arch/arm/boot/dts/ti/omap/am3517.dtsi         | 11 +--
 arch/arm/boot/dts/ti/omap/am4372.dtsi         |  6 ++
 arch/arm/boot/dts/ti/omap/dra7.dtsi           |  9 ++-
 arch/arm/boot/dts/ti/omap/omap34xx.dtsi       | 11 +--
 arch/arm/boot/dts/ti/omap/omap36xx.dtsi       |  9 +--
 arch/arm/boot/dts/ti/omap/omap4.dtsi          |  9 +--
 arch/arm/boot/dts/ti/omap/omap5.dtsi          |  9 +--
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi      |  7 ++
 arch/mips/boot/dts/ingenic/jz4780.dtsi        | 11 +++
 12 files changed, 136 insertions(+), 33 deletions(-)

-- 
2.39.2


