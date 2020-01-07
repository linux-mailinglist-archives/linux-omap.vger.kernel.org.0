Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD951132196
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2020 09:45:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgAGIpo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jan 2020 03:45:44 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43046 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbgAGIpo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Jan 2020 03:45:44 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0078jH0n008916;
        Tue, 7 Jan 2020 02:45:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578386717;
        bh=8o27iEx4YNIvAK4xZuCbnoQRTobEbGheT+LgGTmiM+Q=;
        h=From:To:CC:Subject:Date;
        b=W7Lwbh+2iPu0Tdg4jKRSbG7Unncn2/S/BIzYV6HtNGgYLuZZgQkpksdETman36mPv
         JiB6Ulpzw8k+jMCtGi22tHXVLHBkz1FotfEybSP+lLfqOHAVYlrJ9XUfqxuU5DXrjb
         U2jO6zmuRPdcb0FYQbDtLOUZvDmBXFAsB1LxnA9Q=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0078jHOM063657
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 7 Jan 2020 02:45:17 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 7 Jan
 2020 02:45:16 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 7 Jan 2020 02:45:16 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0078jEfT059940;
        Tue, 7 Jan 2020 02:45:14 -0600
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <kyungmin.park@samsung.com>, <miquel.raynal@bootlin.com>,
        <aaro.koskinen@iki.fi>, <vigneshr@ti.com>, <hns@goldelico.com>
CC:     <tony@atomide.com>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>
Subject: [PATCH v2] mtd: onenand: omap2: Pass correct flags for prep_dma_memcpy
Date:   Tue, 7 Jan 2020 10:45:44 +0200
Message-ID: <20200107084544.18547-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The commit converting the driver to DMAengine was missing the flags for
the memcpy prepare call.
It went unnoticed since the omap-dma driver was ignoring them.

Fixes: 3ed6a4d1de2c5 (" mtd: onenand: omap2: Convert to use dmaengine for memcp")
Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
Tested-by: Aaro Koskinen <aaro.koskinen@iki.fi>
---
Hi,

Changes since v1:
- Typo fixed in the commit message
- Added the Tested-by from Aaro and Nikolaus

Aaro reported [1] a failure on omap2-onenand pointing to
4689d35c765c696bdf0535486a990038b242a26b. It looks like the root cause is the
conversion of omap2-onenand to DMAengine which missed the flags.

Basically the client is waiting for a callback without asking for it. This
certainly causes timeout.

I have not tested the patch, but it should fix the issue.

[1] https://lore.kernel.org/lkml/20200103081726.GD15023@darkstar.musicnaut.iki.fi/

Regards,
Peter

 drivers/mtd/nand/onenand/omap2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/onenand/omap2.c b/drivers/mtd/nand/onenand/omap2.c
index edf94ee54ec7..71a632b815aa 100644
--- a/drivers/mtd/nand/onenand/omap2.c
+++ b/drivers/mtd/nand/onenand/omap2.c
@@ -328,7 +328,8 @@ static inline int omap2_onenand_dma_transfer(struct omap2_onenand *c,
 	struct dma_async_tx_descriptor *tx;
 	dma_cookie_t cookie;
 
-	tx = dmaengine_prep_dma_memcpy(c->dma_chan, dst, src, count, 0);
+	tx = dmaengine_prep_dma_memcpy(c->dma_chan, dst, src, count,
+				       DMA_CTRL_ACK | DMA_PREP_INTERRUPT);
 	if (!tx) {
 		dev_err(&c->pdev->dev, "Failed to prepare DMA memcpy\n");
 		return -EIO;
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

