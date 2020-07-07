Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2531121667B
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jul 2020 08:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbgGGGdx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jul 2020 02:33:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:33510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726918AbgGGGdx (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 7 Jul 2020 02:33:53 -0400
Received: from e123331-lin.nice.arm.com (adsl-70.109.242.21.tellas.gr [109.242.21.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 22FC420720;
        Tue,  7 Jul 2020 06:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594103632;
        bh=ekMmUEk57IWIVLdeC/FPKJ37rO2LDoa6ulxYIG3Nhm0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=xG7zDEO17MqXqaF5Jg51yylMwUUPWhDB9YY6TxnfyQZXPk2zal2Tf61NLCKfNsSRg
         NpcrLMmwl4GMvdp7kKcimJO90VlthSFO5mHQU/X2qcxEFBPRJXCkRjAJG84dzLjkCR
         9BztoCm5zP1VU8pel7wKTjJ5IogGQXPa/ebMqqBE=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     linux-crypto@vger.kernel.org
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Corentin Labbe <clabbe.montjoie@gmail.com>,
        Corentin Labbe <clabbe@baylibre.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        John Allen <john.allen@amd.com>,
        Ayush Sawal <ayush.sawal@chelsio.com>,
        Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
        Rohit Maheshwari <rohitm@chelsio.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Jamie Iles <jamie@jamieiles.com>,
        Eric Biggers <ebiggers@google.com>,
        Tero Kristo <t-kristo@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-amlogic@lists.infradead.org
Subject: [PATCH v4 10/13] crypto: picoxcell - permit asynchronous skcipher as fallback
Date:   Tue,  7 Jul 2020 09:32:00 +0300
Message-Id: <20200707063203.5018-11-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200707063203.5018-1-ardb@kernel.org>
References: <20200707063203.5018-1-ardb@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Even though the picoxcell driver implements asynchronous versions of
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
Reviewed-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/crypto/picoxcell_crypto.c | 38 +++++++++++---------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/crypto/picoxcell_crypto.c b/drivers/crypto/picoxcell_crypto.c
index 7384e91c8b32..13503e16ce1d 100644
--- a/drivers/crypto/picoxcell_crypto.c
+++ b/drivers/crypto/picoxcell_crypto.c
@@ -86,6 +86,7 @@ struct spacc_req {
 	dma_addr_t			src_addr, dst_addr;
 	struct spacc_ddt		*src_ddt, *dst_ddt;
 	void				(*complete)(struct spacc_req *req);
+	struct skcipher_request		fallback_req;	// keep at the end
 };
 
 struct spacc_aead {
@@ -158,7 +159,7 @@ struct spacc_ablk_ctx {
 	 * The fallback cipher. If the operation can't be done in hardware,
 	 * fallback to a software version.
 	 */
-	struct crypto_sync_skcipher	*sw_cipher;
+	struct crypto_skcipher		*sw_cipher;
 };
 
 /* AEAD cipher context. */
@@ -792,13 +793,13 @@ static int spacc_aes_setkey(struct crypto_skcipher *cipher, const u8 *key,
 		 * Set the fallback transform to use the same request flags as
 		 * the hardware transform.
 		 */
-		crypto_sync_skcipher_clear_flags(ctx->sw_cipher,
+		crypto_skcipher_clear_flags(ctx->sw_cipher,
 					    CRYPTO_TFM_REQ_MASK);
-		crypto_sync_skcipher_set_flags(ctx->sw_cipher,
+		crypto_skcipher_set_flags(ctx->sw_cipher,
 					  cipher->base.crt_flags &
 					  CRYPTO_TFM_REQ_MASK);
 
-		err = crypto_sync_skcipher_setkey(ctx->sw_cipher, key, len);
+		err = crypto_skcipher_setkey(ctx->sw_cipher, key, len);
 		if (err)
 			goto sw_setkey_failed;
 	}
@@ -900,7 +901,7 @@ static int spacc_ablk_do_fallback(struct skcipher_request *req,
 	struct crypto_tfm *old_tfm =
 	    crypto_skcipher_tfm(crypto_skcipher_reqtfm(req));
 	struct spacc_ablk_ctx *ctx = crypto_tfm_ctx(old_tfm);
-	SYNC_SKCIPHER_REQUEST_ON_STACK(subreq, ctx->sw_cipher);
+	struct spacc_req *dev_req = skcipher_request_ctx(req);
 	int err;
 
 	/*
@@ -908,13 +909,13 @@ static int spacc_ablk_do_fallback(struct skcipher_request *req,
 	 * the ciphering has completed, put the old transform back into the
 	 * request.
 	 */
-	skcipher_request_set_sync_tfm(subreq, ctx->sw_cipher);
-	skcipher_request_set_callback(subreq, req->base.flags, NULL, NULL);
-	skcipher_request_set_crypt(subreq, req->src, req->dst,
+	skcipher_request_set_tfm(&dev_req->fallback_req, ctx->sw_cipher);
+	skcipher_request_set_callback(&dev_req->fallback_req, req->base.flags,
+				      req->base.complete, req->base.data);
+	skcipher_request_set_crypt(&dev_req->fallback_req, req->src, req->dst,
 				   req->cryptlen, req->iv);
-	err = is_encrypt ? crypto_skcipher_encrypt(subreq) :
-			   crypto_skcipher_decrypt(subreq);
-	skcipher_request_zero(subreq);
+	err = is_encrypt ? crypto_skcipher_encrypt(&dev_req->fallback_req) :
+			   crypto_skcipher_decrypt(&dev_req->fallback_req);
 
 	return err;
 }
@@ -1007,19 +1008,24 @@ static int spacc_ablk_init_tfm(struct crypto_skcipher *tfm)
 	ctx->generic.flags = spacc_alg->type;
 	ctx->generic.engine = engine;
 	if (alg->base.cra_flags & CRYPTO_ALG_NEED_FALLBACK) {
-		ctx->sw_cipher = crypto_alloc_sync_skcipher(
-			alg->base.cra_name, 0, CRYPTO_ALG_NEED_FALLBACK);
+		ctx->sw_cipher = crypto_alloc_skcipher(alg->base.cra_name, 0,
+						       CRYPTO_ALG_NEED_FALLBACK);
 		if (IS_ERR(ctx->sw_cipher)) {
 			dev_warn(engine->dev, "failed to allocate fallback for %s\n",
 				 alg->base.cra_name);
 			return PTR_ERR(ctx->sw_cipher);
 		}
+		crypto_skcipher_set_reqsize(tfm, sizeof(struct spacc_req) +
+						 crypto_skcipher_reqsize(ctx->sw_cipher));
+	} else {
+		/* take the size without the fallback skcipher_request at the end */
+		crypto_skcipher_set_reqsize(tfm, offsetof(struct spacc_req,
+							  fallback_req));
 	}
+
 	ctx->generic.key_offs = spacc_alg->key_offs;
 	ctx->generic.iv_offs = spacc_alg->iv_offs;
 
-	crypto_skcipher_set_reqsize(tfm, sizeof(struct spacc_req));
-
 	return 0;
 }
 
@@ -1027,7 +1033,7 @@ static void spacc_ablk_exit_tfm(struct crypto_skcipher *tfm)
 {
 	struct spacc_ablk_ctx *ctx = crypto_skcipher_ctx(tfm);
 
-	crypto_free_sync_skcipher(ctx->sw_cipher);
+	crypto_free_skcipher(ctx->sw_cipher);
 }
 
 static int spacc_ablk_encrypt(struct skcipher_request *req)
-- 
2.17.1

