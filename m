Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9481BDABFE
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 14:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502302AbfJQM0U (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 08:26:20 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:54440 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406168AbfJQM0P (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 17 Oct 2019 08:26:15 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9HCQ5d0086492;
        Thu, 17 Oct 2019 07:26:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571315165;
        bh=5LuvH1G1CxJXjnQPeRbfhDmv2ndruQP/Xg9DUfak+xk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=jBDjlVJirsa8N89sMOxF+KHGEG0wvSoaySrlqFbxbHTnuoFhJiBox9sX5wlDUCTu6
         1sfMBn4YbUjjFZHEFjD/YEMMZMmHx8zRUi70tXZ34BbBluOVev54UsJSX47FqMjAuz
         seuePR3ajC3k89ccleXd9pErdtHUzU6dZjMNj1t0=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9HCQ5n8117620;
        Thu, 17 Oct 2019 07:26:05 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 17
 Oct 2019 07:26:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 17 Oct 2019 07:26:03 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9HCPxNW073246;
        Thu, 17 Oct 2019 07:26:01 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>, <ard.biesheuvel@linaro.org>
CC:     <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 01/10] crypto: omap-sham: split up data to multiple sg elements with huge data
Date:   Thu, 17 Oct 2019 15:25:40 +0300
Message-ID: <20191017122549.4634-2-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191017122549.4634-1-t-kristo@ti.com>
References: <20191017122549.4634-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

When using huge data amount, allocating free pages fails as the kernel
isn't able to process get_free_page requests larger than MAX_ORDER.
Also, the DMA subsystem has an inherent limitation that data size
larger than some 2MB can't be handled properly. In these cases,
split up the data instead to smaller requests so that the kernel
can allocate the data, and also so that the DMA driver can handle
the separate SG elements.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
Tested-by: Bin Liu <b-liu@ti.com>
---
 drivers/crypto/omap-sham.c | 81 ++++++++++++++++++++++++++++++--------
 1 file changed, 64 insertions(+), 17 deletions(-)

diff --git a/drivers/crypto/omap-sham.c b/drivers/crypto/omap-sham.c
index ac80bc6af093..2e9435577cea 100644
--- a/drivers/crypto/omap-sham.c
+++ b/drivers/crypto/omap-sham.c
@@ -112,6 +112,8 @@
 #define FLAGS_BE32_SHA1		8
 #define FLAGS_SGS_COPIED	9
 #define FLAGS_SGS_ALLOCED	10
+#define FLAGS_HUGE		11
+
 /* context flags */
 #define FLAGS_FINUP		16
 
@@ -136,6 +138,8 @@
 #define BUFLEN			SHA512_BLOCK_SIZE
 #define OMAP_SHA_DMA_THRESHOLD	256
 
+#define OMAP_SHA_MAX_DMA_LEN	(1024 * 2048)
+
 struct omap_sham_dev;
 
 struct omap_sham_reqctx {
@@ -689,21 +693,20 @@ static int omap_sham_copy_sg_lists(struct omap_sham_reqctx *ctx,
 
 	set_bit(FLAGS_SGS_ALLOCED, &ctx->dd->flags);
 
+	ctx->offset += new_len - ctx->bufcnt;
 	ctx->bufcnt = 0;
 
 	return 0;
 }
 
 static int omap_sham_copy_sgs(struct omap_sham_reqctx *ctx,
-			      struct scatterlist *sg, int bs, int new_len)
+			      struct scatterlist *sg, int bs,
+			      unsigned int new_len)
 {
 	int pages;
 	void *buf;
-	int len;
-
-	len = new_len + ctx->bufcnt;
 
-	pages = get_order(ctx->total);
+	pages = get_order(new_len);
 
 	buf = (void *)__get_free_pages(GFP_ATOMIC, pages);
 	if (!buf) {
@@ -715,14 +718,14 @@ static int omap_sham_copy_sgs(struct omap_sham_reqctx *ctx,
 		memcpy(buf, ctx->dd->xmit_buf, ctx->bufcnt);
 
 	scatterwalk_map_and_copy(buf + ctx->bufcnt, sg, ctx->offset,
-				 ctx->total - ctx->bufcnt, 0);
+				 min(new_len, ctx->total) - ctx->bufcnt, 0);
 	sg_init_table(ctx->sgl, 1);
-	sg_set_buf(ctx->sgl, buf, len);
+	sg_set_buf(ctx->sgl, buf, new_len);
 	ctx->sg = ctx->sgl;
 	set_bit(FLAGS_SGS_COPIED, &ctx->dd->flags);
 	ctx->sg_len = 1;
+	ctx->offset += new_len - ctx->bufcnt;
 	ctx->bufcnt = 0;
-	ctx->offset = 0;
 
 	return 0;
 }
@@ -741,7 +744,7 @@ static int omap_sham_align_sgs(struct scatterlist *sg,
 	if (!sg || !sg->length || !nbytes)
 		return 0;
 
-	new_len = nbytes;
+	new_len = nbytes - offset;
 
 	if (offset)
 		list_ok = false;
@@ -751,6 +754,9 @@ static int omap_sham_align_sgs(struct scatterlist *sg,
 	else
 		new_len = (new_len - 1) / bs * bs;
 
+	if (!new_len)
+		return 0;
+
 	if (nbytes != new_len)
 		list_ok = false;
 
@@ -794,10 +800,17 @@ static int omap_sham_align_sgs(struct scatterlist *sg,
 		}
 	}
 
+	if (new_len > OMAP_SHA_MAX_DMA_LEN) {
+		new_len = OMAP_SHA_MAX_DMA_LEN;
+		aligned = false;
+	}
+
 	if (!aligned)
 		return omap_sham_copy_sgs(rctx, sg, bs, new_len);
 	else if (!list_ok)
 		return omap_sham_copy_sg_lists(rctx, sg, bs, new_len);
+	else
+		rctx->offset += new_len;
 
 	rctx->sg_len = n;
 	rctx->sg = sg;
@@ -821,7 +834,12 @@ static int omap_sham_prepare_request(struct ahash_request *req, bool update)
 	else
 		nbytes = 0;
 
-	rctx->total = nbytes + rctx->bufcnt;
+	rctx->total = nbytes + rctx->bufcnt - rctx->offset;
+
+	dev_dbg(rctx->dd->dev,
+		"%s: nbytes=%d, bs=%d, total=%d, offset=%d, bufcnt=%d\n",
+		__func__, nbytes, bs, rctx->total, rctx->offset,
+		rctx->bufcnt);
 
 	if (!rctx->total)
 		return 0;
@@ -847,12 +865,15 @@ static int omap_sham_prepare_request(struct ahash_request *req, bool update)
 
 	xmit_len = rctx->total;
 
+	if (xmit_len > OMAP_SHA_MAX_DMA_LEN)
+		xmit_len = OMAP_SHA_MAX_DMA_LEN;
+
 	if (!IS_ALIGNED(xmit_len, bs)) {
 		if (final)
 			xmit_len = DIV_ROUND_UP(xmit_len, bs) * bs;
 		else
 			xmit_len = xmit_len / bs * bs;
-	} else if (!final) {
+	} else if (!final && rctx->total == xmit_len) {
 		xmit_len -= bs;
 	}
 
@@ -880,7 +901,7 @@ static int omap_sham_prepare_request(struct ahash_request *req, bool update)
 		rctx->sg_len = 1;
 	}
 
-	if (hash_later) {
+	if (hash_later && hash_later <= rctx->buflen) {
 		int offset = 0;
 
 		if (hash_later > req->nbytes) {
@@ -901,6 +922,9 @@ static int omap_sham_prepare_request(struct ahash_request *req, bool update)
 		rctx->bufcnt = 0;
 	}
 
+	if (hash_later > rctx->buflen)
+		set_bit(FLAGS_HUGE, &rctx->dd->flags);
+
 	if (!final)
 		rctx->total = xmit_len;
 
@@ -998,10 +1022,11 @@ static int omap_sham_update_req(struct omap_sham_dev *dd)
 	struct ahash_request *req = dd->req;
 	struct omap_sham_reqctx *ctx = ahash_request_ctx(req);
 	int err;
-	bool final = ctx->flags & BIT(FLAGS_FINUP);
+	bool final = (ctx->flags & BIT(FLAGS_FINUP)) &&
+			!(dd->flags & BIT(FLAGS_HUGE));
 
-	dev_dbg(dd->dev, "update_req: total: %u, digcnt: %d, finup: %d\n",
-		 ctx->total, ctx->digcnt, (ctx->flags & BIT(FLAGS_FINUP)) != 0);
+	dev_dbg(dd->dev, "update_req: total: %u, digcnt: %d, final: %d",
+		ctx->total, ctx->digcnt, final);
 
 	if (ctx->total < get_block_size(ctx) ||
 	    ctx->total < dd->fallback_sz)
@@ -1024,6 +1049,9 @@ static int omap_sham_final_req(struct omap_sham_dev *dd)
 	struct omap_sham_reqctx *ctx = ahash_request_ctx(req);
 	int err = 0, use_dma = 1;
 
+	if (dd->flags & BIT(FLAGS_HUGE))
+		return 0;
+
 	if ((ctx->total <= get_block_size(ctx)) || dd->polling_mode)
 		/*
 		 * faster to handle last block with cpu or
@@ -1083,7 +1111,7 @@ static void omap_sham_finish_req(struct ahash_request *req, int err)
 
 	if (test_bit(FLAGS_SGS_COPIED, &dd->flags))
 		free_pages((unsigned long)sg_virt(ctx->sg),
-			   get_order(ctx->sg->length + ctx->bufcnt));
+			   get_order(ctx->sg->length));
 
 	if (test_bit(FLAGS_SGS_ALLOCED, &dd->flags))
 		kfree(ctx->sg);
@@ -1092,6 +1120,21 @@ static void omap_sham_finish_req(struct ahash_request *req, int err)
 
 	dd->flags &= ~(BIT(FLAGS_SGS_ALLOCED) | BIT(FLAGS_SGS_COPIED));
 
+	if (dd->flags & BIT(FLAGS_HUGE)) {
+		dd->flags &= ~(BIT(FLAGS_CPU) | BIT(FLAGS_DMA_READY) |
+				BIT(FLAGS_OUTPUT_READY) | BIT(FLAGS_HUGE));
+		omap_sham_prepare_request(req, ctx->op == OP_UPDATE);
+		if (ctx->op == OP_UPDATE || (dd->flags & BIT(FLAGS_HUGE))) {
+			err = omap_sham_update_req(dd);
+			if (err != -EINPROGRESS &&
+			    (ctx->flags & BIT(FLAGS_FINUP)))
+				err = omap_sham_final_req(dd);
+		} else if (ctx->op == OP_FINAL) {
+			omap_sham_final_req(dd);
+		}
+		return;
+	}
+
 	if (!err) {
 		dd->pdata->copy_hash(req, 1);
 		if (test_bit(FLAGS_FINAL, &dd->flags))
@@ -1107,6 +1150,8 @@ static void omap_sham_finish_req(struct ahash_request *req, int err)
 	pm_runtime_mark_last_busy(dd->dev);
 	pm_runtime_put_autosuspend(dd->dev);
 
+	ctx->offset = 0;
+
 	if (req->base.complete)
 		req->base.complete(&req->base, err);
 }
@@ -1158,7 +1203,7 @@ static int omap_sham_handle_queue(struct omap_sham_dev *dd,
 		/* request has changed - restore hash */
 		dd->pdata->copy_hash(req, 0);
 
-	if (ctx->op == OP_UPDATE) {
+	if (ctx->op == OP_UPDATE || (dd->flags & BIT(FLAGS_HUGE))) {
 		err = omap_sham_update_req(dd);
 		if (err != -EINPROGRESS && (ctx->flags & BIT(FLAGS_FINUP)))
 			/* no final() after finup() */
@@ -1730,6 +1775,8 @@ static void omap_sham_done_task(unsigned long data)
 	struct omap_sham_dev *dd = (struct omap_sham_dev *)data;
 	int err = 0;
 
+	dev_dbg(dd->dev, "%s: flags=%lx\n", __func__, dd->flags);
+
 	if (!test_bit(FLAGS_BUSY, &dd->flags)) {
 		omap_sham_handle_queue(dd, NULL);
 		return;
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
