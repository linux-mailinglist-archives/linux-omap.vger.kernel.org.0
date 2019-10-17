Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64F40DAC05
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 14:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728554AbfJQM0Y (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 08:26:24 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:50398 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409377AbfJQM0X (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 17 Oct 2019 08:26:23 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9HCQE24084614;
        Thu, 17 Oct 2019 07:26:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571315174;
        bh=/548IYlsZzVpGFlUyLpuldMg6WhApejqtJF4qdDLFY8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=FSCP1gxGgF0OIz9XnlIfJWQr2ZVvUsB50V54Y+CK+gsqhBp3UnfAl/fUICNx/x7fM
         DFDLNW8+slMGMe3ZLaOaz62HUigsONZxBpH+ifQJCryxE5Qz1DWww6EOFotvaiCp6T
         fm+KNqka2JkfjYqdtkDwy1A60Tpl6JI5uXeuyQQ4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9HCQEJp075376
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 17 Oct 2019 07:26:14 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 17
 Oct 2019 07:26:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 17 Oct 2019 07:26:13 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9HCPxNc073246;
        Thu, 17 Oct 2019 07:26:12 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>, <ard.biesheuvel@linaro.org>
CC:     <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 07/10] crypto: omap-aes-gcm: fix corner case with only auth data
Date:   Thu, 17 Oct 2019 15:25:46 +0300
Message-ID: <20191017122549.4634-8-t-kristo@ti.com>
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
