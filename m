Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47B5C209EB8
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jun 2020 14:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404724AbgFYMng (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Jun 2020 08:43:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:45916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404285AbgFYMng (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 25 Jun 2020 08:43:36 -0400
Received: from localhost.localdomain (lfbn-nic-1-188-42.w2-15.abo.wanadoo.fr [2.15.37.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ACD8320857;
        Thu, 25 Jun 2020 12:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593089015;
        bh=hood+SBSrfD8rlAvUlszp6fbHnc3dUB49g4uRq5KZac=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XQtmLNpj/XMLhmv27k6PpfLv9k5QCNBz3Op+LSMmPHZhuWFmbZv+z8CdBQBp9SURh
         7OIIpUfsC8LIFh/0p4k+vFWwCzlWlmuEnHXC8aNhIj4MQgocQo/5bDL4imQYKwZyhS
         +NAgiY3UHxUm9isxqRhPWy6iKfEag1R5RVq5Pdmw=
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
Subject: [PATCH 04/12] crypto: sun4i - permit asynchronous skcipher as fallback
Date:   Thu, 25 Jun 2020 14:42:45 +0200
Message-Id: <20200625124253.1906557-5-ardb@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625124253.1906557-1-ardb@kernel.org>
References: <20200625124253.1906557-1-ardb@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Even though the sun4i driver implements asynchronous versions of ecb(aes)
and cbc(aes), the fallbacks it allocates are required to be synchronous.
Given that SIMD based software implementations are usually asynchronous
as well, even though they rarely complete asynchronously (this typically
only happens in cases where the request was made from softirq context,
while SIMD was already in use in the task context that it interrupted),
these implementations are disregarded, and either the generic C version
or another table based version implemented in assembler is selected
instead.

Since falling back to synchronous AES is not only a performance issue, but
potentially a security issue as well (due to the fact that table based AES
is not time invariant), let's fix this, by allocating an ordinary skcipher
as the fallback, and invoke it with the completion routine that was given
to the outer request.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/crypto/allwinner/sun4i-ss/sun4i-ss-cipher.c | 46 ++++++++++----------
 drivers/crypto/allwinner/sun4i-ss/sun4i-ss.h        |  3 +-
 2 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-cipher.c b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-cipher.c
index 7f22d305178e..b72de8939497 100644
--- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-cipher.c
+++ b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-cipher.c
@@ -122,19 +122,17 @@ static int noinline_for_stack sun4i_ss_cipher_poll_fallback(struct skcipher_requ
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
 	struct sun4i_tfm_ctx *op = crypto_skcipher_ctx(tfm);
 	struct sun4i_cipher_req_ctx *ctx = skcipher_request_ctx(areq);
-	SYNC_SKCIPHER_REQUEST_ON_STACK(subreq, op->fallback_tfm);
 	int err;
 
-	skcipher_request_set_sync_tfm(subreq, op->fallback_tfm);
-	skcipher_request_set_callback(subreq, areq->base.flags, NULL,
-				      NULL);
-	skcipher_request_set_crypt(subreq, areq->src, areq->dst,
+	skcipher_request_set_tfm(&ctx->fallback_req, op->fallback_tfm);
+	skcipher_request_set_callback(&ctx->fallback_req, areq->base.flags,
+				      areq->base.complete, areq->base.data);
+	skcipher_request_set_crypt(&ctx->fallback_req, areq->src, areq->dst,
 				   areq->cryptlen, areq->iv);
 	if (ctx->mode & SS_DECRYPTION)
-		err = crypto_skcipher_decrypt(subreq);
+		err = crypto_skcipher_decrypt(&ctx->fallback_req);
 	else
-		err = crypto_skcipher_encrypt(subreq);
-	skcipher_request_zero(subreq);
+		err = crypto_skcipher_encrypt(&ctx->fallback_req);
 
 	return err;
 }
@@ -494,23 +492,25 @@ int sun4i_ss_cipher_init(struct crypto_tfm *tfm)
 			    alg.crypto.base);
 	op->ss = algt->ss;
 
-	crypto_skcipher_set_reqsize(__crypto_skcipher_cast(tfm),
-				    sizeof(struct sun4i_cipher_req_ctx));
-
-	op->fallback_tfm = crypto_alloc_sync_skcipher(name, 0, CRYPTO_ALG_NEED_FALLBACK);
+	op->fallback_tfm = crypto_alloc_skcipher(name, 0, CRYPTO_ALG_NEED_FALLBACK);
 	if (IS_ERR(op->fallback_tfm)) {
 		dev_err(op->ss->dev, "ERROR: Cannot allocate fallback for %s %ld\n",
 			name, PTR_ERR(op->fallback_tfm));
 		return PTR_ERR(op->fallback_tfm);
 	}
 
+	crypto_skcipher_set_reqsize(__crypto_skcipher_cast(tfm),
+				    sizeof(struct sun4i_cipher_req_ctx) +
+				    crypto_skcipher_reqsize(op->fallback_tfm));
+
+
 	err = pm_runtime_get_sync(op->ss->dev);
 	if (err < 0)
 		goto error_pm;
 
 	return 0;
 error_pm:
-	crypto_free_sync_skcipher(op->fallback_tfm);
+	crypto_free_skcipher(op->fallback_tfm);
 	return err;
 }
 
@@ -518,7 +518,7 @@ void sun4i_ss_cipher_exit(struct crypto_tfm *tfm)
 {
 	struct sun4i_tfm_ctx *op = crypto_tfm_ctx(tfm);
 
-	crypto_free_sync_skcipher(op->fallback_tfm);
+	crypto_free_skcipher(op->fallback_tfm);
 	pm_runtime_put(op->ss->dev);
 }
 
@@ -546,10 +546,10 @@ int sun4i_ss_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	op->keylen = keylen;
 	memcpy(op->key, key, keylen);
 
-	crypto_sync_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
-	crypto_sync_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
+	crypto_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
+	crypto_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
 
-	return crypto_sync_skcipher_setkey(op->fallback_tfm, key, keylen);
+	return crypto_skcipher_setkey(op->fallback_tfm, key, keylen);
 }
 
 /* check and set the DES key, prepare the mode to be used */
@@ -566,10 +566,10 @@ int sun4i_ss_des_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	op->keylen = keylen;
 	memcpy(op->key, key, keylen);
 
-	crypto_sync_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
-	crypto_sync_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
+	crypto_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
+	crypto_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
 
-	return crypto_sync_skcipher_setkey(op->fallback_tfm, key, keylen);
+	return crypto_skcipher_setkey(op->fallback_tfm, key, keylen);
 }
 
 /* check and set the 3DES key, prepare the mode to be used */
@@ -586,9 +586,9 @@ int sun4i_ss_des3_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	op->keylen = keylen;
 	memcpy(op->key, key, keylen);
 
-	crypto_sync_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
-	crypto_sync_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
+	crypto_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
+	crypto_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
 
-	return crypto_sync_skcipher_setkey(op->fallback_tfm, key, keylen);
+	return crypto_skcipher_setkey(op->fallback_tfm, key, keylen);
 
 }
diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss.h b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss.h
index 2b4c6333eb67..163962f9e284 100644
--- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss.h
+++ b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss.h
@@ -170,11 +170,12 @@ struct sun4i_tfm_ctx {
 	u32 keylen;
 	u32 keymode;
 	struct sun4i_ss_ctx *ss;
-	struct crypto_sync_skcipher *fallback_tfm;
+	struct crypto_skcipher *fallback_tfm;
 };
 
 struct sun4i_cipher_req_ctx {
 	u32 mode;
+	struct skcipher_request fallback_req;   // keep at the end
 };
 
 struct sun4i_req_ctx {
-- 
2.27.0

