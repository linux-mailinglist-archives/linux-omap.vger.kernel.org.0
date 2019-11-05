Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8D7EFE63
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2019 14:28:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389186AbfKEN2x (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Nov 2019 08:28:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:46756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388963AbfKEN2w (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 5 Nov 2019 08:28:52 -0500
Received: from localhost.localdomain (laubervilliers-657-1-83-120.w92-154.abo.wanadoo.fr [92.154.90.120])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 61942222C6;
        Tue,  5 Nov 2019 13:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572960530;
        bh=aRzdMmC7ui65EpqRUd1ZVZ4lB4xsXmBx52HO1rRTFn0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ffcmaL3NijX8vkZD/MUaojkqYhsxgt772gh6hro63lpHbCNIgMUnQsjJN64ahBPe2
         4CLdrV7z27b2v2RBXOn7g8l64qT79mzrRrsmHZgvVTKJGG7l1rcPnDZsCupJao+/LJ
         V5MgqZEfahlq5K51j8NRmKQhTA+cWUxvDacE520U=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     linux-crypto@vger.kernel.org
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Biggers <ebiggers@google.com>,
        linux-arm-kernel@lists.infradead.org,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH v3 05/29] crypto: omap - switch to skcipher API
Date:   Tue,  5 Nov 2019 14:28:02 +0100
Message-Id: <20191105132826.1838-6-ardb@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191105132826.1838-1-ardb@kernel.org>
References: <20191105132826.1838-1-ardb@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Commit 7a7ffe65c8c5 ("crypto: skcipher - Add top-level skcipher interface")
dated 20 august 2015 introduced the new skcipher API which is supposed to
replace both blkcipher and ablkcipher. While all consumers of the API have
been converted long ago, some producers of the ablkcipher remain, forcing
us to keep the ablkcipher support routines alive, along with the matching
code to expose [a]blkciphers via the skcipher API.

So switch this driver to the skcipher API, allowing us to finally drop the
blkcipher code in the near future.

Cc: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org
Cc: Tero Kristo <t-kristo@ti.com>
Reviewed-by: Tero Kristo <t-kristo@ti.com>
Tested-by: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/crypto/omap-aes.c | 209 +++++++++---------
 drivers/crypto/omap-aes.h |   4 +-
 drivers/crypto/omap-des.c | 232 +++++++++-----------
 3 files changed, 207 insertions(+), 238 deletions(-)

diff --git a/drivers/crypto/omap-aes.c b/drivers/crypto/omap-aes.c
index 2f53fbb74100..a1fc03ed01f3 100644
--- a/drivers/crypto/omap-aes.c
+++ b/drivers/crypto/omap-aes.c
@@ -142,8 +142,8 @@ int omap_aes_write_ctrl(struct omap_aes_dev *dd)
 			__le32_to_cpu(dd->ctx->key[i]));
 	}
 
-	if ((dd->flags & (FLAGS_CBC | FLAGS_CTR)) && dd->req->info)
-		omap_aes_write_n(dd, AES_REG_IV(dd, 0), dd->req->info, 4);
+	if ((dd->flags & (FLAGS_CBC | FLAGS_CTR)) && dd->req->iv)
+		omap_aes_write_n(dd, AES_REG_IV(dd, 0), (void *)dd->req->iv, 4);
 
 	if ((dd->flags & (FLAGS_GCM)) && dd->aead_req->iv) {
 		rctx = aead_request_ctx(dd->aead_req);
@@ -382,11 +382,11 @@ int omap_aes_crypt_dma_start(struct omap_aes_dev *dd)
 
 static void omap_aes_finish_req(struct omap_aes_dev *dd, int err)
 {
-	struct ablkcipher_request *req = dd->req;
+	struct skcipher_request *req = dd->req;
 
 	pr_debug("err: %d\n", err);
 
-	crypto_finalize_ablkcipher_request(dd->engine, req, err);
+	crypto_finalize_skcipher_request(dd->engine, req, err);
 
 	pm_runtime_mark_last_busy(dd->dev);
 	pm_runtime_put_autosuspend(dd->dev);
@@ -403,10 +403,10 @@ int omap_aes_crypt_dma_stop(struct omap_aes_dev *dd)
 }
 
 static int omap_aes_handle_queue(struct omap_aes_dev *dd,
-				 struct ablkcipher_request *req)
+				 struct skcipher_request *req)
 {
 	if (req)
-		return crypto_transfer_ablkcipher_request_to_engine(dd->engine, req);
+		return crypto_transfer_skcipher_request_to_engine(dd->engine, req);
 
 	return 0;
 }
@@ -414,10 +414,10 @@ static int omap_aes_handle_queue(struct omap_aes_dev *dd,
 static int omap_aes_prepare_req(struct crypto_engine *engine,
 				void *areq)
 {
-	struct ablkcipher_request *req = container_of(areq, struct ablkcipher_request, base);
-	struct omap_aes_ctx *ctx = crypto_ablkcipher_ctx(
-			crypto_ablkcipher_reqtfm(req));
-	struct omap_aes_reqctx *rctx = ablkcipher_request_ctx(req);
+	struct skcipher_request *req = container_of(areq, struct skcipher_request, base);
+	struct omap_aes_ctx *ctx = crypto_skcipher_ctx(
+			crypto_skcipher_reqtfm(req));
+	struct omap_aes_reqctx *rctx = skcipher_request_ctx(req);
 	struct omap_aes_dev *dd = rctx->dd;
 	int ret;
 	u16 flags;
@@ -427,8 +427,8 @@ static int omap_aes_prepare_req(struct crypto_engine *engine,
 
 	/* assign new request to device */
 	dd->req = req;
-	dd->total = req->nbytes;
-	dd->total_save = req->nbytes;
+	dd->total = req->cryptlen;
+	dd->total_save = req->cryptlen;
 	dd->in_sg = req->src;
 	dd->out_sg = req->dst;
 	dd->orig_out = req->dst;
@@ -469,8 +469,8 @@ static int omap_aes_prepare_req(struct crypto_engine *engine,
 static int omap_aes_crypt_req(struct crypto_engine *engine,
 			      void *areq)
 {
-	struct ablkcipher_request *req = container_of(areq, struct ablkcipher_request, base);
-	struct omap_aes_reqctx *rctx = ablkcipher_request_ctx(req);
+	struct skcipher_request *req = container_of(areq, struct skcipher_request, base);
+	struct omap_aes_reqctx *rctx = skcipher_request_ctx(req);
 	struct omap_aes_dev *dd = rctx->dd;
 
 	if (!dd)
@@ -505,26 +505,26 @@ static void omap_aes_done_task(unsigned long data)
 	pr_debug("exit\n");
 }
 
-static int omap_aes_crypt(struct ablkcipher_request *req, unsigned long mode)
+static int omap_aes_crypt(struct skcipher_request *req, unsigned long mode)
 {
-	struct omap_aes_ctx *ctx = crypto_ablkcipher_ctx(
-			crypto_ablkcipher_reqtfm(req));
-	struct omap_aes_reqctx *rctx = ablkcipher_request_ctx(req);
+	struct omap_aes_ctx *ctx = crypto_skcipher_ctx(
+			crypto_skcipher_reqtfm(req));
+	struct omap_aes_reqctx *rctx = skcipher_request_ctx(req);
 	struct omap_aes_dev *dd;
 	int ret;
 
-	pr_debug("nbytes: %d, enc: %d, cbc: %d\n", req->nbytes,
+	pr_debug("nbytes: %d, enc: %d, cbc: %d\n", req->cryptlen,
 		  !!(mode & FLAGS_ENCRYPT),
 		  !!(mode & FLAGS_CBC));
 
-	if (req->nbytes < aes_fallback_sz) {
+	if (req->cryptlen < aes_fallback_sz) {
 		SYNC_SKCIPHER_REQUEST_ON_STACK(subreq, ctx->fallback);
 
 		skcipher_request_set_sync_tfm(subreq, ctx->fallback);
 		skcipher_request_set_callback(subreq, req->base.flags, NULL,
 					      NULL);
 		skcipher_request_set_crypt(subreq, req->src, req->dst,
-					   req->nbytes, req->info);
+					   req->cryptlen, req->iv);
 
 		if (mode & FLAGS_ENCRYPT)
 			ret = crypto_skcipher_encrypt(subreq);
@@ -545,10 +545,10 @@ static int omap_aes_crypt(struct ablkcipher_request *req, unsigned long mode)
 
 /* ********************** ALG API ************************************ */
 
-static int omap_aes_setkey(struct crypto_ablkcipher *tfm, const u8 *key,
+static int omap_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 			   unsigned int keylen)
 {
-	struct omap_aes_ctx *ctx = crypto_ablkcipher_ctx(tfm);
+	struct omap_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
 	int ret;
 
 	if (keylen != AES_KEYSIZE_128 && keylen != AES_KEYSIZE_192 &&
@@ -571,32 +571,32 @@ static int omap_aes_setkey(struct crypto_ablkcipher *tfm, const u8 *key,
 	return 0;
 }
 
-static int omap_aes_ecb_encrypt(struct ablkcipher_request *req)
+static int omap_aes_ecb_encrypt(struct skcipher_request *req)
 {
 	return omap_aes_crypt(req, FLAGS_ENCRYPT);
 }
 
-static int omap_aes_ecb_decrypt(struct ablkcipher_request *req)
+static int omap_aes_ecb_decrypt(struct skcipher_request *req)
 {
 	return omap_aes_crypt(req, 0);
 }
 
-static int omap_aes_cbc_encrypt(struct ablkcipher_request *req)
+static int omap_aes_cbc_encrypt(struct skcipher_request *req)
 {
 	return omap_aes_crypt(req, FLAGS_ENCRYPT | FLAGS_CBC);
 }
 
-static int omap_aes_cbc_decrypt(struct ablkcipher_request *req)
+static int omap_aes_cbc_decrypt(struct skcipher_request *req)
 {
 	return omap_aes_crypt(req, FLAGS_CBC);
 }
 
-static int omap_aes_ctr_encrypt(struct ablkcipher_request *req)
+static int omap_aes_ctr_encrypt(struct skcipher_request *req)
 {
 	return omap_aes_crypt(req, FLAGS_ENCRYPT | FLAGS_CTR);
 }
 
-static int omap_aes_ctr_decrypt(struct ablkcipher_request *req)
+static int omap_aes_ctr_decrypt(struct skcipher_request *req)
 {
 	return omap_aes_crypt(req, FLAGS_CTR);
 }
@@ -606,10 +606,10 @@ static int omap_aes_prepare_req(struct crypto_engine *engine,
 static int omap_aes_crypt_req(struct crypto_engine *engine,
 			      void *req);
 
-static int omap_aes_cra_init(struct crypto_tfm *tfm)
+static int omap_aes_init_tfm(struct crypto_skcipher *tfm)
 {
-	const char *name = crypto_tfm_alg_name(tfm);
-	struct omap_aes_ctx *ctx = crypto_tfm_ctx(tfm);
+	const char *name = crypto_tfm_alg_name(&tfm->base);
+	struct omap_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
 	struct crypto_sync_skcipher *blk;
 
 	blk = crypto_alloc_sync_skcipher(name, 0, CRYPTO_ALG_NEED_FALLBACK);
@@ -618,7 +618,7 @@ static int omap_aes_cra_init(struct crypto_tfm *tfm)
 
 	ctx->fallback = blk;
 
-	tfm->crt_ablkcipher.reqsize = sizeof(struct omap_aes_reqctx);
+	crypto_skcipher_set_reqsize(tfm, sizeof(struct omap_aes_reqctx));
 
 	ctx->enginectx.op.prepare_request = omap_aes_prepare_req;
 	ctx->enginectx.op.unprepare_request = NULL;
@@ -657,9 +657,9 @@ static int omap_aes_gcm_cra_init(struct crypto_aead *tfm)
 	return 0;
 }
 
-static void omap_aes_cra_exit(struct crypto_tfm *tfm)
+static void omap_aes_exit_tfm(struct crypto_skcipher *tfm)
 {
-	struct omap_aes_ctx *ctx = crypto_tfm_ctx(tfm);
+	struct omap_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
 
 	if (ctx->fallback)
 		crypto_free_sync_skcipher(ctx->fallback);
@@ -671,7 +671,10 @@ static void omap_aes_gcm_cra_exit(struct crypto_aead *tfm)
 {
 	struct omap_aes_ctx *ctx = crypto_aead_ctx(tfm);
 
-	omap_aes_cra_exit(crypto_aead_tfm(tfm));
+	if (ctx->fallback)
+		crypto_free_sync_skcipher(ctx->fallback);
+
+	ctx->fallback = NULL;
 
 	if (ctx->ctr)
 		crypto_free_skcipher(ctx->ctr);
@@ -679,78 +682,69 @@ static void omap_aes_gcm_cra_exit(struct crypto_aead *tfm)
 
 /* ********************** ALGS ************************************ */
 
-static struct crypto_alg algs_ecb_cbc[] = {
+static struct skcipher_alg algs_ecb_cbc[] = {
 {
-	.cra_name		= "ecb(aes)",
-	.cra_driver_name	= "ecb-aes-omap",
-	.cra_priority		= 300,
-	.cra_flags		= CRYPTO_ALG_TYPE_ABLKCIPHER |
-				  CRYPTO_ALG_KERN_DRIVER_ONLY |
-				  CRYPTO_ALG_ASYNC | CRYPTO_ALG_NEED_FALLBACK,
-	.cra_blocksize		= AES_BLOCK_SIZE,
-	.cra_ctxsize		= sizeof(struct omap_aes_ctx),
-	.cra_alignmask		= 0,
-	.cra_type		= &crypto_ablkcipher_type,
-	.cra_module		= THIS_MODULE,
-	.cra_init		= omap_aes_cra_init,
-	.cra_exit		= omap_aes_cra_exit,
-	.cra_u.ablkcipher = {
-		.min_keysize	= AES_MIN_KEY_SIZE,
-		.max_keysize	= AES_MAX_KEY_SIZE,
-		.setkey		= omap_aes_setkey,
-		.encrypt	= omap_aes_ecb_encrypt,
-		.decrypt	= omap_aes_ecb_decrypt,
-	}
+	.base.cra_name		= "ecb(aes)",
+	.base.cra_driver_name	= "ecb-aes-omap",
+	.base.cra_priority	= 300,
+	.base.cra_flags		= CRYPTO_ALG_KERN_DRIVER_ONLY |
+				  CRYPTO_ALG_ASYNC |
+				  CRYPTO_ALG_NEED_FALLBACK,
+	.base.cra_blocksize	= AES_BLOCK_SIZE,
+	.base.cra_ctxsize	= sizeof(struct omap_aes_ctx),
+	.base.cra_module	= THIS_MODULE,
+
+	.min_keysize		= AES_MIN_KEY_SIZE,
+	.max_keysize		= AES_MAX_KEY_SIZE,
+	.setkey			= omap_aes_setkey,
+	.encrypt		= omap_aes_ecb_encrypt,
+	.decrypt		= omap_aes_ecb_decrypt,
+	.init			= omap_aes_init_tfm,
+	.exit			= omap_aes_exit_tfm,
 },
 {
-	.cra_name		= "cbc(aes)",
-	.cra_driver_name	= "cbc-aes-omap",
-	.cra_priority		= 300,
-	.cra_flags		= CRYPTO_ALG_TYPE_ABLKCIPHER |
-				  CRYPTO_ALG_KERN_DRIVER_ONLY |
-				  CRYPTO_ALG_ASYNC | CRYPTO_ALG_NEED_FALLBACK,
-	.cra_blocksize		= AES_BLOCK_SIZE,
-	.cra_ctxsize		= sizeof(struct omap_aes_ctx),
-	.cra_alignmask		= 0,
-	.cra_type		= &crypto_ablkcipher_type,
-	.cra_module		= THIS_MODULE,
-	.cra_init		= omap_aes_cra_init,
-	.cra_exit		= omap_aes_cra_exit,
-	.cra_u.ablkcipher = {
-		.min_keysize	= AES_MIN_KEY_SIZE,
-		.max_keysize	= AES_MAX_KEY_SIZE,
-		.ivsize		= AES_BLOCK_SIZE,
-		.setkey		= omap_aes_setkey,
-		.encrypt	= omap_aes_cbc_encrypt,
-		.decrypt	= omap_aes_cbc_decrypt,
-	}
+	.base.cra_name		= "cbc(aes)",
+	.base.cra_driver_name	= "cbc-aes-omap",
+	.base.cra_priority	= 300,
+	.base.cra_flags		= CRYPTO_ALG_KERN_DRIVER_ONLY |
+				  CRYPTO_ALG_ASYNC |
+				  CRYPTO_ALG_NEED_FALLBACK,
+	.base.cra_blocksize	= AES_BLOCK_SIZE,
+	.base.cra_ctxsize	= sizeof(struct omap_aes_ctx),
+	.base.cra_module	= THIS_MODULE,
+
+	.min_keysize		= AES_MIN_KEY_SIZE,
+	.max_keysize		= AES_MAX_KEY_SIZE,
+	.ivsize			= AES_BLOCK_SIZE,
+	.setkey			= omap_aes_setkey,
+	.encrypt		= omap_aes_cbc_encrypt,
+	.decrypt		= omap_aes_cbc_decrypt,
+	.init			= omap_aes_init_tfm,
+	.exit			= omap_aes_exit_tfm,
 }
 };
 
-static struct crypto_alg algs_ctr[] = {
+static struct skcipher_alg algs_ctr[] = {
 {
-	.cra_name		= "ctr(aes)",
-	.cra_driver_name	= "ctr-aes-omap",
-	.cra_priority		= 300,
-	.cra_flags		= CRYPTO_ALG_TYPE_ABLKCIPHER |
-				  CRYPTO_ALG_KERN_DRIVER_ONLY |
-				  CRYPTO_ALG_ASYNC | CRYPTO_ALG_NEED_FALLBACK,
-	.cra_blocksize		= AES_BLOCK_SIZE,
-	.cra_ctxsize		= sizeof(struct omap_aes_ctx),
-	.cra_alignmask		= 0,
-	.cra_type		= &crypto_ablkcipher_type,
-	.cra_module		= THIS_MODULE,
-	.cra_init		= omap_aes_cra_init,
-	.cra_exit		= omap_aes_cra_exit,
-	.cra_u.ablkcipher = {
-		.min_keysize	= AES_MIN_KEY_SIZE,
-		.max_keysize	= AES_MAX_KEY_SIZE,
-		.ivsize		= AES_BLOCK_SIZE,
-		.setkey		= omap_aes_setkey,
-		.encrypt	= omap_aes_ctr_encrypt,
-		.decrypt	= omap_aes_ctr_decrypt,
-	}
-} ,
+	.base.cra_name		= "ctr(aes)",
+	.base.cra_driver_name	= "ctr-aes-omap",
+	.base.cra_priority	= 300,
+	.base.cra_flags		= CRYPTO_ALG_KERN_DRIVER_ONLY |
+				  CRYPTO_ALG_ASYNC |
+				  CRYPTO_ALG_NEED_FALLBACK,
+	.base.cra_blocksize	= AES_BLOCK_SIZE,
+	.base.cra_ctxsize	= sizeof(struct omap_aes_ctx),
+	.base.cra_module	= THIS_MODULE,
+
+	.min_keysize		= AES_MIN_KEY_SIZE,
+	.max_keysize		= AES_MAX_KEY_SIZE,
+	.ivsize			= AES_BLOCK_SIZE,
+	.setkey			= omap_aes_setkey,
+	.encrypt		= omap_aes_ctr_encrypt,
+	.decrypt		= omap_aes_ctr_decrypt,
+	.init			= omap_aes_init_tfm,
+	.exit			= omap_aes_exit_tfm,
+}
 };
 
 static struct omap_aes_algs_info omap_aes_algs_info_ecb_cbc[] = {
@@ -1121,7 +1115,7 @@ static int omap_aes_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct omap_aes_dev *dd;
-	struct crypto_alg *algp;
+	struct skcipher_alg *algp;
 	struct aead_alg *aalg;
 	struct resource res;
 	int err = -ENOMEM, i, j, irq = -1;
@@ -1215,9 +1209,9 @@ static int omap_aes_probe(struct platform_device *pdev)
 			for (j = 0; j < dd->pdata->algs_info[i].size; j++) {
 				algp = &dd->pdata->algs_info[i].algs_list[j];
 
-				pr_debug("reg alg: %s\n", algp->cra_name);
+				pr_debug("reg alg: %s\n", algp->base.cra_name);
 
-				err = crypto_register_alg(algp);
+				err = crypto_register_skcipher(algp);
 				if (err)
 					goto err_algs;
 
@@ -1230,9 +1224,8 @@ static int omap_aes_probe(struct platform_device *pdev)
 	    !dd->pdata->aead_algs_info->registered) {
 		for (i = 0; i < dd->pdata->aead_algs_info->size; i++) {
 			aalg = &dd->pdata->aead_algs_info->algs_list[i];
-			algp = &aalg->base;
 
-			pr_debug("reg alg: %s\n", algp->cra_name);
+			pr_debug("reg alg: %s\n", aalg->base.cra_name);
 
 			err = crypto_register_aead(aalg);
 			if (err)
@@ -1257,7 +1250,7 @@ static int omap_aes_probe(struct platform_device *pdev)
 err_algs:
 	for (i = dd->pdata->algs_info_size - 1; i >= 0; i--)
 		for (j = dd->pdata->algs_info[i].registered - 1; j >= 0; j--)
-			crypto_unregister_alg(
+			crypto_unregister_skcipher(
 					&dd->pdata->algs_info[i].algs_list[j]);
 
 err_engine:
@@ -1290,7 +1283,7 @@ static int omap_aes_remove(struct platform_device *pdev)
 
 	for (i = dd->pdata->algs_info_size - 1; i >= 0; i--)
 		for (j = dd->pdata->algs_info[i].registered - 1; j >= 0; j--)
-			crypto_unregister_alg(
+			crypto_unregister_skcipher(
 					&dd->pdata->algs_info[i].algs_list[j]);
 
 	for (i = dd->pdata->aead_algs_info->size - 1; i >= 0; i--) {
diff --git a/drivers/crypto/omap-aes.h b/drivers/crypto/omap-aes.h
index 2d4b1f87a1c9..2d3575231e31 100644
--- a/drivers/crypto/omap-aes.h
+++ b/drivers/crypto/omap-aes.h
@@ -112,7 +112,7 @@ struct omap_aes_reqctx {
 #define OMAP_AES_CACHE_SIZE	0
 
 struct omap_aes_algs_info {
-	struct crypto_alg	*algs_list;
+	struct skcipher_alg	*algs_list;
 	unsigned int		size;
 	unsigned int		registered;
 };
@@ -162,7 +162,7 @@ struct omap_aes_dev {
 	struct aead_queue	aead_queue;
 	spinlock_t		lock;
 
-	struct ablkcipher_request	*req;
+	struct skcipher_request		*req;
 	struct aead_request		*aead_req;
 	struct crypto_engine		*engine;
 
diff --git a/drivers/crypto/omap-des.c b/drivers/crypto/omap-des.c
index b19d7e5d55ec..4c4dbc2b377e 100644
--- a/drivers/crypto/omap-des.c
+++ b/drivers/crypto/omap-des.c
@@ -34,6 +34,7 @@
 #include <linux/interrupt.h>
 #include <crypto/scatterwalk.h>
 #include <crypto/internal/des.h>
+#include <crypto/internal/skcipher.h>
 #include <crypto/algapi.h>
 #include <crypto/engine.h>
 
@@ -98,7 +99,7 @@ struct omap_des_reqctx {
 #define OMAP_DES_CACHE_SIZE	0
 
 struct omap_des_algs_info {
-	struct crypto_alg	*algs_list;
+	struct skcipher_alg	*algs_list;
 	unsigned int		size;
 	unsigned int		registered;
 };
@@ -139,7 +140,7 @@ struct omap_des_dev {
 
 	struct tasklet_struct	done_task;
 
-	struct ablkcipher_request	*req;
+	struct skcipher_request	*req;
 	struct crypto_engine		*engine;
 	/*
 	 * total is used by PIO mode for book keeping so introduce
@@ -261,8 +262,8 @@ static int omap_des_write_ctrl(struct omap_des_dev *dd)
 			       __le32_to_cpu(dd->ctx->key[i]));
 	}
 
-	if ((dd->flags & FLAGS_CBC) && dd->req->info)
-		omap_des_write_n(dd, DES_REG_IV(dd, 0), dd->req->info, 2);
+	if ((dd->flags & FLAGS_CBC) && dd->req->iv)
+		omap_des_write_n(dd, DES_REG_IV(dd, 0), (void *)dd->req->iv, 2);
 
 	if (dd->flags & FLAGS_CBC)
 		val |= DES_REG_CTRL_CBC;
@@ -456,8 +457,8 @@ static int omap_des_crypt_dma(struct crypto_tfm *tfm,
 
 static int omap_des_crypt_dma_start(struct omap_des_dev *dd)
 {
-	struct crypto_tfm *tfm = crypto_ablkcipher_tfm(
-					crypto_ablkcipher_reqtfm(dd->req));
+	struct crypto_tfm *tfm = crypto_skcipher_tfm(
+					crypto_skcipher_reqtfm(dd->req));
 	int err;
 
 	pr_debug("total: %d\n", dd->total);
@@ -491,11 +492,11 @@ static int omap_des_crypt_dma_start(struct omap_des_dev *dd)
 
 static void omap_des_finish_req(struct omap_des_dev *dd, int err)
 {
-	struct ablkcipher_request *req = dd->req;
+	struct skcipher_request *req = dd->req;
 
 	pr_debug("err: %d\n", err);
 
-	crypto_finalize_ablkcipher_request(dd->engine, req, err);
+	crypto_finalize_skcipher_request(dd->engine, req, err);
 
 	pm_runtime_mark_last_busy(dd->dev);
 	pm_runtime_put_autosuspend(dd->dev);
@@ -514,10 +515,10 @@ static int omap_des_crypt_dma_stop(struct omap_des_dev *dd)
 }
 
 static int omap_des_handle_queue(struct omap_des_dev *dd,
-				 struct ablkcipher_request *req)
+				 struct skcipher_request *req)
 {
 	if (req)
-		return crypto_transfer_ablkcipher_request_to_engine(dd->engine, req);
+		return crypto_transfer_skcipher_request_to_engine(dd->engine, req);
 
 	return 0;
 }
@@ -525,9 +526,9 @@ static int omap_des_handle_queue(struct omap_des_dev *dd,
 static int omap_des_prepare_req(struct crypto_engine *engine,
 				void *areq)
 {
-	struct ablkcipher_request *req = container_of(areq, struct ablkcipher_request, base);
-	struct omap_des_ctx *ctx = crypto_ablkcipher_ctx(
-			crypto_ablkcipher_reqtfm(req));
+	struct skcipher_request *req = container_of(areq, struct skcipher_request, base);
+	struct omap_des_ctx *ctx = crypto_skcipher_ctx(
+			crypto_skcipher_reqtfm(req));
 	struct omap_des_dev *dd = omap_des_find_dev(ctx);
 	struct omap_des_reqctx *rctx;
 	int ret;
@@ -538,8 +539,8 @@ static int omap_des_prepare_req(struct crypto_engine *engine,
 
 	/* assign new request to device */
 	dd->req = req;
-	dd->total = req->nbytes;
-	dd->total_save = req->nbytes;
+	dd->total = req->cryptlen;
+	dd->total_save = req->cryptlen;
 	dd->in_sg = req->src;
 	dd->out_sg = req->dst;
 	dd->orig_out = req->dst;
@@ -568,8 +569,8 @@ static int omap_des_prepare_req(struct crypto_engine *engine,
 	if (dd->out_sg_len < 0)
 		return dd->out_sg_len;
 
-	rctx = ablkcipher_request_ctx(req);
-	ctx = crypto_ablkcipher_ctx(crypto_ablkcipher_reqtfm(req));
+	rctx = skcipher_request_ctx(req);
+	ctx = crypto_skcipher_ctx(crypto_skcipher_reqtfm(req));
 	rctx->mode &= FLAGS_MODE_MASK;
 	dd->flags = (dd->flags & ~FLAGS_MODE_MASK) | rctx->mode;
 
@@ -582,9 +583,9 @@ static int omap_des_prepare_req(struct crypto_engine *engine,
 static int omap_des_crypt_req(struct crypto_engine *engine,
 			      void *areq)
 {
-	struct ablkcipher_request *req = container_of(areq, struct ablkcipher_request, base);
-	struct omap_des_ctx *ctx = crypto_ablkcipher_ctx(
-			crypto_ablkcipher_reqtfm(req));
+	struct skcipher_request *req = container_of(areq, struct skcipher_request, base);
+	struct omap_des_ctx *ctx = crypto_skcipher_ctx(
+			crypto_skcipher_reqtfm(req));
 	struct omap_des_dev *dd = omap_des_find_dev(ctx);
 
 	if (!dd)
@@ -619,18 +620,18 @@ static void omap_des_done_task(unsigned long data)
 	pr_debug("exit\n");
 }
 
-static int omap_des_crypt(struct ablkcipher_request *req, unsigned long mode)
+static int omap_des_crypt(struct skcipher_request *req, unsigned long mode)
 {
-	struct omap_des_ctx *ctx = crypto_ablkcipher_ctx(
-			crypto_ablkcipher_reqtfm(req));
-	struct omap_des_reqctx *rctx = ablkcipher_request_ctx(req);
+	struct omap_des_ctx *ctx = crypto_skcipher_ctx(
+			crypto_skcipher_reqtfm(req));
+	struct omap_des_reqctx *rctx = skcipher_request_ctx(req);
 	struct omap_des_dev *dd;
 
-	pr_debug("nbytes: %d, enc: %d, cbc: %d\n", req->nbytes,
+	pr_debug("nbytes: %d, enc: %d, cbc: %d\n", req->cryptlen,
 		 !!(mode & FLAGS_ENCRYPT),
 		 !!(mode & FLAGS_CBC));
 
-	if (!IS_ALIGNED(req->nbytes, DES_BLOCK_SIZE)) {
+	if (!IS_ALIGNED(req->cryptlen, DES_BLOCK_SIZE)) {
 		pr_err("request size is not exact amount of DES blocks\n");
 		return -EINVAL;
 	}
@@ -646,15 +647,15 @@ static int omap_des_crypt(struct ablkcipher_request *req, unsigned long mode)
 
 /* ********************** ALG API ************************************ */
 
-static int omap_des_setkey(struct crypto_ablkcipher *cipher, const u8 *key,
+static int omap_des_setkey(struct crypto_skcipher *cipher, const u8 *key,
 			   unsigned int keylen)
 {
-	struct omap_des_ctx *ctx = crypto_ablkcipher_ctx(cipher);
+	struct omap_des_ctx *ctx = crypto_skcipher_ctx(cipher);
 	int err;
 
 	pr_debug("enter, keylen: %d\n", keylen);
 
-	err = verify_ablkcipher_des_key(cipher, key);
+	err = verify_skcipher_des_key(cipher, key);
 	if (err)
 		return err;
 
@@ -664,15 +665,15 @@ static int omap_des_setkey(struct crypto_ablkcipher *cipher, const u8 *key,
 	return 0;
 }
 
-static int omap_des3_setkey(struct crypto_ablkcipher *cipher, const u8 *key,
+static int omap_des3_setkey(struct crypto_skcipher *cipher, const u8 *key,
 			    unsigned int keylen)
 {
-	struct omap_des_ctx *ctx = crypto_ablkcipher_ctx(cipher);
+	struct omap_des_ctx *ctx = crypto_skcipher_ctx(cipher);
 	int err;
 
 	pr_debug("enter, keylen: %d\n", keylen);
 
-	err = verify_ablkcipher_des3_key(cipher, key);
+	err = verify_skcipher_des3_key(cipher, key);
 	if (err)
 		return err;
 
@@ -682,22 +683,22 @@ static int omap_des3_setkey(struct crypto_ablkcipher *cipher, const u8 *key,
 	return 0;
 }
 
-static int omap_des_ecb_encrypt(struct ablkcipher_request *req)
+static int omap_des_ecb_encrypt(struct skcipher_request *req)
 {
 	return omap_des_crypt(req, FLAGS_ENCRYPT);
 }
 
-static int omap_des_ecb_decrypt(struct ablkcipher_request *req)
+static int omap_des_ecb_decrypt(struct skcipher_request *req)
 {
 	return omap_des_crypt(req, 0);
 }
 
-static int omap_des_cbc_encrypt(struct ablkcipher_request *req)
+static int omap_des_cbc_encrypt(struct skcipher_request *req)
 {
 	return omap_des_crypt(req, FLAGS_ENCRYPT | FLAGS_CBC);
 }
 
-static int omap_des_cbc_decrypt(struct ablkcipher_request *req)
+static int omap_des_cbc_decrypt(struct skcipher_request *req)
 {
 	return omap_des_crypt(req, FLAGS_CBC);
 }
@@ -707,13 +708,13 @@ static int omap_des_prepare_req(struct crypto_engine *engine,
 static int omap_des_crypt_req(struct crypto_engine *engine,
 			      void *areq);
 
-static int omap_des_cra_init(struct crypto_tfm *tfm)
+static int omap_des_init_tfm(struct crypto_skcipher *tfm)
 {
-	struct omap_des_ctx *ctx = crypto_tfm_ctx(tfm);
+	struct omap_des_ctx *ctx = crypto_skcipher_ctx(tfm);
 
 	pr_debug("enter\n");
 
-	tfm->crt_ablkcipher.reqsize = sizeof(struct omap_des_reqctx);
+	crypto_skcipher_set_reqsize(tfm, sizeof(struct omap_des_reqctx));
 
 	ctx->enginectx.op.prepare_request = omap_des_prepare_req;
 	ctx->enginectx.op.unprepare_request = NULL;
@@ -722,103 +723,78 @@ static int omap_des_cra_init(struct crypto_tfm *tfm)
 	return 0;
 }
 
-static void omap_des_cra_exit(struct crypto_tfm *tfm)
-{
-	pr_debug("enter\n");
-}
-
 /* ********************** ALGS ************************************ */
 
-static struct crypto_alg algs_ecb_cbc[] = {
+static struct skcipher_alg algs_ecb_cbc[] = {
 {
-	.cra_name		= "ecb(des)",
-	.cra_driver_name	= "ecb-des-omap",
-	.cra_priority		= 100,
-	.cra_flags		= CRYPTO_ALG_TYPE_ABLKCIPHER |
-				  CRYPTO_ALG_KERN_DRIVER_ONLY |
+	.base.cra_name		= "ecb(des)",
+	.base.cra_driver_name	= "ecb-des-omap",
+	.base.cra_priority	= 100,
+	.base.cra_flags		= CRYPTO_ALG_KERN_DRIVER_ONLY |
 				  CRYPTO_ALG_ASYNC,
-	.cra_blocksize		= DES_BLOCK_SIZE,
-	.cra_ctxsize		= sizeof(struct omap_des_ctx),
-	.cra_alignmask		= 0,
-	.cra_type		= &crypto_ablkcipher_type,
-	.cra_module		= THIS_MODULE,
-	.cra_init		= omap_des_cra_init,
-	.cra_exit		= omap_des_cra_exit,
-	.cra_u.ablkcipher = {
-		.min_keysize	= DES_KEY_SIZE,
-		.max_keysize	= DES_KEY_SIZE,
-		.setkey		= omap_des_setkey,
-		.encrypt	= omap_des_ecb_encrypt,
-		.decrypt	= omap_des_ecb_decrypt,
-	}
+	.base.cra_blocksize	= DES_BLOCK_SIZE,
+	.base.cra_ctxsize	= sizeof(struct omap_des_ctx),
+	.base.cra_module	= THIS_MODULE,
+
+	.min_keysize		= DES_KEY_SIZE,
+	.max_keysize		= DES_KEY_SIZE,
+	.setkey			= omap_des_setkey,
+	.encrypt		= omap_des_ecb_encrypt,
+	.decrypt		= omap_des_ecb_decrypt,
+	.init			= omap_des_init_tfm,
 },
 {
-	.cra_name		= "cbc(des)",
-	.cra_driver_name	= "cbc-des-omap",
-	.cra_priority		= 100,
-	.cra_flags		= CRYPTO_ALG_TYPE_ABLKCIPHER |
-				  CRYPTO_ALG_KERN_DRIVER_ONLY |
+	.base.cra_name		= "cbc(des)",
+	.base.cra_driver_name	= "cbc-des-omap",
+	.base.cra_priority	= 100,
+	.base.cra_flags		= CRYPTO_ALG_KERN_DRIVER_ONLY |
 				  CRYPTO_ALG_ASYNC,
-	.cra_blocksize		= DES_BLOCK_SIZE,
-	.cra_ctxsize		= sizeof(struct omap_des_ctx),
-	.cra_alignmask		= 0,
-	.cra_type		= &crypto_ablkcipher_type,
-	.cra_module		= THIS_MODULE,
-	.cra_init		= omap_des_cra_init,
-	.cra_exit		= omap_des_cra_exit,
-	.cra_u.ablkcipher = {
-		.min_keysize	= DES_KEY_SIZE,
-		.max_keysize	= DES_KEY_SIZE,
-		.ivsize		= DES_BLOCK_SIZE,
-		.setkey		= omap_des_setkey,
-		.encrypt	= omap_des_cbc_encrypt,
-		.decrypt	= omap_des_cbc_decrypt,
-	}
+	.base.cra_blocksize	= DES_BLOCK_SIZE,
+	.base.cra_ctxsize	= sizeof(struct omap_des_ctx),
+	.base.cra_module	= THIS_MODULE,
+
+	.min_keysize		= DES_KEY_SIZE,
+	.max_keysize		= DES_KEY_SIZE,
+	.ivsize			= DES_BLOCK_SIZE,
+	.setkey			= omap_des_setkey,
+	.encrypt		= omap_des_cbc_encrypt,
+	.decrypt		= omap_des_cbc_decrypt,
+	.init			= omap_des_init_tfm,
 },
 {
-	.cra_name		= "ecb(des3_ede)",
-	.cra_driver_name	= "ecb-des3-omap",
-	.cra_priority		= 100,
-	.cra_flags		= CRYPTO_ALG_TYPE_ABLKCIPHER |
-				  CRYPTO_ALG_KERN_DRIVER_ONLY |
+	.base.cra_name		= "ecb(des3_ede)",
+	.base.cra_driver_name	= "ecb-des3-omap",
+	.base.cra_priority	= 100,
+	.base.cra_flags		= CRYPTO_ALG_KERN_DRIVER_ONLY |
 				  CRYPTO_ALG_ASYNC,
-	.cra_blocksize		= DES_BLOCK_SIZE,
-	.cra_ctxsize		= sizeof(struct omap_des_ctx),
-	.cra_alignmask		= 0,
-	.cra_type		= &crypto_ablkcipher_type,
-	.cra_module		= THIS_MODULE,
-	.cra_init		= omap_des_cra_init,
-	.cra_exit		= omap_des_cra_exit,
-	.cra_u.ablkcipher = {
-		.min_keysize	= 3*DES_KEY_SIZE,
-		.max_keysize	= 3*DES_KEY_SIZE,
-		.setkey		= omap_des3_setkey,
-		.encrypt	= omap_des_ecb_encrypt,
-		.decrypt	= omap_des_ecb_decrypt,
-	}
+	.base.cra_blocksize	= DES3_EDE_BLOCK_SIZE,
+	.base.cra_ctxsize	= sizeof(struct omap_des_ctx),
+	.base.cra_module	= THIS_MODULE,
+
+	.min_keysize		= DES3_EDE_KEY_SIZE,
+	.max_keysize		= DES3_EDE_KEY_SIZE,
+	.setkey			= omap_des3_setkey,
+	.encrypt		= omap_des_ecb_encrypt,
+	.decrypt		= omap_des_ecb_decrypt,
+	.init			= omap_des_init_tfm,
 },
 {
-	.cra_name		= "cbc(des3_ede)",
-	.cra_driver_name	= "cbc-des3-omap",
-	.cra_priority		= 100,
-	.cra_flags		= CRYPTO_ALG_TYPE_ABLKCIPHER |
-				  CRYPTO_ALG_KERN_DRIVER_ONLY |
+	.base.cra_name		= "cbc(des3_ede)",
+	.base.cra_driver_name	= "cbc-des3-omap",
+	.base.cra_priority	= 100,
+	.base.cra_flags		= CRYPTO_ALG_KERN_DRIVER_ONLY |
 				  CRYPTO_ALG_ASYNC,
-	.cra_blocksize		= DES_BLOCK_SIZE,
-	.cra_ctxsize		= sizeof(struct omap_des_ctx),
-	.cra_alignmask		= 0,
-	.cra_type		= &crypto_ablkcipher_type,
-	.cra_module		= THIS_MODULE,
-	.cra_init		= omap_des_cra_init,
-	.cra_exit		= omap_des_cra_exit,
-	.cra_u.ablkcipher = {
-		.min_keysize	= 3*DES_KEY_SIZE,
-		.max_keysize	= 3*DES_KEY_SIZE,
-		.ivsize		= DES_BLOCK_SIZE,
-		.setkey		= omap_des3_setkey,
-		.encrypt	= omap_des_cbc_encrypt,
-		.decrypt	= omap_des_cbc_decrypt,
-	}
+	.base.cra_blocksize	= DES3_EDE_BLOCK_SIZE,
+	.base.cra_ctxsize	= sizeof(struct omap_des_ctx),
+	.base.cra_module	= THIS_MODULE,
+
+	.min_keysize		= DES3_EDE_KEY_SIZE,
+	.max_keysize		= DES3_EDE_KEY_SIZE,
+	.ivsize			= DES3_EDE_BLOCK_SIZE,
+	.setkey			= omap_des3_setkey,
+	.encrypt		= omap_des_cbc_encrypt,
+	.decrypt		= omap_des_cbc_decrypt,
+	.init			= omap_des_init_tfm,
 }
 };
 
@@ -976,7 +952,7 @@ static int omap_des_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct omap_des_dev *dd;
-	struct crypto_alg *algp;
+	struct skcipher_alg *algp;
 	struct resource *res;
 	int err = -ENOMEM, i, j, irq = -1;
 	u32 reg;
@@ -1071,9 +1047,9 @@ static int omap_des_probe(struct platform_device *pdev)
 		for (j = 0; j < dd->pdata->algs_info[i].size; j++) {
 			algp = &dd->pdata->algs_info[i].algs_list[j];
 
-			pr_debug("reg alg: %s\n", algp->cra_name);
+			pr_debug("reg alg: %s\n", algp->base.cra_name);
 
-			err = crypto_register_alg(algp);
+			err = crypto_register_skcipher(algp);
 			if (err)
 				goto err_algs;
 
@@ -1086,7 +1062,7 @@ static int omap_des_probe(struct platform_device *pdev)
 err_algs:
 	for (i = dd->pdata->algs_info_size - 1; i >= 0; i--)
 		for (j = dd->pdata->algs_info[i].registered - 1; j >= 0; j--)
-			crypto_unregister_alg(
+			crypto_unregister_skcipher(
 					&dd->pdata->algs_info[i].algs_list[j]);
 
 err_engine:
@@ -1119,7 +1095,7 @@ static int omap_des_remove(struct platform_device *pdev)
 
 	for (i = dd->pdata->algs_info_size - 1; i >= 0; i--)
 		for (j = dd->pdata->algs_info[i].registered - 1; j >= 0; j--)
-			crypto_unregister_alg(
+			crypto_unregister_skcipher(
 					&dd->pdata->algs_info[i].algs_list[j]);
 
 	tasklet_kill(&dd->done_task);
-- 
2.20.1

