Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9A3411C486
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 05:02:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbfLLECI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 23:02:08 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:52544 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726769AbfLLECI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Dec 2019 23:02:08 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBC423Dl074522;
        Wed, 11 Dec 2019 22:02:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576123323;
        bh=G0MttXQxcSEe8MG9sVlpbE1rdRM5dXjay7Qfde/9HrI=;
        h=From:To:CC:Subject:Date;
        b=QtDrp3F6LGrLxU/ocoQZcnVMmJz6oG7juchJ3PJr6Sj2MolxZStHrgSX+l6RRZ8AN
         6BosQ6r8RY6oJvQf/ZOCRQPQ2FMPbkd2EnHMNe0V0e8WHn/1qoVCPityluWyBP37Sx
         0738N5GZ6kEp0EYEoJk/rCEhXscKf1ZwkybdC64g=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBC422pd064318
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 11 Dec 2019 22:02:03 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 11
 Dec 2019 22:02:00 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 11 Dec 2019 22:02:00 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBC420xY065191;
        Wed, 11 Dec 2019 22:02:00 -0600
From:   Dave Gerlach <d-gerlach@ti.com>
To:     Tony Lindgren <tony@atomide.com>,
        Santosh Shilimkar <ssantosh@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        Dave Gerlach <d-gerlach@ti.com>, Suman Anna <s-anna@ti.com>
Subject: [PATCH] soc: ti: wkup_m3_ipc: Fix race condition with rproc_boot
Date:   Wed, 11 Dec 2019 22:03:14 -0600
Message-ID: <20191212040314.14753-1-d-gerlach@ti.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Any user of wkup_m3_ipc calls wkup_m3_ipc_get to get a handle and this
checks the value of the static variable m3_ipc_state to see if the
wkup_m3 is ready. Currently this is populated during probe before
rproc_boot has been called, meaning there is a window of time that
wkup_m3_ipc_get can return a valid handle but the wkup_m3 itself is not
ready, leading to invalid IPC calls to the wkup_m3 and system
instability.

To avoid this, move the population of the m3_ipc_state variable until
after rproc_boot has succeeded to guarantee a valid and usable handle
is always returned.

Reported-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
---
 drivers/soc/ti/wkup_m3_ipc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/ti/wkup_m3_ipc.c b/drivers/soc/ti/wkup_m3_ipc.c
index 378369d9364a..e9ece45d7a33 100644
--- a/drivers/soc/ti/wkup_m3_ipc.c
+++ b/drivers/soc/ti/wkup_m3_ipc.c
@@ -419,6 +419,8 @@ static void wkup_m3_rproc_boot_thread(struct wkup_m3_ipc *m3_ipc)
 	ret = rproc_boot(m3_ipc->rproc);
 	if (ret)
 		dev_err(dev, "rproc_boot failed\n");
+	else
+		m3_ipc_state = m3_ipc;
 
 	do_exit(0);
 }
@@ -505,8 +507,6 @@ static int wkup_m3_ipc_probe(struct platform_device *pdev)
 		goto err_put_rproc;
 	}
 
-	m3_ipc_state = m3_ipc;
-
 	return 0;
 
 err_put_rproc:
-- 
2.20.1

