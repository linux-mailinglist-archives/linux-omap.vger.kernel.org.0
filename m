Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9426EFD54
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2019 13:38:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388658AbfKEMiU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Nov 2019 07:38:20 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:34362 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388673AbfKEMiU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Nov 2019 07:38:20 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5CcD0U021478;
        Tue, 5 Nov 2019 06:38:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572957493;
        bh=mUjNUnQ/VP5etN9fqL41+Jq7xqRS4LuXTifuuRCP97Q=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ZBgdl3KwrkHfK2iGiHwU60wPSMwrchZCFZYBU3HXGjtyTerIpQfaifXGNgBD9Xr0U
         QwCDRHLzv3e12GKd4czeDNNqvh0C3gY2hhLCaqVmPxaUFiBLx6WwjARKCPKSvVSFkh
         Uh1C/8v0BPCb/C3TzgN3rafWgTw5GAA6Oc4Ri10c=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA5CcD9N023444
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 5 Nov 2019 06:38:13 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 5 Nov
 2019 06:37:58 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 5 Nov 2019 06:37:58 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5Cc6d0117093;
        Tue, 5 Nov 2019 06:38:12 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>, <ard.biesheuvel@kernel.org>
Subject: [PATCH 3/6] crypto: omap-aes-gcm: convert to use crypto engine
Date:   Tue, 5 Nov 2019 14:37:56 +0200
Message-ID: <20191105123759.25053-4-t-kristo@ti.com>
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

Currently omap-aes-gcm algorithms are using local implementation for
crypto request queuing logic. Instead, implement this via usage of
crypto engine which is used already for rest of the omap aes algorithms.
This avoids some random conflicts / crashes also which can happen if
both aes and aes-gcm are attempted to be used simultaneously.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-aes-gcm.c | 98 +++++++++++++++++++----------------
 drivers/crypto/omap-aes.c     | 23 --------
 drivers/crypto/omap-aes.h     |  2 +-
 3 files changed, 55 insertions(+), 68 deletions(-)

diff --git a/drivers/crypto/omap-aes-gcm.c b/drivers/crypto/omap-aes-gcm.c
index e92000846f16..32dc00dc570b 100644
--- a/drivers/crypto/omap-aes-gcm.c
+++ b/drivers/crypto/omap-aes-gcm.c
@@ -13,6 +13,7 @@
 #include <linux/dmaengine.h>
 #include <linux/omap-dma.h>
 #include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
 #include <crypto/aes.h>
 #include <crypto/gcm.h>
 #include <crypto/scatterwalk.h>
@@ -29,11 +30,13 @@ static void omap_aes_gcm_finish_req(struct omap_aes_dev *dd, int ret)
 {
 	struct aead_request *req = dd->aead_req;
 
-	dd->flags &= ~FLAGS_BUSY;
 	dd->in_sg = NULL;
 	dd->out_sg = NULL;
 
-	req->base.complete(&req->base, ret);
+	crypto_finalize_aead_request(dd->engine, req, ret);
+
+	pm_runtime_mark_last_busy(dd->dev);
+	pm_runtime_put_autosuspend(dd->dev);
 }
 
 static void omap_aes_gcm_done_task(struct omap_aes_dev *dd)
@@ -81,7 +84,6 @@ static void omap_aes_gcm_done_task(struct omap_aes_dev *dd)
 	}
 
 	omap_aes_gcm_finish_req(dd, ret);
-	omap_aes_gcm_handle_queue(dd, NULL);
 }
 
 static int omap_aes_gcm_copy_buffers(struct omap_aes_dev *dd,
@@ -127,6 +129,9 @@ static int omap_aes_gcm_copy_buffers(struct omap_aes_dev *dd,
 	if (cryptlen) {
 		tmp = scatterwalk_ffwd(sg_arr, req->src, req->assoclen);
 
+		if (nsg)
+			sg_unmark_end(dd->in_sgl);
+
 		ret = omap_crypto_align_sg(&tmp, cryptlen,
 					   AES_BLOCK_SIZE, &dd->in_sgl[nsg],
 					   OMAP_CRYPTO_COPY_DATA |
@@ -146,7 +151,7 @@ static int omap_aes_gcm_copy_buffers(struct omap_aes_dev *dd,
 	dd->out_sg = req->dst;
 	dd->orig_out = req->dst;
 
-	dd->out_sg = scatterwalk_ffwd(sg_arr, req->dst, assoclen);
+	dd->out_sg = scatterwalk_ffwd(sg_arr, req->dst, req->assoclen);
 
 	flags = 0;
 	if (req->src == req->dst || dd->out_sg == sg_arr)
@@ -202,37 +207,21 @@ void omap_aes_gcm_dma_out_callback(void *data)
 static int omap_aes_gcm_handle_queue(struct omap_aes_dev *dd,
 				     struct aead_request *req)
 {
-	struct omap_aes_gcm_ctx *ctx;
-	struct aead_request *backlog;
-	struct omap_aes_reqctx *rctx;
-	unsigned long flags;
-	int err, ret = 0;
-
-	spin_lock_irqsave(&dd->lock, flags);
-	if (req)
-		ret = aead_enqueue_request(&dd->aead_queue, req);
-	if (dd->flags & FLAGS_BUSY) {
-		spin_unlock_irqrestore(&dd->lock, flags);
-		return ret;
-	}
-
-	backlog = aead_get_backlog(&dd->aead_queue);
-	req = aead_dequeue_request(&dd->aead_queue);
 	if (req)
-		dd->flags |= FLAGS_BUSY;
-	spin_unlock_irqrestore(&dd->lock, flags);
-
-	if (!req)
-		return ret;
+		return crypto_transfer_aead_request_to_engine(dd->engine, req);
 
-	if (backlog)
-		backlog->base.complete(&backlog->base, -EINPROGRESS);
+	return 0;
+}
 
-	ctx = crypto_aead_ctx(crypto_aead_reqtfm(req));
-	rctx = aead_request_ctx(req);
+static int omap_aes_gcm_prepare_req(struct crypto_engine *engine, void *areq)
+{
+	struct aead_request *req = container_of(areq, struct aead_request,
+						base);
+	struct omap_aes_reqctx *rctx = aead_request_ctx(req);
+	struct omap_aes_dev *dd = rctx->dd;
+	struct omap_aes_gcm_ctx *ctx = crypto_aead_ctx(crypto_aead_reqtfm(req));
+	int err;
 
-	dd->ctx = &ctx->octx;
-	rctx->dd = dd;
 	dd->aead_req = req;
 
 	rctx->mode &= FLAGS_MODE_MASK;
@@ -242,20 +231,9 @@ static int omap_aes_gcm_handle_queue(struct omap_aes_dev *dd,
 	if (err)
 		return err;
 
-	err = omap_aes_write_ctrl(dd);
-	if (!err) {
-		if (dd->in_sg_len)
-			err = omap_aes_crypt_dma_start(dd);
-		else
-			omap_aes_gcm_dma_out_callback(dd);
-	}
-
-	if (err) {
-		omap_aes_gcm_finish_req(dd, err);
-		omap_aes_gcm_handle_queue(dd, NULL);
-	}
+	dd->ctx = &ctx->octx;
 
-	return ret;
+	return omap_aes_write_ctrl(dd);
 }
 
 static int omap_aes_gcm_crypt(struct aead_request *req, unsigned long mode)
@@ -378,3 +356,35 @@ int omap_aes_4106gcm_setauthsize(struct crypto_aead *parent,
 {
 	return crypto_rfc4106_check_authsize(authsize);
 }
+
+static int omap_aes_gcm_crypt_req(struct crypto_engine *engine, void *areq)
+{
+	struct aead_request *req = container_of(areq, struct aead_request,
+						base);
+	struct omap_aes_reqctx *rctx = aead_request_ctx(req);
+	struct omap_aes_dev *dd = rctx->dd;
+	int ret = 0;
+
+	if (!dd)
+		return -ENODEV;
+
+	if (dd->in_sg_len)
+		ret = omap_aes_crypt_dma_start(dd);
+	else
+		omap_aes_gcm_dma_out_callback(dd);
+
+	return ret;
+}
+
+int omap_aes_gcm_cra_init(struct crypto_aead *tfm)
+{
+	struct omap_aes_ctx *ctx = crypto_aead_ctx(tfm);
+
+	ctx->enginectx.op.prepare_request = omap_aes_gcm_prepare_req;
+	ctx->enginectx.op.unprepare_request = NULL;
+	ctx->enginectx.op.do_one_request = omap_aes_gcm_crypt_req;
+
+	crypto_aead_set_reqsize(tfm, sizeof(struct omap_aes_reqctx));
+
+	return 0;
+}
diff --git a/drivers/crypto/omap-aes.c b/drivers/crypto/omap-aes.c
index a63ff4738466..627254a872a9 100644
--- a/drivers/crypto/omap-aes.c
+++ b/drivers/crypto/omap-aes.c
@@ -657,29 +657,6 @@ static int omap_aes_init_tfm(struct crypto_skcipher *tfm)
 	return 0;
 }
 
-static int omap_aes_gcm_cra_init(struct crypto_aead *tfm)
-{
-	struct omap_aes_dev *dd = NULL;
-	int err;
-
-	/* Find AES device, currently picks the first device */
-	spin_lock_bh(&list_lock);
-	list_for_each_entry(dd, &dev_list, list) {
-		break;
-	}
-	spin_unlock_bh(&list_lock);
-
-	err = pm_runtime_get_sync(dd->dev);
-	if (err < 0) {
-		dev_err(dd->dev, "%s: failed to get_sync(%d)\n",
-			__func__, err);
-		return err;
-	}
-
-	tfm->reqsize = sizeof(struct omap_aes_reqctx);
-	return 0;
-}
-
 static void omap_aes_exit_tfm(struct crypto_skcipher *tfm)
 {
 	struct omap_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
diff --git a/drivers/crypto/omap-aes.h b/drivers/crypto/omap-aes.h
index b89d2e673699..2d111bf906e1 100644
--- a/drivers/crypto/omap-aes.h
+++ b/drivers/crypto/omap-aes.h
@@ -80,7 +80,6 @@
 
 #define FLAGS_INIT		BIT(5)
 #define FLAGS_FAST		BIT(6)
-#define FLAGS_BUSY		BIT(7)
 
 #define FLAGS_IN_DATA_ST_SHIFT	8
 #define FLAGS_OUT_DATA_ST_SHIFT	10
@@ -212,6 +211,7 @@ int omap_aes_4106gcm_encrypt(struct aead_request *req);
 int omap_aes_4106gcm_decrypt(struct aead_request *req);
 int omap_aes_4106gcm_setauthsize(struct crypto_aead *parent,
 				 unsigned int authsize);
+int omap_aes_gcm_cra_init(struct crypto_aead *tfm);
 int omap_aes_write_ctrl(struct omap_aes_dev *dd);
 int omap_aes_crypt_dma_start(struct omap_aes_dev *dd);
 int omap_aes_crypt_dma_stop(struct omap_aes_dev *dd);
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
