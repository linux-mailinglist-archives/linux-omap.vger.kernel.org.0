Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69120EEA45
	for <lists+linux-omap@lfdr.de>; Mon,  4 Nov 2019 21:50:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729644AbfKDUtM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 4 Nov 2019 15:49:12 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:55860 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729687AbfKDUtL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 4 Nov 2019 15:49:11 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA4Kn6sQ052942;
        Mon, 4 Nov 2019 14:49:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572900546;
        bh=AhKW4zr3y6EnszWY1v1ZvsH1fjzX055dXtF+Ryq9cP0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=CHgnUphErEUWXaluu7j/r6suvrloY7StxAq0qq5DruKxE3QYkO2SwjwdqWhCkSSfk
         S+dSCUyq1Iohuw69OgTfDMF6tJtJjUh8BbZAR7Ci+m4kn98wTxSiHOEZq/FC2VxNsr
         0+5n0ClqV1bztLhOcxuycH/P1PD7tutLD5GFjcH4=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4Kn6Ia005026;
        Mon, 4 Nov 2019 14:49:06 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 4 Nov
 2019 14:49:06 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 4 Nov 2019 14:48:51 -0600
Received: from ula0869644.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4Kmvxx038360;
        Mon, 4 Nov 2019 14:49:05 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 03/10] ARM: OMAP: DRA7xx: Make CAM clock domain SWSUP only
Date:   Mon, 4 Nov 2019 14:48:46 -0600
Message-ID: <20191104204853.4355-4-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191104204853.4355-1-bparrot@ti.com>
References: <20191104204853.4355-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Both CAL and VIP rely on this clock domain. But CAL DPHY require
LVDSRX_96M_GFCLK to be active. When this domain is set to HWSUP the
LVDSRX_96M_GFCLK is on;y active when VIP1 clock is also active.  If only
CAL on DRA72x (which uses the VIP2 clkctrl) probes the CAM domain is
enabled but the LVDSRX_96M_GFCLK is left gated. Since LVDSRX_96M_GFCLK
is sourcing the input clock to the DPHY then actual frame capture cannot
start as the phy are inactive.

So we either have to also enabled VIP1 even if we don't intend on using
it or we need to set the CAM domain to use SWSUP only.

This patch implements the latter.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 arch/arm/mach-omap2/clockdomains7xx_data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/clockdomains7xx_data.c b/arch/arm/mach-omap2/clockdomains7xx_data.c
index 3068802824b7..27835c4d1aa9 100644
--- a/arch/arm/mach-omap2/clockdomains7xx_data.c
+++ b/arch/arm/mach-omap2/clockdomains7xx_data.c
@@ -606,7 +606,7 @@ static struct clockdomain cam_7xx_clkdm = {
 	.dep_bit	  = DRA7XX_CAM_STATDEP_SHIFT,
 	.wkdep_srcs	  = cam_wkup_sleep_deps,
 	.sleepdep_srcs	  = cam_wkup_sleep_deps,
-	.flags		  = CLKDM_CAN_HWSUP_SWSUP,
+	.flags		  = CLKDM_CAN_SWSUP,
 };
 
 static struct clockdomain l4per_7xx_clkdm = {
-- 
2.17.1

