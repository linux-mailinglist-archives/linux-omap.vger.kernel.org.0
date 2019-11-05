Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E546EFF41
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2019 15:01:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389418AbfKEOBt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Nov 2019 09:01:49 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44744 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389377AbfKEOBs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Nov 2019 09:01:48 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1htl043494;
        Tue, 5 Nov 2019 08:01:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572962503;
        bh=upit1y8CUJ/UG9U3l05ijSh8ThRDpMaSJFs1e/vfhUM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=LCKWfEOD7NI4AuoaE3wiOaqgvKfsh23oVAerXggwu4NLxGozUWxcnJLTFd8EJNxtA
         RHAPV4GdmAu/39DhhWGw4NU4kBTxL+UO9M+TBNhxQlOwQNjTr8UvB15LXZrQrxZJM/
         bz5Hvo/dcK+RY4x8ASAC3XMQegIrw4Kscqf0eyjg=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1hMk084677;
        Tue, 5 Nov 2019 08:01:43 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 5 Nov
 2019 08:01:43 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 5 Nov 2019 08:01:43 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5E1FFo068289;
        Tue, 5 Nov 2019 08:01:41 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>, <ard.biesheuvel@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCHv2 11/22] crypto: omap-aes - reject invalid input sizes for block modes
Date:   Tue, 5 Nov 2019 16:01:00 +0200
Message-ID: <20191105140111.20285-12-t-kristo@ti.com>
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

Block modes such as ECB and CBC only support input sizes that are
a round multiple of the block size, so align with the generic code
which returns -EINVAL when encountering inputs that violate this
rule.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Tero Kristo <t-kristo@ti.com>
Tested-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-aes.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/omap-aes.c b/drivers/crypto/omap-aes.c
index de05b35283bf..067f4cd7c005 100644
--- a/drivers/crypto/omap-aes.c
+++ b/drivers/crypto/omap-aes.c
@@ -525,6 +525,9 @@ static int omap_aes_crypt(struct skcipher_request *req, unsigned long mode)
 	struct omap_aes_dev *dd;
 	int ret;
 
+	if ((req->cryptlen % AES_BLOCK_SIZE) && !(mode & FLAGS_CTR))
+		return -EINVAL;
+
 	pr_debug("nbytes: %d, enc: %d, cbc: %d\n", req->cryptlen,
 		  !!(mode & FLAGS_ENCRYPT),
 		  !!(mode & FLAGS_CBC));
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
