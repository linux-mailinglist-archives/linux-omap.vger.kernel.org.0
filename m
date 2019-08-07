Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 495CF84A1E
	for <lists+linux-omap@lfdr.de>; Wed,  7 Aug 2019 12:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727637AbfHGKwi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Aug 2019 06:52:38 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:52032 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727185AbfHGKwh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Aug 2019 06:52:37 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x77AqSth072276;
        Wed, 7 Aug 2019 05:52:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565175148;
        bh=qGpYq60jQ2NH9fBRpbUSq/G1IypjQ7Iiz5/2WFr7+kc=;
        h=From:To:CC:Subject:Date;
        b=oInXtVfQqbXi76bY0xZ89lfpnztbY+y4mxuP2HsSugtTqATcWnrsS2vGDITWGh806
         TglItvv2reZ0lfkRuNJQ/s8jY/ThRZx9PzBxkX+VwTTzEaeiXFSbwOImhoZxCFiS0S
         ZA3VC6QKp2C9MQe+Hb725H+MbOhxp8ZZxhgzOMSg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x77AqSd2014341
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Aug 2019 05:52:28 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 05:52:28 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 7 Aug 2019 05:52:28 -0500
Received: from a0230074-OptiPlex-7010.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x77AqPid031639;
        Wed, 7 Aug 2019 05:52:26 -0500
From:   Faiz Abbas <faiz_abbas@ti.com>
To:     <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>
CC:     <mark.rutland@arm.com>, <robh+dt@kernel.org>, <tony@atomide.com>,
        <bcousson@baylibre.com>, <kishon@ti.com>, <faiz_abbas@ti.com>
Subject: [PATCH] ARM: dts: dra74x: Fix iodelay configuration for mmc3
Date:   Wed, 7 Aug 2019 16:22:38 +0530
Message-ID: <20190807105238.21131-1-faiz_abbas@ti.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

According to the latest am572x[1] and dra74x[2] data manuals, mmc3
default, hs, sdr12 and sdr25 modes use iodelay values given in
MMC3_MANUAL1. Set the MODE_SELECT bit for these so that manual mode is
selected and correct iodelay values can be configured.

[1] http://www.ti.com/lit/ds/symlink/am5728.pdf
[2] http://www.ti.com/lit/ds/symlink/dra746.pdf

Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
---
 arch/arm/boot/dts/dra74x-mmc-iodelay.dtsi | 50 +++++++++++------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/dra74x-mmc-iodelay.dtsi b/arch/arm/boot/dts/dra74x-mmc-iodelay.dtsi
index 28ebb4eb884a..214b9e6de2c3 100644
--- a/arch/arm/boot/dts/dra74x-mmc-iodelay.dtsi
+++ b/arch/arm/boot/dts/dra74x-mmc-iodelay.dtsi
@@ -32,7 +32,7 @@
  *
  * Datamanual Revisions:
  *
- * AM572x Silicon Revision 2.0: SPRS953B, Revised November 2016
+ * AM572x Silicon Revision 2.0: SPRS953F, Revised May 2019
  * AM572x Silicon Revision 1.1: SPRS915R, Revised November 2016
  *
  */
@@ -229,45 +229,45 @@
 
 	mmc3_pins_default: mmc3_pins_default {
 		pinctrl-single,pins = <
-			DRA7XX_CORE_IOPAD(0x377c, (PIN_INPUT_PULLUP | MUX_MODE0)) /* mmc3_clk.mmc3_clk */
-			DRA7XX_CORE_IOPAD(0x3780, (PIN_INPUT_PULLUP | MUX_MODE0)) /* mmc3_cmd.mmc3_cmd */
-			DRA7XX_CORE_IOPAD(0x3784, (PIN_INPUT_PULLUP | MUX_MODE0)) /* mmc3_dat0.mmc3_dat0 */
-			DRA7XX_CORE_IOPAD(0x3788, (PIN_INPUT_PULLUP | MUX_MODE0)) /* mmc3_dat1.mmc3_dat1 */
-			DRA7XX_CORE_IOPAD(0x378c, (PIN_INPUT_PULLUP | MUX_MODE0)) /* mmc3_dat2.mmc3_dat2 */
-			DRA7XX_CORE_IOPAD(0x3790, (PIN_INPUT_PULLUP | MUX_MODE0)) /* mmc3_dat3.mmc3_dat3 */
+			DRA7XX_CORE_IOPAD(0x377c, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_clk.mmc3_clk */
+			DRA7XX_CORE_IOPAD(0x3780, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_cmd.mmc3_cmd */
+			DRA7XX_CORE_IOPAD(0x3784, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_dat0.mmc3_dat0 */
+			DRA7XX_CORE_IOPAD(0x3788, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_dat1.mmc3_dat1 */
+			DRA7XX_CORE_IOPAD(0x378c, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_dat2.mmc3_dat2 */
+			DRA7XX_CORE_IOPAD(0x3790, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_dat3.mmc3_dat3 */
 		>;
 	};
 
 	mmc3_pins_hs: mmc3_pins_hs {
 		pinctrl-single,pins = <
-			DRA7XX_CORE_IOPAD(0x377c, (PIN_INPUT_PULLUP | MUX_MODE0)) /* mmc3_clk.mmc3_clk */
-			DRA7XX_CORE_IOPAD(0x3780, (PIN_INPUT_PULLUP | MUX_MODE0)) /* mmc3_cmd.mmc3_cmd */
-			DRA7XX_CORE_IOPAD(0x3784, (PIN_INPUT_PULLUP | MUX_MODE0)) /* mmc3_dat0.mmc3_dat0 */
-			DRA7XX_CORE_IOPAD(0x3788, (PIN_INPUT_PULLUP | MUX_MODE0)) /* mmc3_dat1.mmc3_dat1 */
-			DRA7XX_CORE_IOPAD(0x378c, (PIN_INPUT_PULLUP | MUX_MODE0)) /* mmc3_dat2.mmc3_dat2 */
-			DRA7XX_CORE_IOPAD(0x3790, (PIN_INPUT_PULLUP | MUX_MODE0)) /* mmc3_dat3.mmc3_dat3 */
+			DRA7XX_CORE_IOPAD(0x377c, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_clk.mmc3_clk */
+			DRA7XX_CORE_IOPAD(0x3780, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_cmd.mmc3_cmd */
+			DRA7XX_CORE_IOPAD(0x3784, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_dat0.mmc3_dat0 */
+			DRA7XX_CORE_IOPAD(0x3788, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_dat1.mmc3_dat1 */
+			DRA7XX_CORE_IOPAD(0x378c, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_dat2.mmc3_dat2 */
+			DRA7XX_CORE_IOPAD(0x3790, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_dat3.mmc3_dat3 */
 		>;
 	};
 
 	mmc3_pins_sdr12: mmc3_pins_sdr12 {
 		pinctrl-single,pins = <
-			DRA7XX_CORE_IOPAD(0x377c, (PIN_INPUT_PULLUP | MUX_MODE0)) /* mmc3_clk.mmc3_clk */
-			DRA7XX_CORE_IOPAD(0x3780, (PIN_INPUT_PULLUP | MUX_MODE0)) /* mmc3_cmd.mmc3_cmd */
-			DRA7XX_CORE_IOPAD(0x3784, (PIN_INPUT_PULLUP | MUX_MODE0)) /* mmc3_dat0.mmc3_dat0 */
-			DRA7XX_CORE_IOPAD(0x3788, (PIN_INPUT_PULLUP | MUX_MODE0)) /* mmc3_dat1.mmc3_dat1 */
-			DRA7XX_CORE_IOPAD(0x378c, (PIN_INPUT_PULLUP | MUX_MODE0)) /* mmc3_dat2.mmc3_dat2 */
-			DRA7XX_CORE_IOPAD(0x3790, (PIN_INPUT_PULLUP | MUX_MODE0)) /* mmc3_dat3.mmc3_dat3 */
+			DRA7XX_CORE_IOPAD(0x377c, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_clk.mmc3_clk */
+			DRA7XX_CORE_IOPAD(0x3780, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_cmd.mmc3_cmd */
+			DRA7XX_CORE_IOPAD(0x3784, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_dat0.mmc3_dat0 */
+			DRA7XX_CORE_IOPAD(0x3788, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_dat1.mmc3_dat1 */
+			DRA7XX_CORE_IOPAD(0x378c, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_dat2.mmc3_dat2 */
+			DRA7XX_CORE_IOPAD(0x3790, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_dat3.mmc3_dat3 */
 		>;
 	};
 
 	mmc3_pins_sdr25: mmc3_pins_sdr25 {
 		pinctrl-single,pins = <
-			DRA7XX_CORE_IOPAD(0x377c, (PIN_INPUT_PULLUP | MUX_MODE0)) /* mmc3_clk.mmc3_clk */
-			DRA7XX_CORE_IOPAD(0x3780, (PIN_INPUT_PULLUP | MUX_MODE0)) /* mmc3_cmd.mmc3_cmd */
-			DRA7XX_CORE_IOPAD(0x3784, (PIN_INPUT_PULLUP | MUX_MODE0)) /* mmc3_dat0.mmc3_dat0 */
-			DRA7XX_CORE_IOPAD(0x3788, (PIN_INPUT_PULLUP | MUX_MODE0)) /* mmc3_dat1.mmc3_dat1 */
-			DRA7XX_CORE_IOPAD(0x378c, (PIN_INPUT_PULLUP | MUX_MODE0)) /* mmc3_dat2.mmc3_dat2 */
-			DRA7XX_CORE_IOPAD(0x3790, (PIN_INPUT_PULLUP | MUX_MODE0)) /* mmc3_dat3.mmc3_dat3 */
+			DRA7XX_CORE_IOPAD(0x377c, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_clk.mmc3_clk */
+			DRA7XX_CORE_IOPAD(0x3780, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_cmd.mmc3_cmd */
+			DRA7XX_CORE_IOPAD(0x3784, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_dat0.mmc3_dat0 */
+			DRA7XX_CORE_IOPAD(0x3788, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_dat1.mmc3_dat1 */
+			DRA7XX_CORE_IOPAD(0x378c, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_dat2.mmc3_dat2 */
+			DRA7XX_CORE_IOPAD(0x3790, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_dat3.mmc3_dat3 */
 		>;
 	};
 
-- 
2.19.2

