Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91A151E420C
	for <lists+linux-omap@lfdr.de>; Wed, 27 May 2020 14:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729387AbgE0MYs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 May 2020 08:24:48 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:35616 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729288AbgE0MYs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 May 2020 08:24:48 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04RCOhaH005910;
        Wed, 27 May 2020 07:24:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590582283;
        bh=bWc2RhjzhYFoeGzIOp0t00bMitcQ7MX4ewFdu1cUq80=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=MxwAzCJOSvjD+qQ7pWZN4Vm8CUvGlnoACtge2MG7zS2nVx7vwp7RGR/qcDo2x1rla
         8nX2M8YOYOo6PVyfQ8JhvYZoY2cE0q+du8uSYd5NsxD7CL3mg9g9lGA2PCA7no2brD
         SPIGBQJytPsks0ALIb9U0fR21tTpjygbpGStoAOU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04RCOhBX130293
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 27 May 2020 07:24:43 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 May 2020 07:24:43 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 May 2020 07:24:43 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04RCOYRi101979;
        Wed, 27 May 2020 07:24:42 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>
Subject: [RESEND PATCHv3 5/7] crypto: omap-sham: fix very small data size handling
Date:   Wed, 27 May 2020 15:24:27 +0300
Message-ID: <20200527122429.14888-6-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200527122429.14888-1-t-kristo@ti.com>
References: <20200527122429.14888-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

With very small data sizes, the whole data can end up in the xmit
buffer. This code path does not set the sg_len properly which causes the
core dma framework to crash. Fix by adding the proper size in place.
Also, the data length must be a multiple of block-size, so extend the
DMA data size while here.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-sham.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/crypto/omap-sham.c b/drivers/crypto/omap-sham.c
index 9823d7dfca9c..86949f1ac6a7 100644
--- a/drivers/crypto/omap-sham.c
+++ b/drivers/crypto/omap-sham.c
@@ -753,9 +753,11 @@ static int omap_sham_align_sgs(struct scatterlist *sg,
 
 	if (!sg || !sg->length || !nbytes) {
 		if (bufcnt) {
+			bufcnt = DIV_ROUND_UP(bufcnt, bs) * bs;
 			sg_init_table(rctx->sgl, 1);
 			sg_set_buf(rctx->sgl, rctx->dd->xmit_buf, bufcnt);
 			rctx->sg = rctx->sgl;
+			rctx->sg_len = 1;
 		}
 
 		return 0;
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
