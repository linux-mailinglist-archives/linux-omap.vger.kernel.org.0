Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C770E1BE163
	for <lists+linux-omap@lfdr.de>; Wed, 29 Apr 2020 16:42:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbgD2Omd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Apr 2020 10:42:33 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:45406 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726348AbgD2Omc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 29 Apr 2020 10:42:32 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03TEgPdo056481;
        Wed, 29 Apr 2020 09:42:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588171345;
        bh=bWc2RhjzhYFoeGzIOp0t00bMitcQ7MX4ewFdu1cUq80=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=meeZJ2mJcYwrxHqXXunbAT6j1eKR6jylmE6IgUI6mYiZYpUVwjEiujdBHe4aUty2p
         +8T5AYFGtZlR5xW2wLnl8RWBYyq1fd6+tD3Nyg6wH1g/7zably6RvDZ7TfR2nJyXua
         QXF7tQK44FMU81he3rLhW8BJ/pCmGtfw5V/WbZpY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03TEgQW3012453
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 29 Apr 2020 09:42:26 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 29
 Apr 2020 09:42:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 29 Apr 2020 09:42:25 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03TEgHjP103561;
        Wed, 29 Apr 2020 09:42:24 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>
Subject: [PATCH 5/6] crypto: omap-sham: fix very small data size handling
Date:   Wed, 29 Apr 2020 17:42:04 +0300
Message-ID: <20200429144205.5291-6-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429144205.5291-1-t-kristo@ti.com>
References: <20200429144205.5291-1-t-kristo@ti.com>
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
