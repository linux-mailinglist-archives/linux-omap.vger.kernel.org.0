Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABEC23030B0
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jan 2021 00:59:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732598AbhAYX6Z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 25 Jan 2021 18:58:25 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:57924 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732463AbhAYX6I (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 25 Jan 2021 18:58:08 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10PNvAPj122248;
        Mon, 25 Jan 2021 17:57:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1611619030;
        bh=W3mA6Gr5VSniesCxAOF0B2n9RNZ/SuE/+94mPRQluPI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=iffWKY5NUrEgU3wM9905b4E16ObCP55qW8eZ/EHV+2EvCsp1rocAFtcmI+7JEreUt
         TrHGnEmTqYsuK6JxeGEL4XzUZy+/orZMn0ZFLcxKtZFreEagdDLi1Q1nzBod5Sl/4u
         n02IHObORkfZZ752jKTpf4XVaylKbet780oII3CQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10PNvAVb019507
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 25 Jan 2021 17:57:10 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 25
 Jan 2021 17:57:09 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 25 Jan 2021 17:57:09 -0600
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10PNv9tn035747;
        Mon, 25 Jan 2021 17:57:09 -0600
Received: from localhost ([10.250.35.71])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 10PNv9sZ117189;
        Mon, 25 Jan 2021 17:57:09 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 1/2] dt-bindings: hwlock: Update OMAP HwSpinlock binding for AM64x SoCs
Date:   Mon, 25 Jan 2021 17:56:52 -0600
Message-ID: <20210125235653.24385-2-s-anna@ti.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125235653.24385-1-s-anna@ti.com>
References: <20210125235653.24385-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Update the existing OMAP HwSpinlock binding to include the info for
AM64x SoCs. There are some minor IP integration differences between
the AM64x SoCs and the previous AM65x and J721E SoC families. A new
example is also added showcasing the difference in the IP's presence
on the interconnect.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 .../bindings/hwlock/ti,omap-hwspinlock.yaml   | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
index ac35491a6f65..ac146c0d628f 100644
--- a/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
+++ b/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
@@ -14,6 +14,7 @@ properties:
     enum:
       - ti,omap4-hwspinlock  # for OMAP44xx, OMAP54xx, AM33xx, AM43xx, DRA7xx SoCs
       - ti,am654-hwspinlock  # for K3 AM65x, J721E and J7200 SoCs
+      - ti,am64-hwspinlock   # for K3 AM64x SoCs
 
   reg:
     maxItems: 1
@@ -74,3 +75,28 @@ examples:
             };
         };
     };
+
+  - |
+    / {
+        /* K3 AM64x SoCs */
+        model = "Texas Instruments K3 AM642 SoC";
+        compatible = "ti,am642-evm", "ti,am642";
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        bus@f4000 {
+            compatible = "simple-bus";
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges = <0x00 0x000f4000 0x00 0x000f4000 0x00 0x000002d0>, /* PINCTRL */
+                     <0x00 0x01000000 0x00 0x01000000 0x00 0x02330400>, /* First peripheral window */
+                     <0x00 0x0f000000 0x00 0x0f000000 0x00 0x00c44200>, /* Second peripheral window */
+                     <0x00 0x20000000 0x00 0x20000000 0x00 0x0a008000>; /* Third peripheral window */
+
+            spinlock@2a000000 {
+                compatible = "ti,am64-hwspinlock";
+                reg = <0x00 0x2a000000 0x00 0x1000>;
+                #hwlock-cells = <1>;
+            };
+        };
+    };
-- 
2.29.2

