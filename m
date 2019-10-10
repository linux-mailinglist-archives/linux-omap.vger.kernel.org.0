Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E53ABD228C
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 10:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733192AbfJJIVZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Oct 2019 04:21:25 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:36540 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733170AbfJJIVZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Oct 2019 04:21:25 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9A8LK2F119361;
        Thu, 10 Oct 2019 03:21:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570695680;
        bh=BZjTfO0hw7QY/DOKoGd7XFdcQdgiFx0Fe8Ciulw6L6Y=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=QsnYSKeo/U7vszz/eNAwI0k5ZhEqYCiH0KHPaFceG6ycVg/FaRd8GalbvE7ifQB27
         5JPSrkSQMZMjpyRAemC/UrMgBu8KJFQcdpRopo7N0tt30Q9C61KcaRKo0QkElvZlUC
         pOSmGTBGur8INj7Z3rDW8w4AwRwGi/UK+uAgyaY0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9A8LKk7003671
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 10 Oct 2019 03:21:20 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 03:21:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 03:21:19 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9A8LAtF012630;
        Thu, 10 Oct 2019 03:21:18 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <linux-arm-kernel@lists.infradead.org>, <s-anna@ti.com>
Subject: [PATCH 5/5] ARM: dts: omap5: Add PRM data
Date:   Thu, 10 Oct 2019 11:21:08 +0300
Message-ID: <20191010082108.15448-6-t-kristo@ti.com>
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

Add PRM data for OMAP54xx SoC. Initially this is used to provide reset
support, but will be expanded later to support also powerdomain control.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/omap5.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
index 1fb7937638f0..cec8a38fb420 100644
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -435,3 +435,29 @@
 
 #include "omap5-l4-abe.dtsi"
 #include "omap54xx-clocks.dtsi"
+
+&prm {
+	prm_dsp: prm@400 {
+		compatible = "ti,omap5-prm-inst", "ti,omap-prm-inst";
+		reg = <0x400 0x100>;
+		#reset-cells = <1>;
+	};
+
+	prm_core: prm@700 {
+		compatible = "ti,omap5-prm-inst", "ti,omap-prm-inst";
+		reg = <0x700 0x100>;
+		#reset-cells = <1>;
+	};
+
+	prm_iva: prm@1200 {
+		compatible = "ti,omap5-prm-inst", "ti,omap-prm-inst";
+		reg = <0x1200 0x100>;
+		#reset-cells = <1>;
+	};
+
+	prm_device: prm@1c00 {
+		compatible = "ti,omap5-prm-inst", "ti,omap-prm-inst";
+		reg = <0x1c00 0x100>;
+		#reset-cells = <1>;
+	};
+};
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
