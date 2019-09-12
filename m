Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D552B0FCE
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2019 15:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732093AbfILN02 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Sep 2019 09:26:28 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:38344 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732098AbfILN02 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Sep 2019 09:26:28 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CDQLB7021179;
        Thu, 12 Sep 2019 08:26:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568294781;
        bh=ZhhtgfHz1PpryANYuepNGwQFWlONDXmjaSxUGLbbF0g=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=XxLUX4Yteuu2XXr6dA3aF5yRzFMY/r5k4y1Cvwcisk7dvn1rs2zxqkAJf094+UqUR
         VyYeH6wQ3cLiCjoOIu7eaK8noT9nlXSsvHl9KF5Y13hJ5I3Dgfx2HEaBHIeYyY8rBa
         x7mE12ul4RmeQu6rSSpg+fmCfSwcqe78xAO65xZw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CDQLDe070947;
        Thu, 12 Sep 2019 08:26:21 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 12
 Sep 2019 08:26:19 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 12 Sep 2019 08:26:19 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CDQFvQ130575;
        Thu, 12 Sep 2019 08:26:18 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
CC:     <tony@atomide.com>, <s-anna@ti.com>
Subject: [PATCHv3 01/10] clk: ti: clkctrl: fix setting up clkctrl clocks
Date:   Thu, 12 Sep 2019 16:26:04 +0300
Message-ID: <20190912132613.28093-2-t-kristo@ti.com>
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

Apply the proper register function for clkctrl clocks, so they get
registered under the clk_hw_omap list also. This allows checking their
type runtime.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clkctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
index 975995eea15c..a914df2e9e1b 100644
--- a/drivers/clk/ti/clkctrl.c
+++ b/drivers/clk/ti/clkctrl.c
@@ -622,7 +622,7 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 		init.ops = &omap4_clkctrl_clk_ops;
 		hw->hw.init = &init;
 
-		clk = ti_clk_register(NULL, &hw->hw, init.name);
+		clk = ti_clk_register_omap_hw(NULL, &hw->hw, init.name);
 		if (IS_ERR_OR_NULL(clk))
 			goto cleanup;
 
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
