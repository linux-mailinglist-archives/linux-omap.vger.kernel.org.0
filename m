Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 166E1CE199
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 14:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727905AbfJGM0P (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 08:26:15 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:44310 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727467AbfJGM0P (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Oct 2019 08:26:15 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97CQCre023243;
        Mon, 7 Oct 2019 07:26:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570451172;
        bh=Le6SKwPCYTVf7PsI5acKrr9OQLX3vSvwu+K9qljitMw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=n9Oz++NZmEeQqYnWlcdhKQC0A0EIZtztPclLduZyNUkQcLdE0UXE0c7TRiMTfmA5f
         abyGW/kMw7mjkO1zDFWJcVBLUhUF0PDJv5q0RPWiMjAZ1nMU45dR27M/ykWzFvRt7K
         T6qHt2B15oEoqL6amCr5wzfAycbv+m8jAxT3N9/s=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x97CQCf6081802
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Oct 2019 07:26:12 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 07:26:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 07:26:09 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97CQ8Na085058;
        Mon, 7 Oct 2019 07:26:10 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
Subject: [PATCH 1/2] clk: ti: am33xx: drop idlest polling from gfx clock
Date:   Mon, 7 Oct 2019 15:26:03 +0300
Message-ID: <20191007122604.18508-2-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007122604.18508-1-t-kristo@ti.com>
References: <20191007122604.18508-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Due to the way ti sysc and hardreset line control is now implemented,
it is not possible to poll the clock status for gfx clock independent
of hardreset line control. Thus, add a flag to prevent handling this
status bit from clock driver. Correct sequencing of events is guaranteed
by ti-sysc bus driver.

Reported-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clk-33xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clk-33xx.c b/drivers/clk/ti/clk-33xx.c
index 935efb66b389..e001b9bcb6bf 100644
--- a/drivers/clk/ti/clk-33xx.c
+++ b/drivers/clk/ti/clk-33xx.c
@@ -217,7 +217,7 @@ static const struct omap_clkctrl_reg_data am3_l4_rtc_clkctrl_regs[] __initconst
 };
 
 static const struct omap_clkctrl_reg_data am3_gfx_l3_clkctrl_regs[] __initconst = {
-	{ AM3_GFX_L3_GFX_CLKCTRL, NULL, CLKF_SW_SUP, "gfx_fck_div_ck" },
+	{ AM3_GFX_L3_GFX_CLKCTRL, NULL, CLKF_SW_SUP | CLKF_NO_IDLEST, "gfx_fck_div_ck" },
 	{ 0 },
 };
 
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
