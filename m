Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF94130150
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2020 08:33:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbgADHds (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 4 Jan 2020 02:33:48 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:48696 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbgADHds (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 4 Jan 2020 02:33:48 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0047X61N032491;
        Sat, 4 Jan 2020 01:33:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578123186;
        bh=MPRf4J4LtJYGh1pD72Jrc6iAhCN4qcDvA6BPua2uosw=;
        h=From:To:CC:Subject:Date;
        b=nx+lPbr/SGmKBzP24thYYTPnB0vv38CdOWsuOTX0yXSWaQmH/DXPDhcq/rM/t0vYz
         1UJpv46qa4X0OMk2IpG2meVvsibgPNCBOm9NPo30cjv+hhFoakk7JSi8Q27bPWg3VE
         E5JTa4t0n4E/BVEB8pKoBuu3CgHi5uqFOoEjDWQw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0047X61P020021
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 4 Jan 2020 01:33:06 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Sat, 4 Jan
 2020 01:33:04 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Sat, 4 Jan 2020 01:33:04 -0600
Received: from vberus.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0047X19D007851;
        Sat, 4 Jan 2020 01:33:02 -0600
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <kyungmin.park@samsung.com>, <miquel.raynal@bootlin.com>,
        <aaro.koskinen@iki.fi>, <vigneshr@ti.com>
CC:     <hns@goldelico.com>, <tony@atomide.com>,
        <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>
Subject: [PATCH] mtd: onenand: omap2: Pass correct flags for prep_dma_memcpy
Date:   Sat, 4 Jan 2020 09:34:53 +0200
Message-ID: <20200104073453.16077-1-peter.ujfalusi@ti.com>
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
It went unnoticed since the omap-dma drive was ignoring them.

Fixes: 3ed6a4d1de2c5 (" mtd: onenand: omap2: Convert to use dmaengine for memcp")
Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
Hi,

Aaro reported [1] a failure on omap2-onenand pointing to
4689d35c765c696bdf0535486a990038b242a26b. It looks like the root cause is the
conversion of omap2-onenand to DMAengine which missed the flags.

Basically the client is waiting for a callback without asking for it. This
certainly causes timeout.

I have not tested the patch, but it should fix the issue.

[1] https://lore.kernel.org/lkml/20200103081726.GD15023@darkstar.musicnaut.iki.fi/

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

