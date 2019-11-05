Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD43EFF57
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2019 15:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389449AbfKEOCJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Nov 2019 09:02:09 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:35274 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389342AbfKEOCJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Nov 2019 09:02:09 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5E24h4038298;
        Tue, 5 Nov 2019 08:02:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572962524;
        bh=9fJAHIVAgIN3PPmEYUALLZCyp9Oxs8DgQg19svNGF8c=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=HbLRw8kgswNEXHxEe2P87lvRkRS3yxuXfOAO8ILecB6xsNbpf7qQuIcWRaguB4xwo
         HgqnEMOTJgCoTdbDwzDzLFg+NzS33ufa4GqNpT5KNslDGkIt0bOw1HOqAn5u88cv2d
         cQNxQNj/pPlJqbn7i+wnjn0SfiOXzxnF1JAfH2sk=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5E23Rm085039;
        Tue, 5 Nov 2019 08:02:03 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 5 Nov
 2019 08:02:03 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 5 Nov 2019 08:02:03 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1FG1068289;
        Tue, 5 Nov 2019 08:02:01 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>, <ard.biesheuvel@kernel.org>
Subject: [PATCHv2 22/22] crypto: omap-crypto: copy the temporary data to output buffer properly
Date:   Tue, 5 Nov 2019 16:01:11 +0200
Message-ID: <20191105140111.20285-23-t-kristo@ti.com>
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

Both source and destination are scatterlists that can contain multiple
entries under the omap crypto cleanup handling. Current code only copies
data from the first source scatterlist entry to the target scatterlist,
potentially omitting any sg entries following the first one. Instead,
implement a new routine that walks through both source and target and
copies the data over once it goes.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-crypto.c | 37 +++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/omap-crypto.c b/drivers/crypto/omap-crypto.c
index 7d592d93bb1c..cc88b7362bc2 100644
--- a/drivers/crypto/omap-crypto.c
+++ b/drivers/crypto/omap-crypto.c
@@ -154,6 +154,41 @@ int omap_crypto_align_sg(struct scatterlist **sg, int total, int bs,
 }
 EXPORT_SYMBOL_GPL(omap_crypto_align_sg);
 
+static void omap_crypto_copy_data(struct scatterlist *src,
+				  struct scatterlist *dst,
+				  int offset, int len)
+{
+	int amt;
+	void *srcb, *dstb;
+	int srco = 0, dsto = offset;
+
+	while (src && dst && len) {
+		if (srco >= src->length) {
+			srco -= src->length;
+			src = sg_next(src);
+			continue;
+		}
+
+		if (dsto >= dst->length) {
+			dsto -= dst->length;
+			dst = sg_next(dst);
+			continue;
+		}
+
+		amt = min(src->length - srco, dst->length - dsto);
+		amt = min(len, amt);
+
+		srcb = sg_virt(src) + srco;
+		dstb = sg_virt(dst) + dsto;
+
+		memcpy(dstb, srcb, amt);
+
+		srco += amt;
+		dsto += amt;
+		len -= amt;
+	}
+}
+
 void omap_crypto_cleanup(struct scatterlist *sg, struct scatterlist *orig,
 			 int offset, int len, u8 flags_shift,
 			 unsigned long flags)
@@ -171,7 +206,7 @@ void omap_crypto_cleanup(struct scatterlist *sg, struct scatterlist *orig,
 	pages = get_order(len);
 
 	if (orig && (flags & OMAP_CRYPTO_COPY_MASK))
-		scatterwalk_map_and_copy(buf, orig, offset, len, 1);
+		omap_crypto_copy_data(sg, orig, offset, len);
 
 	if (flags & OMAP_CRYPTO_DATA_COPIED)
 		free_pages((unsigned long)buf, pages);
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
