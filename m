Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA48C1BE15F
	for <lists+linux-omap@lfdr.de>; Wed, 29 Apr 2020 16:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgD2Om3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Apr 2020 10:42:29 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:40034 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbgD2Om2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 29 Apr 2020 10:42:28 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03TEgKCl106438;
        Wed, 29 Apr 2020 09:42:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588171340;
        bh=r/Z289ziuLekskSoAOTc4KuAcsPT8zHSmf/vDtvcIms=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=zUAUhQUopKka435opNXHotj3rxcICIBSWFowFd36qEUtc99bu7duHXgu5pVf+ylpI
         9S+4mb8rJvV+IeySBljL/3NgKaIRCtmiVJvhMwGpUGdw1YZcBzN/E6fC14QByZn8BQ
         tP3fN1qvsymG0zzGQ0llptXk/ktX/JKhy5eKYUrU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03TEgKCh012376
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 29 Apr 2020 09:42:20 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 29
 Apr 2020 09:42:20 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 29 Apr 2020 09:42:20 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03TEgHjL103561;
        Wed, 29 Apr 2020 09:42:19 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>
Subject: [PATCH 1/6] crypto: omap-aes: avoid spamming console with self tests
Date:   Wed, 29 Apr 2020 17:42:00 +0300
Message-ID: <20200429144205.5291-2-t-kristo@ti.com>
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
