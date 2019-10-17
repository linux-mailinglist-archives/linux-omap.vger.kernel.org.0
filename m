Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2152ADAC04
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 14:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502307AbfJQM02 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 08:26:28 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:54482 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409377AbfJQM02 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 17 Oct 2019 08:26:28 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9HCQHmr086558;
        Thu, 17 Oct 2019 07:26:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571315177;
        bh=Bb+NMsmU29SE+RzWfChJoj3IypYlnD56/0aZEsv24kI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=EUEC5YfnjT7iTVhwzcFK6o9lvoalnQMQKcOei5FY7TvLm581iostC/cYgbLDFAjSf
         l2TpaEQIRiwfvSxgL3id/s0/v4a4sAa6W/tuRy6tj5f6kWRlwKQrj4SIvaB3sZoF++
         L4QwuhQn/ORr7LNOfWLj4pyBTTyZOE/sWofpVun4=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9HCQHI5016697
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 17 Oct 2019 07:26:17 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 17
 Oct 2019 07:26:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 17 Oct 2019 07:26:09 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9HCPxNe073246;
        Thu, 17 Oct 2019 07:26:16 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>, <ard.biesheuvel@linaro.org>
CC:     <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 09/10] crypto: add timeout to crypto_wait_req
Date:   Thu, 17 Oct 2019 15:25:48 +0300
Message-ID: <20191017122549.4634-10-t-kristo@ti.com>
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
index 19ea3a371d7b..b8f0e5c3cc0c 100644
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
