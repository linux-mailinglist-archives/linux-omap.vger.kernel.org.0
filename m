Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CEE4E71E6
	for <lists+linux-omap@lfdr.de>; Mon, 28 Oct 2019 13:44:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389339AbfJ1MnQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 28 Oct 2019 08:43:16 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:37286 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389353AbfJ1MnQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 28 Oct 2019 08:43:16 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9SChFsu034012;
        Mon, 28 Oct 2019 07:43:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572266595;
        bh=Y1auuAq5xKvSGOrmGT7DMiILh+5hUGrcb4QBov2/0Q8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=fJGggYGgGXsPlOdP/c78uHparICetMwdaI0wtKi94H3RhiHCvovTLEByM1+0lNpZU
         8k2gSVWdnBaifv6d9N0vo4Z0Nh78E9mKQmsaT12xTRt65R4NDY7sxmV6KQgsUMfeAA
         ND+j3rQMGKJD6O7CzrnkTL9cc5IPanACdZNLn1Nk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9SChFDp069506
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 28 Oct 2019 07:43:15 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 28
 Oct 2019 07:43:02 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 28 Oct 2019 07:43:02 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9SCgoh2063574;
        Mon, 28 Oct 2019 07:43:12 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 10/17] remoteproc/omap: Remove the omap_rproc_reserve_cma declaration
Date:   Mon, 28 Oct 2019 14:42:31 +0200
Message-ID: <20191028124238.19224-11-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191028124238.19224-1-t-kristo@ti.com>
References: <20191028124238.19224-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The omap_rproc_reserve_cma() function is not defined at the moment.
This prototype was to be used to define a function to declare a
remoteproc device-specific CMA pool.

The remoteproc devices will be defined through DT going forward. A
device specific CMA pool will be defined under the reserved-memory
node, and will be associated with the appropriate remoteproc device
node. This function prototype will no longer be needed and has
therefore been cleaned up.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 include/linux/platform_data/remoteproc-omap.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/include/linux/platform_data/remoteproc-omap.h b/include/linux/platform_data/remoteproc-omap.h
index 6bea01e199fe..49c78805916f 100644
--- a/include/linux/platform_data/remoteproc-omap.h
+++ b/include/linux/platform_data/remoteproc-omap.h
@@ -21,16 +21,4 @@ struct omap_rproc_pdata {
 	int (*device_shutdown)(struct platform_device *pdev);
 };
 
-#if defined(CONFIG_OMAP_REMOTEPROC) || defined(CONFIG_OMAP_REMOTEPROC_MODULE)
-
-void __init omap_rproc_reserve_cma(void);
-
-#else
-
-static inline void __init omap_rproc_reserve_cma(void)
-{
-}
-
-#endif
-
 #endif /* _PLAT_REMOTEPROC_H */
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
