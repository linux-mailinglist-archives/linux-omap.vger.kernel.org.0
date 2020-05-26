Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0797D1E23FB
	for <lists+linux-omap@lfdr.de>; Tue, 26 May 2020 16:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbgEZOVN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 May 2020 10:21:13 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:56112 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbgEZOVN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 26 May 2020 10:21:13 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04QEL6wc042024;
        Tue, 26 May 2020 09:21:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590502866;
        bh=os45j/rYJrQJWrLHX/zyT3cvsjFLUypv+9XW8LkowNw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=upAv+60s82w7RwKv/t5j6FHEIw9NLahjjFiKZ+IKxH0DVeOhPjvpP4wUVBIYgdANK
         7khZmrxI22CnskLdHOqNTZhT4bWW2apCCnRhjxaJdCjkRW7UxziQVtKWgq84pbOBsz
         g8J0nwQgaykfKGkz6yCNwoZcSNXMWoZ2lDMg5u7U=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04QEL6A9050220;
        Tue, 26 May 2020 09:21:06 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 26
 May 2020 09:21:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 26 May 2020 09:21:06 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04QEL4TV121018;
        Tue, 26 May 2020 09:21:05 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>
Subject: [PATCHv3 3/7] crypto: omap-crypto: fix userspace copied buffer access
Date:   Tue, 26 May 2020 17:21:04 +0300
Message-ID: <20200526142104.7362-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200522131247.GA27255@gondor.apana.org.au>
References: <20200522131247.GA27255@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In case buffers are copied from userspace, directly accessing the page
will most likely fail because it hasn't been mapped into the kernel
memory space. Fix the issue by forcing a kmap / kunmap within the
cleanup functionality.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
v3:
  - Added PageSlab() check to the cache flushing portion, and changed
    the used flush API to be flush_kernel_dcache_page()

 drivers/crypto/omap-crypto.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/omap-crypto.c b/drivers/crypto/omap-crypto.c
index cc88b7362bc2..94b2dba90f0d 100644
--- a/drivers/crypto/omap-crypto.c
+++ b/drivers/crypto/omap-crypto.c
@@ -178,11 +178,17 @@ static void omap_crypto_copy_data(struct scatterlist *src,
 		amt = min(src->length - srco, dst->length - dsto);
 		amt = min(len, amt);
 
-		srcb = sg_virt(src) + srco;
-		dstb = sg_virt(dst) + dsto;
+		srcb = kmap_atomic(sg_page(src)) + srco + src->offset;
+		dstb = kmap_atomic(sg_page(dst)) + dsto + dst->offset;
 
 		memcpy(dstb, srcb, amt);
 
+		if (!PageSlab(sg_page(dst)))
+			flush_kernel_dcache_page(sg_page(dst));
+
+		kunmap_atomic(srcb);
+		kunmap_atomic(dstb);
+
 		srco += amt;
 		dsto += amt;
 		len -= amt;
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
