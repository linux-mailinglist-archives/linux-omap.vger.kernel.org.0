Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB69EFF50
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2019 15:02:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389440AbfKEOCC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Nov 2019 09:02:02 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:44058 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389435AbfKEOCB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Nov 2019 09:02:01 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1udg071641;
        Tue, 5 Nov 2019 08:01:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572962516;
        bh=+AmfYZzlDSB4ydg8jhXUTAd0sR8HN8hG6r1nfOurSMs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=baEzSgE3Vrmx+S/C4RCByCuJrZQaV95bwVHtG+mKvFtcEojqODy+jRpJAV8QoqYLX
         qqhBAnpCukV5SPEDlfXGkSLl5OmvjrBNfB/NqJ0D/yorwehSyY12SfBk8YJ0QSxACh
         9ACHThxk07LixVF753otT46YsiozAa8TKDuk7LX0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA5E1ujX059973
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 5 Nov 2019 08:01:56 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 5 Nov
 2019 08:01:41 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 5 Nov 2019 08:01:41 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1FFv068289;
        Tue, 5 Nov 2019 08:01:55 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>, <ard.biesheuvel@kernel.org>
Subject: [PATCHv2 18/22] crypto: omap-sham: fix unaligned sg list handling
Date:   Tue, 5 Nov 2019 16:01:07 +0200
Message-ID: <20191105140111.20285-19-t-kristo@ti.com>
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

Currently the offset for unaligned sg lists is not handled properly
leading into wrong results with certain testmgr self tests. Fix the
handling to account for proper offset within the current sg list.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-sham.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/omap-sham.c b/drivers/crypto/omap-sham.c
index 33a58ebf652c..4f915a4ef5b0 100644
--- a/drivers/crypto/omap-sham.c
+++ b/drivers/crypto/omap-sham.c
@@ -673,10 +673,10 @@ static int omap_sham_copy_sg_lists(struct omap_sham_reqctx *ctx,
 	while (sg && new_len) {
 		int len = sg->length - offset;
 
-		if (offset) {
+		if (len <= 0) {
 			offset -= sg->length;
-			if (offset < 0)
-				offset = 0;
+			sg = sg_next(sg);
+			continue;
 		}
 
 		if (new_len < len)
@@ -684,7 +684,9 @@ static int omap_sham_copy_sg_lists(struct omap_sham_reqctx *ctx,
 
 		if (len > 0) {
 			new_len -= len;
-			sg_set_page(tmp, sg_page(sg), len, sg->offset);
+			sg_set_page(tmp, sg_page(sg), len, sg->offset + offset);
+			offset = 0;
+			ctx->offset = 0;
 			ctx->sg_len++;
 			if (new_len <= 0)
 				break;
@@ -834,7 +836,14 @@ static int omap_sham_align_sgs(struct scatterlist *sg,
 	rctx->total = new_len;
 	rctx->offset += new_len;
 	rctx->sg_len = n;
-	rctx->sg = sg;
+	if (rctx->bufcnt) {
+		sg_init_table(rctx->sgl, 2);
+		sg_set_buf(rctx->sgl, rctx->dd->xmit_buf, rctx->bufcnt);
+		sg_chain(rctx->sgl, 2, sg);
+		rctx->sg = rctx->sgl;
+	} else {
+		rctx->sg = sg;
+	}
 
 	return 0;
 }
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
