Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63AA8209EBD
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jun 2020 14:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404704AbgFYMno (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Jun 2020 08:43:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:46040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404285AbgFYMno (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 25 Jun 2020 08:43:44 -0400
Received: from localhost.localdomain (lfbn-nic-1-188-42.w2-15.abo.wanadoo.fr [2.15.37.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C452C20724;
        Thu, 25 Jun 2020 12:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593089023;
        bh=tpcze3XSHyZPREkPUbsCkWhR8rfSX5Y6bvgG9Oth1A8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=faSHLjmLd+sYk6+dbz3dDtMmv4gu21dpcl0Osqg+RPTeHNfKcw+NYwpetM1+GirGA
         qXdDkPinNhGH07GkQTx1BSt282xVq/fwVTk6JOOAkCe7aay+djvqIpwLOfnsb+zEOf
         MRe4obOkf0QbhU1zwaI/Kiw0J/F1fppxRNkfUtDE=
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
Subject: [PATCH 06/12] crypto: sun8i-ss - permit asynchronous skcipher as fallback
Date:   Thu, 25 Jun 2020 14:42:47 +0200
Message-Id: <20200625124253.1906557-7-ardb@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625124253.1906557-1-ardb@kernel.org>
References: <20200625124253.1906557-1-ardb@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Even though the sun8i-ss driver implements asynchronous versions of
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
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c | 39 ++++++++++----------
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h        |  3 +-
 2 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
index c89cb2ee2496..7a131675a41c 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
@@ -73,7 +73,6 @@ static int sun8i_ss_cipher_fallback(struct skcipher_request *areq)
 	struct sun8i_cipher_req_ctx *rctx = skcipher_request_ctx(areq);
 	int err;
 
-	SYNC_SKCIPHER_REQUEST_ON_STACK(subreq, op->fallback_tfm);
 #ifdef CONFIG_CRYPTO_DEV_SUN8I_SS_DEBUG
 	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
 	struct sun8i_ss_alg_template *algt;
@@ -81,15 +80,15 @@ static int sun8i_ss_cipher_fallback(struct skcipher_request *areq)
 	algt = container_of(alg, struct sun8i_ss_alg_template, alg.skcipher);
 	algt->stat_fb++;
 #endif
-	skcipher_request_set_sync_tfm(subreq, op->fallback_tfm);
-	skcipher_request_set_callback(subreq, areq->base.flags, NULL, NULL);
-	skcipher_request_set_crypt(subreq, areq->src, areq->dst,
+	skcipher_request_set_tfm(&rctx->fallback_req, op->fallback_tfm);
+	skcipher_request_set_callback(&rctx->fallback_req, areq->base.flags,
+				      areq->base.complete, areq->base.data);
+	skcipher_request_set_crypt(&rctx->fallback_req, areq->src, areq->dst,
 				   areq->cryptlen, areq->iv);
 	if (rctx->op_dir & SS_DECRYPTION)
-		err = crypto_skcipher_decrypt(subreq);
+		err = crypto_skcipher_decrypt(&rctx->fallback_req);
 	else
-		err = crypto_skcipher_encrypt(subreq);
-	skcipher_request_zero(subreq);
+		err = crypto_skcipher_encrypt(&rctx->fallback_req);
 	return err;
 }
 
@@ -334,18 +333,20 @@ int sun8i_ss_cipher_init(struct crypto_tfm *tfm)
 	algt = container_of(alg, struct sun8i_ss_alg_template, alg.skcipher);
 	op->ss = algt->ss;
 
-	sktfm->reqsize = sizeof(struct sun8i_cipher_req_ctx);
-
-	op->fallback_tfm = crypto_alloc_sync_skcipher(name, 0, CRYPTO_ALG_NEED_FALLBACK);
+	op->fallback_tfm = crypto_alloc_skcipher(name, 0, CRYPTO_ALG_NEED_FALLBACK);
 	if (IS_ERR(op->fallback_tfm)) {
 		dev_err(op->ss->dev, "ERROR: Cannot allocate fallback for %s %ld\n",
 			name, PTR_ERR(op->fallback_tfm));
 		return PTR_ERR(op->fallback_tfm);
 	}
 
+	sktfm->reqsize = sizeof(struct sun8i_cipher_req_ctx) +
+			 crypto_skcipher_reqsize(op->fallback_tfm);
+
+
 	dev_info(op->ss->dev, "Fallback for %s is %s\n",
 		 crypto_tfm_alg_driver_name(&sktfm->base),
-		 crypto_tfm_alg_driver_name(crypto_skcipher_tfm(&op->fallback_tfm->base)));
+		 crypto_tfm_alg_driver_name(crypto_skcipher_tfm(op->fallback_tfm)));
 
 	op->enginectx.op.do_one_request = sun8i_ss_handle_cipher_request;
 	op->enginectx.op.prepare_request = NULL;
@@ -359,7 +360,7 @@ int sun8i_ss_cipher_init(struct crypto_tfm *tfm)
 
 	return 0;
 error_pm:
-	crypto_free_sync_skcipher(op->fallback_tfm);
+	crypto_free_skcipher(op->fallback_tfm);
 	return err;
 }
 
@@ -371,7 +372,7 @@ void sun8i_ss_cipher_exit(struct crypto_tfm *tfm)
 		memzero_explicit(op->key, op->keylen);
 		kfree(op->key);
 	}
-	crypto_free_sync_skcipher(op->fallback_tfm);
+	crypto_free_skcipher(op->fallback_tfm);
 	pm_runtime_put_sync(op->ss->dev);
 }
 
@@ -401,10 +402,10 @@ int sun8i_ss_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	if (!op->key)
 		return -ENOMEM;
 
-	crypto_sync_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
-	crypto_sync_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
+	crypto_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
+	crypto_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
 
-	return crypto_sync_skcipher_setkey(op->fallback_tfm, key, keylen);
+	return crypto_skcipher_setkey(op->fallback_tfm, key, keylen);
 }
 
 int sun8i_ss_des3_setkey(struct crypto_skcipher *tfm, const u8 *key,
@@ -427,8 +428,8 @@ int sun8i_ss_des3_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	if (!op->key)
 		return -ENOMEM;
 
-	crypto_sync_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
-	crypto_sync_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
+	crypto_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
+	crypto_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
 
-	return crypto_sync_skcipher_setkey(op->fallback_tfm, key, keylen);
+	return crypto_skcipher_setkey(op->fallback_tfm, key, keylen);
 }
diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h
index 29c44f279112..42658b134228 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h
@@ -159,6 +159,7 @@ struct sun8i_cipher_req_ctx {
 	unsigned int ivlen;
 	unsigned int keylen;
 	void *biv;
+	struct skcipher_request fallback_req;   // keep at the end
 };
 
 /*
@@ -174,7 +175,7 @@ struct sun8i_cipher_tfm_ctx {
 	u32 *key;
 	u32 keylen;
 	struct sun8i_ss_dev *ss;
-	struct crypto_sync_skcipher *fallback_tfm;
+	struct crypto_skcipher *fallback_tfm;
 };
 
 /*
-- 
2.27.0

