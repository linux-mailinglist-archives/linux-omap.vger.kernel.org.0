Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE0561BF2FF
	for <lists+linux-omap@lfdr.de>; Thu, 30 Apr 2020 10:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726611AbgD3Igt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Apr 2020 04:36:49 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:35372 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbgD3Igt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Apr 2020 04:36:49 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03U8akMN101696;
        Thu, 30 Apr 2020 03:36:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588235806;
        bh=uRDS3CZggzBOWMlm4jhNck7COB5RbecQq9XdSfwObDE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=g+X8qqiVEFM9TYemJMPbG2QipdGCnFfgmsuLExb5BwibmeFN5xRaPpMbNpBSEZIDy
         NwGxch6sNH/RdA0+/lqdLXmQSRsR+xTqhl9GQgHs3zu8jJFsTkVhBk1PjMayqRxI4B
         grbeIM4I2RQwGBp3yzvh7m4MugcoA8KcEp6AD+Yo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03U8aknq063223
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 30 Apr 2020 03:36:46 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 30
 Apr 2020 03:36:45 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 30 Apr 2020 03:36:46 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03U8agEm073623;
        Thu, 30 Apr 2020 03:36:44 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <tony@atomide.com>, <linux-omap@vger.kernel.org>
Subject: [PATCH 1/3] clk: ti: dra7xx: fix gpu clkctrl parent
Date:   Thu, 30 Apr 2020 11:36:38 +0300
Message-ID: <20200430083640.8621-2-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200430083640.8621-1-t-kristo@ti.com>
References: <20200430083640.8621-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

gpu_cm:* parent clock name is wrong, replace this with correct
gpu-clkctrl:* clock. Otherwise the clock ends up in the orphaned list.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clk-7xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clk-7xx.c b/drivers/clk/ti/clk-7xx.c
index 14b645093107..366cb75378cb 100644
--- a/drivers/clk/ti/clk-7xx.c
+++ b/drivers/clk/ti/clk-7xx.c
@@ -328,7 +328,7 @@ static const struct omap_clkctrl_bit_data dra7_gpu_core_bit_data[] __initconst =
 };
 
 static const struct omap_clkctrl_reg_data dra7_gpu_clkctrl_regs[] __initconst = {
-	{ DRA7_GPU_CLKCTRL, dra7_gpu_core_bit_data, CLKF_SW_SUP, "gpu_cm:clk:0000:24", },
+	{ DRA7_GPU_CLKCTRL, dra7_gpu_core_bit_data, CLKF_SW_SUP, "gpu-clkctrl:0000:24", },
 	{ 0 },
 };
 
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
