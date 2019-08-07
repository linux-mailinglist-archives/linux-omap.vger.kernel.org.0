Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 369AD84BF5
	for <lists+linux-omap@lfdr.de>; Wed,  7 Aug 2019 14:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387858AbfHGMqi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Aug 2019 08:46:38 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:42622 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387777AbfHGMqi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Aug 2019 08:46:38 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x77Cka81067113;
        Wed, 7 Aug 2019 07:46:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565181996;
        bh=go1rEFtGevssljUuoQMcTiduz8S4vZ6Y+2SOQxAcj8k=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=km6RONXqRJ+XTbEbIiI0tfyl4ZxMxu4u+d4NbdUepxxw/t33a5Cqb4cqk2JpX4eC/
         tP/OZWxpOxcsLo/Qms4b6umkMDIPo5SvDwFggSfKTMk84sEFAq1cLjaHLDum3LX3xh
         LRtFrub/2z8DKny+cHxbuTGc5u7paLX/KaMHFKsk=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x77CkaaS018291
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Aug 2019 07:46:36 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 07:46:35 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 7 Aug 2019 07:46:35 -0500
Received: from gomoku.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x77CkVoI016945;
        Wed, 7 Aug 2019 07:46:33 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>, <s-anna@ti.com>
CC:     <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] bus: ti-sysc: re-order the clkdm control around reset handling
Date:   Wed, 7 Aug 2019 15:46:03 +0300
Message-ID: <1565181965-21039-2-git-send-email-t-kristo@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565181965-21039-1-git-send-email-t-kristo@ti.com>
References: <1565181965-21039-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Parenting clockdomain for the IP should be enabled during the reset
handling logic, otherwise the reset may not finish properly. Re-order
the clockdomain control logic to avoid this.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/bus/ti-sysc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index e6deabd..ad9c6d3 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1091,11 +1091,11 @@ static int __maybe_unused sysc_runtime_suspend(struct device *dev)
 	ddata->enabled = false;
 
 err_allow_idle:
-	sysc_clkdm_allow_idle(ddata);
-
 	if (ddata->disable_on_idle)
 		reset_control_assert(ddata->rsts);
 
+	sysc_clkdm_allow_idle(ddata);
+
 	return error;
 }
 
@@ -1109,11 +1109,12 @@ static int __maybe_unused sysc_runtime_resume(struct device *dev)
 	if (ddata->enabled)
 		return 0;
 
-	if (ddata->disable_on_idle)
-		reset_control_deassert(ddata->rsts);
 
 	sysc_clkdm_deny_idle(ddata);
 
+	if (ddata->disable_on_idle)
+		reset_control_deassert(ddata->rsts);
+
 	if (sysc_opt_clks_needed(ddata)) {
 		error = sysc_enable_opt_clocks(ddata);
 		if (error)
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
