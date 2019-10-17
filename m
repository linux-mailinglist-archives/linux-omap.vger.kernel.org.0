Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9E9BDABF9
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 14:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502298AbfJQM0S (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 08:26:18 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:40100 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502296AbfJQM0S (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 17 Oct 2019 08:26:18 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9HCQ79Q037330;
        Thu, 17 Oct 2019 07:26:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571315167;
        bh=DlKZU2pnO04HoutMJq1MepcXwIlqftahdOsUH2+lg9Q=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=m12oDX5qzR3P5XZ7Dxuouu1Z1zII7fjemQbr2mXvuWzQ/xoV8E+v6pb4X+7LgJr2i
         +PS5Cba8ebWiEs/D1yoXNjOVLGnLeJZ12Q/zreJN3t5PcO/+FLYT1o8oOaXlX0DojB
         QBBU3wbI8yCAQR4DMPKWnEPWDKun8NOQkDLLoPWI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9HCQ76I016264
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 17 Oct 2019 07:26:07 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 17
 Oct 2019 07:25:58 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 17 Oct 2019 07:25:58 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9HCPxNY073246;
        Thu, 17 Oct 2019 07:26:05 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>, <ard.biesheuvel@linaro.org>
CC:     <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 03/10] crypto: omap-aes: remove the sysfs group during driver removal
Date:   Thu, 17 Oct 2019 15:25:42 +0300
Message-ID: <20191017122549.4634-4-t-kristo@ti.com>
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

The driver removal should also cleanup the created sysfs group. If not,
the driver fails the subsequent probe as the files exist already. Also,
drop a completely unnecessary pointer assignment from the removal
function at the same time.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/crypto/omap-aes.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/omap-aes.c b/drivers/crypto/omap-aes.c
index a1fc03ed01f3..38c750e83dbe 100644
--- a/drivers/crypto/omap-aes.c
+++ b/drivers/crypto/omap-aes.c
@@ -1296,7 +1296,8 @@ static int omap_aes_remove(struct platform_device *pdev)
 	tasklet_kill(&dd->done_task);
 	omap_aes_dma_cleanup(dd);
 	pm_runtime_disable(dd->dev);
-	dd = NULL;
+
+	sysfs_remove_group(&dd->dev->kobj, &omap_aes_attr_group);
 
 	return 0;
 }
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
