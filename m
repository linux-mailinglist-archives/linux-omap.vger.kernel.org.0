Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23303100579
	for <lists+linux-omap@lfdr.de>; Mon, 18 Nov 2019 13:20:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbfKRMUR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Nov 2019 07:20:17 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53284 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbfKRMUR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 Nov 2019 07:20:17 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAICKDq9094686;
        Mon, 18 Nov 2019 06:20:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574079613;
        bh=Mr/xvH9i7o07dbmai3DgivxsZvlJvlRtOGsunFGbXHw=;
        h=From:To:CC:Subject:Date;
        b=tYri5VtwhAx/AgSmBuX9gC0d86JBwNV7T2lKTH+2sb9v3bs0LKUEdM6sMSSpuSvbP
         dg/74Ldyei8tdTCPjv0S/68VBtKRnIVYHsZmwXor0iL5/7+X+w7t76djDyWvlhDKMd
         JiSG/Hl+9Ayw/vzrvwft+C3xepVuTa7zQ3kpFKw0=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAICKDio117002
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 18 Nov 2019 06:20:13 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 18
 Nov 2019 06:20:12 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 18 Nov 2019 06:20:12 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAICKBCU011547;
        Mon, 18 Nov 2019 06:20:12 -0600
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH] ARM: dts: dra7: fix cpsw mdio fck clock
Date:   Mon, 18 Nov 2019 14:20:16 +0200
Message-ID: <20191118122016.22215-1-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The DRA7 CPSW MDIO functional clock (gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 0)
is specified incorrectly, which is caused incorrect MDIO bus clock
configuration MDCLK. The correct CPSW MDIO functional clock is
gmac_main_clk (125MHz), which is the same as CPSW fck. Hence fix it.

Fixes: commit 1faa415c9c6e ("ARM: dts: Add fck for cpsw mdio for omap variants")
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/dra7-l4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
index 2f3a19edc7af..f69df2d2b554 100644
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -3059,7 +3059,7 @@
 
 				davinci_mdio: mdio@1000 {
 					compatible = "ti,cpsw-mdio","ti,davinci_mdio";
-					clocks = <&gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 0>;
+					clocks = <&gmac_main_clk>;
 					clock-names = "fck";
 					#address-cells = <1>;
 					#size-cells = <0>;
-- 
2.17.1

