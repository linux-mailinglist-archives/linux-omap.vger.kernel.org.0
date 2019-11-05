Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4EAEFF36
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2019 15:01:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389374AbfKEOBm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Nov 2019 09:01:42 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:45256 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389368AbfKEOBm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Nov 2019 09:01:42 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1Yp4101155;
        Tue, 5 Nov 2019 08:01:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572962494;
        bh=gf7Wxfh77f7HHA3L8Iq0WB8JJs92egQOvoT79mDTzZI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=PSUTMr5k2hWcFS0rA9u1WNFHmhecrzz+6sfOyePpzRyWZo74oz/S1ggx79py6sucN
         haaUFjANx4koDqw/9ena01D2dT7f0JjrM8dOkW3Drk7wRH9i1kBepWw7ThOiJg225s
         jk5szRz+IJVAhrM68RPlCczDIflh9gRjSNv/epUc=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA5E1YhP059697
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 5 Nov 2019 08:01:34 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 5 Nov
 2019 08:01:19 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 5 Nov 2019 08:01:19 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1FFj068289;
        Tue, 5 Nov 2019 08:01:32 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>, <ard.biesheuvel@kernel.org>
Subject: [PATCHv2 06/22] crypto: omap-sham: fix buffer handling for split test cases
Date:   Tue, 5 Nov 2019 16:00:55 +0200
Message-ID: <20191105140111.20285-7-t-kristo@ti.com>
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

Current buffer handling logic fails in a case where the buffer contains
existing data from previous update which is divisible by block size.
This results in a block size of data to be left missing from the sg
list going out to the hw accelerator, ending up in stalling the
crypto accelerator driver (the last request never completes fully due
to missing data.)

Fix this by passing the total size of the data instead of the data size
of current request, and also parsing the buffer contents within the
prepare request handling.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-sham.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/omap-sham.c b/drivers/crypto/omap-sham.c
index 0bf07a7c060b..e71cd977b621 100644
--- a/drivers/crypto/omap-sham.c
+++ b/drivers/crypto/omap-sham.c
@@ -740,11 +740,12 @@ static int omap_sham_align_sgs(struct scatterlist *sg,
 	struct scatterlist *sg_tmp = sg;
 	int new_len;
 	int offset = rctx->offset;
+	int bufcnt = rctx->bufcnt;
 
 	if (!sg || !sg->length || !nbytes)
 		return 0;
 
-	new_len = nbytes - offset;
+	new_len = nbytes;
 
 	if (offset)
 		list_ok = false;
@@ -763,6 +764,16 @@ static int omap_sham_align_sgs(struct scatterlist *sg,
 	while (nbytes > 0 && sg_tmp) {
 		n++;
 
+		if (bufcnt) {
+			if (!IS_ALIGNED(bufcnt, bs)) {
+				aligned = false;
+				break;
+			}
+			nbytes -= bufcnt;
+			bufcnt = 0;
+			continue;
+		}
+
 #ifdef CONFIG_ZONE_DMA
 		if (page_zonenum(sg_page(sg_tmp)) != ZONE_DMA) {
 			aligned = false;
@@ -859,7 +870,7 @@ static int omap_sham_prepare_request(struct ahash_request *req, bool update)
 	if (rctx->bufcnt)
 		memcpy(rctx->dd->xmit_buf, rctx->buffer, rctx->bufcnt);
 
-	ret = omap_sham_align_sgs(req->src, nbytes, bs, final, rctx);
+	ret = omap_sham_align_sgs(req->src, rctx->total, bs, final, rctx);
 	if (ret)
 		return ret;
 
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
