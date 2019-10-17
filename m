Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA80DABFF
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 14:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502303AbfJQM0X (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 08:26:23 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:54478 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728554AbfJQM0X (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 17 Oct 2019 08:26:23 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9HCQDsH086521;
        Thu, 17 Oct 2019 07:26:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571315173;
        bh=gf7Wxfh77f7HHA3L8Iq0WB8JJs92egQOvoT79mDTzZI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=rUqYVpjOwrHoanumGzo0DLMjJiI9R8hQuBSBtl5TmV4TMbNmFzW0qQL+eqe0diDLm
         2xYJOSj/HqJa0r+voyBgxVZkLINCxfakIq1rbNlk/SYiy6uir2MfDHSKl0gPfeSoT0
         TPS2NuTtUAq7ywW/SYt/MWiVbsVZn3lWDS12M1Z0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9HCQDLM016505
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 17 Oct 2019 07:26:13 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 17
 Oct 2019 07:26:04 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 17 Oct 2019 07:26:12 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9HCPxNb073246;
        Thu, 17 Oct 2019 07:26:10 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>, <ard.biesheuvel@linaro.org>
CC:     <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 06/10] crypto: omap-sham: fix buffer handling for split test cases
Date:   Thu, 17 Oct 2019 15:25:45 +0300
Message-ID: <20191017122549.4634-7-t-kristo@ti.com>
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
