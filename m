Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 081F121667D
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jul 2020 08:34:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbgGGGeC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jul 2020 02:34:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:33604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726918AbgGGGeB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 7 Jul 2020 02:34:01 -0400
Received: from e123331-lin.nice.arm.com (adsl-70.109.242.21.tellas.gr [109.242.21.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6A35F206DF;
        Tue,  7 Jul 2020 06:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594103641;
        bh=xtNbkebtMctQdpvkm5ZhZR31pleEX5efnRbSCp2ZF4o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gFSYxowZEHOLyY+Ipf7RU3fgh0E92aOYIxLyhqK/3TYSbTj0CttxfdLuSh7MmgFlW
         PWkJ01ls+bBokuC51UUu9ghub1utZK4OQEsS4U6IpjfYy7KudQxcOnIdoPD6nrx2TK
         DIF3pCBAXWJ9fv1KSbkhVc5wDApltgKvBmM1ySac=
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
Subject: [PATCH v4 11/13] crypto: qce - permit asynchronous skcipher as fallback
Date:   Tue,  7 Jul 2020 09:32:01 +0300
Message-Id: <20200707063203.5018-12-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200707063203.5018-1-ardb@kernel.org>
References: <20200707063203.5018-1-ardb@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Even though the qce driver implements asynchronous versions of ecb(aes),
cbc(aes)and xts(aes), the fallbacks it allocates are required to be
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

While at it, remove the pointless memset() from qce_skcipher_init(), and
remove the call to it qce_skcipher_init_fallback().

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/crypto/qce/cipher.h   |  3 +-
 drivers/crypto/qce/skcipher.c | 42 ++++++++++----------
 2 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/crypto/qce/cipher.h b/drivers/crypto/qce/cipher.h
index 7770660bc853..cffa9fc628ff 100644
--- a/drivers/crypto/qce/cipher.h
+++ b/drivers/crypto/qce/cipher.h
@@ -14,7 +14,7 @@
 struct qce_cipher_ctx {
 	u8 enc_key[QCE_MAX_KEY_SIZE];
 	unsigned int enc_keylen;
-	struct crypto_sync_skcipher *fallback;
+	struct crypto_skcipher *fallback;
 };
 
 /**
@@ -43,6 +43,7 @@ struct qce_cipher_reqctx {
 	struct sg_table src_tbl;
 	struct scatterlist *src_sg;
 	unsigned int cryptlen;
+	struct skcipher_request fallback_req;	// keep at the end
 };
 
 static inline struct qce_alg_template *to_cipher_tmpl(struct crypto_skcipher *tfm)
diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 9412433f3b21..a8147381b774 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -178,7 +178,7 @@ static int qce_skcipher_setkey(struct crypto_skcipher *ablk, const u8 *key,
 		break;
 	}
 
-	ret = crypto_sync_skcipher_setkey(ctx->fallback, key, keylen);
+	ret = crypto_skcipher_setkey(ctx->fallback, key, keylen);
 	if (!ret)
 		ctx->enc_keylen = keylen;
 	return ret;
@@ -235,16 +235,15 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	      req->cryptlen <= aes_sw_max_len) ||
 	     (IS_XTS(rctx->flags) && req->cryptlen > QCE_SECTOR_SIZE &&
 	      req->cryptlen % QCE_SECTOR_SIZE))) {
-		SYNC_SKCIPHER_REQUEST_ON_STACK(subreq, ctx->fallback);
-
-		skcipher_request_set_sync_tfm(subreq, ctx->fallback);
-		skcipher_request_set_callback(subreq, req->base.flags,
-					      NULL, NULL);
-		skcipher_request_set_crypt(subreq, req->src, req->dst,
-					   req->cryptlen, req->iv);
-		ret = encrypt ? crypto_skcipher_encrypt(subreq) :
-				crypto_skcipher_decrypt(subreq);
-		skcipher_request_zero(subreq);
+		skcipher_request_set_tfm(&rctx->fallback_req, ctx->fallback);
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
 
@@ -263,10 +262,9 @@ static int qce_skcipher_decrypt(struct skcipher_request *req)
 
 static int qce_skcipher_init(struct crypto_skcipher *tfm)
 {
-	struct qce_cipher_ctx *ctx = crypto_skcipher_ctx(tfm);
-
-	memset(ctx, 0, sizeof(*ctx));
-	crypto_skcipher_set_reqsize(tfm, sizeof(struct qce_cipher_reqctx));
+	/* take the size without the fallback skcipher_request at the end */
+	crypto_skcipher_set_reqsize(tfm, offsetof(struct qce_cipher_reqctx,
+						  fallback_req));
 	return 0;
 }
 
@@ -274,17 +272,21 @@ static int qce_skcipher_init_fallback(struct crypto_skcipher *tfm)
 {
 	struct qce_cipher_ctx *ctx = crypto_skcipher_ctx(tfm);
 
-	qce_skcipher_init(tfm);
-	ctx->fallback = crypto_alloc_sync_skcipher(crypto_tfm_alg_name(&tfm->base),
-						   0, CRYPTO_ALG_NEED_FALLBACK);
-	return PTR_ERR_OR_ZERO(ctx->fallback);
+	ctx->fallback = crypto_alloc_skcipher(crypto_tfm_alg_name(&tfm->base),
+					      0, CRYPTO_ALG_NEED_FALLBACK);
+	if (IS_ERR(ctx->fallback))
+		return PTR_ERR(ctx->fallback);
+
+	crypto_skcipher_set_reqsize(tfm, sizeof(struct qce_cipher_reqctx) +
+					 crypto_skcipher_reqsize(ctx->fallback));
+	return 0;
 }
 
 static void qce_skcipher_exit(struct crypto_skcipher *tfm)
 {
 	struct qce_cipher_ctx *ctx = crypto_skcipher_ctx(tfm);
 
-	crypto_free_sync_skcipher(ctx->fallback);
+	crypto_free_skcipher(ctx->fallback);
 }
 
 struct qce_skcipher_def {
-- 
2.17.1

