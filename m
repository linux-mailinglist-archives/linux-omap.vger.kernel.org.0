Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 887DC304656
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jan 2021 19:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730250AbhAZRYw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Jan 2021 12:24:52 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:38602 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406000AbhAZQf2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 26 Jan 2021 11:35:28 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10QGWxhX087660;
        Tue, 26 Jan 2021 10:32:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1611678779;
        bh=zT5rXzi404sanDCD+FhX1p4eVM2SYSfy/bavMPjgsZ4=;
        h=From:To:CC:Subject:Date;
        b=cNY76W8khMWDiihJY+w8MLZDKUuaH3lNcFQ2hrFVzOT3LkWgLVJVkV29RAv+hniF2
         zGTVg5PzHG3AUCBbMo1N6PvrvxxpmfQVCALvx9zoPYa58ImdqQNMoNgck+QUPDWGUA
         cwgXcGJmus1xbwREQpFqeGuiFxg+UCaMcyLP5j3U=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10QGWxR0082334
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 26 Jan 2021 10:32:59 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 26
 Jan 2021 10:32:58 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 26 Jan 2021 10:32:58 -0600
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10QGWwpA069669;
        Tue, 26 Jan 2021 10:32:58 -0600
Received: from localhost ([10.250.35.71])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 10QGWwbq111807;
        Tue, 26 Jan 2021 10:32:58 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Rob Herring <robh+dt@kernel.org>, Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
CC:     Jan Kiszka <jan.kiszka@siemens.com>,
        David Lechner <david@lechnology.com>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Suman Anna <s-anna@ti.com>
Subject: [PATCH] dt-bindings: irqchip: Add node name to PRUSS INTC
Date:   Tue, 26 Jan 2021 10:32:51 -0600
Message-ID: <20210126163251.29468-1-s-anna@ti.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The current PRUSS Interrupt Controller binding doesn't exactly specify
the convention for the node name. These interrupt-controllers will always
have a unit address. Update the binding with the '$nodename' using the
expected generic name, this shall ensure the interrupt-controller.yaml
is automatically applied to this binding.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
This patch is a result of the previous discussion at
https://patchwork.kernel.org/comment/23926133/

 .../bindings/interrupt-controller/ti,pruss-intc.yaml           | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
index c2ce215501a5..9731dd4421a1 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
@@ -33,6 +33,9 @@ description: |
   corresponding PRUSS node. The node should be named "interrupt-controller".
 
 properties:
+  $nodename:
+    pattern: "^interrupt-controller@[0-9a-f]+$"
+
   compatible:
     enum:
       - ti,pruss-intc
-- 
2.29.2

