Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0C06EFF44
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2019 15:01:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389377AbfKEOBy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Nov 2019 09:01:54 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:35180 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389421AbfKEOBx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Nov 2019 09:01:53 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1laI038217;
        Tue, 5 Nov 2019 08:01:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572962507;
        bh=vdMLW9KPI1Tz8cqZnds9ghnwG28mTN9081e17+WfrQk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=U8xXW9V5C7jq0ddpEG5JMslTxWiNePP6bI+sWud6CR8mSm67PZ2pBqyQ/4MA9pO+7
         bhwqVaVTR+My3eJSq9AA4/3FdUPuSPOrquBkTZ4OEEuvas9h02zfs7ehtHVDVVucuC
         0GU8EoRIASe1jXyi3cm7xEAdkqvw6wZ2jmA6Hy0c=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA5E1lRo087823
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 5 Nov 2019 08:01:47 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 5 Nov
 2019 08:01:32 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 5 Nov 2019 08:01:32 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1FFq068289;
        Tue, 5 Nov 2019 08:01:45 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>, <ard.biesheuvel@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCHv2 13/22] crypto: omap-aes-gcm - deal with memory allocation failure
Date:   Tue, 5 Nov 2019 16:01:02 +0200
Message-ID: <20191105140111.20285-14-t-kristo@ti.com>
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

From: Ard Biesheuvel <ardb@kernel.org>

The OMAP gcm(aes) driver invokes omap_crypto_align_sg() without
dealing with the errors it may return, resulting in a crash if
the routine fails in a __get_free_pages(GFP_ATOMIC) call. So
bail and return the error rather than limping on if one occurs.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Tero Kristo <t-kristo@ti.com>
Tested-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-aes-gcm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/crypto/omap-aes-gcm.c b/drivers/crypto/omap-aes-gcm.c
index dfd4d1cac421..05d2fe78b105 100644
--- a/drivers/crypto/omap-aes-gcm.c
+++ b/drivers/crypto/omap-aes-gcm.c
@@ -120,6 +120,8 @@ static int omap_aes_gcm_copy_buffers(struct omap_aes_dev *dd,
 					   OMAP_CRYPTO_FORCE_SINGLE_ENTRY,
 					   FLAGS_ASSOC_DATA_ST_SHIFT,
 					   &dd->flags);
+		if (ret)
+			return ret;
 	}
 
 	if (cryptlen) {
@@ -132,6 +134,8 @@ static int omap_aes_gcm_copy_buffers(struct omap_aes_dev *dd,
 					   OMAP_CRYPTO_FORCE_SINGLE_ENTRY,
 					   FLAGS_IN_DATA_ST_SHIFT,
 					   &dd->flags);
+		if (ret)
+			return ret;
 	}
 
 	dd->in_sg = dd->in_sgl;
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
