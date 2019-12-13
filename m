Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF7711E40A
	for <lists+linux-omap@lfdr.de>; Fri, 13 Dec 2019 13:57:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727357AbfLMM4O (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Dec 2019 07:56:14 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:48470 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727313AbfLMM4L (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Dec 2019 07:56:11 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBDCu9Rf068942;
        Fri, 13 Dec 2019 06:56:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576241769;
        bh=Z0UZgul79dMd1dzpnJXaYuVp++fe7lVa0f6QkAu6WoM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ELvSmVfIvfUP4ruJa3uExx4dfjpZVc2qEeghidpkdSYjYTOC/7CCYrJLJWouClECK
         Qp6Dhs4FSkv4Par4vTel+CBlDeGIGd7RwBEkEgKRQ6GYsg8J2X4YGrANJ250uXobk6
         c5AfzmXnV7ERMtOB+C4AtQuotyDi5HkMz1f+Ffp0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBDCu9JR085116
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 13 Dec 2019 06:56:09 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Dec 2019 06:56:07 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Dec 2019 06:56:06 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBDCtwVI127295;
        Fri, 13 Dec 2019 06:56:05 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-omap@vger.kernel.org>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCHv3 03/15] remoteproc/omap: Add a sanity check for DSP boot address alignment
Date:   Fri, 13 Dec 2019 14:55:25 +0200
Message-ID: <20191213125537.11509-4-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213125537.11509-1-t-kristo@ti.com>
References: <20191213125537.11509-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The DSP remote processors on OMAP SoCs require a boot register to
be programmed with a boot address, and this boot address needs to
be on a 1KB boundary. The current code is simply masking the boot
address appropriately without performing any sanity checks before
releasing the resets. An unaligned boot address results in an
undefined execution behavior and can result in various bus errors
like MMU Faults or L3 NoC errors. Such errors are hard to debug and
can be easily avoided by adding a sanity check for the alignment
before booting a DSP remote processor.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/omap_remoteproc.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 558634624590..d80f5d7b5931 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -124,13 +124,22 @@ static void omap_rproc_kick(struct rproc *rproc, int vqid)
  *
  * Set boot address for a supported DSP remote processor.
  */
-static void omap_rproc_write_dsp_boot_addr(struct rproc *rproc)
+static int omap_rproc_write_dsp_boot_addr(struct rproc *rproc)
 {
+	struct device *dev = rproc->dev.parent;
 	struct omap_rproc *oproc = rproc->priv;
 	struct omap_rproc_boot_data *bdata = oproc->boot_data;
 	u32 offset = bdata->boot_reg;
 
+	if (rproc->bootaddr & (SZ_1K - 1)) {
+		dev_err(dev, "invalid boot address 0x%x, must be aligned on a 1KB boundary\n",
+			rproc->bootaddr);
+		return -EINVAL;
+	}
+
 	regmap_write(bdata->syscon, offset, rproc->bootaddr);
+
+	return 0;
 }
 
 /*
@@ -147,8 +156,11 @@ static int omap_rproc_start(struct rproc *rproc)
 	int ret;
 	struct mbox_client *client = &oproc->client;
 
-	if (oproc->boot_data)
-		omap_rproc_write_dsp_boot_addr(rproc);
+	if (oproc->boot_data) {
+		ret = omap_rproc_write_dsp_boot_addr(rproc);
+		if (ret)
+			return ret;
+	}
 
 	client->dev = dev;
 	client->tx_done = NULL;
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
