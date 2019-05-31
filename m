Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42AA230684
	for <lists+linux-omap@lfdr.de>; Fri, 31 May 2019 04:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbfEaCNb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 May 2019 22:13:31 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:52674 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbfEaCNb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 May 2019 22:13:31 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4V2DOCH105395;
        Thu, 30 May 2019 21:13:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559268804;
        bh=hs354EoGbV73TbB075I8Lanu8CNWjwVr00edQ5IOMWo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=FkqaIt0OwYhrxKB0BgGMX+rrb/5/fpm9FgyaDJfGOD4hXPVJkSb2ydZYWRhfT57sy
         4lZGx+1Y+kVEfNECHzqr9rBVHG6uxLEQaJN7ujdmKJdMA7l3xgVRT9apwiznorEZbX
         1/C63RG29eiDFbpVypUsGYZ3Bh28CwvPoXD4CNjM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4V2DOhR108705
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 30 May 2019 21:13:24 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 30
 May 2019 21:13:24 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 30 May 2019 21:13:24 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4V2DOPO027212;
        Thu, 30 May 2019 21:13:24 -0500
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id x4V2DOm18136;
        Thu, 30 May 2019 21:13:24 -0500 (CDT)
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 3/3] hwspinlock/omap: Add a trace during probe
Date:   Thu, 30 May 2019 21:13:21 -0500
Message-ID: <20190531021321.14025-4-s-anna@ti.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190531021321.14025-1-s-anna@ti.com>
References: <20190531021321.14025-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add a debug level trace statement in the OMAP HwSpinlock driver
probe function to print the number of hwlocks on a successful
registration.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/hwspinlock/omap_hwspinlock.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index a4d7a7bc863a..14e1a532ebb5 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -140,6 +140,9 @@ static int omap_hwspinlock_probe(struct platform_device *pdev)
 	if (ret)
 		goto reg_fail;
 
+	dev_dbg(&pdev->dev, "Registered %d locks with HwSpinlock core\n",
+		num_locks);
+
 	return 0;
 
 reg_fail:
-- 
2.21.0

