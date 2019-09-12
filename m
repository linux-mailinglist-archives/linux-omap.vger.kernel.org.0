Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38311B0FDC
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2019 15:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732115AbfILN0k (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Sep 2019 09:26:40 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:41666 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732098AbfILN0k (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Sep 2019 09:26:40 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CDQbaQ049583;
        Thu, 12 Sep 2019 08:26:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568294797;
        bh=K2Q92adlyOlFE+55nlrsCH8twyZ1qvVGlSQOn8cJ0jo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=R5Sx57oFPzATZ7B13TRpt+LVvRAA0YJuP5aYxx+jWwNQS8vfMX2aRi0AnKQvVctj6
         rd3Gyqgm0kY4w4SV8D22PnJimdgujRGc8b6mV/24mjp7YJFQ9zha7YqPb9IcnowqyP
         SLlcNO9g8efjY/UQmGU1UXuIXex4Rfpf5mIkFftk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CDQbGA071418;
        Thu, 12 Sep 2019 08:26:37 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 12
 Sep 2019 08:26:37 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 12 Sep 2019 08:26:37 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CDQFvZ130575;
        Thu, 12 Sep 2019 08:26:35 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
CC:     <tony@atomide.com>, <s-anna@ti.com>
Subject: [PATCHv3 10/10] clk: ti: am33xx: drop idlest polling from pruss clkctrl clock
Date:   Thu, 12 Sep 2019 16:26:13 +0300
Message-ID: <20190912132613.28093-11-t-kristo@ti.com>
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

The PRUSS module on AM33xx SoCs has a hardreset line and is controlled
by a PRCM reset line. Any clkctrl enable/disable operations cannot be
checked for module enabled/disabled status independent of the reset
operation, and this causes some unwanted timeouts in the kernel and
unbalanced states for the PRUSS clocks. These details should be handled
by the driver integration code itself.

Add the CLKF_NO_IDLEST flag to the PRUSS clkctrl clock so that these
module status checks are skipped.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clk-33xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clk-33xx.c b/drivers/clk/ti/clk-33xx.c
index a360d3109555..935efb66b389 100644
--- a/drivers/clk/ti/clk-33xx.c
+++ b/drivers/clk/ti/clk-33xx.c
@@ -107,7 +107,7 @@ static const struct omap_clkctrl_reg_data am3_l4hs_clkctrl_regs[] __initconst =
 };
 
 static const struct omap_clkctrl_reg_data am3_pruss_ocp_clkctrl_regs[] __initconst = {
-	{ AM3_PRUSS_OCP_PRUSS_CLKCTRL, NULL, CLKF_SW_SUP, "pruss_ocp_gclk" },
+	{ AM3_PRUSS_OCP_PRUSS_CLKCTRL, NULL, CLKF_SW_SUP | CLKF_NO_IDLEST, "pruss_ocp_gclk" },
 	{ 0 },
 };
 
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
