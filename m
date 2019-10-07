Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFD84CE1B5
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 14:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727554AbfJGM3r (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 08:29:47 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:47976 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727798AbfJGM3q (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Oct 2019 08:29:46 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97CTbKe092218;
        Mon, 7 Oct 2019 07:29:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570451377;
        bh=CrweeoqDBqIdn3s+o5LCr5A3MF6tfykZWffRhUe50/g=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=OK4Dc0eUBmyvrqDlw7uFj8IcMEebY8TMr9dWBEwXLAz/CfxdX+7CF7NTtX4x8eZTN
         SW/lijT6g6/ZKkqDqPsuSXum08+EOKNrgMK5Ugy+D8MOxMsJ8NSuyuxzFOubAt/KxU
         PVrFemc+rF3lSc9S90B4royxzaVlRsNNddO37U9U=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x97CTbDL085408
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Oct 2019 07:29:37 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 07:29:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 07:29:34 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97CTYe6066760;
        Mon, 7 Oct 2019 07:29:36 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 1/3] bus: ti-sysc: re-order reset and main clock controls
Date:   Mon, 7 Oct 2019 15:29:29 +0300
Message-ID: <20191007122931.18668-2-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007122931.18668-1-t-kristo@ti.com>
References: <20191007122931.18668-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The main clocks and reset controls have a hardware level dependency,
where one can't transition state without the other one transitioning.
Because we don't have the dependency implemented in software, we must
ensure the ordering of these two is done properly; they way this is
handled is that clocks transition on software level without delay,
and the status is only polled on reset side. Because of this, we must
re-order the main clock and reset handling on the ti-sysc driver.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/bus/ti-sysc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 193d8b23d54d..c9d01e2d3a64 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1032,8 +1032,6 @@ static int __maybe_unused sysc_runtime_resume_legacy(struct device *dev,
 	struct ti_sysc_platform_data *pdata;
 	int error;
 
-	reset_control_deassert(ddata->rsts);
-
 	pdata = dev_get_platdata(ddata->dev);
 	if (!pdata)
 		return 0;
@@ -1046,6 +1044,8 @@ static int __maybe_unused sysc_runtime_resume_legacy(struct device *dev,
 		dev_err(dev, "%s: could not enable: %i\n",
 			__func__, error);
 
+	reset_control_deassert(ddata->rsts);
+
 	return 0;
 }
 
@@ -1099,8 +1099,6 @@ static int __maybe_unused sysc_runtime_resume(struct device *dev)
 
 	sysc_clkdm_deny_idle(ddata);
 
-	reset_control_deassert(ddata->rsts);
-
 	if (sysc_opt_clks_needed(ddata)) {
 		error = sysc_enable_opt_clocks(ddata);
 		if (error)
@@ -1111,6 +1109,8 @@ static int __maybe_unused sysc_runtime_resume(struct device *dev)
 	if (error)
 		goto err_opt_clocks;
 
+	reset_control_deassert(ddata->rsts);
+
 	if (ddata->legacy_mode) {
 		error = sysc_runtime_resume_legacy(dev, ddata);
 		if (error)
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
