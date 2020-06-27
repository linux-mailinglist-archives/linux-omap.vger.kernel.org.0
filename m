Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF42520C051
	for <lists+linux-omap@lfdr.de>; Sat, 27 Jun 2020 10:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgF0Ihe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 27 Jun 2020 04:37:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:33612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726086AbgF0Ihd (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 27 Jun 2020 04:37:33 -0400
Received: from dogfood.home (lfbn-nic-1-188-42.w2-15.abo.wanadoo.fr [2.15.37.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7A1202088E;
        Sat, 27 Jun 2020 08:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593247053;
        bh=zjbLkDlwCXNIbtATEiNU0StbDpQpMVzWqLK75QxxG/c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tChlkpS2IZp2KSfyxBkAGl1w2bjXvp7Og3a2jpgn2f0cYCmTNe5yV02fWcVAsYGqd
         8d6NLDuF1hX8C0c4eBP9z4LwQWazC9hHpHLzU9a6mJ7nNfhyRzhXi6Hpq0fW4/mChO
         C8VEqFA/cNoH6xF2wul2e05fVmZQcU8aCN1kIT5E=
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
Subject: [PATCH v2 13/13] crypto: mediatek - use AES library for GCM key derivation
Date:   Sat, 27 Jun 2020 10:36:23 +0200
Message-Id: <20200627083623.2428333-14-ardb@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200627083623.2428333-1-ardb@kernel.org>
References: <20200627083623.2428333-1-ardb@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The Mediatek accelerator driver calls into a dynamically allocated
skcipher of the ctr(aes) variety to perform GCM key derivation, which
involves AES encryption of a single block consisting of NUL bytes.

There is no point in using the skcipher API for this, so use the AES
library interface instead.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/crypto/Kconfig            |  3 +-
 drivers/crypto/mediatek/mtk-aes.c | 63 +++-----------------
 2 files changed, 9 insertions(+), 57 deletions(-)

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 802b9ada4e9e..c8c3ebb248f8 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -756,10 +756,9 @@ config CRYPTO_DEV_ZYNQMP_AES
 config CRYPTO_DEV_MEDIATEK
 	tristate "MediaTek's EIP97 Cryptographic Engine driver"
 	depends on (ARM && ARCH_MEDIATEK) || COMPILE_TEST
-	select CRYPTO_AES
+	select CRYPTO_LIB_AES
 	select CRYPTO_AEAD
 	select CRYPTO_SKCIPHER
-	select CRYPTO_CTR
 	select CRYPTO_SHA1
 	select CRYPTO_SHA256
 	select CRYPTO_SHA512
diff --git a/drivers/crypto/mediatek/mtk-aes.c b/drivers/crypto/mediatek/mtk-aes.c
index 78d660d963e2..4ad3571ab6af 100644
--- a/drivers/crypto/mediatek/mtk-aes.c
+++ b/drivers/crypto/mediatek/mtk-aes.c
@@ -137,8 +137,6 @@ struct mtk_aes_gcm_ctx {
 
 	u32 authsize;
 	size_t textlen;
-
-	struct crypto_skcipher *ctr;
 };
 
 struct mtk_aes_drv {
@@ -996,17 +994,8 @@ static int mtk_aes_gcm_setkey(struct crypto_aead *aead, const u8 *key,
 			      u32 keylen)
 {
 	struct mtk_aes_base_ctx *ctx = crypto_aead_ctx(aead);
-	struct mtk_aes_gcm_ctx *gctx = mtk_aes_gcm_ctx_cast(ctx);
-	struct crypto_skcipher *ctr = gctx->ctr;
-	struct {
-		u32 hash[4];
-		u8 iv[8];
-
-		struct crypto_wait wait;
-
-		struct scatterlist sg[1];
-		struct skcipher_request req;
-	} *data;
+	u8 hash[AES_BLOCK_SIZE] __aligned(4) = {};
+	struct crypto_aes_ctx aes_ctx;
 	int err;
 
 	switch (keylen) {
@@ -1026,39 +1015,18 @@ static int mtk_aes_gcm_setkey(struct crypto_aead *aead, const u8 *key,
 
 	ctx->keylen = SIZE_IN_WORDS(keylen);
 
-	/* Same as crypto_gcm_setkey() from crypto/gcm.c */
-	crypto_skcipher_clear_flags(ctr, CRYPTO_TFM_REQ_MASK);
-	crypto_skcipher_set_flags(ctr, crypto_aead_get_flags(aead) &
-				  CRYPTO_TFM_REQ_MASK);
-	err = crypto_skcipher_setkey(ctr, key, keylen);
+	err = aes_expandkey(&aes_ctx, key, keylen);
 	if (err)
 		return err;
 
-	data = kzalloc(sizeof(*data) + crypto_skcipher_reqsize(ctr),
-		       GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	crypto_init_wait(&data->wait);
-	sg_init_one(data->sg, &data->hash, AES_BLOCK_SIZE);
-	skcipher_request_set_tfm(&data->req, ctr);
-	skcipher_request_set_callback(&data->req, CRYPTO_TFM_REQ_MAY_SLEEP |
-				      CRYPTO_TFM_REQ_MAY_BACKLOG,
-				      crypto_req_done, &data->wait);
-	skcipher_request_set_crypt(&data->req, data->sg, data->sg,
-				   AES_BLOCK_SIZE, data->iv);
-
-	err = crypto_wait_req(crypto_skcipher_encrypt(&data->req),
-			      &data->wait);
-	if (err)
-		goto out;
+	aes_encrypt(&aes_ctx, hash, hash);
+	memzero_explicit(&aes_ctx, sizeof(aes_ctx));
 
 	mtk_aes_write_state_le(ctx->key, (const u32 *)key, keylen);
-	mtk_aes_write_state_be(ctx->key + ctx->keylen, data->hash,
+	mtk_aes_write_state_be(ctx->key + ctx->keylen, (const u32 *)hash,
 			       AES_BLOCK_SIZE);
-out:
-	kzfree(data);
-	return err;
+
+	return 0;
 }
 
 static int mtk_aes_gcm_setauthsize(struct crypto_aead *aead,
@@ -1095,32 +1063,17 @@ static int mtk_aes_gcm_init(struct crypto_aead *aead)
 {
 	struct mtk_aes_gcm_ctx *ctx = crypto_aead_ctx(aead);
 
-	ctx->ctr = crypto_alloc_skcipher("ctr(aes)", 0,
-					 CRYPTO_ALG_ASYNC);
-	if (IS_ERR(ctx->ctr)) {
-		pr_err("Error allocating ctr(aes)\n");
-		return PTR_ERR(ctx->ctr);
-	}
-
 	crypto_aead_set_reqsize(aead, sizeof(struct mtk_aes_reqctx));
 	ctx->base.start = mtk_aes_gcm_start;
 	return 0;
 }
 
-static void mtk_aes_gcm_exit(struct crypto_aead *aead)
-{
-	struct mtk_aes_gcm_ctx *ctx = crypto_aead_ctx(aead);
-
-	crypto_free_skcipher(ctx->ctr);
-}
-
 static struct aead_alg aes_gcm_alg = {
 	.setkey		= mtk_aes_gcm_setkey,
 	.setauthsize	= mtk_aes_gcm_setauthsize,
 	.encrypt	= mtk_aes_gcm_encrypt,
 	.decrypt	= mtk_aes_gcm_decrypt,
 	.init		= mtk_aes_gcm_init,
-	.exit		= mtk_aes_gcm_exit,
 	.ivsize		= GCM_AES_IV_SIZE,
 	.maxauthsize	= AES_BLOCK_SIZE,
 
-- 
2.27.0

