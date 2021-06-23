Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7784F3B1F8D
	for <lists+linux-omap@lfdr.de>; Wed, 23 Jun 2021 19:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbhFWRfJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 23 Jun 2021 13:35:09 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60358 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbhFWRfI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 23 Jun 2021 13:35:08 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15NHWhHd099618;
        Wed, 23 Jun 2021 12:32:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1624469563;
        bh=q5arVj9mTAxIzA/sUXQNmdNySZl9RRGTotbkjbnLbGw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=KjbWA6zZZ9g+Ncfb+UFJx3fHDEOaEF0/6a+asDZAhnsQyAc33hEebS8Ptj5e0u6O6
         dMleci9EGIzS8o9qh0QC9BNZqU+W8Tt3XXELhryV23aYPs0cBpyMYmOsjo0d55sCR0
         CX9d/PMChJq5eNkdX45g1kH0pCfaI50hYQ9caA1Y=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15NHWhiG039636
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 23 Jun 2021 12:32:43 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 23
 Jun 2021 12:32:43 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 23 Jun 2021 12:32:43 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15NHWhXo058495;
        Wed, 23 Jun 2021 12:32:43 -0500
Received: from localhost ([10.250.33.41])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 15NHWhlk028852;
        Wed, 23 Jun 2021 12:32:43 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Kishon Vijay Abraham I <kishon@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 1/2] dt-bindings: remoteproc: pru: Update bindings for K3 AM64x SoCs
Date:   Wed, 23 Jun 2021 12:32:41 -0500
Message-ID: <20210623173243.7862-2-s-anna@ti.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210623173243.7862-1-s-anna@ti.com>
References: <20210623173243.7862-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The K3 AM64x SoCs have an ICSSG IP that is similar to the IP revisions
used on K3 AM65x SR2.0 and J721E SoCs. The ICSSG IP on K3 AM64x SoCs
have the same set of two PRU cores, two RTU cores and two auxiliary PRU
cores called Transmit PRUs (Tx_PRUs). There are some minor differences
surrounding the PRU cores like different Broadside RAM (BSRAM) sizes
w.r.t AM65x SR1.0 SoCs.

Update the PRU remoteproc bindings for these PRU cores on AM64x SoCs.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 .../devicetree/bindings/remoteproc/ti,pru-rproc.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
index 63071eef1632..4f8435d49a62 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
@@ -44,6 +44,9 @@ properties:
       - ti,j721e-pru    # for PRUs in K3 J721E SoC family
       - ti,j721e-rtu    # for RTUs in K3 J721E SoC family
       - ti,j721e-tx-pru # for Tx_PRUs in K3 J721E SoC family
+      - ti,am642-pru    # for PRUs in K3 AM64x SoC family
+      - ti,am642-rtu    # for RTUs in K3 AM64x SoC family
+      - ti,am642-tx-pru # for Tx_PRUs in K3 AM64x SoC family
 
   reg:
     items:
@@ -68,6 +71,7 @@ if:
       enum:
         - ti,am654-rtu
         - ti,j721e-rtu
+        - ti,am642-rtu
 then:
   properties:
     $nodename:
@@ -79,6 +83,7 @@ else:
         enum:
           - ti,am654-tx-pru
           - ti,j721e-tx-pru
+          - ti,am642-tx-pru
   then:
     properties:
       $nodename:
-- 
2.30.1

