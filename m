Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF642EFF3C
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2019 15:01:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389413AbfKEOBq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Nov 2019 09:01:46 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43976 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389377AbfKEOBq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Nov 2019 09:01:46 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1fvU071574;
        Tue, 5 Nov 2019 08:01:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572962501;
        bh=8Qb0rbFmtCeLFsP63eWPse1DK88m1awgJzuGanBPJcY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=RAuv6iaxRCpWAWs0mwbfhmUmlh7KyyKi+PPtwwaBU1xpKi2iTFUDHMKQHLlUfB+aR
         CCArs4q6OToe/zgSWaN7l+6nhM/PxaJ09ikL17pE6OIVaiFl5amdr/l81a8ojr2jQ3
         9GyGLyhyLu+2MMVHXyUEKG+fl+C9/fUHBa8oYBOA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA5E1fBZ087778
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 5 Nov 2019 08:01:41 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 5 Nov
 2019 08:01:41 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 5 Nov 2019 08:01:26 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1FFn068289;
        Tue, 5 Nov 2019 08:01:39 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>, <ard.biesheuvel@kernel.org>
Subject: [PATCHv2 10/22] crypto: omap-aes: fixup aligned data cleanup
Date:   Tue, 5 Nov 2019 16:00:59 +0200
Message-ID: <20191105140111.20285-11-t-kristo@ti.com>
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

Aligned data cleanup is using wrong pointers in the cleanup calls. Most
of the time these are right, but can cause mysterious problems in some
cases. Fix to use the same pointers that were used with the align call.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-aes.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/omap-aes.c b/drivers/crypto/omap-aes.c
index e3f2ed0184f8..de05b35283bf 100644
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
