Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6333DB796E
	for <lists+linux-omap@lfdr.de>; Thu, 19 Sep 2019 14:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390331AbfISMaU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Sep 2019 08:30:20 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46760 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389347AbfISMaT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Sep 2019 08:30:19 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8JCU5Oa127637;
        Thu, 19 Sep 2019 07:30:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568896205;
        bh=F+n1rsuLrfMe5CItyh0FKyzxNzdl4TWNUEWsERsnn/c=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=HaKj6eiIcizrmEfFq5MvgBz2M9Nm9jN1itAeHvmI10aQdHnY9IzWwiT64Z06ftRon
         Xn7NBMz5SKBXWRwI7nro8ktcJ1cBeZO/lZlhwoY3ksTOctWDF/yi38YgJ0Mj0k8qr3
         eMe4rIAD+hF8PThUnZqGRfu/+04kU94qn7hZCXt8=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8JCU4aM037316;
        Thu, 19 Sep 2019 07:30:04 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 19
 Sep 2019 07:30:01 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 19 Sep 2019 07:30:04 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8JCU2Pe084177;
        Thu, 19 Sep 2019 07:30:02 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <ssantosh@kernel.org>, <p.zabel@pengutronix.de>,
        <robh+dt@kernel.org>, <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <s-anna@ti.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCHv6 01/10] dt-bindings: omap: add new binding for PRM instances
Date:   Thu, 19 Sep 2019 15:30:01 +0300
Message-ID: <20190919123001.23081-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190917174817.GA27938@bogus>
References: <20190917174817.GA27938@bogus>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add new binding for OMAP PRM (Power and Reset Manager) instances. Each
of these will act as a power domain controller and potentially as a reset
provider.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
v6: added common compatible as per request from Tony Lindgren. This is
    to simplify the support code in patch #10 of the series slightly

 .../devicetree/bindings/arm/omap/prm-inst.txt | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/omap/prm-inst.txt

diff --git a/Documentation/devicetree/bindings/arm/omap/prm-inst.txt b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
new file mode 100644
index 000000000000..31f8d8b44a51
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
@@ -0,0 +1,30 @@
+OMAP PRM instance bindings
+
+Power and Reset Manager is an IP block on OMAP family of devices which
+handle the power domains and their current state, and provide reset
+handling for the domains and/or separate IP blocks under the power domain
+hierarchy.
+
+Required properties:
+- compatible:	Must contain one of the following:
+		"ti,am3-prm-inst"
+		"ti,am4-prm-inst"
+		"ti,omap4-prm-inst"
+		"ti,omap5-prm-inst"
+		"ti,dra7-prm-inst"
+		and additionally must contain:
+		"ti,omap-prm-inst"
+- reg:		Contains PRM instance register address range
+		(base address and length)
+
+Optional properties:
+- #reset-cells:	Should be 1 if the PRM instance in question supports resets.
+
+Example:
+
+prm_dsp2: prm@1b00 {
+	compatible = "ti,omap-prm-inst", "ti,dra7-prm-inst";
+	reg = <0x1b00 0x40>;
+	#reset-cells = <1>;
+	clocks = <&dsp2_clkctrl DRA7_DSP2_MMU0_DSP2_CLKCTRL 0>;
+};
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
