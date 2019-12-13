Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC4E211DC6F
	for <lists+linux-omap@lfdr.de>; Fri, 13 Dec 2019 04:07:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731948AbfLMDHP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 22:07:15 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:36462 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731499AbfLMDHO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Dec 2019 22:07:14 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBD377KD088008;
        Thu, 12 Dec 2019 21:07:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576206427;
        bh=bjzkSGwjJanZ6D9U2D9DBeNvV2bdbXonjWIceJ35aww=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=R1XF8Afh+BJQzN1qC5TplJQtyTR/9ImQsey59k1vw8hnOVh/rGR2b/uYFraNu89nF
         /8822gYa7AKGat2yhhDVcwdEQ41A8kRg/4odTQBwnjh9uMqu8Rf7Huw9wpPzHLV+D8
         sJz7t09neLSXg4kHeOraQO+j8T5LBgN0Nr+IlhBw=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBD376OU018495
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Dec 2019 21:07:07 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 21:07:06 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 21:07:06 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBD376eC025174;
        Thu, 12 Dec 2019 21:07:06 -0600
From:   Dave Gerlach <d-gerlach@ti.com>
To:     Tony Lindgren <tony@atomide.com>,
        Santosh Shilimkar <ssantosh@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Dave Gerlach <d-gerlach@ti.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/5] dt-bindings: arm: cpu: Add TI AM335x and AM437x enable method
Date:   Thu, 12 Dec 2019 21:07:51 -0600
Message-ID: <20191213030755.16096-2-d-gerlach@ti.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191213030755.16096-1-d-gerlach@ti.com>
References: <20191213030755.16096-1-d-gerlach@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add enable-method binding for "ti,am3352" and "ti,am4372".

Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
---
CC: Rob Herring <robh+dt@kernel.org>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index c23c24ff7575..428b6b55b5da 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -201,6 +201,8 @@ properties:
               - rockchip,rk3066-smp
               - socionext,milbeaut-m10v-smp
               - ste,dbx500-smp
+              - ti,am3352
+              - ti,am4372
 
   cpu-release-addr:
     $ref: '/schemas/types.yaml#/definitions/uint64'
-- 
2.20.1

