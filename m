Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1189B21AB68
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jul 2020 01:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbgGIXUN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 9 Jul 2020 19:20:13 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:49288 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbgGIXUM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 9 Jul 2020 19:20:12 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 069NK4IW122916;
        Thu, 9 Jul 2020 18:20:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594336804;
        bh=zGwp7kf/6vGSBcqJKvT87gomlb9Jc7VbFtUnbKFhyuI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=vB6whN1ey/S1kK6AsIww0TVF5zNxwP6LkFTG3Xsk/+LV1nITqJUR7PIA7rDuBYwal
         9+sJifSyUjgR021HRdKFMKoV1n3y0NHI6Mm5/Byhzo6l/tYalGv7oh6JlW6GXj4czh
         UvuX0PoLTiLK+e/hFrckAt5/O9qZ03ezPFgY4UAQ=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 069NK4go023734
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 9 Jul 2020 18:20:04 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 9 Jul
 2020 18:20:04 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 9 Jul 2020 18:20:04 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 069NK3oX118932;
        Thu, 9 Jul 2020 18:20:04 -0500
Received: from localhost ([10.250.34.57])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 069NK3wx124406;
        Thu, 9 Jul 2020 18:20:03 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <t-kristo@ti.com>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 03/13] ARM: dts: omap4: Update the DSP node
Date:   Thu, 9 Jul 2020 18:19:44 -0500
Message-ID: <20200709231954.1973-4-s-anna@ti.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200709231954.1973-1-s-anna@ti.com>
References: <20200709231954.1973-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The compatible property for the DSP node is updated to match
the OMAP remoteproc bindings. The node is moved from the soc
node to the ocp node to better reflect the connectivity from
MPU side.

The node is updated with the 'ti,bootreg', 'clocks', 'resets',
'iommus', 'mboxes' and 'firmware' properties. Note that the
node does not have any 'reg' or 'reg-names' properties since
it doesn't have any L2 RAM memory, but only Unicaches.

The node is disabled for now, and should be enabled as per
the individual product configuration in the corresponding
board dts files.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/omap4.dtsi | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
index 4400f5f8e099..8f6b38bb5753 100644
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -106,10 +106,6 @@ mpu {
 			sram = <&ocmcram>;
 		};
 
-		dsp {
-			compatible = "ti,omap3-c64";
-		};
-
 		iva {
 			compatible = "ti,ivahd";
 			ti,hwmods = "iva";
@@ -277,6 +273,17 @@ emif2: emif@4d000000 {
 			hw-caps-temp-alert;
 		};
 
+		dsp: dsp {
+			compatible = "ti,omap4-dsp";
+			ti,bootreg = <&scm_conf 0x304 0>;
+			iommus = <&mmu_dsp>;
+			resets = <&prm_tesla 0>;
+			clocks = <&tesla_clkctrl OMAP4_DSP_CLKCTRL 0>;
+			firmware-name = "omap4-dsp-fw.xe64T";
+			mboxes = <&mailbox &mbox_dsp>;
+			status = "disabled";
+		};
+
 		aes1_target: target-module@4b501000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
 			reg = <0x4b501080 0x4>,
-- 
2.26.0

