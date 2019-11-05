Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FC44EFF34
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2019 15:01:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389290AbfKEOBm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Nov 2019 09:01:42 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43946 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388605AbfKEOBl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Nov 2019 09:01:41 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1YiD071523;
        Tue, 5 Nov 2019 08:01:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572962494;
        bh=nrw79wvcWzgTlVnIkkp/iAS37hs/nXQ21HoyDm5EaZw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=UEpdwjcSm3zYxT4I5hz9VKQY5oMDKbUc8ISIIQ+wgvprL+yn4kdaD569OcKhf9Yfp
         tuQCnI2yA2Ka49e04Sd+Weq9RpBUC9jCk9hSdEq0blSQgGawggTQBxwHY1VYZVkjOU
         TsTqNQEc68JNtFOQ3iBOR6C/xcIHMWHMCWfpcZho=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1YOL084579;
        Tue, 5 Nov 2019 08:01:34 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 5 Nov
 2019 08:01:17 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 5 Nov 2019 08:01:17 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1FFi068289;
        Tue, 5 Nov 2019 08:01:27 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>, <ard.biesheuvel@kernel.org>
Subject: [PATCHv2 05/22] crypto: omap-aes: add IV output handling
Date:   Tue, 5 Nov 2019 16:00:54 +0200
Message-ID: <20191105140111.20285-6-t-kristo@ti.com>
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

Currently omap-aes driver does not copy end result IV out at all. This
is evident with the additional checks done at the crypto test manager.
Fix by copying out the IV values from HW.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-aes.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/crypto/omap-aes.c b/drivers/crypto/omap-aes.c
index 38c750e83dbe..e3f2ed0184f8 100644
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
