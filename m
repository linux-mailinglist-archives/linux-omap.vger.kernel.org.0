Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23D9D27B85B
	for <lists+linux-omap@lfdr.de>; Tue, 29 Sep 2020 01:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbgI1Xka (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 28 Sep 2020 19:40:30 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:51802 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgI1Xka (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 28 Sep 2020 19:40:30 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08SMq3wW045646;
        Mon, 28 Sep 2020 17:52:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1601333524;
        bh=STg7IE+M7kXiOpxK1ULOrYJlIQH7zPjcF0BxRsCPWr0=;
        h=From:To:CC:Subject:Date;
        b=tg8gm6hKD5/tvv1x66Z/DnjuTx2lnEu4Mh80ahWjGGurStw53w4qu+fLB/ehv5rZ1
         v7D/auwnrr8kUNESPfhpn2nbrC7d7vJbNCsr1qsvIRglbCxihUFRC+a8+fgXrxZ264
         JMgqHZKbzCsRpANplpyHAQi9MXyskjbv2WKABJI4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08SMq3rO110391
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 28 Sep 2020 17:52:03 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 28
 Sep 2020 17:52:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 28 Sep 2020 17:52:03 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08SMq2kK044416;
        Mon, 28 Sep 2020 17:52:03 -0500
Received: from localhost ([10.250.35.102])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 08SMq2PK026630;
        Mon, 28 Sep 2020 17:52:02 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Rob Herring <robh+dt@kernel.org>
CC:     Nishanth Menon <nm@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH -next] dt-bindings: hwlock: omap: Fix warnings with k3.yaml
Date:   Mon, 28 Sep 2020 17:51:55 -0500
Message-ID: <20200928225155.12432-1-s-anna@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Update the AM65x HwSpinlock example to fix couple of warnings
that started showing up after the conversion of K3 bindings to
YAML format in commit 66e06509aa37 ("dt-bindings: arm: ti:
Convert K3 board/soc bindings to DT schema").

 compatible: ['ti,am654'] is not valid under any of the given schemas (Possible causes of the failure):
 compatible: ['ti,am654'] is too short
 compatible:0: 'ti,am654' is not one of ['ti,am654-evm']

Also, fix one of the node names while at this.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 .../devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
index 2765758d95e1..ac35491a6f65 100644
--- a/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
+++ b/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
@@ -49,7 +49,7 @@ examples:
     / {
         /* K3 AM65x SoCs */
         model = "Texas Instruments K3 AM654 SoC";
-        compatible = "ti,am654";
+        compatible = "ti,am654-evm", "ti,am654";
         #address-cells = <2>;
         #size-cells = <2>;
 
@@ -60,7 +60,7 @@ examples:
             ranges = <0x00 0x00100000 0x00 0x00100000 0x00 0x00020000>, /* ctrl mmr */
                      <0x00 0x30800000 0x00 0x30800000 0x00 0x0bc00000>; /* Main NavSS */
 
-            main_navss@30800000 {
+            bus@30800000 {
                 compatible = "simple-mfd";
                 #address-cells = <2>;
                 #size-cells = <2>;
-- 
2.28.0

