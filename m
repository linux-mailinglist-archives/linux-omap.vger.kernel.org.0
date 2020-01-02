Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 047F612E69B
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2020 14:20:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728444AbgABNTj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jan 2020 08:19:39 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42526 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728330AbgABNTN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Jan 2020 08:19:13 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 002DJCr9071439;
        Thu, 2 Jan 2020 07:19:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1577971152;
        bh=zneLu/SkQzC/11Mw/u4irFAk48RNoOqIHYYpnuUj5Oo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=RIpy2sZdMMQ4MZGUiYoMsdL5ddV8cj+WCnlvjYgldJ4jIVRouT6o44l/RfKXOlE0U
         fiU/DBJ9iFnMEtqwCQ1VNe7Onp6NyxImrCWvxqM5d3V4Sk03YR/3Dyd+ClqahtbQC/
         wpICN98yPwIRM5jEk8H/yirDwHhUCimMrcIHHj9Q=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 002DJCJb069539
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 2 Jan 2020 07:19:12 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 2 Jan
 2020 07:19:11 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 2 Jan 2020 07:19:11 -0600
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 002DIp3Z075354;
        Thu, 2 Jan 2020 07:19:09 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-omap@vger.kernel.org>, <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCHv4 08/14] remoteproc/omap: remove the platform_data header
Date:   Thu, 2 Jan 2020 15:18:39 +0200
Message-ID: <20200102131845.12992-9-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200102131845.12992-1-t-kristo@ti.com>
References: <20200102131845.12992-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The platform data header for OMAP remoteproc is no longer used for
anything post ti-sysc conversion, so just remove it completely.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
v4:
  - new patch, to remove the platform data file completely compared to
    patches #8 / #9 in previous version of the series

 include/linux/platform_data/remoteproc-omap.h | 51 -------------------
 1 file changed, 51 deletions(-)
 delete mode 100644 include/linux/platform_data/remoteproc-omap.h

diff --git a/include/linux/platform_data/remoteproc-omap.h b/include/linux/platform_data/remoteproc-omap.h
deleted file mode 100644
index 7e3a16097672..000000000000
--- a/include/linux/platform_data/remoteproc-omap.h
+++ /dev/null
@@ -1,51 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Remote Processor - omap-specific bits
- *
- * Copyright (C) 2011 Texas Instruments, Inc.
- * Copyright (C) 2011 Google, Inc.
- */
-
-#ifndef _PLAT_REMOTEPROC_H
-#define _PLAT_REMOTEPROC_H
-
-struct rproc_ops;
-struct platform_device;
-
-/*
- * struct omap_rproc_pdata - omap remoteproc's platform data
- * @name: the remoteproc's name
- * @oh_name: omap hwmod device
- * @oh_name_opt: optional, secondary omap hwmod device
- * @firmware: name of firmware file to load
- * @mbox_name: name of omap mailbox device to use with this rproc
- * @ops: start/stop rproc handlers
- * @device_enable: omap-specific handler for enabling a device
- * @device_shutdown: omap-specific handler for shutting down a device
- * @set_bootaddr: omap-specific handler for setting the rproc boot address
- */
-struct omap_rproc_pdata {
-	const char *name;
-	const char *oh_name;
-	const char *oh_name_opt;
-	const char *firmware;
-	const char *mbox_name;
-	const struct rproc_ops *ops;
-	int (*device_enable)(struct platform_device *pdev);
-	int (*device_shutdown)(struct platform_device *pdev);
-	void (*set_bootaddr)(u32);
-};
-
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
-#endif /* _PLAT_REMOTEPROC_H */
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
