Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E50211ACC3
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 15:03:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729789AbfLKODA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 09:03:00 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:47972 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729686AbfLKOC7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Dec 2019 09:02:59 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBBE2eB9034203;
        Wed, 11 Dec 2019 08:02:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576072960;
        bh=M257Xz7fAOlmSwrEbNXIJwipCrFIM2SaIl6IE3TF+hM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=CJDylWCeipf8CKUttWGo3+ahpp4Y1XWTGnotzOSEyx6uwXUO+3zu0QHCVmz3CuFxs
         YMGpIVaVlma8862wgu8ih1kofw8J/HnIkFJMhO/qFVcOYnyXrEbisH9edkBpC2ZMWE
         /aP4sOCDj4zfpLH2FUVutN6wBmcbQPKID6jMkrH4=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBBE2exl094063
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 11 Dec 2019 08:02:40 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 11
 Dec 2019 08:02:39 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 11 Dec 2019 08:02:39 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBBE2afn007398;
        Wed, 11 Dec 2019 08:02:39 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v4 03/10] ARM: OMAP: DRA7xx: Make CAM clock domain SWSUP only
Date:   Wed, 11 Dec 2019 08:05:51 -0600
Message-ID: <20191211140558.10407-4-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211140558.10407-1-bparrot@ti.com>
References: <20191211140558.10407-1-bparrot@ti.com>
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
Acked-by: Tony Lindgren <tony@atomide.com>
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

