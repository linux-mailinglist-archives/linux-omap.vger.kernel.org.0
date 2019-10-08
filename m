Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF94CF382
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 09:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730273AbfJHHTh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Oct 2019 03:19:37 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:53616 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730161AbfJHHTg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Oct 2019 03:19:36 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x987JOKG046282;
        Tue, 8 Oct 2019 02:19:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570519164;
        bh=5NjhrYu8nXMN27ChfH5ORG8Z1ERJZGAOrQx8/HEKMSw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=epXn03vZtIrUhAFDrlLkcQdNbgWcClh/3N7cjFxmBi+HcIj7IY6zpC8WitsTOcdm9
         Bw0TIgAeURcnmtX9Ad8u93GKIaKuInORxNw6Jon+Uqi8NObZ405NBEooWlUOd+TPwQ
         BmjmlmZUJJrmM/6lH7/fv8uw6a+b0z60yFtLMP3g=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x987JOC5046068
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Oct 2019 02:19:24 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 8 Oct
 2019 02:19:21 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 8 Oct 2019 02:19:23 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x987JJj4027770;
        Tue, 8 Oct 2019 02:19:22 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <ssantosh@kernel.org>
CC:     <tony@atomide.com>, <s-anna@ti.com>, <p.zabel@pengutronix.de>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCHv7 1/9] dt-bindings: omap: add new binding for PRM instances
Date:   Tue, 8 Oct 2019 10:19:05 +0300
Message-ID: <20191008071913.28740-2-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191008071913.28740-1-t-kristo@ti.com>
References: <20191008071913.28740-1-t-kristo@ti.com>
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
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Tony Lindgren <tony@atomide.com>
---
v7:
  - dropped clocks property from example

 .../devicetree/bindings/arm/omap/prm-inst.txt | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/omap/prm-inst.txt

diff --git a/Documentation/devicetree/bindings/arm/omap/prm-inst.txt b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
new file mode 100644
index 000000000000..dfe7c7789ca7
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
@@ -0,0 +1,29 @@
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
+};
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
