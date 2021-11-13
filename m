Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8796744F139
	for <lists+linux-omap@lfdr.de>; Sat, 13 Nov 2021 05:36:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231254AbhKMEjg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 12 Nov 2021 23:39:36 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42078 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbhKMEjf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 12 Nov 2021 23:39:35 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AD4aclm008317;
        Fri, 12 Nov 2021 22:36:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1636778198;
        bh=f8LgJZNnJCqu2PSnY9a5BSValDnYokfnws05hp1+1AY=;
        h=From:To:CC:Subject:Date;
        b=ZvkPdtjYzbGwzGyrL1FcE9KXymkCNcA0GR4s47Yp+Hv124/rxTAPqQCqwFotbZ+Je
         Ys04A6FD7cyYx5DB9vxbO8UWq1kbFU1Mi9tIqcZ2at9vQPrLGYqNSv2+pIjsyszWQ9
         TZBcFJbUJZXDs7p0E/2CXnsfudYbnmtxo++n+rTI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AD4acbg088877
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 12 Nov 2021 22:36:38 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 12
 Nov 2021 22:36:38 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 12 Nov 2021 22:36:37 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AD4abM7045449;
        Fri, 12 Nov 2021 22:36:37 -0600
From:   Nishanth Menon <nm@ti.com>
To:     Rob Herring <robh+dt@kernel.org>, Tero Kristo <kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
CC:     <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Nishanth Menon <nm@ti.com>,
        <linux-omap@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH] arm64: dts: ti: k3-am642: Fix the L2 cache sets
Date:   Fri, 12 Nov 2021 22:36:35 -0600
Message-ID: <20211113043635.4296-1-nm@ti.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

A53's L2 cache[1] on AM642[2] is 256KB. A53's L2 is fixed line length
of 64 bytes and 16-way set-associative cache structure.

256KB of L2 / 64 (line length) = 4096 ways
4096 ways / 16 = 256 sets

Fix the l2 cache-sets.

[1] https://developer.arm.com/documentation/ddi0500/j/Level-2-Memory-System/About-the-L2-memory-system?lang=en
[2] https://www.ti.com/lit/pdf/spruim2

Fixes: 8abae9389bdb ("arm64: dts: ti: Add support for AM642 SoC")
Reported-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am642.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am642.dtsi b/arch/arm64/boot/dts/ti/k3-am642.dtsi
index e2b397c88401..8a76f4821b11 100644
--- a/arch/arm64/boot/dts/ti/k3-am642.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am642.dtsi
@@ -60,6 +60,6 @@ L2_0: l2-cache0 {
 		cache-level = <2>;
 		cache-size = <0x40000>;
 		cache-line-size = <64>;
-		cache-sets = <512>;
+		cache-sets = <256>;
 	};
 };
-- 
2.32.0

