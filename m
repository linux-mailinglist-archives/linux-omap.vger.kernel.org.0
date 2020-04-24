Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A4EB1B7978
	for <lists+linux-omap@lfdr.de>; Fri, 24 Apr 2020 17:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgDXPXH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Apr 2020 11:23:07 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:55282 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726717AbgDXPXH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Apr 2020 11:23:07 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03OFN3mt105049;
        Fri, 24 Apr 2020 10:23:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587741783;
        bh=m2sHyM1LH4LSgb92tuBX838XNsL85Lw1JXBiHZer4oc=;
        h=From:To:CC:Subject:Date;
        b=WOAoq5azhAj6mS59nJmqjuXfd2imcldlU20lvPpqefpqhh4QtrvTJ2STTnU+39Jo8
         9KiFf1zE+2+CHUi/GdMRER0Z/JOrq5arnQNKawDa+hdU14vLbHieKPNzx/FjKKwkkO
         jvZK0FCa7fw3ITlFHiHq1KuSa2iY01tVZx1Udwg4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03OFN3ld108240
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 24 Apr 2020 10:23:03 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 24
 Apr 2020 10:23:03 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 24 Apr 2020 10:23:03 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03OFN1O8062339;
        Fri, 24 Apr 2020 10:23:02 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <tony@atomide.com>, <linux-omap@vger.kernel.org>
Subject: [PATCH] clk: ti: am33xx: fix RTC clock parent
Date:   Fri, 24 Apr 2020 18:23:01 +0300
Message-ID: <20200424152301.4018-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Right now, trying to use RTC purely with the ti-sysc / clkctrl framework
fails to enable the RTC module properly. Based on experimentation, this
appears to be because RTC is sourced from the clkdiv32k optional clock.
TRM is not very clear on this topic, but fix the RTC to use the proper
source clock nevertheless.

Reported-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clk-33xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clk-33xx.c b/drivers/clk/ti/clk-33xx.c
index e001b9bcb6bf..7dc30dd6c8d5 100644
--- a/drivers/clk/ti/clk-33xx.c
+++ b/drivers/clk/ti/clk-33xx.c
@@ -212,7 +212,7 @@ static const struct omap_clkctrl_reg_data am3_mpu_clkctrl_regs[] __initconst = {
 };
 
 static const struct omap_clkctrl_reg_data am3_l4_rtc_clkctrl_regs[] __initconst = {
-	{ AM3_L4_RTC_RTC_CLKCTRL, NULL, CLKF_SW_SUP, "clk_32768_ck" },
+	{ AM3_L4_RTC_RTC_CLKCTRL, NULL, CLKF_SW_SUP, "clk-24mhz-clkctrl:0000:0" },
 	{ 0 },
 };
 
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
