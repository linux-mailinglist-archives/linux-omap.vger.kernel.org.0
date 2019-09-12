Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E957B0FDA
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2019 15:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732112AbfILN0h (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Sep 2019 09:26:37 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:38390 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732098AbfILN0h (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Sep 2019 09:26:37 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CDQZHU021229;
        Thu, 12 Sep 2019 08:26:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568294795;
        bh=V1b0FMEeevL3urjdJBuTCnTQb6LW6rgCELNI7FyhZeE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=SWXhSgj1ds7YXWFx1umEHZxcRWRw/uZMwVBvjO9WU/Jg6BWBTnbaPmj9/XXo7SXcr
         V8fY7hEVYy7QecLtoCy5rBreQDh8DscRMChz8IgpY42+kZfR1Uu55I7LddG1iLHzQY
         iRpHJWaUIlempeFzYYXuSgr04W2F9WWbL/Ht+plQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8CDQZx0011793
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Sep 2019 08:26:35 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 12
 Sep 2019 08:26:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 12 Sep 2019 08:26:35 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CDQFvY130575;
        Thu, 12 Sep 2019 08:26:33 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
CC:     <tony@atomide.com>, <s-anna@ti.com>
Subject: [PATCHv3 09/10] clk: ti: am43xx: drop idlest polling from pruss clkctrl clock
Date:   Thu, 12 Sep 2019 16:26:12 +0300
Message-ID: <20190912132613.28093-10-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190912132613.28093-1-t-kristo@ti.com>
References: <20190912132613.28093-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The PRUSS modules on AM43xx SoCs have a hardreset line and are controlled
by a PRCM reset line. Any clkctrl enable/disable operations cannot be
checked for module enabled/disabled status independent of the reset
operation, and this causes some unwanted timeouts in the kernel and
unbalanced states for the PRUSS clocks. These details should be handled
by the driver integration code itself.

Add the CLKF_NO_IDLEST flag to the PRUSS clkctrl clock so that these
module status checks are skipped.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clk-43xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clk-43xx.c b/drivers/clk/ti/clk-43xx.c
index 2782d91838ac..7ec8fe6aa7c1 100644
--- a/drivers/clk/ti/clk-43xx.c
+++ b/drivers/clk/ti/clk-43xx.c
@@ -126,7 +126,7 @@ static const struct omap_clkctrl_reg_data am4_l3s_clkctrl_regs[] __initconst = {
 };
 
 static const struct omap_clkctrl_reg_data am4_pruss_ocp_clkctrl_regs[] __initconst = {
-	{ AM4_PRUSS_OCP_PRUSS_CLKCTRL, NULL, CLKF_SW_SUP, "pruss_ocp_gclk" },
+	{ AM4_PRUSS_OCP_PRUSS_CLKCTRL, NULL, CLKF_SW_SUP | CLKF_NO_IDLEST, "pruss_ocp_gclk" },
 	{ 0 },
 };
 
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
