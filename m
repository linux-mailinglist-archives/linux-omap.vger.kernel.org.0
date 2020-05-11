Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 672761CD791
	for <lists+linux-omap@lfdr.de>; Mon, 11 May 2020 13:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729343AbgEKLTp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 May 2020 07:19:45 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:52260 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbgEKLTp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 11 May 2020 07:19:45 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04BBJVnV099257;
        Mon, 11 May 2020 06:19:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589195971;
        bh=ri+/lIeSNOTM3l+FNff6gZorR0Kh5OVSvczQZBkHThk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=pJlWQBC3ot8g9xhpGhEnu3og5oqL4LlV9uztEhEJL2Ew0OhKIA2lVSDWt39SLs2Vv
         0c95mXTYeR9N2DPExC9UdHNg1sTog5w/UYF8A8L8p2/l7E9Mhyenfwgqa9RG6MieVi
         9zTvrQK0msADjHXiKOgiDeXQD8sjAIwsW5RMYURo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04BBJVJx003452
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 11 May 2020 06:19:31 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 11
 May 2020 06:19:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 11 May 2020 06:19:31 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04BBJKOa004306;
        Mon, 11 May 2020 06:19:30 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>
Subject: [PATCHv2 6/7] crypto: omap-aes: prevent unregistering algorithms twice
Date:   Mon, 11 May 2020 14:19:12 +0300
Message-ID: <20200511111913.26541-7-t-kristo@ti.com>
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

Most of the OMAP family SoCs contain two instances for AES core, which
causes the remove callbacks to be also done twice when driver is
removed. Fix the algorithm unregister callbacks to take into account the
number of algorithms still registered to avoid removing these twice.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-aes.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/omap-aes.c b/drivers/crypto/omap-aes.c
index 824ddf2a66ff..b5aff20c5900 100644
--- a/drivers/crypto/omap-aes.c
+++ b/drivers/crypto/omap-aes.c
@@ -1269,13 +1269,17 @@ static int omap_aes_remove(struct platform_device *pdev)
 	spin_unlock(&list_lock);
 
 	for (i = dd->pdata->algs_info_size - 1; i >= 0; i--)
-		for (j = dd->pdata->algs_info[i].registered - 1; j >= 0; j--)
+		for (j = dd->pdata->algs_info[i].registered - 1; j >= 0; j--) {
 			crypto_unregister_skcipher(
 					&dd->pdata->algs_info[i].algs_list[j]);
+			dd->pdata->algs_info[i].registered--;
+		}
 
-	for (i = dd->pdata->aead_algs_info->size - 1; i >= 0; i--) {
+	for (i = dd->pdata->aead_algs_info->registered - 1; i >= 0; i--) {
 		aalg = &dd->pdata->aead_algs_info->algs_list[i];
 		crypto_unregister_aead(aalg);
+		dd->pdata->aead_algs_info->registered--;
+
 	}
 
 	crypto_engine_exit(dd->engine);
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
