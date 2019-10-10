Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D934D2285
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 10:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733225AbfJJIVY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Oct 2019 04:21:24 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:39296 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733188AbfJJIVY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Oct 2019 04:21:24 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9A8LECl101667;
        Thu, 10 Oct 2019 03:21:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570695674;
        bh=tu0nnpfGzidXSw6/IM0hH5/1VmGSmGFdGSiEQ/tREe8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=n+ePALqMLDuo0IqsY2eoEQTS4ujCu6x1HIllAvfIx2ZjerFTxA/tCVAiItUS1qUjv
         yFGRQYj+YnG9CrzUJGrhgI4jSCHgcC4ERK84B9DGl1xb69MYUBG2ksnjwiHwxD72Ry
         eyjoygOoyhTx5xsGqdTQNjSj6I3RXkdT9a8XFk6s=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9A8LEBn104160
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 10 Oct 2019 03:21:14 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 03:21:10 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 03:21:13 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9A8LAtB012630;
        Thu, 10 Oct 2019 03:21:12 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <linux-arm-kernel@lists.infradead.org>, <s-anna@ti.com>
Subject: [PATCH 1/5] ARM: dts: dra7: add PRM nodes
Date:   Thu, 10 Oct 2019 11:21:04 +0300
Message-ID: <20191010082108.15448-2-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191010082108.15448-1-t-kristo@ti.com>
References: <20191010082108.15448-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add PRM nodes for dra7 series of SoCs. These are initially used to
support reset control for some of the nodes, but will be extended
later to add powerdomain control and support for PRCM irqs among
other things.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/dra7.dtsi | 55 +++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
index 953f0ffce2a9..f4c73cca6354 100644
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -763,3 +763,54 @@
 
 #include "dra7-l4.dtsi"
 #include "dra7xx-clocks.dtsi"
+
+&prm {
+	prm_dsp1: prm@400 {
+		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
+		reg = <0x400 0x100>;
+		#reset-cells = <1>;
+	};
+
+	prm_ipu: prm@500 {
+		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
+		reg = <0x500 0x100>;
+		#reset-cells = <1>;
+	};
+
+	prm_core: prm@700 {
+		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
+		reg = <0x700 0x100>;
+		#reset-cells = <1>;
+	};
+
+	prm_iva: prm@f00 {
+		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
+		reg = <0xf00 0x100>;
+	};
+
+	prm_dsp2: prm@1b00 {
+		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
+		reg = <0x1b00 0x40>;
+		#reset-cells = <1>;
+	};
+
+	prm_eve1: prm@1b40 {
+		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
+		reg = <0x1b40 0x40>;
+	};
+
+	prm_eve2: prm@1b80 {
+		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
+		reg = <0x1b80 0x40>;
+	};
+
+	prm_eve3: prm@1bc0 {
+		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
+		reg = <0x1bc0 0x40>;
+	};
+
+	prm_eve4: prm@1c00 {
+		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
+		reg = <0x1c00 0x60>;
+	};
+};
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
