Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 297F7DB34
	for <lists+linux-omap@lfdr.de>; Mon, 29 Apr 2019 06:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbfD2EoU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Apr 2019 00:44:20 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58150 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbfD2EoU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 29 Apr 2019 00:44:20 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3T4iEcw127625;
        Sun, 28 Apr 2019 23:44:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1556513054;
        bh=W9+4g9I6aP23vKVz+oN4Rt8eSQ2ZaITln10ptQSSBM8=;
        h=From:To:CC:Subject:Date;
        b=KwjJsNBM6ieTxitWuCxdmaBU2WnTt0mAARzYVCsuSmN466k3CmPfPQVANXvSpFt7e
         WhRpm8OqIdKA3RH674//g264sCBil6iBMkZ3CYsbjCRfYygeA/m5Oi9/9wtj8U+Lch
         RO4N9LBue1KfcvHdaMo1UEcjEyZf2kggDDHWFNF4=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3T4iExx023005
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 28 Apr 2019 23:44:14 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sun, 28
 Apr 2019 23:44:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Sun, 28 Apr 2019 23:44:13 -0500
Received: from a0393675ula.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3T4iBrZ019531;
        Sun, 28 Apr 2019 23:44:11 -0500
From:   Keerthy <j-keerthy@ti.com>
To:     <ssantosh@kernel.org>, <tony@atomide.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <j-keerthy@ti.com>, <d-gerlach@ti.com>, <t-kristo@ti.com>
Subject: [PATCH] soc: ti: pm33xx: Add a print while entering RTC only mode with DDR in self-refresh
Date:   Mon, 29 Apr 2019 10:14:35 +0530
Message-ID: <20190429044435.19315-1-j-keerthy@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Currently there is no way to distinguish if the SoC entered DS0
mode or the RTC only mode. Hence add a print before entering
the RTC only mode.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 drivers/soc/ti/pm33xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/ti/pm33xx.c b/drivers/soc/ti/pm33xx.c
index fc5802ccb1c0..bb77c220b6f8 100644
--- a/drivers/soc/ti/pm33xx.c
+++ b/drivers/soc/ti/pm33xx.c
@@ -178,6 +178,7 @@ static int am33xx_pm_suspend(suspend_state_t suspend_state)
 					  suspend_wfi_flags);
 
 		suspend_wfi_flags &= ~WFI_FLAG_RTC_ONLY;
+		dev_info(pm33xx_dev, "Entering RTC Only mode with DDR in self-refresh\n");
 
 		if (!ret) {
 			clk_restore_context();
-- 
2.17.1

