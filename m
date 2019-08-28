Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A96B89FAFA
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 08:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726169AbfH1G7l (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 02:59:41 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:58026 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbfH1G7l (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Aug 2019 02:59:41 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7S6xcro120622;
        Wed, 28 Aug 2019 01:59:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566975578;
        bh=ZhhtgfHz1PpryANYuepNGwQFWlONDXmjaSxUGLbbF0g=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Z12Q2RERnKXNOgXtBbbO/p6iGfCzVBkcF0MGAoJWTbcM65ofZaB5ZuYKeiCipyeca
         RjH5lCa14VehLjy/pQEy980VJT/ZANwHqgGjJ3jllo82JMpbo0QelLbvgsLpgrZZiL
         OUcZLYO2dI9CF4bru+qy2ekA5fofjRsKsVyYUtZw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7S6xcs0052329
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 28 Aug 2019 01:59:38 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 28
 Aug 2019 01:59:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 28 Aug 2019 01:59:37 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7S6xXVB074399;
        Wed, 28 Aug 2019 01:59:36 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>, <s-anna@ti.com>
Subject: [PATCHv2 1/6] clk: ti: clkctrl: fix setting up clkctrl clocks
Date:   Wed, 28 Aug 2019 09:59:24 +0300
Message-ID: <20190828065929.32150-2-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828065929.32150-1-t-kristo@ti.com>
References: <20190828065929.32150-1-t-kristo@ti.com>
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
