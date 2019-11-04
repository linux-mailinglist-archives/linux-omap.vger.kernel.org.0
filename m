Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9161EEE9CD
	for <lists+linux-omap@lfdr.de>; Mon,  4 Nov 2019 21:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729596AbfKDUi7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 4 Nov 2019 15:38:59 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:50856 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729587AbfKDUi7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 4 Nov 2019 15:38:59 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA4KcsTG127085;
        Mon, 4 Nov 2019 14:38:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572899934;
        bh=Bb+RT8SQh95qU51XROkC4ETq9FqCfyxaupssY38UWcs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=v24A6NnsrV1BQJMGgKuqEeORKYUv5kEqYeTO1oggEu6e7WDWAUgqTgT7PkzWjIk/N
         0A8XiSj8GSFoy47wAurv9VeM04aLhkIaHEShsiJEkAmpBMjwF0lNFwq1kzOyUqnfe6
         e3KC/DFZmFAL6lGKna6sJkyrhdu3gnVwRezB6PAk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA4KcsrW025147
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 4 Nov 2019 14:38:54 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 4 Nov
 2019 14:38:39 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 4 Nov 2019 14:38:39 -0600
Received: from ula0869644.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4Kcl4o020670;
        Mon, 4 Nov 2019 14:38:53 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 3/5] ARM: dts: dra7: add vpe clkctrl node
Date:   Mon, 4 Nov 2019 14:38:39 -0600
Message-ID: <20191104203841.3628-4-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191104203841.3628-1-bparrot@ti.com>
References: <20191104203841.3628-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add clkctrl nodes for VPE module.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 arch/arm/boot/dts/dra7xx-clocks.dtsi | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/dra7xx-clocks.dtsi b/arch/arm/boot/dts/dra7xx-clocks.dtsi
index 93e1eb83bed9..d1c2406ec71c 100644
--- a/arch/arm/boot/dts/dra7xx-clocks.dtsi
+++ b/arch/arm/boot/dts/dra7xx-clocks.dtsi
@@ -1591,10 +1591,10 @@
 
 	rtc_cm: rtc-cm@700 {
 		compatible = "ti,omap4-cm";
-		reg = <0x700 0x100>;
+		reg = <0x700 0x60>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges = <0 0x700 0x100>;
+		ranges = <0 0x700 0x60>;
 
 		rtc_clkctrl: rtc-clkctrl@20 {
 			compatible = "ti,clkctrl";
@@ -1603,6 +1603,20 @@
 		};
 	};
 
+	vpe_cm: vpe-cm@760 {
+		compatible = "ti,omap4-cm";
+		reg = <0x760 0xc>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x760 0xc>;
+
+		vpe_clkctrl: vpe-clkctrl@0 {
+			compatible = "ti,clkctrl";
+			reg = <0x0 0xc>;
+			#clock-cells = <2>;
+		};
+	};
+
 };
 
 &cm_core {
-- 
2.17.1

