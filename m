Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3DA91E420B
	for <lists+linux-omap@lfdr.de>; Wed, 27 May 2020 14:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbgE0MYr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 May 2020 08:24:47 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:41250 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729288AbgE0MYq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 May 2020 08:24:46 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04RCOeuU078813;
        Wed, 27 May 2020 07:24:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590582280;
        bh=os45j/rYJrQJWrLHX/zyT3cvsjFLUypv+9XW8LkowNw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=mum9C7zNiGIsyz0RgL/jULwEEISURCMgTLQejBhoCUyUYEymPLLriL0OnkufuOBpd
         aeYJv25xIZ8uFhKkJkE9FlzUd1Ezpy68Lgq7Kln8WjQRFi1h6i5A6kwL9GGrvMSZsQ
         x4zTVfRY/Ok2MHLjRNo9mcOTRu29M+mathUMusMk=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04RCOeC7064282;
        Wed, 27 May 2020 07:24:40 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 May 2020 07:24:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 May 2020 07:24:40 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04RCOYRg101979;
        Wed, 27 May 2020 07:24:39 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>
Subject: [RESEND PATCHv3 3/7] crypto: omap-crypto: fix userspace copied buffer access
Date:   Wed, 27 May 2020 15:24:25 +0300
Message-ID: <20200527122429.14888-4-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200527122429.14888-1-t-kristo@ti.com>
References: <20200527122429.14888-1-t-kristo@ti.com>
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
