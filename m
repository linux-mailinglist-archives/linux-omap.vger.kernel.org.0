Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D79228079C
	for <lists+linux-omap@lfdr.de>; Thu,  1 Oct 2020 21:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729993AbgJATUb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Oct 2020 15:20:31 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59862 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729990AbgJATUa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 1 Oct 2020 15:20:30 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 091JKRI9005822;
        Thu, 1 Oct 2020 14:20:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1601580027;
        bh=vLtU7HOSA7uzWzCnBZpRLx1lfIxyzsrJ2TaDftfyCeg=;
        h=From:To:CC:Subject:Date;
        b=NotJiYnbCfFyWY99VAuWqq85L1YrFOf8H3jWCk1rCTNQ2UWFQ/F0Q74KA4bgEyJn3
         H7TRn9ua7soCa74uE255e0Pf1opE+qhGoGZRcOliJQ6P6PFKUjXq6p9wR1SSsUG+5c
         Lp+lH1DA5A7uDDdnTH8Q5y88j3NgaEPdC0/IaMyU=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 091JKRqT127407;
        Thu, 1 Oct 2020 14:20:27 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 1 Oct
 2020 14:20:27 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 1 Oct 2020 14:20:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 091JKPxZ016472;
        Thu, 1 Oct 2020 14:20:26 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH] ARM: dts: am437x-l4: fix compatible for cpsw switch dt node
Date:   Thu, 1 Oct 2020 22:20:23 +0300
Message-ID: <20201001192023.6606-1-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fix compatible the new CPSW switchdev DT node to avoid probing of legacy
CPSW driver which fails:
[    2.781009] cpsw 4a100000.switch: invalid resource

Fixes: 7bf8f37aea82 ("ARM: dts: am437x-l4: add dt node for new cpsw switchdev driver")
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
Hi Tony,

This is follow up patch for series [1], not critical.
[1] https://lore.kernel.org/patchwork/cover/1304085/

 arch/arm/boot/dts/am437x-l4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
index d82a6eeaf1b3..3643e505e582 100644
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -522,7 +522,7 @@
 			ranges = <0x0 0x100000 0x8000>;
 
 			mac_sw: switch@0 {
-				compatible = "ti,am4372-cpsw","ti,cpsw-switch";
+				compatible = "ti,am4372-cpsw-switch", "ti,cpsw-switch";
 				reg = <0x0 0x4000>;
 				ranges = <0 0 0x4000>;
 				clocks = <&cpsw_125mhz_gclk>, <&dpll_clksel_mac_clk>;
-- 
2.17.1

