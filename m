Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E55E1CD784
	for <lists+linux-omap@lfdr.de>; Mon, 11 May 2020 13:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729163AbgEKLTi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 May 2020 07:19:38 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:52250 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726438AbgEKLTh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 11 May 2020 07:19:37 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04BBJOXN099223;
        Mon, 11 May 2020 06:19:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589195964;
        bh=r/Z289ziuLekskSoAOTc4KuAcsPT8zHSmf/vDtvcIms=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=mHsWzWs7Lk5GIGNMwXZ5PH7M5+jB7PLtYLpnf1nld2OKxJt1HfivDE1xKHUrodikk
         WzgkTXdNhTXP4rinHohAN7KKPV5YVbMi0JG5lD8Yq8oXdO+bkE6GxBRRjoaJov85K5
         R+2sabiR5cQenorn4PFkL3UZdL8fVsJZ2z5JV9Ck=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04BBJOOZ061628
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 11 May 2020 06:19:24 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 11
 May 2020 06:19:23 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 11 May 2020 06:19:23 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04BBJKOV004306;
        Mon, 11 May 2020 06:19:22 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>
Subject: [PATCHv2 1/7] crypto: omap-aes: avoid spamming console with self tests
Date:   Mon, 11 May 2020 14:19:07 +0300
Message-ID: <20200511111913.26541-2-t-kristo@ti.com>
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

Running the self test suite for omap-aes with extra tests enabled causes
huge spam with the tag message wrong indicators. With self tests, this
is fine as there are some tests that purposedly pass bad data to the
driver. Also, returning -EBADMSG from the driver is enough, so remove the
dev_err message completely.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-aes-gcm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/crypto/omap-aes-gcm.c b/drivers/crypto/omap-aes-gcm.c
index 32dc00dc570b..9f937bdc53a7 100644
--- a/drivers/crypto/omap-aes-gcm.c
+++ b/drivers/crypto/omap-aes-gcm.c
@@ -77,7 +77,6 @@ static void omap_aes_gcm_done_task(struct omap_aes_dev *dd)
 		tag = (u8 *)rctx->auth_tag;
 		for (i = 0; i < dd->authsize; i++) {
 			if (tag[i]) {
-				dev_err(dd->dev, "GCM decryption: Tag Message is wrong\n");
 				ret = -EBADMSG;
 			}
 		}
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
