Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 532AB38D168
	for <lists+linux-omap@lfdr.de>; Sat, 22 May 2021 00:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbhEUWZl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 May 2021 18:25:41 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46668 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbhEUWZk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 21 May 2021 18:25:40 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14LMOFw1051431;
        Fri, 21 May 2021 17:24:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621635855;
        bh=dRamGBGs+j0egVNPSNncNwb+3fD/5wC2tsZZYFFhX0E=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Y8SHfF58B8sxv0BXaBOlEOrR0AGmQePHZcnJmVRqmVi8195A9puo9i9sZUmjd4+Lp
         XugwH/5Bbu6MH8EjsVG/KDlDiqzllPKg3gXxEgeSZWEgNCErWuftBsy0F+BuTnSr6u
         OfjCY657H1UzXgl3p6zcply6KFnL3Zve/UqB0n3g=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14LMOEGq051679
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 21 May 2021 17:24:14 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 21
 May 2021 17:24:14 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 21 May 2021 17:24:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14LMODLv097432;
        Fri, 21 May 2021 17:24:13 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH 1/3] ARM: dts: am57xx-cl-som-am57x: fix ti,no-reset-on-init flag for gpios
Date:   Sat, 22 May 2021 01:24:09 +0300
Message-ID: <20210521222411.17547-2-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210521222411.17547-1-grygorii.strashko@ti.com>
References: <20210521222411.17547-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The ti,no-reset-on-init flag need to be at the interconnect target module
level for the modules that have it defined.
The ti-sysc driver handles this case, but produces warning, not a critical
issue.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/am57xx-cl-som-am57x.dts | 5 ++---
 arch/arm/boot/dts/dra7-l4.dtsi            | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/am57xx-cl-som-am57x.dts b/arch/arm/boot/dts/am57xx-cl-som-am57x.dts
index 0d5fe2bfb683..39eba2bc36dd 100644
--- a/arch/arm/boot/dts/am57xx-cl-som-am57x.dts
+++ b/arch/arm/boot/dts/am57xx-cl-som-am57x.dts
@@ -610,12 +610,11 @@
 	>;
 };
 
-&gpio3 {
-	status = "okay";
+&gpio3_target {
 	ti,no-reset-on-init;
 };
 
-&gpio2 {
+&gpio2_target {
 	status = "okay";
 	ti,no-reset-on-init;
 };
diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
index 149144cdff35..6e33c0bf32a9 100644
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -1343,7 +1343,7 @@
 			};
 		};
 
-		target-module@55000 {			/* 0x48055000, ap 13 0e.0 */
+		gpio2_target: target-module@55000 {		/* 0x48055000, ap 13 0e.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
 			reg = <0x55000 0x4>,
 			      <0x55010 0x4>,
@@ -1376,7 +1376,7 @@
 			};
 		};
 
-		target-module@57000 {			/* 0x48057000, ap 15 06.0 */
+		gpio3_target: target-module@57000 {		/* 0x48057000, ap 15 06.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
 			reg = <0x57000 0x4>,
 			      <0x57010 0x4>,
-- 
2.17.1

