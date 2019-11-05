Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05554EFF3E
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2019 15:01:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389414AbfKEOBr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Nov 2019 09:01:47 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:35154 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389377AbfKEOBr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Nov 2019 09:01:47 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1f5R038178;
        Tue, 5 Nov 2019 08:01:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572962501;
        bh=DytK5ZfNQDTyFQ9kvyYcuDXQB7MIOphvtCQ9eA53fOk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=yrgeKv7aDdjQaAbIiyW8ZERkZDAo1pKPFIrMLGV92vBUrNiYOg6LCq3Amz7+UOUfJ
         JNVGwegQfqS2J77wNpRalEJ2cSk7pzjyR0caFiESwx2BTAH66kry0ZUdckMM7MduGs
         gT/okgs4mqXvWX2t7zEV3hirByAdVHbvtm5tEHa0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA5E1fpn008046
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 5 Nov 2019 08:01:41 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 5 Nov
 2019 08:01:24 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 5 Nov 2019 08:01:24 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1FFm068289;
        Tue, 5 Nov 2019 08:01:38 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>, <ard.biesheuvel@kernel.org>
Subject: [PATCHv2 09/22] crypto: add timeout to crypto_wait_req
Date:   Tue, 5 Nov 2019 16:00:58 +0200
Message-ID: <20191105140111.20285-10-t-kristo@ti.com>
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

Currently crypto_wait_req waits indefinitely for an async crypto request
to complete. This is bad as it can cause for example the crypto test
manager to hang without any notification as to why it has happened.
Instead of waiting indefinitely, add a 1 second timeout to the call,
and provide a warning print if a timeout happens.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 include/linux/crypto.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/linux/crypto.h b/include/linux/crypto.h
index 19ea3a371d7b..41279eeecb21 100644
--- a/include/linux/crypto.h
+++ b/include/linux/crypto.h
@@ -682,8 +682,15 @@ static inline int crypto_wait_req(int err, struct crypto_wait *wait)
 	switch (err) {
 	case -EINPROGRESS:
 	case -EBUSY:
-		wait_for_completion(&wait->completion);
+		err = wait_for_completion_timeout(&wait->completion,
+						  msecs_to_jiffies(1000));
 		reinit_completion(&wait->completion);
+		if (!err) {
+			pr_err("%s: timeout for %p\n", __func__, wait);
+			err = -ETIMEDOUT;
+			break;
+		}
+
 		err = wait->err;
 		break;
 	};
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
