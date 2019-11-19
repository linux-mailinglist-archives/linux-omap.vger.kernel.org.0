Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32A23102663
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2019 15:18:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728122AbfKSOSH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Nov 2019 09:18:07 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:39804 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728157AbfKSORT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 Nov 2019 09:17:19 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAJEHIVI077203;
        Tue, 19 Nov 2019 08:17:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574173038;
        bh=N8L22jtFlFM+1lmOBiRwEbibBb0hxH7QgTw5pjPN5G8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=P3AMXFHFFYnir0L7P/DNWptI3S1+ppg/gKipimsIuCYFAZD+HPxOYlHKOgEGNatdp
         h/eTsbMBPWgaM3dJyN80Tqq+u+pXsR95tTUVMEbnBELFl8f7+7Gj/xQQKyLhnjHEgu
         CmaXVL3g4ZvsU2lw3t06wQ+G2KvEmA0qiVgyMoc0=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAJEHIvX054002
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 19 Nov 2019 08:17:18 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 19
 Nov 2019 08:17:18 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 19 Nov 2019 08:17:18 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAJEGvZ2027070;
        Tue, 19 Nov 2019 08:17:16 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>
Subject: [PATCHv2 09/15] remoteproc/omap: Remove the omap_rproc_reserve_cma declaration
Date:   Tue, 19 Nov 2019 16:16:39 +0200
Message-ID: <20191119141645.19777-10-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191119141645.19777-1-t-kristo@ti.com>
References: <20191119141645.19777-1-t-kristo@ti.com>
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
