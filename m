Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B012CAB616
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2019 12:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbfIFKgT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Sep 2019 06:36:19 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:38762 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725846AbfIFKgT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 6 Sep 2019 06:36:19 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x86Aa4JA112792;
        Fri, 6 Sep 2019 05:36:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567766164;
        bh=NKu33tCBfYWn/j0hyZDumUtOVco0J0GnTjsYln1Fv+Y=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=A02WkVUupyPbaiJr1QyQemypxZ8pXyzutM05BOr3B2hQnmz8sdtZCXVlYZfcICYTt
         HwujqOspTnPdvT/6UeMPjxPf9Zq918TEbqzpGVbOaT4KgWowKjgOEsqsJwDDsk4qN3
         tU5FZhQLCa59rbMWtm/0BoqgYYHSx8Jqcxiovv2Y=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x86Aa48j050155
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 6 Sep 2019 05:36:04 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 6 Sep
 2019 05:36:02 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 6 Sep 2019 05:36:02 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x86AZxp9060862;
        Fri, 6 Sep 2019 05:36:00 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <ssantosh@kernel.org>, <linux-omap@vger.kernel.org>,
        <tony@atomide.com>, <s-anna@ti.com>, <p.zabel@pengutronix.de>,
        <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCHv4 01/10] dt-bindings: omap: add new binding for PRM instances
Date:   Fri, 6 Sep 2019 13:35:58 +0300
Message-ID: <20190906103558.17694-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190830121816.30034-2-t-kristo@ti.com>
References: <20190830121816.30034-2-t-kristo@ti.com>
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
v4:
- renamed nodes as power-controller
- added documentation about hierarchy

 .../devicetree/bindings/arm/omap/prm-inst.txt | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/omap/prm-inst.txt

diff --git a/Documentation/devicetree/bindings/arm/omap/prm-inst.txt b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
new file mode 100644
index 000000000000..7c7527c37734
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
@@ -0,0 +1,35 @@
+OMAP PRM instance bindings
+
+Power and Reset Manager is an IP block on OMAP family of devices which
+handle the power domains and their current state, and provide reset
+handling for the domains and/or separate IP blocks under the power domain
+hierarchy. A PRM instance node must be a child of a PRM node [1].
+
+[1] Documentation/devicetree/bindings/arm/omap/prcm.txt
+
+Required properties:
+- compatible:	Must be one of:
+		"ti,am3-prm-inst"
+		"ti,am4-prm-inst"
+		"ti,omap4-prm-inst"
+		"ti,omap5-prm-inst"
+		"ti,dra7-prm-inst"
+- reg:		Contains PRM instance register address range
+		(base address and length)
+
+Optional properties:
+- #reset-cells:	Should be 1 if the PRM instance in question supports resets.
+- clocks:	Associated clocks for the reset signals if any. Certain reset
+		signals can't be toggled properly without functional clock
+		being active for them.
+
+Example:
+
+&prm {
+	prm_dsp2: power-controller@1b00 {
+		compatible = "ti,dra7-prm-inst";
+		reg = <0x1b00 0x40>;
+		#reset-cells = <1>;
+		clocks = <&dsp2_clkctrl DRA7_DSP2_MMU0_DSP2_CLKCTRL 0>;
+	};
+};
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
