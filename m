Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B9DBDAC06
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 14:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406181AbfJQM0e (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 08:26:34 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:54500 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728368AbfJQM0d (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 17 Oct 2019 08:26:33 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9HCQJRg086571;
        Thu, 17 Oct 2019 07:26:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571315179;
        bh=yP6xPhlj18H6iTp8pG1xyYarjc/HONgaPVPk1rzTYts=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=cN6IGpc12pN5UdK4ufEN2GnQgH13Wcv/dQ6DBb9a4U/7U3rg4+mKlASdX1hQPxroJ
         J4GvqO5QsBgTDcJJgVVJjQ1EINcbOnyg+NIBJmot4lk7/wOAXPEDDeT4MeSJ3pDRAm
         UrrLPy95a1RSDS1zTIRuCh2zg7gVWTY3iRJpCSDk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9HCQJMt118129;
        Thu, 17 Oct 2019 07:26:19 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 17
 Oct 2019 07:26:19 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 17 Oct 2019 07:26:11 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9HCPxNf073246;
        Thu, 17 Oct 2019 07:26:17 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>, <ard.biesheuvel@linaro.org>
CC:     <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 10/10] crypto: omap-aes: fixup aligned data cleanup
Date:   Thu, 17 Oct 2019 15:25:49 +0300
Message-ID: <20191017122549.4634-11-t-kristo@ti.com>
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

Aligned data cleanup is using wrong pointers in the cleanup calls. Most
of the time these are right, but can cause mysterious problems in some
cases. Fix to use the same pointers that were used with the align call.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-aes.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/omap-aes.c b/drivers/crypto/omap-aes.c
index c40876353b19..649abbc92fd4 100644
--- a/drivers/crypto/omap-aes.c
+++ b/drivers/crypto/omap-aes.c
@@ -502,10 +502,10 @@ static void omap_aes_done_task(unsigned long data)
 		omap_aes_crypt_dma_stop(dd);
 	}
 
-	omap_crypto_cleanup(dd->in_sgl, NULL, 0, dd->total_save,
+	omap_crypto_cleanup(dd->in_sg, NULL, 0, dd->total_save,
 			    FLAGS_IN_DATA_ST_SHIFT, dd->flags);
 
-	omap_crypto_cleanup(&dd->out_sgl, dd->orig_out, 0, dd->total_save,
+	omap_crypto_cleanup(dd->out_sg, dd->orig_out, 0, dd->total_save,
 			    FLAGS_OUT_DATA_ST_SHIFT, dd->flags);
 
 	/* Update IV output */
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
