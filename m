Return-Path: <linux-omap+bounces-220-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF3D82779A
	for <lists+linux-omap@lfdr.de>; Mon,  8 Jan 2024 19:34:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C73AD1F23BAD
	for <lists+linux-omap@lfdr.de>; Mon,  8 Jan 2024 18:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BDDD54FA4;
	Mon,  8 Jan 2024 18:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tIC3FO5N"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C9247793;
	Mon,  8 Jan 2024 18:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 408IX5ms041769;
	Mon, 8 Jan 2024 12:33:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1704738785;
	bh=Gdhx6GMh4rVP3km5x1uoGL2Uoq7UqUUHtltyRBPwCl8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tIC3FO5NGBdpNDZlL287om+LGb2BYGIgBzpWR4Jj6OVKhN1b5dqIyLqSNRd3Asg27
	 PYv3+qbzz6maBy2EnNEuv8N8WDCe6hqy8SionOywnJa55CZ2Gmu/CwUGPkD1dzCZ/v
	 emN536JMSU2ovagvBOND/1UjP9UZWTchj78/WjV4=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 408IX5mU022175
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jan 2024 12:33:05 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 Jan 2024 12:33:05 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 Jan 2024 12:33:05 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.40.136])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 408IX3hA051691;
	Mon, 8 Jan 2024 12:33:04 -0600
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
Subject: [PATCH RFC v2 01/11] dt-bindings: gpu: Rename img,powervr to img,powervr-rogue
Date: Mon, 8 Jan 2024 12:32:52 -0600
Message-ID: <20240108183302.255055-2-afd@ti.com>
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

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../bindings/gpu/{img,powervr.yaml => img,powervr-rogue.yaml} | 4 ++--
 MAINTAINERS                                                   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename Documentation/devicetree/bindings/gpu/{img,powervr.yaml => img,powervr-rogue.yaml} (91%)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
similarity index 91%
rename from Documentation/devicetree/bindings/gpu/img,powervr.yaml
rename to Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index a13298f1a1827..03a8308b41ae7 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -2,10 +2,10 @@
 # Copyright (c) 2023 Imagination Technologies Ltd.
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/gpu/img,powervr.yaml#
+$id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Imagination Technologies PowerVR and IMG GPU
+title: Imagination Technologies PowerVR Rogue and IMG GPUs
 
 maintainers:
   - Frank Binns <frank.binns@imgtec.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index fa67e2624723f..5b205795da04e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10461,7 +10461,7 @@ M:	Donald Robson <donald.robson@imgtec.com>
 M:	Matt Coster <matt.coster@imgtec.com>
 S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-F:	Documentation/devicetree/bindings/gpu/img,powervr.yaml
+F:	Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
 F:	Documentation/gpu/imagination/
 F:	drivers/gpu/drm/imagination/
 F:	include/uapi/drm/pvr_drm.h
-- 
2.39.2


