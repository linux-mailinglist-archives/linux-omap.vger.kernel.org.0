Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE632EFF2F
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2019 15:01:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389332AbfKEOBd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Nov 2019 09:01:33 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44710 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389290AbfKEOBd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Nov 2019 09:01:33 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1RNG043448;
        Tue, 5 Nov 2019 08:01:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572962488;
        bh=1EkNmS89YfDgM2jgb2vd+QfDT3W+cE8tMZjNL9+5Avw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=IxpLht6VPuPpoO77CL9p07NTcLbRMWWlTHB6DV1AiRO9lLtYPmZ6KVChC0Dlweg1c
         Grw8n3qoI0+nzgOtzR3JxLLeFk3oECVMMCzHyjT8lLhggYLAuYZqTbz0euLvSXNO28
         V291Q3H0eCPjdg2iFRQrh0UzjGA6ZuGZjLqSwCbc=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1RLb084461;
        Tue, 5 Nov 2019 08:01:27 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 5 Nov
 2019 08:01:11 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 5 Nov 2019 08:01:11 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1FFh068289;
        Tue, 5 Nov 2019 08:01:23 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>, <ard.biesheuvel@kernel.org>
Subject: [PATCHv2 04/22] crypto: omap-des: add IV output handling
Date:   Tue, 5 Nov 2019 16:00:53 +0200
Message-ID: <20191105140111.20285-5-t-kristo@ti.com>
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

Currently omap-des driver does not copy end result IV out at all. This
is evident with the additional checks done at the crypto test manager.
Fix by copying out the IV values from HW.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-des.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/crypto/omap-des.c b/drivers/crypto/omap-des.c
index 4c4dbc2b377e..2e3ecb860e27 100644
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
