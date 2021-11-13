Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF7C44F133
	for <lists+linux-omap@lfdr.de>; Sat, 13 Nov 2021 05:26:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235676AbhKME3l (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 12 Nov 2021 23:29:41 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:40664 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235653AbhKME3l (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 12 Nov 2021 23:29:41 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AD4QgNZ005480;
        Fri, 12 Nov 2021 22:26:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1636777602;
        bh=AzxwH1X9ows2Erct7pYAUSmPXFfFQD/w7RCW6wE/p34=;
        h=From:To:CC:Subject:Date;
        b=Lh1WQRdW6m2geHcICcadRnf2oFNdjUIDwVREtyz3nFJbw0QTNy38RzO0sE8YmHBlR
         ikPg5PxuNjrr8q0AJlw2yT0njjsRIfTMkLGrQDPJbzdI+yFDzITRuA6FE0E8razN8/
         +BOLrRJCjTfgZzudsIYHQ2Lvask/QDRFMYdkm8eA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AD4QgG0061509
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 12 Nov 2021 22:26:42 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 12
 Nov 2021 22:26:42 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 12 Nov 2021 22:26:42 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AD4QgFL034758;
        Fri, 12 Nov 2021 22:26:42 -0600
From:   Nishanth Menon <nm@ti.com>
To:     Rob Herring <robh+dt@kernel.org>, Tero Kristo <kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
CC:     <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Nishanth Menon <nm@ti.com>,
        <linux-omap@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2] arm64: dts: ti: k3-j7200: Correct the d-cache-sets info
Date:   Fri, 12 Nov 2021 22:26:40 -0600
Message-ID: <20211113042640.30955-1-nm@ti.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

A72 Cluster (chapter 1.3.1 [1]) has 48KB Icache, 32KB Dcache and 1MB L2 Cache
 - ICache is 3-way set-associative
 - Dcache is 2-way set-associative
 - Line size are 64bytes

32KB (Dcache)/64 (fixed line length of 64 bytes) = 512 ways
512 ways / 2 (Dcache is 2-way per set) = 256 sets.

So, correct the d-cache-sets info.

[1] https://www.ti.com/lit/pdf/spruiu1

Fixes: d361ed88455f ("arm64: dts: ti: Add support for J7200 SoC")
Reported-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
---

Changes since V1:
* subject line fixup to stay in sync with other patches
* type in chapter (',' replaced with '.')

V1: https://lore.kernel.org/linux-arm-kernel/20211113024348.29257-1-nm@ti.com/T/#u

 arch/arm64/boot/dts/ti/k3-j7200.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j7200.dtsi b/arch/arm64/boot/dts/ti/k3-j7200.dtsi
index 47567cb260c2..958587d3a33d 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200.dtsi
@@ -62,7 +62,7 @@ cpu0: cpu@0 {
 			i-cache-sets = <256>;
 			d-cache-size = <0x8000>;
 			d-cache-line-size = <64>;
-			d-cache-sets = <128>;
+			d-cache-sets = <256>;
 			next-level-cache = <&L2_0>;
 		};
 
@@ -76,7 +76,7 @@ cpu1: cpu@1 {
 			i-cache-sets = <256>;
 			d-cache-size = <0x8000>;
 			d-cache-line-size = <64>;
-			d-cache-sets = <128>;
+			d-cache-sets = <256>;
 			next-level-cache = <&L2_0>;
 		};
 	};
-- 
2.32.0

