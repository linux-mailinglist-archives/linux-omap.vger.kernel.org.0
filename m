Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1AA30685
	for <lists+linux-omap@lfdr.de>; Fri, 31 May 2019 04:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbfEaCNb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 May 2019 22:13:31 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:60876 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726535AbfEaCNb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 May 2019 22:13:31 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4V2DOfM098761;
        Thu, 30 May 2019 21:13:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559268804;
        bh=Oen/+xiiETjW9FwkFkd7lXZEV3DCVFsj5dxIIjqAEis=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=cCkE3gFxF8xewl2nldyei9Z3N+HqGVMJR1eaGHyGxf50P540bd6l6cG0CD1vNRuCS
         q9RZiCXXkVo6HISWdfUFvGwRE3pJk9Cozj+a+DLW6Pq/voAySv/li8CdulbrI9W8Gq
         lEEmRK5pUwiOMCQFDaPfGXj/5gWd2l2saGTngFDI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4V2DOul115235
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 30 May 2019 21:13:24 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 30
 May 2019 21:13:23 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 30 May 2019 21:13:24 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4V2DNjD029304;
        Thu, 30 May 2019 21:13:23 -0500
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id x4V2DNm18128;
        Thu, 30 May 2019 21:13:23 -0500 (CDT)
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 1/3] dt-bindings: hwlock: Update OMAP binding for TI K3 SoCs
Date:   Thu, 30 May 2019 21:13:19 -0500
Message-ID: <20190531021321.14025-2-s-anna@ti.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190531021321.14025-1-s-anna@ti.com>
References: <20190531021321.14025-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The TI K3 AM65x and J721E family of SoCs have a HwSpinlock IP that
is similar to the existing HwSpinlock IP present in OMAP architecture
based SoCs with minor differences. Update the existing OMAP HwSpinlock
binding for this IP on TI K3 AM65x and J721E SoCs. The same compatible
from AM65x SoCs is reused for J721E SoCs.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 .../bindings/hwlock/omap-hwspinlock.txt       | 25 +++++++++++++++----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwlock/omap-hwspinlock.txt b/Documentation/devicetree/bindings/hwlock/omap-hwspinlock.txt
index 2c9804f4f4ac..8d365f89694c 100644
--- a/Documentation/devicetree/bindings/hwlock/omap-hwspinlock.txt
+++ b/Documentation/devicetree/bindings/hwlock/omap-hwspinlock.txt
@@ -1,12 +1,16 @@
-OMAP4+ HwSpinlock Driver
-========================
+TI HwSpinlock for OMAP and K3 based SoCs
+=========================================
 
 Required properties:
-- compatible:		Should be "ti,omap4-hwspinlock" for
-			    OMAP44xx, OMAP54xx, AM33xx, AM43xx, DRA7xx SoCs
+- compatible:		Should be one of the following,
+			  "ti,omap4-hwspinlock" for
+				OMAP44xx, OMAP54xx, AM33xx, AM43xx, DRA7xx SoCs
+			  "ti,am654-hwspinlock" for
+				K3 AM65x and J721E SoCs
 - reg:			Contains the hwspinlock module register address space
 			(base address and length)
 - ti,hwmods:		Name of the hwmod associated with the hwspinlock device
+			(for OMAP architecture based SoCs only)
 - #hwlock-cells:	Should be 1. The OMAP hwspinlock users will use a
 			0-indexed relative hwlock number as the argument
 			specifier value for requesting a specific hwspinlock
@@ -17,10 +21,21 @@ Please look at the generic hwlock binding for usage information for consumers,
 
 Example:
 
-/* OMAP4 */
+1. OMAP4 SoCs
 hwspinlock: spinlock@4a0f6000 {
 	compatible = "ti,omap4-hwspinlock";
 	reg = <0x4a0f6000 0x1000>;
 	ti,hwmods = "spinlock";
 	#hwlock-cells = <1>;
 };
+
+2. AM65x SoCs and J721E SoCs
+&cbass_main {
+	cbass_main_navss: interconnect0 {
+		hwspinlock: spinlock@30e00000 {
+			compatible = "ti,am654-hwspinlock";
+			reg = <0x00 0x30e00000 0x00 0x1000>;
+			#hwlock-cells = <1>;
+		};
+	};
+};
-- 
2.21.0

