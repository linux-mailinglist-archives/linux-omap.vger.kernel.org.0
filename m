Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C41BEFF4B
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2019 15:02:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389434AbfKEOCA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Nov 2019 09:02:00 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:44044 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389421AbfKEOCA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Nov 2019 09:02:00 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1rvY071630;
        Tue, 5 Nov 2019 08:01:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572962513;
        bh=LmAyLnfz8YM25OuVd13njs2VbIXOcCSwKLiFJrFKgBI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=wB5X9yexbeeiGItPyVJeTOmWUa19DpRAkIvLYFqBxTMam50eeeb3StnQR5r9tZkfC
         buwRcn1t1WHIXXeaZeZu+C1Y34wgRz4LT4fJ/7iDIAlgvFNE6qrWnc/NQTV6rmEaFC
         IwDDglM+goq8FWz2bxSRNCmbsY+OToqyOUzFlAxI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA5E1rEs059930
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 5 Nov 2019 08:01:53 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 5 Nov
 2019 08:01:38 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 5 Nov 2019 08:01:52 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1FFt068289;
        Tue, 5 Nov 2019 08:01:51 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>, <ard.biesheuvel@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCHv2 16/22] crypto: omap-aes-gcm - use the AES library to encrypt the tag
Date:   Tue, 5 Nov 2019 16:01:05 +0200
Message-ID: <20191105140111.20285-17-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191105140111.20285-1-t-kristo@ti.com>
References: <20191105140111.20285-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Ard Biesheuvel <ardb@kernel.org>

The OMAP AES-GCM implementation uses a fallback ecb(aes) skcipher to
produce the keystream to encrypt the output tag. Let's use the new
AES library instead - this is much simpler, and shouldn't affect
performance given that it only involves a single block.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Tero Kristo <t-kristo@ti.com>
Tested-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-aes-gcm.c | 98 +++++++++--------------------------
 drivers/crypto/omap-aes.c     | 26 +---------
 drivers/crypto/omap-aes.h     |  7 ++-
 3 files changed, 33 insertions(+), 98 deletions(-)

diff --git a/drivers/crypto/omap-aes-gcm.c b/drivers/crypto/omap-aes-gcm.c
index 1aabf9a72066..6da05149b195 100644
--- a/drivers/crypto/omap-aes-gcm.c
+++ b/drivers/crypto/omap-aes-gcm.c
@@ -167,62 +167,12 @@ static int omap_aes_gcm_copy_buffers(struct omap_aes_dev *dd,
 	return 0;
 }
 
-static void omap_aes_gcm_complete(struct crypto_async_request *req, int err)
-{
-	struct omap_aes_gcm_result *res = req->data;
-
-	if (err == -EINPROGRESS)
-		return;
-
-	res->err = err;
-	complete(&res->completion);
-}
-
 static int do_encrypt_iv(struct aead_request *req, u32 *tag, u32 *iv)
 {
-	struct scatterlist iv_sg, tag_sg;
-	struct skcipher_request *sk_req;
-	struct omap_aes_gcm_result result;
-	struct omap_aes_ctx *ctx = crypto_aead_ctx(crypto_aead_reqtfm(req));
-	int ret = 0;
-
-	sk_req = skcipher_request_alloc(ctx->ctr, GFP_KERNEL);
-	if (!sk_req) {
-		pr_err("skcipher: Failed to allocate request\n");
-		return -ENOMEM;
-	}
-
-	init_completion(&result.completion);
-
-	sg_init_one(&iv_sg, iv, AES_BLOCK_SIZE);
-	sg_init_one(&tag_sg, tag, AES_BLOCK_SIZE);
-	skcipher_request_set_callback(sk_req, CRYPTO_TFM_REQ_MAY_BACKLOG,
-				      omap_aes_gcm_complete, &result);
-	ret = crypto_skcipher_setkey(ctx->ctr, (u8 *)ctx->key, ctx->keylen);
-	skcipher_request_set_crypt(sk_req, &iv_sg, &tag_sg, AES_BLOCK_SIZE,
-				   NULL);
-	ret = crypto_skcipher_encrypt(sk_req);
-	switch (ret) {
-	case 0:
-		break;
-	case -EINPROGRESS:
-	case -EBUSY:
-		ret = wait_for_completion_interruptible(&result.completion);
-		if (!ret) {
-			ret = result.err;
-			if (!ret) {
-				reinit_completion(&result.completion);
-				break;
-			}
-		}
-		/* fall through */
-	default:
-		pr_err("Encryption of IV failed for GCM mode\n");
-		break;
-	}
+	struct omap_aes_gcm_ctx *ctx = crypto_aead_ctx(crypto_aead_reqtfm(req));
 
-	skcipher_request_free(sk_req);
-	return ret;
+	aes_encrypt(&ctx->actx, (u8 *)tag, (u8 *)iv);
+	return 0;
 }
 
 void omap_aes_gcm_dma_out_callback(void *data)
@@ -252,7 +202,7 @@ void omap_aes_gcm_dma_out_callback(void *data)
 static int omap_aes_gcm_handle_queue(struct omap_aes_dev *dd,
 				     struct aead_request *req)
 {
-	struct omap_aes_ctx *ctx;
+	struct omap_aes_gcm_ctx *ctx;
 	struct aead_request *backlog;
 	struct omap_aes_reqctx *rctx;
 	unsigned long flags;
@@ -281,7 +231,7 @@ static int omap_aes_gcm_handle_queue(struct omap_aes_dev *dd,
 	ctx = crypto_aead_ctx(crypto_aead_reqtfm(req));
 	rctx = aead_request_ctx(req);
 
-	dd->ctx = ctx;
+	dd->ctx = &ctx->octx;
 	rctx->dd = dd;
 	dd->aead_req = req;
 
@@ -360,10 +310,10 @@ int omap_aes_gcm_decrypt(struct aead_request *req)
 
 int omap_aes_4106gcm_encrypt(struct aead_request *req)
 {
-	struct omap_aes_ctx *ctx = crypto_aead_ctx(crypto_aead_reqtfm(req));
+	struct omap_aes_gcm_ctx *ctx = crypto_aead_ctx(crypto_aead_reqtfm(req));
 	struct omap_aes_reqctx *rctx = aead_request_ctx(req);
 
-	memcpy(rctx->iv, ctx->nonce, 4);
+	memcpy(rctx->iv, ctx->octx.nonce, 4);
 	memcpy(rctx->iv + 4, req->iv, 8);
 	return crypto_ipsec_check_assoclen(req->assoclen) ?:
 	       omap_aes_gcm_crypt(req, FLAGS_ENCRYPT | FLAGS_GCM |
@@ -372,10 +322,10 @@ int omap_aes_4106gcm_encrypt(struct aead_request *req)
 
 int omap_aes_4106gcm_decrypt(struct aead_request *req)
 {
-	struct omap_aes_ctx *ctx = crypto_aead_ctx(crypto_aead_reqtfm(req));
+	struct omap_aes_gcm_ctx *ctx = crypto_aead_ctx(crypto_aead_reqtfm(req));
 	struct omap_aes_reqctx *rctx = aead_request_ctx(req);
 
-	memcpy(rctx->iv, ctx->nonce, 4);
+	memcpy(rctx->iv, ctx->octx.nonce, 4);
 	memcpy(rctx->iv + 4, req->iv, 8);
 	return crypto_ipsec_check_assoclen(req->assoclen) ?:
 	       omap_aes_gcm_crypt(req, FLAGS_GCM | FLAGS_RFC4106_GCM);
@@ -384,14 +334,15 @@ int omap_aes_4106gcm_decrypt(struct aead_request *req)
 int omap_aes_gcm_setkey(struct crypto_aead *tfm, const u8 *key,
 			unsigned int keylen)
 {
-	struct omap_aes_ctx *ctx = crypto_aead_ctx(tfm);
+	struct omap_aes_gcm_ctx *ctx = crypto_aead_ctx(tfm);
+	int ret;
 
-	if (keylen != AES_KEYSIZE_128 && keylen != AES_KEYSIZE_192 &&
-	    keylen != AES_KEYSIZE_256)
-		return -EINVAL;
+	ret = aes_expandkey(&ctx->actx, key, keylen);
+	if (ret)
+		return ret;
 
-	memcpy(ctx->key, key, keylen);
-	ctx->keylen = keylen;
+	memcpy(ctx->octx.key, key, keylen);
+	ctx->octx.keylen = keylen;
 
 	return 0;
 }
@@ -399,19 +350,20 @@ int omap_aes_gcm_setkey(struct crypto_aead *tfm, const u8 *key,
 int omap_aes_4106gcm_setkey(struct crypto_aead *tfm, const u8 *key,
 			    unsigned int keylen)
 {
-	struct omap_aes_ctx *ctx = crypto_aead_ctx(tfm);
+	struct omap_aes_gcm_ctx *ctx = crypto_aead_ctx(tfm);
+	int ret;
 
 	if (keylen < 4)
 		return -EINVAL;
-
 	keylen -= 4;
-	if (keylen != AES_KEYSIZE_128 && keylen != AES_KEYSIZE_192 &&
-	    keylen != AES_KEYSIZE_256)
-		return -EINVAL;
 
-	memcpy(ctx->key, key, keylen);
-	memcpy(ctx->nonce, key + keylen, 4);
-	ctx->keylen = keylen;
+	ret = aes_expandkey(&ctx->actx, key, keylen);
+	if (ret)
+		return ret;
+
+	memcpy(ctx->octx.key, key, keylen);
+	memcpy(ctx->octx.nonce, key + keylen, 4);
+	ctx->octx.keylen = keylen;
 
 	return 0;
 }
diff --git a/drivers/crypto/omap-aes.c b/drivers/crypto/omap-aes.c
index 161af3bf667c..d63ab370030e 100644
--- a/drivers/crypto/omap-aes.c
+++ b/drivers/crypto/omap-aes.c
@@ -645,7 +645,6 @@ static int omap_aes_init_tfm(struct crypto_skcipher *tfm)
 static int omap_aes_gcm_cra_init(struct crypto_aead *tfm)
 {
 	struct omap_aes_dev *dd = NULL;
-	struct omap_aes_ctx *ctx = crypto_aead_ctx(tfm);
 	int err;
 
 	/* Find AES device, currently picks the first device */
@@ -663,12 +662,6 @@ static int omap_aes_gcm_cra_init(struct crypto_aead *tfm)
 	}
 
 	tfm->reqsize = sizeof(struct omap_aes_reqctx);
-	ctx->ctr = crypto_alloc_skcipher("ecb(aes)", 0, 0);
-	if (IS_ERR(ctx->ctr)) {
-		pr_warn("could not load aes driver for encrypting IV\n");
-		return PTR_ERR(ctx->ctr);
-	}
-
 	return 0;
 }
 
@@ -682,19 +675,6 @@ static void omap_aes_exit_tfm(struct crypto_skcipher *tfm)
 	ctx->fallback = NULL;
 }
 
-static void omap_aes_gcm_cra_exit(struct crypto_aead *tfm)
-{
-	struct omap_aes_ctx *ctx = crypto_aead_ctx(tfm);
-
-	if (ctx->fallback)
-		crypto_free_sync_skcipher(ctx->fallback);
-
-	ctx->fallback = NULL;
-
-	if (ctx->ctr)
-		crypto_free_skcipher(ctx->ctr);
-}
-
 /* ********************** ALGS ************************************ */
 
 static struct skcipher_alg algs_ecb_cbc[] = {
@@ -778,12 +758,11 @@ static struct aead_alg algs_aead_gcm[] = {
 		.cra_flags		= CRYPTO_ALG_ASYNC |
 					  CRYPTO_ALG_KERN_DRIVER_ONLY,
 		.cra_blocksize		= 1,
-		.cra_ctxsize		= sizeof(struct omap_aes_ctx),
+		.cra_ctxsize		= sizeof(struct omap_aes_gcm_ctx),
 		.cra_alignmask		= 0xf,
 		.cra_module		= THIS_MODULE,
 	},
 	.init		= omap_aes_gcm_cra_init,
-	.exit		= omap_aes_gcm_cra_exit,
 	.ivsize		= GCM_AES_IV_SIZE,
 	.maxauthsize	= AES_BLOCK_SIZE,
 	.setkey		= omap_aes_gcm_setkey,
@@ -799,12 +778,11 @@ static struct aead_alg algs_aead_gcm[] = {
 		.cra_flags		= CRYPTO_ALG_ASYNC |
 					  CRYPTO_ALG_KERN_DRIVER_ONLY,
 		.cra_blocksize		= 1,
-		.cra_ctxsize		= sizeof(struct omap_aes_ctx),
+		.cra_ctxsize		= sizeof(struct omap_aes_gcm_ctx),
 		.cra_alignmask		= 0xf,
 		.cra_module		= THIS_MODULE,
 	},
 	.init		= omap_aes_gcm_cra_init,
-	.exit		= omap_aes_gcm_cra_exit,
 	.maxauthsize	= AES_BLOCK_SIZE,
 	.ivsize		= GCM_RFC4106_IV_SIZE,
 	.setkey		= omap_aes_4106gcm_setkey,
diff --git a/drivers/crypto/omap-aes.h b/drivers/crypto/omap-aes.h
index 1bcca7957e92..b89d2e673699 100644
--- a/drivers/crypto/omap-aes.h
+++ b/drivers/crypto/omap-aes.h
@@ -9,6 +9,7 @@
 #ifndef __OMAP_AES_H__
 #define __OMAP_AES_H__
 
+#include <crypto/aes.h>
 #include <crypto/engine.h>
 
 #define DST_MAXBURST			4
@@ -98,7 +99,11 @@ struct omap_aes_ctx {
 	u32		key[AES_KEYSIZE_256 / sizeof(u32)];
 	u8		nonce[4];
 	struct crypto_sync_skcipher	*fallback;
-	struct crypto_skcipher	*ctr;
+};
+
+struct omap_aes_gcm_ctx {
+	struct omap_aes_ctx	octx;
+	struct crypto_aes_ctx	actx;
 };
 
 struct omap_aes_reqctx {
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
