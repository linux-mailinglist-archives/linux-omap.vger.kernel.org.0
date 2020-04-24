Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82DCC1B75E2
	for <lists+linux-omap@lfdr.de>; Fri, 24 Apr 2020 14:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728124AbgDXMrd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Apr 2020 08:47:33 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33472 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbgDXMrb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Apr 2020 08:47:31 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03OClSbh013707;
        Fri, 24 Apr 2020 07:47:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587732448;
        bh=WBg5tAJeJxs9zQBIrOrEJPDiql3rS9wv8Z7K8hDEjZ8=;
        h=From:To:CC:Subject:Date;
        b=uD8pDOoYE7O8VeTD00az9r1gsr8CiNGV87IWHg2d7kHRhGdXd1l4Rl9awNQ1B1788
         Te6aiC8PrLiADeNmnDrIzlgVp0yID43K9tVPoPQ8yYEQtT+Pir/QoF5JE4vVo1CbKc
         ccSlvCAO2rJrMwjTvRZ5DPYvIwtVeqkJ9gUtBvAE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03OClS4a095095;
        Fri, 24 Apr 2020 07:47:28 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 24
 Apr 2020 07:47:28 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 24 Apr 2020 07:47:28 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03OClQ7f022011;
        Fri, 24 Apr 2020 07:47:26 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <tony@atomide.com>, <linux-omap@vger.kernel.org>
Subject: [PATCH 1/1] clk: ti: clkctrl: Fix Bad of_node_put within clkctrl_get_name
Date:   Fri, 24 Apr 2020 15:47:25 +0300
Message-ID: <20200424124725.9895-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

clkctrl_get_name incorrectly calls of_node_put when it is not really
doing of_node_get. This causes a boot time warning later on:

[    0.000000] OF: ERROR: Bad of_node_put() on /ocp/interconnect@4a000000/segmen
t@0/target-module@5000/cm_core_aon@0/ipu-cm@500/ipu1-clkctrl@20

Fix by dropping the of_node_put from the function.

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Fixes: 6c3090520554 ("clk: ti: clkctrl: Fix hidden dependency to node name")
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clkctrl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
index 062266034d84..9019624e37bc 100644
--- a/drivers/clk/ti/clkctrl.c
+++ b/drivers/clk/ti/clkctrl.c
@@ -461,7 +461,6 @@ static char * __init clkctrl_get_name(struct device_node *np)
 			return name;
 		}
 	}
-	of_node_put(np);
 
 	return NULL;
 }
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
