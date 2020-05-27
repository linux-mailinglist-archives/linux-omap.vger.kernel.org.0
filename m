Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 777A91E4214
	for <lists+linux-omap@lfdr.de>; Wed, 27 May 2020 14:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729411AbgE0MYy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 May 2020 08:24:54 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37690 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729407AbgE0MYx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 May 2020 08:24:53 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04RCOl31026187;
        Wed, 27 May 2020 07:24:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590582287;
        bh=DmuTt/oLL9bLxYzTZA57/askvQvzJwvHmWkkULIzNXk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=v930t/NNvDfqHLXHVdPhA3194dE7FyckD0FvWWopISDVCnIKNzzfRP5LUwPYduIxu
         fXBHszBZL5YKLboUj0LcYnc6RVemKZ0tKSwqLa3Z7FYg+B+ADaOney2vYtc1I5PAxb
         rXyoq45A5+0LstYtwv16EmEh/aP0DlFX/6bW7fuc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04RCOlYj064346;
        Wed, 27 May 2020 07:24:47 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 May 2020 07:24:46 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 May 2020 07:24:46 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04RCOYRk101979;
        Wed, 27 May 2020 07:24:45 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>
Subject: [RESEND PATCHv3 7/7] crypto: omap-sham: add proper load balancing support for multicore
Date:   Wed, 27 May 2020 15:24:29 +0300
Message-ID: <20200527122429.14888-8-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200527122429.14888-1-t-kristo@ti.com>
References: <20200527122429.14888-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The current implementation of the multiple accelerator core support for
OMAP SHA does not work properly. It always picks up the first probed
accelerator core if this is available, and rest of the book keeping also
gets confused if there are two cores available. Add proper load
balancing support for SHA, and also fix any bugs related to the
multicore support while doing it.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-sham.c | 64 ++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 33 deletions(-)

diff --git a/drivers/crypto/omap-sham.c b/drivers/crypto/omap-sham.c
index 86949f1ac6a7..0651604161ea 100644
--- a/drivers/crypto/omap-sham.c
+++ b/drivers/crypto/omap-sham.c
@@ -169,8 +169,6 @@ struct omap_sham_hmac_ctx {
 };
 
 struct omap_sham_ctx {
-	struct omap_sham_dev	*dd;
-
 	unsigned long		flags;
 
 	/* fallback stuff */
@@ -935,27 +933,35 @@ static int omap_sham_update_dma_stop(struct omap_sham_dev *dd)
 	return 0;
 }
 
+struct omap_sham_dev *omap_sham_find_dev(struct omap_sham_reqctx *ctx)
+{
+	struct omap_sham_dev *dd;
+
+	if (ctx->dd)
+		return ctx->dd;
+
+	spin_lock_bh(&sham.lock);
+	dd = list_first_entry(&sham.dev_list, struct omap_sham_dev, list);
+	list_move_tail(&dd->list, &sham.dev_list);
+	ctx->dd = dd;
+	spin_unlock_bh(&sham.lock);
+
+	return dd;
+}
+
 static int omap_sham_init(struct ahash_request *req)
 {
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
 	struct omap_sham_ctx *tctx = crypto_ahash_ctx(tfm);
 	struct omap_sham_reqctx *ctx = ahash_request_ctx(req);
-	struct omap_sham_dev *dd = NULL, *tmp;
+	struct omap_sham_dev *dd;
 	int bs = 0;
 
-	spin_lock_bh(&sham.lock);
-	if (!tctx->dd) {
-		list_for_each_entry(tmp, &sham.dev_list, list) {
-			dd = tmp;
-			break;
-		}
-		tctx->dd = dd;
-	} else {
-		dd = tctx->dd;
-	}
-	spin_unlock_bh(&sham.lock);
+	ctx->dd = NULL;
 
-	ctx->dd = dd;
+	dd = omap_sham_find_dev(ctx);
+	if (!dd)
+		return -ENODEV;
 
 	ctx->flags = 0;
 
@@ -1225,8 +1231,7 @@ static int omap_sham_handle_queue(struct omap_sham_dev *dd,
 static int omap_sham_enqueue(struct ahash_request *req, unsigned int op)
 {
 	struct omap_sham_reqctx *ctx = ahash_request_ctx(req);
-	struct omap_sham_ctx *tctx = crypto_tfm_ctx(req->base.tfm);
-	struct omap_sham_dev *dd = tctx->dd;
+	struct omap_sham_dev *dd = ctx->dd;
 
 	ctx->op = op;
 
@@ -1236,7 +1241,7 @@ static int omap_sham_enqueue(struct ahash_request *req, unsigned int op)
 static int omap_sham_update(struct ahash_request *req)
 {
 	struct omap_sham_reqctx *ctx = ahash_request_ctx(req);
-	struct omap_sham_dev *dd = ctx->dd;
+	struct omap_sham_dev *dd = omap_sham_find_dev(ctx);
 
 	if (!req->nbytes)
 		return 0;
@@ -1340,21 +1345,8 @@ static int omap_sham_setkey(struct crypto_ahash *tfm, const u8 *key,
 	struct omap_sham_hmac_ctx *bctx = tctx->base;
 	int bs = crypto_shash_blocksize(bctx->shash);
 	int ds = crypto_shash_digestsize(bctx->shash);
-	struct omap_sham_dev *dd = NULL, *tmp;
 	int err, i;
 
-	spin_lock_bh(&sham.lock);
-	if (!tctx->dd) {
-		list_for_each_entry(tmp, &sham.dev_list, list) {
-			dd = tmp;
-			break;
-		}
-		tctx->dd = dd;
-	} else {
-		dd = tctx->dd;
-	}
-	spin_unlock_bh(&sham.lock);
-
 	err = crypto_shash_setkey(tctx->fallback, key, keylen);
 	if (err)
 		return err;
@@ -1372,7 +1364,7 @@ static int omap_sham_setkey(struct crypto_ahash *tfm, const u8 *key,
 
 	memset(bctx->ipad + keylen, 0, bs - keylen);
 
-	if (!test_bit(FLAGS_AUTO_XOR, &dd->flags)) {
+	if (!test_bit(FLAGS_AUTO_XOR, &sham.flags)) {
 		memcpy(bctx->opad, bctx->ipad, bs);
 
 		for (i = 0; i < bs; i++) {
@@ -2184,6 +2176,7 @@ static int omap_sham_probe(struct platform_device *pdev)
 	}
 
 	dd->flags |= dd->pdata->flags;
+	sham.flags |= dd->pdata->flags;
 
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_set_autosuspend_delay(dev, DEFAULT_AUTOSUSPEND_DELAY);
@@ -2211,6 +2204,9 @@ static int omap_sham_probe(struct platform_device *pdev)
 	spin_unlock(&sham.lock);
 
 	for (i = 0; i < dd->pdata->algs_info_size; i++) {
+		if (dd->pdata->algs_info[i].registered)
+			break;
+
 		for (j = 0; j < dd->pdata->algs_info[i].size; j++) {
 			struct ahash_alg *alg;
 
@@ -2262,9 +2258,11 @@ static int omap_sham_remove(struct platform_device *pdev)
 	list_del(&dd->list);
 	spin_unlock(&sham.lock);
 	for (i = dd->pdata->algs_info_size - 1; i >= 0; i--)
-		for (j = dd->pdata->algs_info[i].registered - 1; j >= 0; j--)
+		for (j = dd->pdata->algs_info[i].registered - 1; j >= 0; j--) {
 			crypto_unregister_ahash(
 					&dd->pdata->algs_info[i].algs_list[j]);
+			dd->pdata->algs_info[i].registered--;
+		}
 	tasklet_kill(&dd->done_task);
 	pm_runtime_disable(&pdev->dev);
 
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
