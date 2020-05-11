Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4056D1CD786
	for <lists+linux-omap@lfdr.de>; Mon, 11 May 2020 13:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729215AbgEKLTi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 May 2020 07:19:38 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:40270 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbgEKLTi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 11 May 2020 07:19:38 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04BBJRrO094029;
        Mon, 11 May 2020 06:19:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589195967;
        bh=gF2PqYNCTqam+pfCLXYK/QDdEYuZIM7FQDpr83pvKsA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=M7mlmUldok5B0XtYgXZLUXbdyy10v69rfzgZMFdgVX3BP8EBntzmUxTcLX2jAbRyE
         zgvT3QhyEZyrpHW+PpE2qJQuqsXGsNPdt8yDfNRq0Z4bQTLUilp3y5vATm/z+JWcXh
         mNSPGNH5wFjcsY4Zx6aZN+hpVl1zoY9C0c58xOJ4=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04BBJRUW053856
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 11 May 2020 06:19:27 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 11
 May 2020 06:19:26 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 11 May 2020 06:19:26 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04BBJKOX004306;
        Mon, 11 May 2020 06:19:25 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>
Subject: [PATCHv2 3/7] crypto: omap-crypto: fix userspace copied buffer access
Date:   Mon, 11 May 2020 14:19:09 +0300
Message-ID: <20200511111913.26541-4-t-kristo@ti.com>
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

In case buffers are copied from userspace, directly accessing the page
will most likely fail because it hasn't been mapped into the kernel
memory space. Fix the issue by forcing a kmap / kunmap within the
cleanup functionality.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-crypto.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/omap-crypto.c b/drivers/crypto/omap-crypto.c
index cc88b7362bc2..31bdb1d76d11 100644
--- a/drivers/crypto/omap-crypto.c
+++ b/drivers/crypto/omap-crypto.c
@@ -178,11 +178,16 @@ static void omap_crypto_copy_data(struct scatterlist *src,
 		amt = min(src->length - srco, dst->length - dsto);
 		amt = min(len, amt);
 
-		srcb = sg_virt(src) + srco;
-		dstb = sg_virt(dst) + dsto;
+		srcb = kmap_atomic(sg_page(src)) + srco + src->offset;
+		dstb = kmap_atomic(sg_page(dst)) + dsto + dst->offset;
 
 		memcpy(dstb, srcb, amt);
 
+		flush_dcache_page(sg_page(dst));
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
