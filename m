Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5D820C04A
	for <lists+linux-omap@lfdr.de>; Sat, 27 Jun 2020 10:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbgF0IhQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 27 Jun 2020 04:37:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:33214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726086AbgF0IhQ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 27 Jun 2020 04:37:16 -0400
Received: from dogfood.home (lfbn-nic-1-188-42.w2-15.abo.wanadoo.fr [2.15.37.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B253C208C7;
        Sat, 27 Jun 2020 08:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593247035;
        bh=mJ44RN1Ax7UO5kUEhNQNsOxr9UMAVZrtpGUzPdPjV5w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JJ8PGniKDwza/T069KYGviPChm/sq/A0O1/cXJD7D4b45EdSD5aBEtWIl1FxD/07T
         ay4A+7qicQGgq6mgO6mnvOk215t5E7vDxLo7DICzkND1FDakZfQMKX0CFjy2hI42UA
         IMkKpfDde2o0HFaHQTGSVI+ZbzwsivB1CLA9EFwY=
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
        Eric Biggers <ebiggers@google.com>,
        Tero Kristo <t-kristo@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 09/13] crypto: mxs-dcp - permit asynchronous skcipher as fallback
Date:   Sat, 27 Jun 2020 10:36:19 +0200
Message-Id: <20200627083623.2428333-10-ardb@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200627083623.2428333-1-ardb@kernel.org>
References: <20200627083623.2428333-1-ardb@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Even though the mxs-dcp driver implements asynchronous versions of
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
 drivers/crypto/mxs-dcp.c | 33 ++++++++++----------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/crypto/mxs-dcp.c b/drivers/crypto/mxs-dcp.c
index d84530293036..909a7eb748e3 100644
--- a/drivers/crypto/mxs-dcp.c
+++ b/drivers/crypto/mxs-dcp.c
@@ -97,7 +97,7 @@ struct dcp_async_ctx {
 	unsigned int			hot:1;
 
 	/* Crypto-specific context */
-	struct crypto_sync_skcipher	*fallback;
+	struct crypto_skcipher		*fallback;
 	unsigned int			key_len;
 	uint8_t				key[AES_KEYSIZE_128];
 };
@@ -105,6 +105,7 @@ struct dcp_async_ctx {
 struct dcp_aes_req_ctx {
 	unsigned int	enc:1;
 	unsigned int	ecb:1;
+	struct skcipher_request fallback_req;	// keep at the end
 };
 
 struct dcp_sha_req_ctx {
@@ -426,21 +427,20 @@ static int dcp_chan_thread_aes(void *data)
 static int mxs_dcp_block_fallback(struct skcipher_request *req, int enc)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
+	struct dcp_aes_req_ctx *rctx = skcipher_request_ctx(req);
 	struct dcp_async_ctx *ctx = crypto_skcipher_ctx(tfm);
-	SYNC_SKCIPHER_REQUEST_ON_STACK(subreq, ctx->fallback);
 	int ret;
 
-	skcipher_request_set_sync_tfm(subreq, ctx->fallback);
-	skcipher_request_set_callback(subreq, req->base.flags, NULL, NULL);
-	skcipher_request_set_crypt(subreq, req->src, req->dst,
+	skcipher_request_set_tfm(&rctx->fallback_req, ctx->fallback);
+	skcipher_request_set_callback(&rctx->fallback_req, req->base.flags,
+				      req->base.complete, req->base.data);
+	skcipher_request_set_crypt(&rctx->fallback_req, req->src, req->dst,
 				   req->cryptlen, req->iv);
 
 	if (enc)
-		ret = crypto_skcipher_encrypt(subreq);
+		ret = crypto_skcipher_encrypt(&rctx->fallback_req);
 	else
-		ret = crypto_skcipher_decrypt(subreq);
-
-	skcipher_request_zero(subreq);
+		ret = crypto_skcipher_decrypt(&rctx->fallback_req);
 
 	return ret;
 }
@@ -510,24 +510,25 @@ static int mxs_dcp_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	 * but is supported by in-kernel software implementation, we use
 	 * software fallback.
 	 */
-	crypto_sync_skcipher_clear_flags(actx->fallback, CRYPTO_TFM_REQ_MASK);
-	crypto_sync_skcipher_set_flags(actx->fallback,
+	crypto_skcipher_clear_flags(actx->fallback, CRYPTO_TFM_REQ_MASK);
+	crypto_skcipher_set_flags(actx->fallback,
 				  tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
-	return crypto_sync_skcipher_setkey(actx->fallback, key, len);
+	return crypto_skcipher_setkey(actx->fallback, key, len);
 }
 
 static int mxs_dcp_aes_fallback_init_tfm(struct crypto_skcipher *tfm)
 {
 	const char *name = crypto_tfm_alg_name(crypto_skcipher_tfm(tfm));
 	struct dcp_async_ctx *actx = crypto_skcipher_ctx(tfm);
-	struct crypto_sync_skcipher *blk;
+	struct crypto_skcipher *blk;
 
-	blk = crypto_alloc_sync_skcipher(name, 0, CRYPTO_ALG_NEED_FALLBACK);
+	blk = crypto_alloc_skcipher(name, 0, CRYPTO_ALG_NEED_FALLBACK);
 	if (IS_ERR(blk))
 		return PTR_ERR(blk);
 
 	actx->fallback = blk;
-	crypto_skcipher_set_reqsize(tfm, sizeof(struct dcp_aes_req_ctx));
+	crypto_skcipher_set_reqsize(tfm, sizeof(struct dcp_aes_req_ctx) +
+					 crypto_skcipher_reqsize(blk));
 	return 0;
 }
 
@@ -535,7 +536,7 @@ static void mxs_dcp_aes_fallback_exit_tfm(struct crypto_skcipher *tfm)
 {
 	struct dcp_async_ctx *actx = crypto_skcipher_ctx(tfm);
 
-	crypto_free_sync_skcipher(actx->fallback);
+	crypto_free_skcipher(actx->fallback);
 }
 
 /*
-- 
2.27.0

