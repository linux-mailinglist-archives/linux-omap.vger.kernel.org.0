Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27E1A357134
	for <lists+linux-omap@lfdr.de>; Wed,  7 Apr 2021 17:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353937AbhDGP5P (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Apr 2021 11:57:15 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:52410 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353962AbhDGP5O (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Apr 2021 11:57:14 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 137Fuvgw116698;
        Wed, 7 Apr 2021 10:56:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1617811017;
        bh=D1uTZ8PJxXWfw+lIGtWEx/obgfLqJBnOltn3mYjLZdk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=XwZLGecHafCwwNMnfItyXJhrDyeHD1ZtobH01R+bwc2Lk6/sMd6JjHMTCtZja5xnt
         JuVR+YUxLK8tcgDWp219YKBt2G/sJ9qBLekmXVB/HINerOkG+fawySBgTzIqtrZWAq
         54yslWZeInxJK/iGsMByc4CriQeHTaPbcIcegKaA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 137FuvMX047528
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Apr 2021 10:56:57 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 7 Apr
 2021 10:56:57 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 7 Apr 2021 10:56:57 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 137FuvTT041737;
        Wed, 7 Apr 2021 10:56:57 -0500
Received: from localhost ([10.250.37.105])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 137FuvKb101693;
        Wed, 7 Apr 2021 10:56:57 -0500
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
Subject: [PATCH v2 3/3] remoteproc: pru: Fix and cleanup firmware interrupt mapping logic
Date:   Wed, 7 Apr 2021 10:56:41 -0500
Message-ID: <20210407155641.5501-4-s-anna@ti.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210407155641.5501-1-s-anna@ti.com>
References: <20210407155641.5501-1-s-anna@ti.com>
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
v2:
 - Fixed two additional cleanup paths in pru_handle_intrmap()
   addressing Mathieu's review comment
v1: https://patchwork.kernel.org/project/linux-remoteproc/patch/20210323223839.17464-4-s-anna@ti.com/

 drivers/remoteproc/pru_rproc.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index 87b43976c51b..04863bf23db8 100644
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
@@ -307,8 +312,10 @@ static int pru_handle_intrmap(struct rproc *rproc)
 	pru->evt_count = rsc->num_evts;
 	pru->mapped_irq = kcalloc(pru->evt_count, sizeof(unsigned int),
 				  GFP_KERNEL);
-	if (!pru->mapped_irq)
+	if (!pru->mapped_irq) {
+		pru->evt_count = 0;
 		return -ENOMEM;
+	}
 
 	/*
 	 * parse and fill in system event to interrupt channel and
@@ -317,13 +324,19 @@ static int pru_handle_intrmap(struct rproc *rproc)
 	 * corresponding sibling PRUSS INTC node.
 	 */
 	parent = of_get_parent(dev_of_node(pru->dev));
-	if (!parent)
+	if (!parent) {
+		kfree(pru->mapped_irq);
+		pru->mapped_irq = NULL;
+		pru->evt_count = 0;
 		return -ENODEV;
+	}
 
 	irq_parent = of_get_child_by_name(parent, "interrupt-controller");
 	of_node_put(parent);
 	if (!irq_parent) {
 		kfree(pru->mapped_irq);
+		pru->mapped_irq = NULL;
+		pru->evt_count = 0;
 		return -ENODEV;
 	}
 
@@ -398,8 +411,7 @@ static int pru_rproc_stop(struct rproc *rproc)
 	pru_control_write_reg(pru, PRU_CTRL_CTRL, val);
 
 	/* dispose irq mapping - new firmware can provide new mapping */
-	if (pru->mapped_irq)
-		pru_dispose_irq_mapping(pru);
+	pru_dispose_irq_mapping(pru);
 
 	return 0;
 }
-- 
2.30.1

