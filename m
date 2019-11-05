Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE9EBEFF39
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2019 15:01:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389379AbfKEOBo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Nov 2019 09:01:44 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43962 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389368AbfKEOBo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Nov 2019 09:01:44 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1cd9071560;
        Tue, 5 Nov 2019 08:01:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572962498;
        bh=9OwOcAzmISWskR6psmzxNFNO/2lnZlaYpyywZJ98T/0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=azNehCvqXPkDKmKVhKDHwfad8f/CzcItSOg7afM1wJWyOKcVfxeiz+SQJCp1ykVop
         B6NHMdsy4+vLXjFoHpg4/p0XHtcWakT/um5+HjV2Qd3IKIupwSff8C+fbmnap4DRa+
         PW0sl340Z/5TdEZt579V2HCwP1swO2W8vJgmE/bQ=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA5E1cDq059747
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 5 Nov 2019 08:01:38 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 5 Nov
 2019 08:01:23 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 5 Nov 2019 08:01:23 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1FFl068289;
        Tue, 5 Nov 2019 08:01:36 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>, <ard.biesheuvel@kernel.org>
Subject: [PATCHv2 08/22] crypto: omap-sham: fix split update cases with cryptomgr tests
Date:   Tue, 5 Nov 2019 16:00:57 +0200
Message-ID: <20191105140111.20285-9-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191105140111.20285-1-t-kristo@ti.com>
References: <20191105140111.20285-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The updated crypto manager finds a couple of new bugs from the omap-sham
driver. Basically the split update cases fail to calculate the amount of
data to be sent properly, leading into failed results and hangs with the
hw accelerator.

To fix these, the buffer handling needs to be fixed, but we do some cleanup
for the code at the same time to cut away some unnecessary code so that
it is easier to fix.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-sham.c | 102 ++++++++++++-------------------------
 1 file changed, 33 insertions(+), 69 deletions(-)

diff --git a/drivers/crypto/omap-sham.c b/drivers/crypto/omap-sham.c
index e71cd977b621..33a58ebf652c 100644
--- a/drivers/crypto/omap-sham.c
+++ b/drivers/crypto/omap-sham.c
@@ -648,6 +648,8 @@ static int omap_sham_copy_sg_lists(struct omap_sham_reqctx *ctx,
 	struct scatterlist *tmp;
 	int offset = ctx->offset;
 
+	ctx->total = new_len;
+
 	if (ctx->bufcnt)
 		n++;
 
@@ -665,6 +667,7 @@ static int omap_sham_copy_sg_lists(struct omap_sham_reqctx *ctx,
 		sg_set_buf(tmp, ctx->dd->xmit_buf, ctx->bufcnt);
 		tmp = sg_next(tmp);
 		ctx->sg_len++;
+		new_len -= ctx->bufcnt;
 	}
 
 	while (sg && new_len) {
@@ -682,15 +685,18 @@ static int omap_sham_copy_sg_lists(struct omap_sham_reqctx *ctx,
 		if (len > 0) {
 			new_len -= len;
 			sg_set_page(tmp, sg_page(sg), len, sg->offset);
+			ctx->sg_len++;
 			if (new_len <= 0)
-				sg_mark_end(tmp);
+				break;
 			tmp = sg_next(tmp);
-			ctx->sg_len++;
 		}
 
 		sg = sg_next(sg);
 	}
 
+	if (tmp)
+		sg_mark_end(tmp);
+
 	set_bit(FLAGS_SGS_ALLOCED, &ctx->dd->flags);
 
 	ctx->offset += new_len - ctx->bufcnt;
@@ -726,6 +732,7 @@ static int omap_sham_copy_sgs(struct omap_sham_reqctx *ctx,
 	ctx->sg_len = 1;
 	ctx->offset += new_len - ctx->bufcnt;
 	ctx->bufcnt = 0;
+	ctx->total = new_len;
 
 	return 0;
 }
@@ -771,6 +778,9 @@ static int omap_sham_align_sgs(struct scatterlist *sg,
 			}
 			nbytes -= bufcnt;
 			bufcnt = 0;
+			if (!nbytes)
+				list_ok = false;
+
 			continue;
 		}
 
@@ -820,9 +830,9 @@ static int omap_sham_align_sgs(struct scatterlist *sg,
 		return omap_sham_copy_sgs(rctx, sg, bs, new_len);
 	else if (!list_ok)
 		return omap_sham_copy_sg_lists(rctx, sg, bs, new_len);
-	else
-		rctx->offset += new_len;
 
+	rctx->total = new_len;
+	rctx->offset += new_len;
 	rctx->sg_len = n;
 	rctx->sg = sg;
 
@@ -834,99 +844,54 @@ static int omap_sham_prepare_request(struct ahash_request *req, bool update)
 	struct omap_sham_reqctx *rctx = ahash_request_ctx(req);
 	int bs;
 	int ret;
-	int nbytes;
+	unsigned int nbytes;
 	bool final = rctx->flags & BIT(FLAGS_FINUP);
-	int xmit_len, hash_later;
+	int hash_later;
 
 	bs = get_block_size(rctx);
 
-	if (update)
-		nbytes = req->nbytes;
-	else
-		nbytes = 0;
+	nbytes = rctx->bufcnt;
 
-	rctx->total = nbytes + rctx->bufcnt - rctx->offset;
+	if (update)
+		nbytes += req->nbytes - rctx->offset;
 
 	dev_dbg(rctx->dd->dev,
 		"%s: nbytes=%d, bs=%d, total=%d, offset=%d, bufcnt=%d\n",
 		__func__, nbytes, bs, rctx->total, rctx->offset,
 		rctx->bufcnt);
 
-	if (!rctx->total)
+	if (!nbytes)
 		return 0;
 
-	if (nbytes && (!IS_ALIGNED(rctx->bufcnt, bs))) {
+	rctx->total = nbytes;
+
+	if (update && req->nbytes && (!IS_ALIGNED(rctx->bufcnt, bs))) {
 		int len = bs - rctx->bufcnt % bs;
 
-		if (len > nbytes)
-			len = nbytes;
+		if (len > req->nbytes)
+			len = req->nbytes;
 		scatterwalk_map_and_copy(rctx->buffer + rctx->bufcnt, req->src,
 					 0, len, 0);
 		rctx->bufcnt += len;
-		nbytes -= len;
 		rctx->offset = len;
 	}
 
 	if (rctx->bufcnt)
 		memcpy(rctx->dd->xmit_buf, rctx->buffer, rctx->bufcnt);
 
-	ret = omap_sham_align_sgs(req->src, rctx->total, bs, final, rctx);
+	ret = omap_sham_align_sgs(req->src, nbytes, bs, final, rctx);
 	if (ret)
 		return ret;
 
-	xmit_len = rctx->total;
-
-	if (xmit_len > OMAP_SHA_MAX_DMA_LEN)
-		xmit_len = OMAP_SHA_MAX_DMA_LEN;
-
-	if (!IS_ALIGNED(xmit_len, bs)) {
-		if (final)
-			xmit_len = DIV_ROUND_UP(xmit_len, bs) * bs;
-		else
-			xmit_len = xmit_len / bs * bs;
-	} else if (!final && rctx->total == xmit_len) {
-		xmit_len -= bs;
-	}
-
-	hash_later = rctx->total - xmit_len;
+	hash_later = nbytes - rctx->total;
 	if (hash_later < 0)
 		hash_later = 0;
 
-	if (rctx->bufcnt && nbytes) {
-		/* have data from previous operation and current */
-		sg_init_table(rctx->sgl, 2);
-		sg_set_buf(rctx->sgl, rctx->dd->xmit_buf, rctx->bufcnt);
-
-		sg_chain(rctx->sgl, 2, req->src);
-
-		rctx->sg = rctx->sgl;
-
-		rctx->sg_len++;
-	} else if (rctx->bufcnt) {
-		/* have buffered data only */
-		sg_init_table(rctx->sgl, 1);
-		sg_set_buf(rctx->sgl, rctx->dd->xmit_buf, xmit_len);
-
-		rctx->sg = rctx->sgl;
-
-		rctx->sg_len = 1;
-	}
-
-	if (hash_later && hash_later <= rctx->buflen) {
-		int offset = 0;
-
-		if (hash_later > req->nbytes) {
-			memcpy(rctx->buffer, rctx->buffer + xmit_len,
-			       hash_later - req->nbytes);
-			offset = hash_later - req->nbytes;
-		}
-
-		if (req->nbytes) {
-			scatterwalk_map_and_copy(rctx->buffer + offset,
-						 req->src,
-						 offset + req->nbytes -
-						 hash_later, hash_later, 0);
-		}
+	if (hash_later) {
+		scatterwalk_map_and_copy(rctx->buffer,
+					 req->src,
+					 req->nbytes - hash_later,
+					 hash_later, 0);
 
 		rctx->bufcnt = hash_later;
 	} else {
@@ -936,8 +901,7 @@ static int omap_sham_prepare_request(struct ahash_request *req, bool update)
 	if (hash_later > rctx->buflen)
 		set_bit(FLAGS_HUGE, &rctx->dd->flags);
 
-	if (!final)
-		rctx->total = xmit_len;
+	rctx->total = min(nbytes, rctx->total);
 
 	return 0;
 }
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
