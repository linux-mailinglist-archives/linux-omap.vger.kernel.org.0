Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86E1AC4990
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2019 10:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725908AbfJBIdx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Oct 2019 04:33:53 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:44090 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbfJBIdx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 2 Oct 2019 04:33:53 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x928XoTr028711;
        Wed, 2 Oct 2019 03:33:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570005231;
        bh=Lx0PqOkFZnRlGG1vEvlWMVTGc+q6HEDxj3c2tzG4bLs=;
        h=From:To:CC:Subject:Date;
        b=ig5Wa0bHgog0DDzmgvazjkSpYC2YGavFl4c7/gUGUm+KvhGYzcBkRcLAjsdv7QT3s
         XarlGThelfpXo8AAGr5LNBimXDeqrh4mAysaOSmyybopAY2dOSZqnvLoOlsZ/tALI1
         VJIi7fZSXLFVFT2NRXblKigV84Z6QvOiKpGQxdlk=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x928Xohi093820
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 2 Oct 2019 03:33:50 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 03:33:50 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 03:33:50 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x928Xlts014195;
        Wed, 2 Oct 2019 03:33:48 -0500
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <t-kristo@ti.com>, <mturquette@baylibre.com>
CC:     <sboyd@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] clk: ti: dra7-atl-clock: Remove ti_clk_add_alias call
Date:   Wed, 2 Oct 2019 11:34:36 +0300
Message-ID: <20191002083436.10194-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

ti_clk_register() calls it already so the driver should not create
duplicated alias.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
Hi,

changes since v1:
- removed unused ret variable

Regards,
Peter

 drivers/clk/ti/clk-dra7-atl.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/clk/ti/clk-dra7-atl.c b/drivers/clk/ti/clk-dra7-atl.c
index a01ca9395179..f65e16c4f3c4 100644
--- a/drivers/clk/ti/clk-dra7-atl.c
+++ b/drivers/clk/ti/clk-dra7-atl.c
@@ -174,7 +174,6 @@ static void __init of_dra7_atl_clock_setup(struct device_node *node)
 	struct clk_init_data init = { NULL };
 	const char **parent_names = NULL;
 	struct clk *clk;
-	int ret;
 
 	clk_hw = kzalloc(sizeof(*clk_hw), GFP_KERNEL);
 	if (!clk_hw) {
@@ -207,11 +206,6 @@ static void __init of_dra7_atl_clock_setup(struct device_node *node)
 	clk = ti_clk_register(NULL, &clk_hw->hw, node->name);
 
 	if (!IS_ERR(clk)) {
-		ret = ti_clk_add_alias(NULL, clk, node->name);
-		if (ret) {
-			clk_unregister(clk);
-			goto cleanup;
-		}
 		of_clk_add_provider(node, of_clk_src_simple_get, clk);
 		kfree(parent_names);
 		return;
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

