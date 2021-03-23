Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37353346D56
	for <lists+linux-omap@lfdr.de>; Tue, 23 Mar 2021 23:39:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234025AbhCWWj3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Mar 2021 18:39:29 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:34642 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233941AbhCWWiy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 23 Mar 2021 18:38:54 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12NMcilg068332;
        Tue, 23 Mar 2021 17:38:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1616539124;
        bh=dcG1K7rIEgxuPcS6umlxbj2JzxAoNQrfLADmWxfGAFw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=p1ZZjWgCX5gPUtdaQaml8O/Nq4Tc9eNahF0a3rfNIsJ7Y83ETHjq3cOcB6k8YyR0c
         wL3E4fn58tdh8lmHoS2jmNQFMmd9NdTkh1xj4QlVZeW9G3Gp5jcsDpDb6n31//HKNh
         DqZUTEp/5Owl51UMJRx8DGFN8a/q/IGdp4z8oOVk=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12NMcifE046601
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 23 Mar 2021 17:38:44 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 23
 Mar 2021 17:38:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 23 Mar 2021 17:38:43 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12NMchZc039063;
        Tue, 23 Mar 2021 17:38:43 -0500
Received: from localhost ([10.250.221.195])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 12NMchSa102222;
        Tue, 23 Mar 2021 17:38:43 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] remoteproc: pru: Fix and cleanup firmware interrupt mapping logic
Date:   Tue, 23 Mar 2021 17:38:39 -0500
Message-ID: <20210323223839.17464-4-s-anna@ti.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323223839.17464-1-s-anna@ti.com>
References: <20210323223839.17464-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The PRU firmware interrupt mappings are configured and unconfigured in
.start() and .stop() callbacks respectively using the variables 'evt_count'
and a 'mapped_irq' pointer. These variables are modified only during these
callbacks but are not re-initialized/reset properly during unwind or
failure paths. These stale values caused a kernel crash while stopping a
PRU remoteproc running a different firmware with no events on a subsequent
run after a previous run that was running a firmware with events.

Fix this crash by ensuring that the evt_count is 0 and the mapped_irq
pointer is set to NULL in pru_dispose_irq_mapping(). Also, reset these
variables properly during any failures in the .start() callback. While
at this, the pru_dispose_irq_mapping() callsites are all made to look
the same, moving any conditional logic to inside the function.

Fixes: c75c9fdac66e ("remoteproc: pru: Add support for PRU specific interrupt configuration")
Reported-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/pru_rproc.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index 87b43976c51b..5df19acb90ed 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -266,12 +266,17 @@ static void pru_rproc_create_debug_entries(struct rproc *rproc)
 
 static void pru_dispose_irq_mapping(struct pru_rproc *pru)
 {
-	while (pru->evt_count--) {
+	if (!pru->mapped_irq)
+		return;
+
+	while (pru->evt_count) {
+		pru->evt_count--;
 		if (pru->mapped_irq[pru->evt_count] > 0)
 			irq_dispose_mapping(pru->mapped_irq[pru->evt_count]);
 	}
 
 	kfree(pru->mapped_irq);
+	pru->mapped_irq = NULL;
 }
 
 /*
@@ -324,6 +329,8 @@ static int pru_handle_intrmap(struct rproc *rproc)
 	of_node_put(parent);
 	if (!irq_parent) {
 		kfree(pru->mapped_irq);
+		pru->mapped_irq = NULL;
+		pru->evt_count = 0;
 		return -ENODEV;
 	}
 
@@ -398,8 +405,7 @@ static int pru_rproc_stop(struct rproc *rproc)
 	pru_control_write_reg(pru, PRU_CTRL_CTRL, val);
 
 	/* dispose irq mapping - new firmware can provide new mapping */
-	if (pru->mapped_irq)
-		pru_dispose_irq_mapping(pru);
+	pru_dispose_irq_mapping(pru);
 
 	return 0;
 }
-- 
2.30.1

