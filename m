Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6766438D16D
	for <lists+linux-omap@lfdr.de>; Sat, 22 May 2021 00:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbhEUWZo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 May 2021 18:25:44 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:36984 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbhEUWZn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 21 May 2021 18:25:43 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14LMOHfS121856;
        Fri, 21 May 2021 17:24:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621635857;
        bh=NT4BVJLwt6+rL5z9zo/97lTrFfejjwhzjEemRY1V8xA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=a2mLyzLAVgOp6jgkbcky9HGIeni68GXpJFBkXfWnCPV6SM7OULy1hVuaRPRKTC0q4
         WlTh4YQaRm2AGQZ/lBMVLfwHuxxsuGoMZ5rmfznSVb9y1cKL+y35LL54rL+/Raffgy
         PvkI5A6sWfdG363EUp+JxgEIwQ9szaEKrIgpuMAg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14LMOHhs105296
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 21 May 2021 17:24:17 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 21
 May 2021 17:24:17 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 21 May 2021 17:24:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14LMOGSx097646;
        Fri, 21 May 2021 17:24:17 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH 3/3] ARM: dts: am335x: fix ti,no-reset-on-init flag for gpios
Date:   Sat, 22 May 2021 01:24:11 +0300
Message-ID: <20210521222411.17547-4-grygorii.strashko@ti.com>
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
 arch/arm/boot/dts/am335x-baltos.dtsi              | 4 ++--
 arch/arm/boot/dts/am335x-evmsk.dts                | 2 +-
 arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi | 2 +-
 arch/arm/boot/dts/am335x-moxa-uc-8100-common.dtsi | 2 +-
 arch/arm/boot/dts/am33xx-l4.dtsi                  | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-baltos.dtsi b/arch/arm/boot/dts/am335x-baltos.dtsi
index 3ea286180382..1103a2cb836f 100644
--- a/arch/arm/boot/dts/am335x-baltos.dtsi
+++ b/arch/arm/boot/dts/am335x-baltos.dtsi
@@ -393,10 +393,10 @@
 	status = "okay";
 };
 
-&gpio0 {
+&gpio0_target {
 	ti,no-reset-on-init;
 };
 
-&gpio3 {
+&gpio3_target {
 	ti,no-reset-on-init;
 };
diff --git a/arch/arm/boot/dts/am335x-evmsk.dts b/arch/arm/boot/dts/am335x-evmsk.dts
index d5f8d5e2eb5d..45bf0273ecd8 100644
--- a/arch/arm/boot/dts/am335x-evmsk.dts
+++ b/arch/arm/boot/dts/am335x-evmsk.dts
@@ -646,7 +646,7 @@
 	status = "okay";
 };
 
-&gpio0 {
+&gpio0_target {
 	ti,no-reset-on-init;
 };
 
diff --git a/arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi b/arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi
index 4e90f9c23d2e..8121a199607c 100644
--- a/arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi
+++ b/arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi
@@ -150,7 +150,7 @@
 	status = "okay";
 };
 
-&gpio0 {
+&gpio0_target {
 	ti,no-reset-on-init;
 };
 
diff --git a/arch/arm/boot/dts/am335x-moxa-uc-8100-common.dtsi b/arch/arm/boot/dts/am335x-moxa-uc-8100-common.dtsi
index 98d8ed4ad967..39e5d2ce600a 100644
--- a/arch/arm/boot/dts/am335x-moxa-uc-8100-common.dtsi
+++ b/arch/arm/boot/dts/am335x-moxa-uc-8100-common.dtsi
@@ -353,7 +353,7 @@
 	status = "okay";
 };
 
-&gpio0 {
+&gpio0_target {
 	ti,no-reset-on-init;
 };
 
diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
index 039a9ab4c7ea..dcce5e3e001e 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -1789,7 +1789,7 @@
 			};
 		};
 
-		target-module@ae000 {			/* 0x481ae000, ap 56 3a.0 */
+		gpio3_target: target-module@ae000 {		/* 0x481ae000, ap 56 3a.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
 			reg = <0xae000 0x4>,
 			      <0xae010 0x4>,
-- 
2.17.1

