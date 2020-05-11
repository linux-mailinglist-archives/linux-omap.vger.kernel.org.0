Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A6B71CD78D
	for <lists+linux-omap@lfdr.de>; Mon, 11 May 2020 13:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729327AbgEKLTn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 May 2020 07:19:43 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:52258 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729279AbgEKLTl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 11 May 2020 07:19:41 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04BBJU7g099248;
        Mon, 11 May 2020 06:19:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589195970;
        bh=bWc2RhjzhYFoeGzIOp0t00bMitcQ7MX4ewFdu1cUq80=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=vjD34CEC2fEPr16JkfYbidX3P1DeiXgxIYbz6lbgzJk1xJoWI1ZUrTgY1udXrFL2C
         s2ITSsLOKwSftDTHyO8zbv1VkFcP3hZCNY6GiIlWbtdsA9YTC2L7C2zE11KD/BmX95
         Okhj2/xgXBC0EaG7S0o53lzvUDVJjeR7g9gJNbdU=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04BBJUf4018197;
        Mon, 11 May 2020 06:19:30 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 11
 May 2020 06:19:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 11 May 2020 06:19:29 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04BBJKOZ004306;
        Mon, 11 May 2020 06:19:28 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>
Subject: [PATCHv2 5/7] crypto: omap-sham: fix very small data size handling
Date:   Mon, 11 May 2020 14:19:11 +0300
Message-ID: <20200511111913.26541-6-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200511111913.26541-1-t-kristo@ti.com>
References: <20200511111913.26541-1-t-kristo@ti.com>
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
