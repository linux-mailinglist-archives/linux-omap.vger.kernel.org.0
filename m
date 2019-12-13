Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8F1A11E42B
	for <lists+linux-omap@lfdr.de>; Fri, 13 Dec 2019 13:57:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbfLMM4y (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Dec 2019 07:56:54 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:41718 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727313AbfLMM4V (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Dec 2019 07:56:21 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBDCuK95018520;
        Fri, 13 Dec 2019 06:56:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576241780;
        bh=N8L22jtFlFM+1lmOBiRwEbibBb0hxH7QgTw5pjPN5G8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=gAACTBlbC5N9t7fwUYP+0SykY5XWvASrqlQxk0YBP7jCAea2wBSqRlDyrw3xBpHQk
         n3vO83DkDAucu8OkwYpVN67a1cXGoGxRJqAH+Qpm0HFASLeYiR35J+ffGyd6u3NoZW
         CbvKo4t/H7T1/+EgtrgXgn4adVCnxJF2A3HP7/Og=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBDCuK2t085344
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 13 Dec 2019 06:56:20 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Dec 2019 06:56:19 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Dec 2019 06:56:19 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBDCtwVO127295;
        Fri, 13 Dec 2019 06:56:18 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-omap@vger.kernel.org>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCHv3 09/15] remoteproc/omap: Remove the omap_rproc_reserve_cma declaration
Date:   Fri, 13 Dec 2019 14:55:31 +0200
Message-ID: <20191213125537.11509-10-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213125537.11509-1-t-kristo@ti.com>
References: <20191213125537.11509-1-t-kristo@ti.com>
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
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
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
