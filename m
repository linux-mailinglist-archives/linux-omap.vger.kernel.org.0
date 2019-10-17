Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B924DABF8
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 14:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502299AbfJQM0S (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 08:26:18 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47748 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728554AbfJQM0S (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 17 Oct 2019 08:26:18 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9HCQ9Np091673;
        Thu, 17 Oct 2019 07:26:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571315169;
        bh=1IRzEhXkaYpuIR4HmS/s7juXRRsv8nh6YnuqSdpL4Qk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=fhD5zpvDS9/guAnZ5cGequwye8WSGKLygZSLXFVoJ4Ih4qJn10f+oHoSIWm6XTYwP
         FFmdp8vFeegu2Sp/ydIxCwbVe+jsS2SqshxxW2VkuFbLOLCDXhRCFdyVQFeo3PvSzI
         RouXBoOA0oLZG8y2/DTdM6CizN2N73ln+pDgauM8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9HCQ8vo039332
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 17 Oct 2019 07:26:08 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 17
 Oct 2019 07:26:00 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 17 Oct 2019 07:26:00 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9HCPxNZ073246;
        Thu, 17 Oct 2019 07:26:07 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>, <ard.biesheuvel@linaro.org>
CC:     <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 04/10] crypto: omap-des: add IV output handling
Date:   Thu, 17 Oct 2019 15:25:43 +0300
Message-ID: <20191017122549.4634-5-t-kristo@ti.com>
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

Currently omap-des driver does not copy end result IV out at all. This
is evident with the additional checks done at the crypto test manager.
Fix by copying out the IV values from HW.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-des.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/crypto/omap-des.c b/drivers/crypto/omap-des.c
index 4c4dbc2b377e..ea82d55ea8c3 100644
--- a/drivers/crypto/omap-des.c
+++ b/drivers/crypto/omap-des.c
@@ -597,6 +597,7 @@ static int omap_des_crypt_req(struct crypto_engine *engine,
 static void omap_des_done_task(unsigned long data)
 {
 	struct omap_des_dev *dd = (struct omap_des_dev *)data;
+	int i;
 
 	pr_debug("enter done_task\n");
 
@@ -615,6 +616,11 @@ static void omap_des_done_task(unsigned long data)
 	omap_crypto_cleanup(&dd->out_sgl, dd->orig_out, 0, dd->total_save,
 			    FLAGS_OUT_DATA_ST_SHIFT, dd->flags);
 
+	if ((dd->flags & FLAGS_CBC) && dd->req->iv)
+		for (i = 0; i < 2; i++)
+			((u32 *)dd->req->iv)[i] =
+				omap_des_read(dd, DES_REG_IV(dd, i));
+
 	omap_des_finish_req(dd, 0);
 
 	pr_debug("exit\n");
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
