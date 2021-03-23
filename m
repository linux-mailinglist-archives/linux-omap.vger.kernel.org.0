Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4D1346D4E
	for <lists+linux-omap@lfdr.de>; Tue, 23 Mar 2021 23:39:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233936AbhCWWix (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Mar 2021 18:38:53 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:34640 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233872AbhCWWix (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 23 Mar 2021 18:38:53 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12NMcf6A068319;
        Tue, 23 Mar 2021 17:38:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1616539121;
        bh=YGi1VyqGQ1rgvfssZ8UrxzHioZnd/GahUvZLhYzp25w=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=QZzTEhNAvzKdq8Ms319DDKmCLCv/5Ey2kbq06RRA4I1xYR+qmytesCuZl6DUqmtRv
         dx56F83KrAheVUJAFZK0BzDhEc/LtFNcZi9agX8DbP9VL859xA0XkcKs3gGC1BUed2
         Ukn8LLoQY8vnZEBZYDF1da+kErm8gW5M72wVc7r8=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12NMcfUN046568
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 23 Mar 2021 17:38:41 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 23
 Mar 2021 17:38:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 23 Mar 2021 17:38:41 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12NMcfoT043251;
        Tue, 23 Mar 2021 17:38:41 -0500
Received: from localhost ([10.250.221.195])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 12NMcejw102213;
        Tue, 23 Mar 2021 17:38:41 -0500
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
Subject: [PATCH 1/3] remoteproc: pru: Fixup interrupt-parent logic for fw events
Date:   Tue, 23 Mar 2021 17:38:37 -0500
Message-ID: <20210323223839.17464-2-s-anna@ti.com>
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

The PRU firmware interrupt mapping logic in pru_handle_intrmap() uses
of_irq_find_parent() with PRU device node to get a handle to the PRUSS
Interrupt Controller at present. This logic however requires that the
PRU nodes always define a interrupt-parent property. This property is
neither a required/defined property as per the PRU remoteproc binding,
nor is relevant from a DT node point of view without any associated
interrupts. The curret logic finds a wrong interrupt controller and
fails to perform proper mapping without any interrupt-parent property
in the PRU nodes.

Fix this logic to always find and use the sibling interrupt controller.
Also, while at this, fix the acquired interrupt controller device node
reference properly.

Fixes: c75c9fdac66e ("remoteproc: pru: Add support for PRU specific interrupt configuration")
Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/pru_rproc.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index 16979c1cd2f4..a9d07c0751be 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -284,7 +284,7 @@ static int pru_handle_intrmap(struct rproc *rproc)
 	struct pru_rproc *pru = rproc->priv;
 	struct pru_irq_rsc *rsc = pru->pru_interrupt_map;
 	struct irq_fwspec fwspec;
-	struct device_node *irq_parent;
+	struct device_node *parent, *irq_parent;
 	int i, ret = 0;
 
 	/* not having pru_interrupt_map is not an error */
@@ -312,9 +312,16 @@ static int pru_handle_intrmap(struct rproc *rproc)
 
 	/*
 	 * parse and fill in system event to interrupt channel and
-	 * channel-to-host mapping
+	 * channel-to-host mapping. The interrupt controller to be used
+	 * for these mappings for a given PRU remoteproc is always its
+	 * corresponding sibling PRUSS INTC node.
 	 */
-	irq_parent = of_irq_find_parent(pru->dev->of_node);
+	parent = of_get_parent(dev_of_node(pru->dev));
+	if (!parent)
+		return -ENODEV;
+
+	irq_parent = of_get_child_by_name(parent, "interrupt-controller");
+	of_node_put(parent);
 	if (!irq_parent) {
 		kfree(pru->mapped_irq);
 		return -ENODEV;
@@ -337,11 +344,13 @@ static int pru_handle_intrmap(struct rproc *rproc)
 			goto map_fail;
 		}
 	}
+	of_node_put(irq_parent);
 
 	return ret;
 
 map_fail:
 	pru_dispose_irq_mapping(pru);
+	of_node_put(irq_parent);
 
 	return ret;
 }
-- 
2.30.1

