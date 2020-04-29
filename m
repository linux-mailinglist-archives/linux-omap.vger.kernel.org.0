Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD4A91BE162
	for <lists+linux-omap@lfdr.de>; Wed, 29 Apr 2020 16:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgD2Omb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Apr 2020 10:42:31 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:40036 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726348AbgD2Oma (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 29 Apr 2020 10:42:30 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03TEgO7q106472;
        Wed, 29 Apr 2020 09:42:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588171344;
        bh=D+FkBTnlxhFt8rwKSbgbew41pOYqmQRAEPiRqzTmXOQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=J/04/UOByz93S8iBybfTFjo0Y6RDYgG5hbNrqTh5IoyOS5WSS/fCCsNu5oHYwI2BR
         c35NQc/W5U13sp/q959eVxHlaUAtpYBppEoi8RxBBzj1W+Rd2NwOvjPw2bv7IxR/3+
         NIO6XOb2gJ5whLFOa1p6yNXnLzWXawbBvuQz5FqY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03TEgOmU009923;
        Wed, 29 Apr 2020 09:42:24 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 29
 Apr 2020 09:42:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 29 Apr 2020 09:42:24 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03TEgHjO103561;
        Wed, 29 Apr 2020 09:42:23 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>
Subject: [PATCH 4/6] crypto: omap-sham: huge buffer access fixes
Date:   Wed, 29 Apr 2020 17:42:03 +0300
Message-ID: <20200429144205.5291-5-t-kristo@ti.com>
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

The ctx internal buffer can only hold buflen amount of data, don't try
to copy over more than that. Also, initialize the context sg pointer
if we only have data in the context internal buffer, this can happen
when closing a hash with certain data amounts.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-sham.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/omap-sham.c b/drivers/crypto/omap-sham.c
index 0c837bbd8f0c..9823d7dfca9c 100644
--- a/drivers/crypto/omap-sham.c
+++ b/drivers/crypto/omap-sham.c
@@ -751,8 +751,15 @@ static int omap_sham_align_sgs(struct scatterlist *sg,
 	int offset = rctx->offset;
 	int bufcnt = rctx->bufcnt;
 
-	if (!sg || !sg->length || !nbytes)
+	if (!sg || !sg->length || !nbytes) {
+		if (bufcnt) {
+			sg_init_table(rctx->sgl, 1);
+			sg_set_buf(rctx->sgl, rctx->dd->xmit_buf, bufcnt);
+			rctx->sg = rctx->sgl;
+		}
+
 		return 0;
+	}
 
 	new_len = nbytes;
 
@@ -896,7 +903,7 @@ static int omap_sham_prepare_request(struct ahash_request *req, bool update)
 	if (hash_later < 0)
 		hash_later = 0;
 
-	if (hash_later) {
+	if (hash_later && hash_later <= rctx->buflen) {
 		scatterwalk_map_and_copy(rctx->buffer,
 					 req->src,
 					 req->nbytes - hash_later,
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
