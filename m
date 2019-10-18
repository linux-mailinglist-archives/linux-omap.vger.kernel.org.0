Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3DACDC98A
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2019 17:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502190AbfJRPqT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 11:46:19 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46284 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409052AbfJRPqT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Oct 2019 11:46:19 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9IFkGwU120233;
        Fri, 18 Oct 2019 10:46:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571413576;
        bh=AhKW4zr3y6EnszWY1v1ZvsH1fjzX055dXtF+Ryq9cP0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Co2TjTHRd8/bgq3vBKC1prulo6lCzYTwmoOn3pBY+t411HX9AR5CiB/8TO21Ykrb0
         EgdTRS3SOwFgTYx7uWhMTbISiJFBZnvJKfPHpSmwvQmlySFkD9L+r3iZb2+mgwWvSe
         g80qJ++lgEirJuYd3xQPsSiDzVSCj0vAy/MSG6gA=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9IFkGlh109053
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Oct 2019 10:46:16 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 18
 Oct 2019 10:46:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 18 Oct 2019 10:46:15 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9IFkDAO045642;
        Fri, 18 Oct 2019 10:46:15 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     Rob Herring <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch 2/9] ARM: OMAP: DRA7xx: Make CAM clock domain SWSUP only
Date:   Fri, 18 Oct 2019 10:48:42 -0500
Message-ID: <20191018154849.3127-3-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018154849.3127-1-bparrot@ti.com>
References: <20191018154849.3127-1-bparrot@ti.com>
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

