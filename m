Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0DCF77B614
	for <lists+linux-omap@lfdr.de>; Mon, 14 Aug 2023 12:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235667AbjHNKJw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Aug 2023 06:09:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235691AbjHNKJ2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 14 Aug 2023 06:09:28 -0400
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17C35D8;
        Mon, 14 Aug 2023 03:09:26 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37EA98gt079383;
        Mon, 14 Aug 2023 05:09:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1692007748;
        bh=WplKQHl5M2V7bJhan3m1wpk4fn4xUU6AG0k/G3lMEm4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=YJzzDcZ3TwIuk7pXkzDQrIwowQKMQQBD6j62EKifgpzgB8W5epKZswiKycxhC3Tli
         KDRCncRLTTeH/Zk4LqPGAexsD/CdlGeLgG2QWMqlKgIpEw7C0vDJP2vOPubbzWcUnj
         x4Xo+fjrUmurPb9/6r5y/JcD8Nb0AKTH970AyKqM=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37EA98Wq126076
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 14 Aug 2023 05:09:08 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Aug 2023 05:09:07 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 14 Aug 2023 05:09:07 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37EA97BS023712;
        Mon, 14 Aug 2023 05:09:07 -0500
Received: from localhost (uda0501179.dhcp.ti.com [172.24.227.217])
        by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 37EA97Ts020106;
        Mon, 14 Aug 2023 05:09:07 -0500
From:   MD Danish Anwar <danishanwar@ti.com>
To:     Randy Dunlap <rdunlap@infradead.org>,
        Roger Quadros <rogerq@kernel.org>,
        Simon Horman <simon.horman@corigine.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Richard Cochran <richardcochran@gmail.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        MD Danish Anwar <danishanwar@ti.com>
CC:     <nm@ti.com>, <srk@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 2/5] dt-bindings: net: Add IEP property in ICSSG DT binding
Date:   Mon, 14 Aug 2023 15:38:44 +0530
Message-ID: <20230814100847.3531480-3-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230814100847.3531480-1-danishanwar@ti.com>
References: <20230814100847.3531480-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add IEP node in ICSSG driver DT binding document.

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 Documentation/devicetree/bindings/net/ti,icssg-prueth.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ti,icssg-prueth.yaml b/Documentation/devicetree/bindings/net/ti,icssg-prueth.yaml
index 8ec30b3eb760..a736d1424ea4 100644
--- a/Documentation/devicetree/bindings/net/ti,icssg-prueth.yaml
+++ b/Documentation/devicetree/bindings/net/ti,icssg-prueth.yaml
@@ -52,6 +52,12 @@ properties:
     description:
       phandle to MII_RT module's syscon regmap
 
+  ti,iep:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 2
+    description:
+      phandle to IEP (Industrial Ethernet Peripheral) for ICSSG driver
+
   interrupts:
     maxItems: 2
     description:
@@ -155,6 +161,7 @@ examples:
                     "tx1-0", "tx1-1", "tx1-2", "tx1-3",
                     "rx0", "rx1";
         ti,mii-g-rt = <&icssg2_mii_g_rt>;
+        ti,iep = <&icssg2_iep0>, <&icssg2_iep1>;
         interrupt-parent = <&icssg2_intc>;
         interrupts = <24 0 2>, <25 1 3>;
         interrupt-names = "tx_ts0", "tx_ts1";
-- 
2.34.1

