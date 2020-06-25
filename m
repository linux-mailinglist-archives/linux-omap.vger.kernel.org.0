Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE82D209EB7
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jun 2020 14:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404784AbgFYMnd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Jun 2020 08:43:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:45872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404285AbgFYMnc (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 25 Jun 2020 08:43:32 -0400
Received: from localhost.localdomain (lfbn-nic-1-188-42.w2-15.abo.wanadoo.fr [2.15.37.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A40A92082F;
        Thu, 25 Jun 2020 12:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593089011;
        bh=7g45QWyrYUg0An4TDCghUfvpEHV1X2Se+dPPjGObVdQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=q3/XepTQLoJhJKhn8/LBvEE9s+FbxrQLKtjsvC6S+AamPxSAD+v3rq3k8ov1gZ8jm
         ix1UsEqvKt2dqP/shAQkAzhBZXgDTBzog0jga5Gp2bp6hCeUR85HLXrYJWdguao6tR
         Fnbw1pH9Vmu41hADjmc9EHfDvkHPgXFXiKH075Zs=
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
Subject: [PATCH 03/12] crypto: omap-aes - permit asynchronous skcipher as fallback
Date:   Thu, 25 Jun 2020 14:42:44 +0200
Message-Id: <20200625124253.1906557-4-ardb@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625124253.1906557-1-ardb@kernel.org>
References: <20200625124253.1906557-1-ardb@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Even though the omap-aes driver implements asynchronous versions of
ecb(aes), cbc(aes) and ctr(aes), the fallbacks it allocates are required
to be synchronous. Given that SIMD based software implementations are
usually asynchronous as well, even though they rarely complete
asynchronously (this typically only happens in cases where the request was
made from softirq context, while SIMD was already in use in the task
context that it interrupted), these implementations are disregarded, and
either the generic C version or another table based version implemented in
assembler is selected instead.

Since falling back to synchronous AES is not only a performance issue, but
potentially a security issue as well (due to the fact that table based AES
is not time invariant), let's fix this, by allocating an ordinary skcipher
as the fallback, and invoke it with the completion routine that was given
to the outer request.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/crypto/omap-aes.c | 35 ++++++++++----------
 drivers/crypto/omap-aes.h |  3 +-
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/crypto/omap-aes.c b/drivers/crypto/omap-aes.c
index b5aff20c5900..25154b74dcc6 100644
--- a/drivers/crypto/omap-aes.c
+++ b/drivers/crypto/omap-aes.c
@@ -548,20 +548,18 @@ static int omap_aes_crypt(struct skcipher_request *req, unsigned long mode)
 		  !!(mode & FLAGS_CBC));
 
 	if (req->cryptlen < aes_fallback_sz) {
-		SYNC_SKCIPHER_REQUEST_ON_STACK(subreq, ctx->fallback);
-
-		skcipher_request_set_sync_tfm(subreq, ctx->fallback);
-		skcipher_request_set_callback(subreq, req->base.flags, NULL,
-					      NULL);
-		skcipher_request_set_crypt(subreq, req->src, req->dst,
-					   req->cryptlen, req->iv);
+		skcipher_request_set_tfm(&rctx->fallback_req, ctx->fallback);
+		skcipher_request_set_callback(&rctx->fallback_req,
+					      req->base.flags,
+					      req->base.complete,
+					      req->base.data);
+		skcipher_request_set_crypt(&rctx->fallback_req, req->src,
+					   req->dst, req->cryptlen, req->iv);
 
 		if (mode & FLAGS_ENCRYPT)
-			ret = crypto_skcipher_encrypt(subreq);
+			ret = crypto_skcipher_encrypt(&rctx->fallback_req);
 		else
-			ret = crypto_skcipher_decrypt(subreq);
-
-		skcipher_request_zero(subreq);
+			ret = crypto_skcipher_decrypt(&rctx->fallback_req);
 		return ret;
 	}
 	dd = omap_aes_find_dev(rctx);
@@ -590,11 +588,11 @@ static int omap_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	memcpy(ctx->key, key, keylen);
 	ctx->keylen = keylen;
 
-	crypto_sync_skcipher_clear_flags(ctx->fallback, CRYPTO_TFM_REQ_MASK);
-	crypto_sync_skcipher_set_flags(ctx->fallback, tfm->base.crt_flags &
+	crypto_skcipher_clear_flags(ctx->fallback, CRYPTO_TFM_REQ_MASK);
+	crypto_skcipher_set_flags(ctx->fallback, tfm->base.crt_flags &
 						 CRYPTO_TFM_REQ_MASK);
 
-	ret = crypto_sync_skcipher_setkey(ctx->fallback, key, keylen);
+	ret = crypto_skcipher_setkey(ctx->fallback, key, keylen);
 	if (!ret)
 		return 0;
 
@@ -640,15 +638,16 @@ static int omap_aes_init_tfm(struct crypto_skcipher *tfm)
 {
 	const char *name = crypto_tfm_alg_name(&tfm->base);
 	struct omap_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
-	struct crypto_sync_skcipher *blk;
+	struct crypto_skcipher *blk;
 
-	blk = crypto_alloc_sync_skcipher(name, 0, CRYPTO_ALG_NEED_FALLBACK);
+	blk = crypto_alloc_skcipher(name, 0, CRYPTO_ALG_NEED_FALLBACK);
 	if (IS_ERR(blk))
 		return PTR_ERR(blk);
 
 	ctx->fallback = blk;
 
-	crypto_skcipher_set_reqsize(tfm, sizeof(struct omap_aes_reqctx));
+	crypto_skcipher_set_reqsize(tfm, sizeof(struct omap_aes_reqctx) +
+					 crypto_skcipher_reqsize(blk));
 
 	ctx->enginectx.op.prepare_request = omap_aes_prepare_req;
 	ctx->enginectx.op.unprepare_request = NULL;
@@ -662,7 +661,7 @@ static void omap_aes_exit_tfm(struct crypto_skcipher *tfm)
 	struct omap_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
 
 	if (ctx->fallback)
-		crypto_free_sync_skcipher(ctx->fallback);
+		crypto_free_skcipher(ctx->fallback);
 
 	ctx->fallback = NULL;
 }
diff --git a/drivers/crypto/omap-aes.h b/drivers/crypto/omap-aes.h
index 2d111bf906e1..23d073e87bb8 100644
--- a/drivers/crypto/omap-aes.h
+++ b/drivers/crypto/omap-aes.h
@@ -97,7 +97,7 @@ struct omap_aes_ctx {
 	int		keylen;
 	u32		key[AES_KEYSIZE_256 / sizeof(u32)];
 	u8		nonce[4];
-	struct crypto_sync_skcipher	*fallback;
+	struct crypto_skcipher	*fallback;
 };
 
 struct omap_aes_gcm_ctx {
@@ -110,6 +110,7 @@ struct omap_aes_reqctx {
 	unsigned long mode;
 	u8 iv[AES_BLOCK_SIZE];
 	u32 auth_tag[AES_BLOCK_SIZE / sizeof(u32)];
+	struct skcipher_request fallback_req;	// keep at the end
 };
 
 #define OMAP_AES_QUEUE_LENGTH	1
-- 
2.27.0

