Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E319DABFA
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 14:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409376AbfJQM0U (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 08:26:20 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47750 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728554AbfJQM0U (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 17 Oct 2019 08:26:20 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9HCQADT091680;
        Thu, 17 Oct 2019 07:26:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571315170;
        bh=hmNAPQfmgr7QrBR8MmHXs44ME0uvJ0gm3L6xlCrIGdo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Xb6bTmXFN96YtX1wBXHM58x7EkP8BS3eEkoRBIAqnF94m9joZ/waJnup2YrBmuAu5
         SekTXOxsfBBhh3+Wof5+G6Z42pbD1ph5sU9YbtwvFzZ2mfalbl/7L2LG2pw4qZMA71
         SqHZ4CNCM7JVAPYwCGm8z/sPrLOabsbtBaI22608=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9HCQA21117882;
        Thu, 17 Oct 2019 07:26:10 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 17
 Oct 2019 07:26:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 17 Oct 2019 07:26:10 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9HCPxNa073246;
        Thu, 17 Oct 2019 07:26:08 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>, <ard.biesheuvel@linaro.org>
CC:     <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 05/10] crypto: omap-aes: add IV output handling
Date:   Thu, 17 Oct 2019 15:25:44 +0300
Message-ID: <20191017122549.4634-6-t-kristo@ti.com>
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

Currently omap-aes driver does not copy end result IV out at all. This
is evident with the additional checks done at the crypto test manager.
Fix by copying out the IV values from HW.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-aes.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/crypto/omap-aes.c b/drivers/crypto/omap-aes.c
index 38c750e83dbe..c40876353b19 100644
--- a/drivers/crypto/omap-aes.c
+++ b/drivers/crypto/omap-aes.c
@@ -479,6 +479,14 @@ static int omap_aes_crypt_req(struct crypto_engine *engine,
 	return omap_aes_crypt_dma_start(dd);
 }
 
+static void omap_aes_copy_ivout(struct omap_aes_dev *dd, u8 *ivbuf)
+{
+	int i;
+
+	for (i = 0; i < 4; i++)
+		((u32 *)ivbuf)[i] = omap_aes_read(dd, AES_REG_IV(dd, i));
+}
+
 static void omap_aes_done_task(unsigned long data)
 {
 	struct omap_aes_dev *dd = (struct omap_aes_dev *)data;
@@ -500,6 +508,10 @@ static void omap_aes_done_task(unsigned long data)
 	omap_crypto_cleanup(&dd->out_sgl, dd->orig_out, 0, dd->total_save,
 			    FLAGS_OUT_DATA_ST_SHIFT, dd->flags);
 
+	/* Update IV output */
+	if (dd->flags & (FLAGS_CBC | FLAGS_CTR))
+		omap_aes_copy_ivout(dd, dd->req->iv);
+
 	omap_aes_finish_req(dd, 0);
 
 	pr_debug("exit\n");
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
