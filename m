Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84A6321AB63
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jul 2020 01:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbgGIXUK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 9 Jul 2020 19:20:10 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:49280 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbgGIXUK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 9 Jul 2020 19:20:10 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 069NK5HP122925;
        Thu, 9 Jul 2020 18:20:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594336806;
        bh=bTbO7tKvhum5luzqsKRZJs6tS+jmpYvKHI4pzaAiS9w=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=pP0UbUwvvLDPY+nqCHOEHtvohVoePS+OwAkOUoyX6rJxzRFcMg6k7JmHawiBeRCTA
         eGfv2iSmVdR1o0gpk04PhHTZb6X3iezWPPuDIuClLf4z91DoYKQvQaOwdRb5dxbgj+
         F+s6WRTvQ7hZmLkPY8Jjnh2ETfvS32w0CTU/pPgk=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 069NK5Sg099173;
        Thu, 9 Jul 2020 18:20:05 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 9 Jul
 2020 18:20:04 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 9 Jul 2020 18:20:04 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 069NK43s052548;
        Thu, 9 Jul 2020 18:20:04 -0500
Received: from localhost ([10.250.34.57])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 069NK4t5124425;
        Thu, 9 Jul 2020 18:20:04 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <t-kristo@ti.com>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 04/13] ARM: dts: omap4: Add IPU DT node
Date:   Thu, 9 Jul 2020 18:19:45 -0500
Message-ID: <20200709231954.1973-5-s-anna@ti.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200709231954.1973-1-s-anna@ti.com>
References: <20200709231954.1973-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The DT node for the Dual-Cortex M3 IPU processor sub-system has
been added for OMAP4 SoCs. The L2RAM memory region information
has been added to the node through the 'reg' and 'reg-names'
properties. The node has the 'iommus', 'clocks', 'resets',
'mboxes' and 'firmware' properties also added, and is disabled
for now. It should be enabled as per the individual product
configuration in the corresponding board dts files.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/omap4.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
index 8f6b38bb5753..4928951ad9db 100644
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -284,6 +284,18 @@ dsp: dsp {
 			status = "disabled";
 		};
 
+		ipu: ipu@55020000 {
+			compatible = "ti,omap4-ipu";
+			reg = <0x55020000 0x10000>;
+			reg-names = "l2ram";
+			iommus = <&mmu_ipu>;
+			resets = <&prm_core 0>, <&prm_core 1>;
+			clocks = <&ducati_clkctrl OMAP4_IPU_CLKCTRL 0>;
+			firmware-name = "omap4-ipu-fw.xem3";
+			mboxes = <&mailbox &mbox_ipu>;
+			status = "disabled";
+		};
+
 		aes1_target: target-module@4b501000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
 			reg = <0x4b501080 0x4>,
-- 
2.26.0

