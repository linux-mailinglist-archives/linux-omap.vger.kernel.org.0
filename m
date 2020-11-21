Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 407AD2BBC7D
	for <lists+linux-omap@lfdr.de>; Sat, 21 Nov 2020 04:03:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbgKUDCK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 20 Nov 2020 22:02:10 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50546 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbgKUDCJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 20 Nov 2020 22:02:09 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AL324QI047246;
        Fri, 20 Nov 2020 21:02:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1605927724;
        bh=TC5ddzu7mwkthSoG4t+tXmM7BmxrpIfppkjKhSj731Y=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=In7mXjrRgbQ0nlWt1Qi2QKcSTGAQS0qMrWirRO6hjhvaVehJVg1ySaev+kyo+SZG3
         YYggSHAUx0qlr2ZUQxvJGhuKjAS/jqIUtrDFXFxYOcSQ5O9L9d0tp6DrXVdeCiyI7M
         YnEybjK+GCU7CqnpNH6Bj6QsHt02buSW7Ju04Axk=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AL324sA112239
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Nov 2020 21:02:04 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 20
 Nov 2020 21:02:03 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 20 Nov 2020 21:02:03 -0600
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AL323go102487;
        Fri, 20 Nov 2020 21:02:03 -0600
Received: from localhost ([10.250.68.46])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 0AL322Bj038719;
        Fri, 20 Nov 2020 21:02:02 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Loic Pallardy <loic.pallardy@st.com>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 3/3] remoteproc: wkup_m3: Set deny_sysfs_ops flag
Date:   Fri, 20 Nov 2020 21:01:56 -0600
Message-ID: <20201121030156.22857-4-s-anna@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201121030156.22857-1-s-anna@ti.com>
References: <20201121030156.22857-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The Wakeup M3 remote processor is controlled by the wkup_m3_ipc
client driver, so set the newly introduced 'deny_sysfs_ops' flag
to not allow any overriding of the remoteproc firmware or state
from userspace.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
v2: rebased version, no code changes, patch title adjusted slightly
v1: https://patchwork.kernel.org/project/linux-remoteproc/patch/20180915003725.17549-6-s-anna@ti.com/

 drivers/remoteproc/wkup_m3_rproc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/wkup_m3_rproc.c b/drivers/remoteproc/wkup_m3_rproc.c
index b9349d684258..d92d7f32ba8d 100644
--- a/drivers/remoteproc/wkup_m3_rproc.c
+++ b/drivers/remoteproc/wkup_m3_rproc.c
@@ -160,6 +160,7 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
 	}
 
 	rproc->auto_boot = false;
+	rproc->deny_sysfs_ops = true;
 
 	wkupm3 = rproc->priv;
 	wkupm3->rproc = rproc;
-- 
2.28.0

