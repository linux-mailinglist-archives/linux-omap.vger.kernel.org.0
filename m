Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B282209EC2
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jun 2020 14:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404575AbgFYMnw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Jun 2020 08:43:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:46198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404285AbgFYMnw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 25 Jun 2020 08:43:52 -0400
Received: from localhost.localdomain (lfbn-nic-1-188-42.w2-15.abo.wanadoo.fr [2.15.37.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D4FEB207E8;
        Thu, 25 Jun 2020 12:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593089031;
        bh=u3/i0Ai3PMvuNylvohLoEd68csg/Is/hfnIaNyDzZf8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XLJUCThru6iwLOTic9LzGUq7TrHZm9SwEWCblY4Vq8peu8rT19wXpZmxZITPtlFOm
         z/ZQySk9C6qkuemwmHUz4/JBD2x+oxVL5o5lTkqOdRhuBjzGaKzZO3WtxD5PzlHLUX
         f4JizI95+ZbBsTvPz2H6GfYAGTrEueaOa0Znwzvk=
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
Subject: [PATCH 08/12] crypto: chelsio - permit asynchronous skcipher as fallback
Date:   Thu, 25 Jun 2020 14:42:49 +0200
Message-Id: <20200625124253.1906557-9-ardb@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625124253.1906557-1-ardb@kernel.org>
References: <20200625124253.1906557-1-ardb@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Even though the chelsio driver implements asynchronous versions of
cbc(aes) and xts(aes), the fallbacks it allocates are required to be
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
 drivers/crypto/chelsio/chcr_algo.c   | 57 ++++++++------------
 drivers/crypto/chelsio/chcr_crypto.h |  3 +-
 2 files changed, 25 insertions(+), 35 deletions(-)

diff --git a/drivers/crypto/chelsio/chcr_algo.c b/drivers/crypto/chelsio/chcr_algo.c
index 4c2553672b6f..a6625b90fb1a 100644
--- a/drivers/crypto/chelsio/chcr_algo.c
+++ b/drivers/crypto/chelsio/chcr_algo.c
@@ -690,26 +690,22 @@ static int chcr_sg_ent_in_wr(struct scatterlist *src,
 	return min(srclen, dstlen);
 }
 
-static int chcr_cipher_fallback(struct crypto_sync_skcipher *cipher,
-				u32 flags,
-				struct scatterlist *src,
-				struct scatterlist *dst,
-				unsigned int nbytes,
+static int chcr_cipher_fallback(struct crypto_skcipher *cipher,
+				struct skcipher_request *req,
 				u8 *iv,
 				unsigned short op_type)
 {
+	struct chcr_skcipher_req_ctx *reqctx = skcipher_request_ctx(req);
 	int err;
 
-	SYNC_SKCIPHER_REQUEST_ON_STACK(subreq, cipher);
-
-	skcipher_request_set_sync_tfm(subreq, cipher);
-	skcipher_request_set_callback(subreq, flags, NULL, NULL);
-	skcipher_request_set_crypt(subreq, src, dst,
-				   nbytes, iv);
+	skcipher_request_set_tfm(&reqctx->fallback_req, cipher);
+	skcipher_request_set_callback(&reqctx->fallback_req, req->base.flags,
+				      req->base.complete, req->base.data);
+	skcipher_request_set_crypt(&reqctx->fallback_req, req->src, req->dst,
+				   req->cryptlen, iv);
 
-	err = op_type ? crypto_skcipher_decrypt(subreq) :
-		crypto_skcipher_encrypt(subreq);
-	skcipher_request_zero(subreq);
+	err = op_type ? crypto_skcipher_decrypt(&reqctx->fallback_req) :
+			crypto_skcipher_encrypt(&reqctx->fallback_req);
 
 	return err;
 
@@ -924,11 +920,11 @@ static int chcr_cipher_fallback_setkey(struct crypto_skcipher *cipher,
 {
 	struct ablk_ctx *ablkctx = ABLK_CTX(c_ctx(cipher));
 
-	crypto_sync_skcipher_clear_flags(ablkctx->sw_cipher,
+	crypto_skcipher_clear_flags(ablkctx->sw_cipher,
 				CRYPTO_TFM_REQ_MASK);
-	crypto_sync_skcipher_set_flags(ablkctx->sw_cipher,
+	crypto_skcipher_set_flags(ablkctx->sw_cipher,
 				cipher->base.crt_flags & CRYPTO_TFM_REQ_MASK);
-	return crypto_sync_skcipher_setkey(ablkctx->sw_cipher, key, keylen);
+	return crypto_skcipher_setkey(ablkctx->sw_cipher, key, keylen);
 }
 
 static int chcr_aes_cbc_setkey(struct crypto_skcipher *cipher,
@@ -1206,13 +1202,8 @@ static int chcr_handle_cipher_resp(struct skcipher_request *req,
 				      req);
 		memcpy(req->iv, reqctx->init_iv, IV);
 		atomic_inc(&adap->chcr_stats.fallback);
-		err = chcr_cipher_fallback(ablkctx->sw_cipher,
-				     req->base.flags,
-				     req->src,
-				     req->dst,
-				     req->cryptlen,
-				     req->iv,
-				     reqctx->op);
+		err = chcr_cipher_fallback(ablkctx->sw_cipher, req, req->iv,
+					   reqctx->op);
 		goto complete;
 	}
 
@@ -1341,11 +1332,7 @@ static int process_cipher(struct skcipher_request *req,
 		chcr_cipher_dma_unmap(&ULD_CTX(c_ctx(tfm))->lldi.pdev->dev,
 				      req);
 fallback:       atomic_inc(&adap->chcr_stats.fallback);
-		err = chcr_cipher_fallback(ablkctx->sw_cipher,
-					   req->base.flags,
-					   req->src,
-					   req->dst,
-					   req->cryptlen,
+		err = chcr_cipher_fallback(ablkctx->sw_cipher, req,
 					   subtype ==
 					   CRYPTO_ALG_SUB_TYPE_CTR_RFC3686 ?
 					   reqctx->iv : req->iv,
@@ -1486,14 +1473,15 @@ static int chcr_init_tfm(struct crypto_skcipher *tfm)
 	struct chcr_context *ctx = crypto_skcipher_ctx(tfm);
 	struct ablk_ctx *ablkctx = ABLK_CTX(ctx);
 
-	ablkctx->sw_cipher = crypto_alloc_sync_skcipher(alg->base.cra_name, 0,
+	ablkctx->sw_cipher = crypto_alloc_skcipher(alg->base.cra_name, 0,
 				CRYPTO_ALG_NEED_FALLBACK);
 	if (IS_ERR(ablkctx->sw_cipher)) {
 		pr_err("failed to allocate fallback for %s\n", alg->base.cra_name);
 		return PTR_ERR(ablkctx->sw_cipher);
 	}
 	init_completion(&ctx->cbc_aes_aio_done);
-	crypto_skcipher_set_reqsize(tfm, sizeof(struct chcr_skcipher_req_ctx));
+	crypto_skcipher_set_reqsize(tfm, sizeof(struct chcr_skcipher_req_ctx) +
+					 crypto_skcipher_reqsize(ablkctx->sw_cipher));
 
 	return chcr_device_init(ctx);
 }
@@ -1507,13 +1495,14 @@ static int chcr_rfc3686_init(struct crypto_skcipher *tfm)
 	/*RFC3686 initialises IV counter value to 1, rfc3686(ctr(aes))
 	 * cannot be used as fallback in chcr_handle_cipher_response
 	 */
-	ablkctx->sw_cipher = crypto_alloc_sync_skcipher("ctr(aes)", 0,
+	ablkctx->sw_cipher = crypto_alloc_skcipher("ctr(aes)", 0,
 				CRYPTO_ALG_NEED_FALLBACK);
 	if (IS_ERR(ablkctx->sw_cipher)) {
 		pr_err("failed to allocate fallback for %s\n", alg->base.cra_name);
 		return PTR_ERR(ablkctx->sw_cipher);
 	}
-	crypto_skcipher_set_reqsize(tfm, sizeof(struct chcr_skcipher_req_ctx));
+	crypto_skcipher_set_reqsize(tfm, sizeof(struct chcr_skcipher_req_ctx) +
+				    crypto_skcipher_reqsize(ablkctx->sw_cipher));
 	return chcr_device_init(ctx);
 }
 
@@ -1523,7 +1512,7 @@ static void chcr_exit_tfm(struct crypto_skcipher *tfm)
 	struct chcr_context *ctx = crypto_skcipher_ctx(tfm);
 	struct ablk_ctx *ablkctx = ABLK_CTX(ctx);
 
-	crypto_free_sync_skcipher(ablkctx->sw_cipher);
+	crypto_free_skcipher(ablkctx->sw_cipher);
 }
 
 static int get_alg_config(struct algo_param *params,
diff --git a/drivers/crypto/chelsio/chcr_crypto.h b/drivers/crypto/chelsio/chcr_crypto.h
index 31e427e273f8..e89f9e0094b4 100644
--- a/drivers/crypto/chelsio/chcr_crypto.h
+++ b/drivers/crypto/chelsio/chcr_crypto.h
@@ -171,7 +171,7 @@ static inline struct chcr_context *h_ctx(struct crypto_ahash *tfm)
 }
 
 struct ablk_ctx {
-	struct crypto_sync_skcipher *sw_cipher;
+	struct crypto_skcipher *sw_cipher;
 	__be32 key_ctx_hdr;
 	unsigned int enckey_len;
 	unsigned char ciph_mode;
@@ -305,6 +305,7 @@ struct chcr_skcipher_req_ctx {
 	u8 init_iv[CHCR_MAX_CRYPTO_IV_LEN];
 	u16 txqidx;
 	u16 rxqidx;
+	struct skcipher_request fallback_req;	// keep at the end
 };
 
 struct chcr_alg_template {
-- 
2.27.0

