Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAA5A16F080
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 21:47:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730175AbgBYUrq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Feb 2020 15:47:46 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:39056 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729048AbgBYUq6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 25 Feb 2020 15:46:58 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01PKkus6045207;
        Tue, 25 Feb 2020 14:46:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582663616;
        bh=8gUHCC8lERL7o2usz9p3+V++I32vD0RNtScbEJOJDUI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ureUBOEfyTXFbA7KeofTI9OyP60BBE7jvy4l6mh0mi9F/R+4QUKO7on73Sa/T3kPE
         8BY+p3vcMDHVYZbpuaXE9ypilEqAL6n7JhNgYWFf6RbY+ERJbmRag9hrH//afWlkU2
         zegCvWE+fMAPApieozvtqWaONDRhUuzrZ3a7lmKw=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01PKkuwu023140
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Feb 2020 14:46:56 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 25
 Feb 2020 14:46:56 -0600
Received: from localhost.localdomain (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 25 Feb 2020 14:46:55 -0600
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 01PKkuDE128891;
        Tue, 25 Feb 2020 14:46:56 -0600
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 01PKkuHA025470;
        Tue, 25 Feb 2020 14:46:56 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Roger Quadros <rogerq@ti.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 04/12] ARM: dts: AM4372: Add the PRU-ICSS interconnect target-module node
Date:   Tue, 25 Feb 2020 14:46:41 -0600
Message-ID: <20200225204649.28220-5-s-anna@ti.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200225204649.28220-1-s-anna@ti.com>
References: <20200225204649.28220-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The AM437x family of SoCs contains two dissimilar PRU-ICSS instances,
but leverage a common reset line and SYSCFG from the larger PRU-ICSS1
instance. This SYSC register has also very unique bit-fields. Both
the IPs require the PRCM reset to be deasserted to be able to access
any registers. Add a common PRUSS interconnect target-module with all
the required properties.

The PRUSS devices themselves shall be added as child nodes to this
interconnect node in the future. The PRU-ICSS instances are not
supported on AM4372 SoC though in the AM437x family, so the target
module node should be enabled in only those derivative board files
that use a SoC containing the PRU-ICSS IPs.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/am4372.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
index faa14dc0faff..979fa7f67825 100644
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -344,6 +344,29 @@
 			};
 		};
 
+		pruss_tm: target-module@54400000 {
+			compatible = "ti,sysc-pruss", "ti,sysc";
+			reg = <0x54426000 0x4>,
+			      <0x54426004 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-mask = <(SYSC_PRUSS_STANDBY_INIT |
+					 SYSC_PRUSS_SUB_MWAIT)>;
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			clocks = <&pruss_ocp_clkctrl AM4_PRUSS_OCP_PRUSS_CLKCTRL 0>;
+			clock-names = "fck";
+			resets = <&prm_per 1>;
+			reset-names = "rstctrl";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x54400000 0x80000>;
+			status = "disabled";
+		};
+
 		gpmc: gpmc@50000000 {
 			compatible = "ti,am3352-gpmc";
 			ti,hwmods = "gpmc";
-- 
2.23.0

