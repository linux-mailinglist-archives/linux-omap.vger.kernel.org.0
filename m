Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC85C172B31
	for <lists+linux-omap@lfdr.de>; Thu, 27 Feb 2020 23:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730273AbgB0W2x (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Feb 2020 17:28:53 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:41218 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730198AbgB0W2x (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 27 Feb 2020 17:28:53 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01RMSp8l106641;
        Thu, 27 Feb 2020 16:28:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582842531;
        bh=wpJm8EVY/uB14h+BkJS+LRdTUAYM9k8bE4INF6DskhM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=psH9UbQrdZW552NohVzrR6+QmA/d0TpGntI4BYZ7ytktEn1/u6p1TJkUIzIMd7NWt
         rz18e+SPLBpFlr5xT8gAWRgsuoEVhC6zZd8j23tcWoJL7QV1XExpTK+BEhTlVG40TW
         p3CdLdamVDjXAzn7LF18RBsLo9caR8Mbde2lAwOk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01RMSp2m077911
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 27 Feb 2020 16:28:51 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 27
 Feb 2020 16:28:50 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 27 Feb 2020 16:28:50 -0600
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01RMSowA120440;
        Thu, 27 Feb 2020 16:28:50 -0600
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 01RMSoLW087091;
        Thu, 27 Feb 2020 16:28:50 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Roger Quadros <rogerq@ti.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 4/5] ARM: dts: AM4372: Add the PRU-ICSS interconnect target-module node
Date:   Thu, 27 Feb 2020 16:28:36 -0600
Message-ID: <20200227222837.7329-5-s-anna@ti.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200227222837.7329-1-s-anna@ti.com>
References: <20200227222837.7329-1-s-anna@ti.com>
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
module node should be disabled in any derivative board files that
use this SoC.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
v2: 
 - Remove status=disabled
 - Revise last para in patch description

 arch/arm/boot/dts/am4372.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
index faa14dc0faff..9f39413b0d0e 100644
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -344,6 +344,28 @@
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
+		};
+
 		gpmc: gpmc@50000000 {
 			compatible = "ti,am3352-gpmc";
 			ti,hwmods = "gpmc";
-- 
2.23.0

