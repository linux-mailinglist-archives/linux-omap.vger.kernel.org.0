Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11127209ECC
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jun 2020 14:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404792AbgFYMoM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Jun 2020 08:44:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:46520 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404755AbgFYMoI (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 25 Jun 2020 08:44:08 -0400
Received: from localhost.localdomain (lfbn-nic-1-188-42.w2-15.abo.wanadoo.fr [2.15.37.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 03531206BE;
        Thu, 25 Jun 2020 12:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593089047;
        bh=1mKbpa4I4Sh07AGQPoHxLj1RNd0nCGZ8qWt4DEk3uDw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EtSqpxr5/UQ9Ntco1uUPIcviLv6ya5Mu71Nnggl7PMTeIeA0sjbtLYU14mpmVEN2o
         EbvVdfOb4JRPemi3FcNe2EsCV3/iZIaUYEiLW3bo1H/2x3PuvrMrV5O80eNtBL46o7
         zWfXGJzR0Od3k+p6GdnIBmGt1X8YSZHg5+uk1HDo=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     linux-crypto@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        Ard Biesheuvel <ardb@kernel.org>,
        Corentin Labbe <clabbe.montjoie@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Ayush Sawal <ayush.sawal@chelsio.com>,
        Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
        Rohit Maheshwari <rohitm@chelsio.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Jamie Iles <jamie@jamieiles.com>,
        Eric Biggers <ebiggers@google.com>
Subject: [PATCH 12/12] crypto: sahara - permit asynchronous skcipher as fallback
Date:   Thu, 25 Jun 2020 14:42:53 +0200
Message-Id: <20200625124253.1906557-13-ardb@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625124253.1906557-1-ardb@kernel.org>
References: <20200625124253.1906557-1-ardb@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Even though the sahara driver implements asynchronous versions of
ecb(aes) and cbc(aes), the fallbacks it allocates are required to be
synchronous. Given that SIMD based software implementations are usually
asynchronous as well, even though they rarely complete asynchronously
(this typically only happens in cases where the request was made from
softirq context, while SIMD was already in use in the task context that
it interrupted), these implementations are disregarded, and either the
generic C version or another table based version implemented in assembler
is selected instead.

Since falling back to synchronous AES is not only a performance issue, but
potentially a security issue as well (due to the fact that table based AES
is not time invariant), let's fix this, by allocating an ordinary skcipher
as the fallback, and invoke it with the completion routine that was given
to the outer request.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/crypto/sahara.c | 96 +++++++++-----------
 1 file changed, 45 insertions(+), 51 deletions(-)

diff --git a/drivers/crypto/sahara.c b/drivers/crypto/sahara.c
index 466e30bd529c..0c8cb23ae708 100644
--- a/drivers/crypto/sahara.c
+++ b/drivers/crypto/sahara.c
@@ -146,11 +146,12 @@ struct sahara_ctx {
 	/* AES-specific context */
 	int keylen;
 	u8 key[AES_KEYSIZE_128];
-	struct crypto_sync_skcipher *fallback;
+	struct crypto_skcipher *fallback;
 };
 
 struct sahara_aes_reqctx {
 	unsigned long mode;
+	struct skcipher_request fallback_req;	// keep at the end
 };
 
 /*
@@ -617,10 +618,10 @@ static int sahara_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	/*
 	 * The requested key size is not supported by HW, do a fallback.
 	 */
-	crypto_sync_skcipher_clear_flags(ctx->fallback, CRYPTO_TFM_REQ_MASK);
-	crypto_sync_skcipher_set_flags(ctx->fallback, tfm->base.crt_flags &
+	crypto_skcipher_clear_flags(ctx->fallback, CRYPTO_TFM_REQ_MASK);
+	crypto_skcipher_set_flags(ctx->fallback, tfm->base.crt_flags &
 						 CRYPTO_TFM_REQ_MASK);
-	return crypto_sync_skcipher_setkey(ctx->fallback, key, keylen);
+	return crypto_skcipher_setkey(ctx->fallback, key, keylen);
 }
 
 static int sahara_aes_crypt(struct skcipher_request *req, unsigned long mode)
@@ -651,21 +652,19 @@ static int sahara_aes_crypt(struct skcipher_request *req, unsigned long mode)
 
 static int sahara_aes_ecb_encrypt(struct skcipher_request *req)
 {
+	struct sahara_aes_reqctx *rctx = skcipher_request_ctx(req);
 	struct sahara_ctx *ctx = crypto_skcipher_ctx(
 		crypto_skcipher_reqtfm(req));
-	int err;
 
 	if (unlikely(ctx->keylen != AES_KEYSIZE_128)) {
-		SYNC_SKCIPHER_REQUEST_ON_STACK(subreq, ctx->fallback);
-
-		skcipher_request_set_sync_tfm(subreq, ctx->fallback);
-		skcipher_request_set_callback(subreq, req->base.flags,
-					      NULL, NULL);
-		skcipher_request_set_crypt(subreq, req->src, req->dst,
-					   req->cryptlen, req->iv);
-		err = crypto_skcipher_encrypt(subreq);
-		skcipher_request_zero(subreq);
-		return err;
+		skcipher_request_set_tfm(&rctx->fallback_req, ctx->fallback);
+		skcipher_request_set_callback(&rctx->fallback_req,
+					      req->base.flags,
+					      req->base.complete,
+					      req->base.data);
+		skcipher_request_set_crypt(&rctx->fallback_req, req->src,
+					   req->dst, req->cryptlen, req->iv);
+		return crypto_skcipher_encrypt(&rctx->fallback_req);
 	}
 
 	return sahara_aes_crypt(req, FLAGS_ENCRYPT);
@@ -673,21 +672,19 @@ static int sahara_aes_ecb_encrypt(struct skcipher_request *req)
 
 static int sahara_aes_ecb_decrypt(struct skcipher_request *req)
 {
+	struct sahara_aes_reqctx *rctx = skcipher_request_ctx(req);
 	struct sahara_ctx *ctx = crypto_skcipher_ctx(
 		crypto_skcipher_reqtfm(req));
-	int err;
 
 	if (unlikely(ctx->keylen != AES_KEYSIZE_128)) {
-		SYNC_SKCIPHER_REQUEST_ON_STACK(subreq, ctx->fallback);
-
-		skcipher_request_set_sync_tfm(subreq, ctx->fallback);
-		skcipher_request_set_callback(subreq, req->base.flags,
-					      NULL, NULL);
-		skcipher_request_set_crypt(subreq, req->src, req->dst,
-					   req->cryptlen, req->iv);
-		err = crypto_skcipher_decrypt(subreq);
-		skcipher_request_zero(subreq);
-		return err;
+		skcipher_request_set_tfm(&rctx->fallback_req, ctx->fallback);
+		skcipher_request_set_callback(&rctx->fallback_req,
+					      req->base.flags,
+					      req->base.complete,
+					      req->base.data);
+		skcipher_request_set_crypt(&rctx->fallback_req, req->src,
+					   req->dst, req->cryptlen, req->iv);
+		return crypto_skcipher_decrypt(&rctx->fallback_req);
 	}
 
 	return sahara_aes_crypt(req, 0);
@@ -695,21 +692,19 @@ static int sahara_aes_ecb_decrypt(struct skcipher_request *req)
 
 static int sahara_aes_cbc_encrypt(struct skcipher_request *req)
 {
+	struct sahara_aes_reqctx *rctx = skcipher_request_ctx(req);
 	struct sahara_ctx *ctx = crypto_skcipher_ctx(
 		crypto_skcipher_reqtfm(req));
-	int err;
 
 	if (unlikely(ctx->keylen != AES_KEYSIZE_128)) {
-		SYNC_SKCIPHER_REQUEST_ON_STACK(subreq, ctx->fallback);
-
-		skcipher_request_set_sync_tfm(subreq, ctx->fallback);
-		skcipher_request_set_callback(subreq, req->base.flags,
-					      NULL, NULL);
-		skcipher_request_set_crypt(subreq, req->src, req->dst,
-					   req->cryptlen, req->iv);
-		err = crypto_skcipher_encrypt(subreq);
-		skcipher_request_zero(subreq);
-		return err;
+		skcipher_request_set_tfm(&rctx->fallback_req, ctx->fallback);
+		skcipher_request_set_callback(&rctx->fallback_req,
+					      req->base.flags,
+					      req->base.complete,
+					      req->base.data);
+		skcipher_request_set_crypt(&rctx->fallback_req, req->src,
+					   req->dst, req->cryptlen, req->iv);
+		return crypto_skcipher_encrypt(&rctx->fallback_req);
 	}
 
 	return sahara_aes_crypt(req, FLAGS_ENCRYPT | FLAGS_CBC);
@@ -717,21 +712,19 @@ static int sahara_aes_cbc_encrypt(struct skcipher_request *req)
 
 static int sahara_aes_cbc_decrypt(struct skcipher_request *req)
 {
+	struct sahara_aes_reqctx *rctx = skcipher_request_ctx(req);
 	struct sahara_ctx *ctx = crypto_skcipher_ctx(
 		crypto_skcipher_reqtfm(req));
-	int err;
 
 	if (unlikely(ctx->keylen != AES_KEYSIZE_128)) {
-		SYNC_SKCIPHER_REQUEST_ON_STACK(subreq, ctx->fallback);
-
-		skcipher_request_set_sync_tfm(subreq, ctx->fallback);
-		skcipher_request_set_callback(subreq, req->base.flags,
-					      NULL, NULL);
-		skcipher_request_set_crypt(subreq, req->src, req->dst,
-					   req->cryptlen, req->iv);
-		err = crypto_skcipher_decrypt(subreq);
-		skcipher_request_zero(subreq);
-		return err;
+		skcipher_request_set_tfm(&rctx->fallback_req, ctx->fallback);
+		skcipher_request_set_callback(&rctx->fallback_req,
+					      req->base.flags,
+					      req->base.complete,
+					      req->base.data);
+		skcipher_request_set_crypt(&rctx->fallback_req, req->src,
+					   req->dst, req->cryptlen, req->iv);
+		return crypto_skcipher_decrypt(&rctx->fallback_req);
 	}
 
 	return sahara_aes_crypt(req, FLAGS_CBC);
@@ -742,14 +735,15 @@ static int sahara_aes_init_tfm(struct crypto_skcipher *tfm)
 	const char *name = crypto_tfm_alg_name(&tfm->base);
 	struct sahara_ctx *ctx = crypto_skcipher_ctx(tfm);
 
-	ctx->fallback = crypto_alloc_sync_skcipher(name, 0,
+	ctx->fallback = crypto_alloc_skcipher(name, 0,
 					      CRYPTO_ALG_NEED_FALLBACK);
 	if (IS_ERR(ctx->fallback)) {
 		pr_err("Error allocating fallback algo %s\n", name);
 		return PTR_ERR(ctx->fallback);
 	}
 
-	crypto_skcipher_set_reqsize(tfm, sizeof(struct sahara_aes_reqctx));
+	crypto_skcipher_set_reqsize(tfm, sizeof(struct sahara_aes_reqctx) +
+					 crypto_skcipher_reqsize(ctx->fallback));
 
 	return 0;
 }
@@ -758,7 +752,7 @@ static void sahara_aes_exit_tfm(struct crypto_skcipher *tfm)
 {
 	struct sahara_ctx *ctx = crypto_skcipher_ctx(tfm);
 
-	crypto_free_sync_skcipher(ctx->fallback);
+	crypto_free_skcipher(ctx->fallback);
 }
 
 static u32 sahara_sha_init_hdr(struct sahara_dev *dev,
-- 
2.27.0

