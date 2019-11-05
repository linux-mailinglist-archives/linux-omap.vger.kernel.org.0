Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D755EFD52
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2019 13:38:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388551AbfKEMiU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Nov 2019 07:38:20 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:34364 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388658AbfKEMiT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Nov 2019 07:38:19 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5CcAL4021467;
        Tue, 5 Nov 2019 06:38:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572957490;
        bh=0MpnH7eWm4FOfZl52m8GMcsRbvgeR59zMBRCUV6i9o8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=hHwM9OoVHJBA1laAJayTjqPTFqJ6FrXtRcUcG1eO8edjganfguOG4J+9/xVyGkOjB
         dWWf+EgbiWWx0h1/ZE+yT9HaKDggNQrQY7jzz5KqoyIsxptBd4OdadGcrTpKG5JZRj
         XEsFpVdkU+ba94/3xhVtSUgI52AkYHM5Wd2apJi4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5CcAdL095773;
        Tue, 5 Nov 2019 06:38:10 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 5 Nov
 2019 06:37:55 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 5 Nov 2019 06:37:55 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5Cc6cw117093;
        Tue, 5 Nov 2019 06:38:08 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>, <ard.biesheuvel@kernel.org>
Subject: [PATCH 1/6] crypto: omap-aes-gcm: fix failure with assocdata only
Date:   Tue, 5 Nov 2019 14:37:54 +0200
Message-ID: <20191105123759.25053-2-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191105123759.25053-1-t-kristo@ti.com>
References: <20191105123759.25053-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

If we only have assocdata with an omap-aes-gcm, it currently just
completes it directly without passing it over to the crypto HW. This
produces wrong results.

Fix by passing the request down to the crypto HW, and fix the DMA
support code to accept a case where we don't expect any output data.
In the case where only assocdata is provided, it just passes through
the accelerator and provides authentication results, without any
encrypted/decrypted buffer via DMA.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-aes-gcm.c |  2 +-
 drivers/crypto/omap-aes.c     | 67 +++++++++++++++++++++--------------
 2 files changed, 42 insertions(+), 27 deletions(-)

diff --git a/drivers/crypto/omap-aes-gcm.c b/drivers/crypto/omap-aes-gcm.c
index 6da05149b195..e92000846f16 100644
--- a/drivers/crypto/omap-aes-gcm.c
+++ b/drivers/crypto/omap-aes-gcm.c
@@ -244,7 +244,7 @@ static int omap_aes_gcm_handle_queue(struct omap_aes_dev *dd,
 
 	err = omap_aes_write_ctrl(dd);
 	if (!err) {
-		if (dd->in_sg_len && dd->out_sg_len)
+		if (dd->in_sg_len)
 			err = omap_aes_crypt_dma_start(dd);
 		else
 			omap_aes_gcm_dma_out_callback(dd);
diff --git a/drivers/crypto/omap-aes.c b/drivers/crypto/omap-aes.c
index c43121ec8b0b..a63ff4738466 100644
--- a/drivers/crypto/omap-aes.c
+++ b/drivers/crypto/omap-aes.c
@@ -269,13 +269,14 @@ static int omap_aes_crypt_dma(struct omap_aes_dev *dd,
 			      struct scatterlist *out_sg,
 			      int in_sg_len, int out_sg_len)
 {
-	struct dma_async_tx_descriptor *tx_in, *tx_out;
+	struct dma_async_tx_descriptor *tx_in, *tx_out = NULL, *cb_desc;
 	struct dma_slave_config cfg;
 	int ret;
 
 	if (dd->pio_only) {
 		scatterwalk_start(&dd->in_walk, dd->in_sg);
-		scatterwalk_start(&dd->out_walk, dd->out_sg);
+		if (out_sg_len)
+			scatterwalk_start(&dd->out_walk, dd->out_sg);
 
 		/* Enable DATAIN interrupt and let it take
 		   care of the rest */
@@ -312,34 +313,45 @@ static int omap_aes_crypt_dma(struct omap_aes_dev *dd,
 
 	/* No callback necessary */
 	tx_in->callback_param = dd;
+	tx_in->callback = NULL;
 
 	/* OUT */
-	ret = dmaengine_slave_config(dd->dma_lch_out, &cfg);
-	if (ret) {
-		dev_err(dd->dev, "can't configure OUT dmaengine slave: %d\n",
-			ret);
-		return ret;
-	}
+	if (out_sg_len) {
+		ret = dmaengine_slave_config(dd->dma_lch_out, &cfg);
+		if (ret) {
+			dev_err(dd->dev, "can't configure OUT dmaengine slave: %d\n",
+				ret);
+			return ret;
+		}
 
-	tx_out = dmaengine_prep_slave_sg(dd->dma_lch_out, out_sg, out_sg_len,
-					DMA_DEV_TO_MEM,
-					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
-	if (!tx_out) {
-		dev_err(dd->dev, "OUT prep_slave_sg() failed\n");
-		return -EINVAL;
+		tx_out = dmaengine_prep_slave_sg(dd->dma_lch_out, out_sg,
+						 out_sg_len,
+						 DMA_DEV_TO_MEM,
+						 DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+		if (!tx_out) {
+			dev_err(dd->dev, "OUT prep_slave_sg() failed\n");
+			return -EINVAL;
+		}
+
+		cb_desc = tx_out;
+	} else {
+		cb_desc = tx_in;
 	}
 
 	if (dd->flags & FLAGS_GCM)
-		tx_out->callback = omap_aes_gcm_dma_out_callback;
+		cb_desc->callback = omap_aes_gcm_dma_out_callback;
 	else
-		tx_out->callback = omap_aes_dma_out_callback;
-	tx_out->callback_param = dd;
+		cb_desc->callback = omap_aes_dma_out_callback;
+	cb_desc->callback_param = dd;
+
 
 	dmaengine_submit(tx_in);
-	dmaengine_submit(tx_out);
+	if (tx_out)
+		dmaengine_submit(tx_out);
 
 	dma_async_issue_pending(dd->dma_lch_in);
-	dma_async_issue_pending(dd->dma_lch_out);
+	if (out_sg_len)
+		dma_async_issue_pending(dd->dma_lch_out);
 
 	/* start DMA */
 	dd->pdata->trigger(dd, dd->total);
@@ -361,11 +373,13 @@ int omap_aes_crypt_dma_start(struct omap_aes_dev *dd)
 			return -EINVAL;
 		}
 
-		err = dma_map_sg(dd->dev, dd->out_sg, dd->out_sg_len,
-				 DMA_FROM_DEVICE);
-		if (!err) {
-			dev_err(dd->dev, "dma_map_sg() error\n");
-			return -EINVAL;
+		if (dd->out_sg_len) {
+			err = dma_map_sg(dd->dev, dd->out_sg, dd->out_sg_len,
+					 DMA_FROM_DEVICE);
+			if (!err) {
+				dev_err(dd->dev, "dma_map_sg() error\n");
+				return -EINVAL;
+			}
 		}
 	}
 
@@ -373,8 +387,9 @@ int omap_aes_crypt_dma_start(struct omap_aes_dev *dd)
 				 dd->out_sg_len);
 	if (err && !dd->pio_only) {
 		dma_unmap_sg(dd->dev, dd->in_sg, dd->in_sg_len, DMA_TO_DEVICE);
-		dma_unmap_sg(dd->dev, dd->out_sg, dd->out_sg_len,
-			     DMA_FROM_DEVICE);
+		if (dd->out_sg_len)
+			dma_unmap_sg(dd->dev, dd->out_sg, dd->out_sg_len,
+				     DMA_FROM_DEVICE);
 	}
 
 	return err;
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
