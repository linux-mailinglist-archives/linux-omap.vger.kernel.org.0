Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40F5525F467
	for <lists+linux-omap@lfdr.de>; Mon,  7 Sep 2020 09:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgIGH42 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Sep 2020 03:56:28 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:59990 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727924AbgIGH4V (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Sep 2020 03:56:21 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0877uCLh040302;
        Mon, 7 Sep 2020 02:56:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1599465372;
        bh=zN5bpHwVAAQ0slnPf8zjX/kHOEQ/jvVZABPpP+KWjcc=;
        h=From:To:CC:Subject:Date;
        b=LVb+N/9OrsM0zqolJzR7+r9Pt5xDgAEcq3ZXyFRc/8RJcnwtLX57u3s1K1rUFWf8x
         uyX6n19Pd84REW76u5BjfZNeoC0olEJt9QfPVn9zKqbx4B8A9BPfE15eeeYOxLjoJP
         PaocL8KJebqQiXmxtKL8K1sucqlx597Q4b57EpEA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0877uCHl080485;
        Mon, 7 Sep 2020 02:56:12 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 7 Sep
 2020 02:56:12 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 7 Sep 2020 02:56:12 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0877uAI8032737;
        Mon, 7 Sep 2020 02:56:11 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>
Subject: [PATCH] crypto: omap-sham: convert to use crypto engine
Date:   Mon, 7 Sep 2020 10:56:10 +0300
Message-ID: <20200907075610.32326-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Convert the omap-sham driver to use crypto engine for queue handling,
instead of using local implementation.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-sham.c | 186 ++++++++++++++++---------------------
 1 file changed, 78 insertions(+), 108 deletions(-)

diff --git a/drivers/crypto/omap-sham.c b/drivers/crypto/omap-sham.c
index 954d703f2981..b2b930a1fb04 100644
--- a/drivers/crypto/omap-sham.c
+++ b/drivers/crypto/omap-sham.c
@@ -39,6 +39,7 @@
 #include <crypto/hash.h>
 #include <crypto/hmac.h>
 #include <crypto/internal/hash.h>
+#include <crypto/engine.h>
 
 #define MD5_DIGEST_SIZE			16
 
@@ -100,7 +101,6 @@
 #define DEFAULT_AUTOSUSPEND_DELAY	1000
 
 /* mostly device flags */
-#define FLAGS_BUSY		0
 #define FLAGS_FINAL		1
 #define FLAGS_DMA_ACTIVE	2
 #define FLAGS_OUTPUT_READY	3
@@ -144,7 +144,7 @@ struct omap_sham_dev;
 struct omap_sham_reqctx {
 	struct omap_sham_dev	*dd;
 	unsigned long		flags;
-	unsigned long		op;
+	u8			op;
 
 	u8			digest[SHA512_DIGEST_SIZE] OMAP_ALIGNED;
 	size_t			digcnt;
@@ -168,6 +168,7 @@ struct omap_sham_hmac_ctx {
 };
 
 struct omap_sham_ctx {
+	struct crypto_engine_ctx	enginectx;
 	unsigned long		flags;
 
 	/* fallback stuff */
@@ -219,7 +220,6 @@ struct omap_sham_dev {
 	struct device		*dev;
 	void __iomem		*io_base;
 	int			irq;
-	spinlock_t		lock;
 	int			err;
 	struct dma_chan		*dma_lch;
 	struct tasklet_struct	done_task;
@@ -230,6 +230,7 @@ struct omap_sham_dev {
 	int			fallback_sz;
 	struct crypto_queue	queue;
 	struct ahash_request	*req;
+	struct crypto_engine	*engine;
 
 	const struct omap_sham_pdata	*pdata;
 };
@@ -245,6 +246,9 @@ static struct omap_sham_drv sham = {
 	.lock = __SPIN_LOCK_UNLOCKED(sham.lock),
 };
 
+static int omap_sham_enqueue(struct ahash_request *req, unsigned int op);
+static void omap_sham_finish_req(struct ahash_request *req, int err);
+
 static inline u32 omap_sham_read(struct omap_sham_dev *dd, u32 offset)
 {
 	return __raw_readl(dd->io_base + offset);
@@ -854,13 +858,16 @@ static int omap_sham_align_sgs(struct scatterlist *sg,
 	return 0;
 }
 
-static int omap_sham_prepare_request(struct ahash_request *req, bool update)
+static int omap_sham_prepare_request(struct crypto_engine *engine, void *areq)
 {
+	struct ahash_request *req = container_of(areq, struct ahash_request,
+						 base);
 	struct omap_sham_reqctx *rctx = ahash_request_ctx(req);
 	int bs;
 	int ret;
 	unsigned int nbytes;
 	bool final = rctx->flags & BIT(FLAGS_FINUP);
+	bool update = rctx->op == OP_UPDATE;
 	int hash_later;
 
 	bs = get_block_size(rctx);
@@ -1021,7 +1028,7 @@ static int omap_sham_update_req(struct omap_sham_dev *dd)
 	struct omap_sham_reqctx *ctx = ahash_request_ctx(req);
 	int err;
 	bool final = (ctx->flags & BIT(FLAGS_FINUP)) &&
-			!(dd->flags & BIT(FLAGS_HUGE));
+		!(dd->flags & BIT(FLAGS_HUGE));
 
 	dev_dbg(dd->dev, "update_req: total: %u, digcnt: %zd, final: %d",
 		ctx->total, ctx->digcnt, final);
@@ -1069,6 +1076,39 @@ static int omap_sham_final_req(struct omap_sham_dev *dd)
 	return err;
 }
 
+static int omap_sham_hash_one_req(struct crypto_engine *engine, void *areq)
+{
+	struct ahash_request *req = container_of(areq, struct ahash_request,
+						 base);
+	struct omap_sham_reqctx *ctx = ahash_request_ctx(req);
+	struct omap_sham_dev *dd = ctx->dd;
+	int err;
+	bool final = (ctx->flags & BIT(FLAGS_FINUP)) &&
+			!(dd->flags & BIT(FLAGS_HUGE));
+
+	dev_dbg(dd->dev, "hash-one: op: %u, total: %u, digcnt: %zd, final: %d",
+		ctx->op, ctx->total, ctx->digcnt, final);
+
+	dd->req = req;
+
+	err = omap_sham_hw_init(dd);
+	if (err)
+		return err;
+
+	if (ctx->digcnt)
+		dd->pdata->copy_hash(req, 0);
+
+	if (ctx->op == OP_UPDATE)
+		err = omap_sham_update_req(dd);
+	else if (ctx->op == OP_FINAL)
+		err = omap_sham_final_req(dd);
+
+	if (err != -EINPROGRESS)
+		omap_sham_finish_req(req, err);
+
+	return 0;
+}
+
 static int omap_sham_finish_hmac(struct ahash_request *req)
 {
 	struct omap_sham_ctx *tctx = crypto_tfm_ctx(req->base.tfm);
@@ -1116,25 +1156,20 @@ static void omap_sham_finish_req(struct ahash_request *req, int err)
 
 	ctx->sg = NULL;
 
-	dd->flags &= ~(BIT(FLAGS_SGS_ALLOCED) | BIT(FLAGS_SGS_COPIED));
+	dd->flags &= ~(BIT(FLAGS_SGS_ALLOCED) | BIT(FLAGS_SGS_COPIED) |
+		       BIT(FLAGS_CPU) | BIT(FLAGS_DMA_READY) |
+		       BIT(FLAGS_OUTPUT_READY));
+
+	if (!err)
+		dd->pdata->copy_hash(req, 1);
 
 	if (dd->flags & BIT(FLAGS_HUGE)) {
-		dd->flags &= ~(BIT(FLAGS_CPU) | BIT(FLAGS_DMA_READY) |
-				BIT(FLAGS_OUTPUT_READY) | BIT(FLAGS_HUGE));
-		omap_sham_prepare_request(req, ctx->op == OP_UPDATE);
-		if (ctx->op == OP_UPDATE || (dd->flags & BIT(FLAGS_HUGE))) {
-			err = omap_sham_update_req(dd);
-			if (err != -EINPROGRESS &&
-			    (ctx->flags & BIT(FLAGS_FINUP)))
-				err = omap_sham_final_req(dd);
-		} else if (ctx->op == OP_FINAL) {
-			omap_sham_final_req(dd);
-		}
+		/* Re-enqueue the request */
+		omap_sham_enqueue(req, ctx->op);
 		return;
 	}
 
 	if (!err) {
-		dd->pdata->copy_hash(req, 1);
 		if (test_bit(FLAGS_FINAL, &dd->flags))
 			err = omap_sham_finish(req);
 	} else {
@@ -1142,7 +1177,7 @@ static void omap_sham_finish_req(struct ahash_request *req, int err)
 	}
 
 	/* atomic operation is not needed here */
-	dd->flags &= ~(BIT(FLAGS_BUSY) | BIT(FLAGS_FINAL) | BIT(FLAGS_CPU) |
+	dd->flags &= ~(BIT(FLAGS_FINAL) | BIT(FLAGS_CPU) |
 			BIT(FLAGS_DMA_READY) | BIT(FLAGS_OUTPUT_READY));
 
 	pm_runtime_mark_last_busy(dd->dev);
@@ -1150,81 +1185,13 @@ static void omap_sham_finish_req(struct ahash_request *req, int err)
 
 	ctx->offset = 0;
 
-	if (req->base.complete)
-		req->base.complete(&req->base, err);
+	crypto_finalize_hash_request(dd->engine, req, err);
 }
 
 static int omap_sham_handle_queue(struct omap_sham_dev *dd,
 				  struct ahash_request *req)
 {
-	struct crypto_async_request *async_req, *backlog;
-	struct omap_sham_reqctx *ctx;
-	unsigned long flags;
-	int err = 0, ret = 0;
-
-retry:
-	spin_lock_irqsave(&dd->lock, flags);
-	if (req)
-		ret = ahash_enqueue_request(&dd->queue, req);
-	if (test_bit(FLAGS_BUSY, &dd->flags)) {
-		spin_unlock_irqrestore(&dd->lock, flags);
-		return ret;
-	}
-	backlog = crypto_get_backlog(&dd->queue);
-	async_req = crypto_dequeue_request(&dd->queue);
-	if (async_req)
-		set_bit(FLAGS_BUSY, &dd->flags);
-	spin_unlock_irqrestore(&dd->lock, flags);
-
-	if (!async_req)
-		return ret;
-
-	if (backlog)
-		backlog->complete(backlog, -EINPROGRESS);
-
-	req = ahash_request_cast(async_req);
-	dd->req = req;
-	ctx = ahash_request_ctx(req);
-
-	err = omap_sham_prepare_request(req, ctx->op == OP_UPDATE);
-	if (err || !ctx->total)
-		goto err1;
-
-	dev_dbg(dd->dev, "handling new req, op: %lu, nbytes: %d\n",
-						ctx->op, req->nbytes);
-
-	err = omap_sham_hw_init(dd);
-	if (err)
-		goto err1;
-
-	if (ctx->digcnt)
-		/* request has changed - restore hash */
-		dd->pdata->copy_hash(req, 0);
-
-	if (ctx->op == OP_UPDATE || (dd->flags & BIT(FLAGS_HUGE))) {
-		err = omap_sham_update_req(dd);
-		if (err != -EINPROGRESS && (ctx->flags & BIT(FLAGS_FINUP)))
-			/* no final() after finup() */
-			err = omap_sham_final_req(dd);
-	} else if (ctx->op == OP_FINAL) {
-		err = omap_sham_final_req(dd);
-	}
-err1:
-	dev_dbg(dd->dev, "exit, err: %d\n", err);
-
-	if (err != -EINPROGRESS) {
-		/* done_task will not finish it, so do it here */
-		omap_sham_finish_req(req, err);
-		req = NULL;
-
-		/*
-		 * Execute next request immediately if there is anything
-		 * in queue.
-		 */
-		goto retry;
-	}
-
-	return ret;
+	return crypto_transfer_hash_request_to_engine(dd->engine, req);
 }
 
 static int omap_sham_enqueue(struct ahash_request *req, unsigned int op)
@@ -1394,6 +1361,10 @@ static int omap_sham_cra_init_alg(struct crypto_tfm *tfm, const char *alg_base)
 
 	}
 
+	tctx->enginectx.op.do_one_request = omap_sham_hash_one_req;
+	tctx->enginectx.op.prepare_request = omap_sham_prepare_request;
+	tctx->enginectx.op.unprepare_request = NULL;
+
 	return 0;
 }
 
@@ -1757,11 +1728,6 @@ static void omap_sham_done_task(unsigned long data)
 
 	dev_dbg(dd->dev, "%s: flags=%lx\n", __func__, dd->flags);
 
-	if (!test_bit(FLAGS_BUSY, &dd->flags)) {
-		omap_sham_handle_queue(dd, NULL);
-		return;
-	}
-
 	if (test_bit(FLAGS_CPU, &dd->flags)) {
 		if (test_and_clear_bit(FLAGS_OUTPUT_READY, &dd->flags))
 			goto finish;
@@ -1786,20 +1752,12 @@ static void omap_sham_done_task(unsigned long data)
 	dev_dbg(dd->dev, "update done: err: %d\n", err);
 	/* finish curent request */
 	omap_sham_finish_req(dd->req, err);
-
-	/* If we are not busy, process next req */
-	if (!test_bit(FLAGS_BUSY, &dd->flags))
-		omap_sham_handle_queue(dd, NULL);
 }
 
 static irqreturn_t omap_sham_irq_common(struct omap_sham_dev *dd)
 {
-	if (!test_bit(FLAGS_BUSY, &dd->flags)) {
-		dev_warn(dd->dev, "Interrupt when no active requests.\n");
-	} else {
-		set_bit(FLAGS_OUTPUT_READY, &dd->flags);
-		tasklet_schedule(&dd->done_task);
-	}
+	set_bit(FLAGS_OUTPUT_READY, &dd->flags);
+	tasklet_schedule(&dd->done_task);
 
 	return IRQ_HANDLED;
 }
@@ -2072,7 +2030,6 @@ static ssize_t queue_len_store(struct device *dev,
 	struct omap_sham_dev *dd = dev_get_drvdata(dev);
 	ssize_t status;
 	long value;
-	unsigned long flags;
 
 	status = kstrtol(buf, 0, &value);
 	if (status)
@@ -2086,9 +2043,7 @@ static ssize_t queue_len_store(struct device *dev,
 	 * than current size, it will just not accept new entries until
 	 * it has shrank enough.
 	 */
-	spin_lock_irqsave(&dd->lock, flags);
 	dd->queue.max_qlen = value;
-	spin_unlock_irqrestore(&dd->lock, flags);
 
 	return size;
 }
@@ -2125,7 +2080,6 @@ static int omap_sham_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, dd);
 
 	INIT_LIST_HEAD(&dd->list);
-	spin_lock_init(&dd->lock);
 	tasklet_init(&dd->done_task, omap_sham_done_task, (unsigned long)dd);
 	crypto_init_queue(&dd->queue, OMAP_SHAM_QUEUE_LENGTH);
 
@@ -2190,6 +2144,16 @@ static int omap_sham_probe(struct platform_device *pdev)
 	list_add_tail(&dd->list, &sham.dev_list);
 	spin_unlock(&sham.lock);
 
+	dd->engine = crypto_engine_alloc_init(dev, 1);
+	if (!dd->engine) {
+		err = -ENOMEM;
+		goto err_engine;
+	}
+
+	err = crypto_engine_start(dd->engine);
+	if (err)
+		goto err_engine_start;
+
 	for (i = 0; i < dd->pdata->algs_info_size; i++) {
 		if (dd->pdata->algs_info[i].registered)
 			break;
@@ -2223,6 +2187,12 @@ static int omap_sham_probe(struct platform_device *pdev)
 		for (j = dd->pdata->algs_info[i].registered - 1; j >= 0; j--)
 			crypto_unregister_ahash(
 					&dd->pdata->algs_info[i].algs_list[j]);
+err_engine_start:
+	crypto_engine_exit(dd->engine);
+err_engine:
+	spin_lock(&sham.lock);
+	list_del(&dd->list);
+	spin_unlock(&sham.lock);
 err_pm:
 	pm_runtime_disable(dev);
 	if (!dd->polling_mode)
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
