Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE24F216669
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jul 2020 08:32:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727981AbgGGGcr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jul 2020 02:32:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:60924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725825AbgGGGcr (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 7 Jul 2020 02:32:47 -0400
Received: from e123331-lin.nice.arm.com (adsl-70.109.242.21.tellas.gr [109.242.21.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 43309206CD;
        Tue,  7 Jul 2020 06:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594103566;
        bh=5Z8STLY5JY6OvbbbA0d94AcNfTgrj9JGm+KCb156uwQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qyaUAjnIehyqoQzGv9X+nrgQPRV22ClYLbFFfFtis4eh/eKOOYVaLTEL8evOYuVLu
         3HdsZGq556XBNd3ho+hryL+mFt28cuyu+xm1S226YnD9FsKeljxbion+dCdLYRuu0v
         +yjAAaApvfvzIc/R90vS8Mmi0gsZQBMPdlAlWDZg=
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
Subject: [PATCH v4 02/13] crypto: amlogic-gxl - permit async skcipher as fallback
Date:   Tue,  7 Jul 2020 09:31:52 +0300
Message-Id: <20200707063203.5018-3-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200707063203.5018-1-ardb@kernel.org>
References: <20200707063203.5018-1-ardb@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Even though the amlogic-gxl driver implements asynchronous versions of
ecb(aes) and cbc(aes), the fallbacks it allocates are required to be
synchronous. Given that SIMD based software implementations are usually
asynchronous as well, even though they rarely complete asynchronously
(this typically only happens in cases where the request was made from
softirq context, while SIMD was already in use in the task context that
it interrupted), these implementations are disregarded, and either the
generic C version or another table based version implemented in assembler
is selected instead.

Since falling back to synchronous AES is not only a performance issue,
but potentially a security issue as well (due to the fact that table
based AES is not time invariant), let's fix this, by allocating an
ordinary skcipher as the fallback, and invoke it with the completion
routine that was given to the outer request.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Tested-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 27 ++++++++++----------
 drivers/crypto/amlogic/amlogic-gxl.h        |  3 ++-
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index 9819dd50fbad..5880b94dcb32 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -64,22 +64,20 @@ static int meson_cipher_do_fallback(struct skcipher_request *areq)
 #ifdef CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG
 	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
 	struct meson_alg_template *algt;
-#endif
-	SYNC_SKCIPHER_REQUEST_ON_STACK(req, op->fallback_tfm);
 
-#ifdef CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG
 	algt = container_of(alg, struct meson_alg_template, alg.skcipher);
 	algt->stat_fb++;
 #endif
-	skcipher_request_set_sync_tfm(req, op->fallback_tfm);
-	skcipher_request_set_callback(req, areq->base.flags, NULL, NULL);
-	skcipher_request_set_crypt(req, areq->src, areq->dst,
+	skcipher_request_set_tfm(&rctx->fallback_req, op->fallback_tfm);
+	skcipher_request_set_callback(&rctx->fallback_req, areq->base.flags,
+				      areq->base.complete, areq->base.data);
+	skcipher_request_set_crypt(&rctx->fallback_req, areq->src, areq->dst,
 				   areq->cryptlen, areq->iv);
+
 	if (rctx->op_dir == MESON_DECRYPT)
-		err = crypto_skcipher_decrypt(req);
+		err = crypto_skcipher_decrypt(&rctx->fallback_req);
 	else
-		err = crypto_skcipher_encrypt(req);
-	skcipher_request_zero(req);
+		err = crypto_skcipher_encrypt(&rctx->fallback_req);
 	return err;
 }
 
@@ -321,15 +319,16 @@ int meson_cipher_init(struct crypto_tfm *tfm)
 	algt = container_of(alg, struct meson_alg_template, alg.skcipher);
 	op->mc = algt->mc;
 
-	sktfm->reqsize = sizeof(struct meson_cipher_req_ctx);
-
-	op->fallback_tfm = crypto_alloc_sync_skcipher(name, 0, CRYPTO_ALG_NEED_FALLBACK);
+	op->fallback_tfm = crypto_alloc_skcipher(name, 0, CRYPTO_ALG_NEED_FALLBACK);
 	if (IS_ERR(op->fallback_tfm)) {
 		dev_err(op->mc->dev, "ERROR: Cannot allocate fallback for %s %ld\n",
 			name, PTR_ERR(op->fallback_tfm));
 		return PTR_ERR(op->fallback_tfm);
 	}
 
+	sktfm->reqsize = sizeof(struct meson_cipher_req_ctx) +
+			 crypto_skcipher_reqsize(op->fallback_tfm);
+
 	op->enginectx.op.do_one_request = meson_handle_cipher_request;
 	op->enginectx.op.prepare_request = NULL;
 	op->enginectx.op.unprepare_request = NULL;
@@ -345,7 +344,7 @@ void meson_cipher_exit(struct crypto_tfm *tfm)
 		memzero_explicit(op->key, op->keylen);
 		kfree(op->key);
 	}
-	crypto_free_sync_skcipher(op->fallback_tfm);
+	crypto_free_skcipher(op->fallback_tfm);
 }
 
 int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
@@ -377,5 +376,5 @@ int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	if (!op->key)
 		return -ENOMEM;
 
-	return crypto_sync_skcipher_setkey(op->fallback_tfm, key, keylen);
+	return crypto_skcipher_setkey(op->fallback_tfm, key, keylen);
 }
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index b7f2de91ab76..dc0f142324a3 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -109,6 +109,7 @@ struct meson_dev {
 struct meson_cipher_req_ctx {
 	u32 op_dir;
 	int flow;
+	struct skcipher_request fallback_req;	// keep at the end
 };
 
 /*
@@ -126,7 +127,7 @@ struct meson_cipher_tfm_ctx {
 	u32 keylen;
 	u32 keymode;
 	struct meson_dev *mc;
-	struct crypto_sync_skcipher *fallback_tfm;
+	struct crypto_skcipher *fallback_tfm;
 };
 
 /*
-- 
2.17.1

