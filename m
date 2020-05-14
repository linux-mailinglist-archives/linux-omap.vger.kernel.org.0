Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 362881D28DE
	for <lists+linux-omap@lfdr.de>; Thu, 14 May 2020 09:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgENHh2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 May 2020 03:37:28 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:60010 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbgENHh0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 14 May 2020 03:37:26 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04E7bKZV054213;
        Thu, 14 May 2020 02:37:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589441841;
        bh=QGXAZUOwvDino56G8IWDdQ/NYT0jQ6NRH5b71pGNvrc=;
        h=From:To:CC:Subject:Date;
        b=cpS3n/GTSD1sKVTClUxFGXySVg4Fa/sMcsnTMldfYMfIpCPT2mDjZeB2SAYmLxHl0
         8DhFnfb66dYVlVkapr8lZ6Zudp+4OOQPnR7mNidJHU+brlDVLmCkJsJYF3l0CM+Nxp
         UN13c9NS5lN8KTC2YICC/UmU/BCX7xd9l4EW4W3I=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04E7bKIH002543
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 14 May 2020 02:37:20 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 14
 May 2020 02:37:20 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 14 May 2020 02:37:20 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04E7bIm6009731;
        Thu, 14 May 2020 02:37:19 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <ssantosh@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>, <s-anna@ti.com>
Subject: [PATCH 1/1] soc: ti: omap-prm: use atomic iopoll instead of sleeping one
Date:   Thu, 14 May 2020 10:37:18 +0300
Message-ID: <20200514073718.17690-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The reset handling APIs for omap-prm can be invoked PM runtime which
runs in atomic context. For this to work properly, switch to atomic
iopoll version instead of the current which can sleep. Otherwise,
this throws a "BUG: scheduling while atomic" warning. Issue is seen
rather easily when CONFIG_PREEMPT is enabled.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/soc/ti/omap_prm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
index 96c6f777519c..c9b3f9ebf0bb 100644
--- a/drivers/soc/ti/omap_prm.c
+++ b/drivers/soc/ti/omap_prm.c
@@ -256,10 +256,10 @@ static int omap_reset_deassert(struct reset_controller_dev *rcdev,
 		goto exit;
 
 	/* wait for the status to be set */
-	ret = readl_relaxed_poll_timeout(reset->prm->base +
-					 reset->prm->data->rstst,
-					 v, v & BIT(st_bit), 1,
-					 OMAP_RESET_MAX_WAIT);
+	ret = readl_relaxed_poll_timeout_atomic(reset->prm->base +
+						 reset->prm->data->rstst,
+						 v, v & BIT(st_bit), 1,
+						 OMAP_RESET_MAX_WAIT);
 	if (ret)
 		pr_err("%s: timedout waiting for %s:%lu\n", __func__,
 		       reset->prm->data->name, id);
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
