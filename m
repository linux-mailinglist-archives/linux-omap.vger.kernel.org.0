Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8572A20C045
	for <lists+linux-omap@lfdr.de>; Sat, 27 Jun 2020 10:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726404AbgF0IhH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 27 Jun 2020 04:37:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:33042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726086AbgF0IhH (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 27 Jun 2020 04:37:07 -0400
Received: from dogfood.home (lfbn-nic-1-188-42.w2-15.abo.wanadoo.fr [2.15.37.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CE2BA208C7;
        Sat, 27 Jun 2020 08:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593247026;
        bh=DoA6f29T+QZl9PEHAXdrvpSKEzdX6U9CtDe+6HrgxnA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PXx0Cxudum+aOZZ1BJD27yf9+2R+PZxtRs/sEdd/EbHaLJiLFYj4cLMordpd21Ire
         l8cI3XNHTEFono/mGqo5pqvCsrKduxQE83N9cR03hkX3zl7EU5uiQrauKEOyCp7txU
         v7XZGHHgUpJk3tt0GNhOnp7WDdlvbgoA7noElsjQ=
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
Subject: [PATCH v2 07/13] crypto: ccp - permit asynchronous skcipher as fallback
Date:   Sat, 27 Jun 2020 10:36:17 +0200
Message-Id: <20200627083623.2428333-8-ardb@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200627083623.2428333-1-ardb@kernel.org>
References: <20200627083623.2428333-1-ardb@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Even though the ccp driver implements an asynchronous version of xts(aes),
the fallback it allocates is required to be synchronous. Given that SIMD
based software implementations are usually asynchronous as well, even
though they rarely complete asynchronously (this typically only happens
in cases where the request was made from softirq context, while SIMD was
already in use in the task context that it interrupted), these
implementations are disregarded, and either the generic C version or
another table based version implemented in assembler is selected instead.

Since falling back to synchronous AES is not only a performance issue, but
potentially a security issue as well (due to the fact that table based AES
is not time invariant), let's fix this, by allocating an ordinary skcipher
as the fallback, and invoke it with the completion routine that was given
to the outer request.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/crypto/ccp/ccp-crypto-aes-xts.c | 33 ++++++++++----------
 drivers/crypto/ccp/ccp-crypto.h         |  4 ++-
 2 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/crypto/ccp/ccp-crypto-aes-xts.c b/drivers/crypto/ccp/ccp-crypto-aes-xts.c
index 04b2517df955..959168a7ac59 100644
--- a/drivers/crypto/ccp/ccp-crypto-aes-xts.c
+++ b/drivers/crypto/ccp/ccp-crypto-aes-xts.c
@@ -98,7 +98,7 @@ static int ccp_aes_xts_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	ctx->u.aes.key_len = key_len / 2;
 	sg_init_one(&ctx->u.aes.key_sg, ctx->u.aes.key, key_len);
 
-	return crypto_sync_skcipher_setkey(ctx->u.aes.tfm_skcipher, key, key_len);
+	return crypto_skcipher_setkey(ctx->u.aes.tfm_skcipher, key, key_len);
 }
 
 static int ccp_aes_xts_crypt(struct skcipher_request *req,
@@ -145,20 +145,19 @@ static int ccp_aes_xts_crypt(struct skcipher_request *req,
 	    (ctx->u.aes.key_len != AES_KEYSIZE_256))
 		fallback = 1;
 	if (fallback) {
-		SYNC_SKCIPHER_REQUEST_ON_STACK(subreq,
-					       ctx->u.aes.tfm_skcipher);
-
 		/* Use the fallback to process the request for any
 		 * unsupported unit sizes or key sizes
 		 */
-		skcipher_request_set_sync_tfm(subreq, ctx->u.aes.tfm_skcipher);
-		skcipher_request_set_callback(subreq, req->base.flags,
-					      NULL, NULL);
-		skcipher_request_set_crypt(subreq, req->src, req->dst,
-					   req->cryptlen, req->iv);
-		ret = encrypt ? crypto_skcipher_encrypt(subreq) :
-				crypto_skcipher_decrypt(subreq);
-		skcipher_request_zero(subreq);
+		skcipher_request_set_tfm(&rctx->fallback_req,
+					 ctx->u.aes.tfm_skcipher);
+		skcipher_request_set_callback(&rctx->fallback_req,
+					      req->base.flags,
+					      req->base.complete,
+					      req->base.data);
+		skcipher_request_set_crypt(&rctx->fallback_req, req->src,
+					   req->dst, req->cryptlen, req->iv);
+		ret = encrypt ? crypto_skcipher_encrypt(&rctx->fallback_req) :
+				crypto_skcipher_decrypt(&rctx->fallback_req);
 		return ret;
 	}
 
@@ -198,13 +197,12 @@ static int ccp_aes_xts_decrypt(struct skcipher_request *req)
 static int ccp_aes_xts_init_tfm(struct crypto_skcipher *tfm)
 {
 	struct ccp_ctx *ctx = crypto_skcipher_ctx(tfm);
-	struct crypto_sync_skcipher *fallback_tfm;
+	struct crypto_skcipher *fallback_tfm;
 
 	ctx->complete = ccp_aes_xts_complete;
 	ctx->u.aes.key_len = 0;
 
-	fallback_tfm = crypto_alloc_sync_skcipher("xts(aes)", 0,
-					     CRYPTO_ALG_ASYNC |
+	fallback_tfm = crypto_alloc_skcipher("xts(aes)", 0,
 					     CRYPTO_ALG_NEED_FALLBACK);
 	if (IS_ERR(fallback_tfm)) {
 		pr_warn("could not load fallback driver xts(aes)\n");
@@ -212,7 +210,8 @@ static int ccp_aes_xts_init_tfm(struct crypto_skcipher *tfm)
 	}
 	ctx->u.aes.tfm_skcipher = fallback_tfm;
 
-	crypto_skcipher_set_reqsize(tfm, sizeof(struct ccp_aes_req_ctx));
+	crypto_skcipher_set_reqsize(tfm, sizeof(struct ccp_aes_req_ctx) +
+					 crypto_skcipher_reqsize(fallback_tfm));
 
 	return 0;
 }
@@ -221,7 +220,7 @@ static void ccp_aes_xts_exit_tfm(struct crypto_skcipher *tfm)
 {
 	struct ccp_ctx *ctx = crypto_skcipher_ctx(tfm);
 
-	crypto_free_sync_skcipher(ctx->u.aes.tfm_skcipher);
+	crypto_free_skcipher(ctx->u.aes.tfm_skcipher);
 }
 
 static int ccp_register_aes_xts_alg(struct list_head *head,
diff --git a/drivers/crypto/ccp/ccp-crypto.h b/drivers/crypto/ccp/ccp-crypto.h
index 90a009e6b5c1..aed3d2192d01 100644
--- a/drivers/crypto/ccp/ccp-crypto.h
+++ b/drivers/crypto/ccp/ccp-crypto.h
@@ -89,7 +89,7 @@ static inline struct ccp_crypto_ahash_alg *
 /***** AES related defines *****/
 struct ccp_aes_ctx {
 	/* Fallback cipher for XTS with unsupported unit sizes */
-	struct crypto_sync_skcipher *tfm_skcipher;
+	struct crypto_skcipher *tfm_skcipher;
 
 	enum ccp_engine engine;
 	enum ccp_aes_type type;
@@ -121,6 +121,8 @@ struct ccp_aes_req_ctx {
 	u8 rfc3686_iv[AES_BLOCK_SIZE];
 
 	struct ccp_cmd cmd;
+
+	struct skcipher_request fallback_req;	// keep at the end
 };
 
 struct ccp_aes_cmac_req_ctx {
-- 
2.27.0

