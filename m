Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4B6144F13D
	for <lists+linux-omap@lfdr.de>; Sat, 13 Nov 2021 05:36:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235580AbhKMEji (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 12 Nov 2021 23:39:38 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42086 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232958AbhKMEjh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 12 Nov 2021 23:39:37 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AD4adeW008322;
        Fri, 12 Nov 2021 22:36:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1636778199;
        bh=j5ybofCO5YEwuhQss0z6TVfBLWH8Iof5EbnI79FNTzE=;
        h=From:To:CC:Subject:Date;
        b=niS+MQS4OO9ZdKihPATaLwPfp9+xR9+WVsIx4J2CaVEs+iigdhl04GRnaM+NNAooU
         hjzKQFvsGPO5BAREJOD3KwcMn5iGwUtxuIBrOw4xlaoFE4d+K9vpRbM0BHsiKLkQ7J
         n8YPh0y6Dxm2KMxXcrKslmXhClKwN94UhvxJTgZQ=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AD4addR088887
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 12 Nov 2021 22:36:39 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 12
 Nov 2021 22:36:39 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 12 Nov 2021 22:36:39 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AD4adjM045465;
        Fri, 12 Nov 2021 22:36:39 -0600
From:   Nishanth Menon <nm@ti.com>
To:     Rob Herring <robh+dt@kernel.org>, Tero Kristo <kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
CC:     <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Nishanth Menon <nm@ti.com>,
        <linux-omap@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH] arm64: dts: ti: k3-j7200: Fix the L2 cache sets
Date:   Fri, 12 Nov 2021 22:36:38 -0600
Message-ID: <20211113043638.4358-1-nm@ti.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

A72's L2 cache[1] on J7200[2] is 1MB. A53's L2 is fixed line length of
64 bytes and 16-way set-associative cache structure.

1MB of L2 / 64 (line length) = 16384 ways
16384 ways / 16 = 1024 sets

Fix the l2 cache-sets.

[1] https://developer.arm.com/documentation/100095/0003/Level-2-Memory-System/About-the-L2-memory-system
[2] https://www.ti.com/lit/pdf/spruiu1

Fixes: d361ed88455f ("arm64: dts: ti: Add support for J7200 SoC")
Reported-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j7200.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j7200.dtsi b/arch/arm64/boot/dts/ti/k3-j7200.dtsi
index 958587d3a33d..64fef4e67d76 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200.dtsi
@@ -86,7 +86,7 @@ L2_0: l2-cache0 {
 		cache-level = <2>;
 		cache-size = <0x100000>;
 		cache-line-size = <64>;
-		cache-sets = <2048>;
+		cache-sets = <1024>;
 		next-level-cache = <&msmc_l3>;
 	};
 
-- 
2.32.0

