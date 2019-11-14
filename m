Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE8FFC3D1
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2019 11:17:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbfKNKRJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 Nov 2019 05:17:09 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:49850 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbfKNKRI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 14 Nov 2019 05:17:08 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAEAH53q072937;
        Thu, 14 Nov 2019 04:17:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573726625;
        bh=HedHmovqwkx7XL1pCgXazCvoJ3PZTV/ZjyzHwJfLFFs=;
        h=From:To:CC:Subject:Date;
        b=C0IQY/oEy9eiBRhmiuLe6N3WW5FGNfxSPSk/X+bqzZ3StAjIzgGiOu3ImDn/326hh
         FAHhIo0w+jHOPPL8tSHCco047Cd3+1s5t0n+XjSv7aom2CRmyLmkPAdIOPM+659obs
         eDps0ZgLAywVgRAohSiFfPqA3M9EZEQQOfNgmano=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAEAH4Nd053996;
        Thu, 14 Nov 2019 04:17:04 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 14
 Nov 2019 04:17:04 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 14 Nov 2019 04:17:04 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAEAH195020127;
        Thu, 14 Nov 2019 04:17:01 -0600
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <t-kristo@ti.com>, <mturquette@baylibre.com>, <robh+dt@kernel.org>
CC:     <sboyd@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <tony@atomide.com>, <devicetree@vger.kernel.org>
Subject: [PATCH] dt-bindings: clock: Move ti-dra7-atl.h to dt-bindigs/clock
Date:   Thu, 14 Nov 2019 12:18:17 +0200
Message-ID: <20191114101817.20831-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Most of the clock related dt-binding header files are located in
dt-bindings/clock folder. It would be good to keep all the similar
header files at a single location.

Suggested-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 Documentation/devicetree/bindings/clock/ti/dra7-atl.txt | 4 ++--
 arch/arm/boot/dts/dra7-evm-common.dtsi                  | 2 +-
 arch/arm/boot/dts/dra72-evm-common.dtsi                 | 2 +-
 include/dt-bindings/{clk => clock}/ti-dra7-atl.h        | 0
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename include/dt-bindings/{clk => clock}/ti-dra7-atl.h (100%)

diff --git a/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt b/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt
index 10f7047755f3..21c002d28b9b 100644
--- a/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt
+++ b/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt
@@ -43,7 +43,7 @@ Configuration of ATL instances:
 	- aws : Audio word select signal selection
 };
 
-For valid word select signals, see the dt-bindings/clk/ti-dra7-atl.h include
+For valid word select signals, see the dt-bindings/clock/ti-dra7-atl.h include
 file.
 
 Examples:
@@ -83,7 +83,7 @@ atl: atl@4843c000 {
 	clock-names = "fck";
 };
 
-#include <dt-bindings/clk/ti-dra7-atl.h>
+#include <dt-bindings/clock/ti-dra7-atl.h>
 
 &atl {
 
diff --git a/arch/arm/boot/dts/dra7-evm-common.dtsi b/arch/arm/boot/dts/dra7-evm-common.dtsi
index 82eeba8faef1..23244b5a9942 100644
--- a/arch/arm/boot/dts/dra7-evm-common.dtsi
+++ b/arch/arm/boot/dts/dra7-evm-common.dtsi
@@ -4,7 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/clk/ti-dra7-atl.h>
+#include <dt-bindings/clock/ti-dra7-atl.h>
 #include <dt-bindings/input/input.h>
 
 / {
diff --git a/arch/arm/boot/dts/dra72-evm-common.dtsi b/arch/arm/boot/dts/dra72-evm-common.dtsi
index 8641a3d7d8ad..9eabfd1502da 100644
--- a/arch/arm/boot/dts/dra72-evm-common.dtsi
+++ b/arch/arm/boot/dts/dra72-evm-common.dtsi
@@ -6,7 +6,7 @@
 
 #include "dra72x.dtsi"
 #include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/clk/ti-dra7-atl.h>
+#include <dt-bindings/clock/ti-dra7-atl.h>
 
 / {
 	compatible = "ti,dra72-evm", "ti,dra722", "ti,dra72", "ti,dra7";
diff --git a/include/dt-bindings/clk/ti-dra7-atl.h b/include/dt-bindings/clock/ti-dra7-atl.h
similarity index 100%
rename from include/dt-bindings/clk/ti-dra7-atl.h
rename to include/dt-bindings/clock/ti-dra7-atl.h
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

