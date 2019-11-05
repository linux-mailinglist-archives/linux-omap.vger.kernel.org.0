Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F142EFF31
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2019 15:01:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389369AbfKEOBl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Nov 2019 09:01:41 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:35128 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389290AbfKEOBl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Nov 2019 09:01:41 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1aPm038169;
        Tue, 5 Nov 2019 08:01:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572962496;
        bh=/548IYlsZzVpGFlUyLpuldMg6WhApejqtJF4qdDLFY8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=xnNecQu0ByEXRygUFD4eTHRu4VpwDaHeJSu2V1Cb3iI5G1S8tJeCIyF/Y/vPy0z8/
         O9nJyYgVcxnBSOW2z3+EAG0edxyoegvy7P4E6cYt/awKIT1fQxX5f/weiOV5zM5AY2
         ecP3Dt4H+BFUgPDDDCC5pVuN9zKFzwkRZBCXKNXI=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA5E1aEB087706
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 5 Nov 2019 08:01:36 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 5 Nov
 2019 08:01:36 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 5 Nov 2019 08:01:36 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1FFk068289;
        Tue, 5 Nov 2019 08:01:34 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>, <ard.biesheuvel@kernel.org>
Subject: [PATCHv2 07/22] crypto: omap-aes-gcm: fix corner case with only auth data
Date:   Tue, 5 Nov 2019 16:00:56 +0200
Message-ID: <20191105140111.20285-8-t-kristo@ti.com>
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

Fix a corner case where only authdata is generated, without any provided
assocdata / cryptdata. Passing the empty scatterlists to OMAP AES core driver
in this case would confuse it, failing to map DMAs.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-aes-gcm.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/crypto/omap-aes-gcm.c b/drivers/crypto/omap-aes-gcm.c
index 9bbedbccfadf..dfd4d1cac421 100644
--- a/drivers/crypto/omap-aes-gcm.c
+++ b/drivers/crypto/omap-aes-gcm.c
@@ -148,12 +148,14 @@ static int omap_aes_gcm_copy_buffers(struct omap_aes_dev *dd,
 	if (req->src == req->dst || dd->out_sg == sg_arr)
 		flags |= OMAP_CRYPTO_FORCE_COPY;
 
-	ret = omap_crypto_align_sg(&dd->out_sg, cryptlen,
-				   AES_BLOCK_SIZE, &dd->out_sgl,
-				   flags,
-				   FLAGS_OUT_DATA_ST_SHIFT, &dd->flags);
-	if (ret)
-		return ret;
+	if (cryptlen) {
+		ret = omap_crypto_align_sg(&dd->out_sg, cryptlen,
+					   AES_BLOCK_SIZE, &dd->out_sgl,
+					   flags,
+					   FLAGS_OUT_DATA_ST_SHIFT, &dd->flags);
+		if (ret)
+			return ret;
+	}
 
 	dd->in_sg_len = sg_nents_for_len(dd->in_sg, alen + clen);
 	dd->out_sg_len = sg_nents_for_len(dd->out_sg, clen);
@@ -287,8 +289,12 @@ static int omap_aes_gcm_handle_queue(struct omap_aes_dev *dd,
 		return err;
 
 	err = omap_aes_write_ctrl(dd);
-	if (!err)
-		err = omap_aes_crypt_dma_start(dd);
+	if (!err) {
+		if (dd->in_sg_len && dd->out_sg_len)
+			err = omap_aes_crypt_dma_start(dd);
+		else
+			omap_aes_gcm_dma_out_callback(dd);
+	}
 
 	if (err) {
 		omap_aes_gcm_finish_req(dd, err);
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
