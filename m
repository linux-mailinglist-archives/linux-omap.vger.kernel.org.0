Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1196EEFD51
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2019 13:38:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388683AbfKEMiT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Nov 2019 07:38:19 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:53530 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388551AbfKEMiT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Nov 2019 07:38:19 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5CcD1A016852;
        Tue, 5 Nov 2019 06:38:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572957493;
        bh=+AmfYZzlDSB4ydg8jhXUTAd0sR8HN8hG6r1nfOurSMs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=zDFvrPRqT0LK+p1n3Nz8y+n5anm2OQMYD7/U2ESXrsm/wlreNncKEDo/9Nr3KNhqk
         W5GfrQUYanjQTlxUNE4sm4HmwojyZBIjnPWpwVs6KlTq0JQaU0bmWpzGgRUBK145J5
         5V38PizJeIfGnkOtNzgZzRiQFUcAwmYINA/juqK4=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA5CcD4Y087593
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 5 Nov 2019 06:38:13 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 5 Nov
 2019 06:37:56 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 5 Nov 2019 06:38:11 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5Cc6cx117093;
        Tue, 5 Nov 2019 06:38:10 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>, <ard.biesheuvel@kernel.org>
Subject: [PATCH 2/6] crypto: omap-sham: fix unaligned sg list handling
Date:   Tue, 5 Nov 2019 14:37:55 +0200
Message-ID: <20191105123759.25053-3-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191105123759.25053-1-t-kristo@ti.com>
References: <20191105123759.25053-1-t-kristo@ti.com>
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
