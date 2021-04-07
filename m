Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2400357130
	for <lists+linux-omap@lfdr.de>; Wed,  7 Apr 2021 17:57:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353939AbhDGP5M (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Apr 2021 11:57:12 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:60916 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233852AbhDGP5L (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Apr 2021 11:57:11 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 137FuqL4071603;
        Wed, 7 Apr 2021 10:56:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1617811012;
        bh=Jgds5zewRhcnEp12jeYpJsxNje/XJJuE5lRZxJltew0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=MVag6pSDYAkWmwLCMGTlHLHrkeTE6WROGpAM7AlzQgDa6t0I10i2mUgs1c3jp+eZe
         ZierZZrHcetUgm2dHY87u4Qkn9DWwApiWp2eDjXvfsl/F+NagN1kAhk7fx7szATioi
         AcyA3kuONytxtfyXFy6ONYW717OxZdnvv+YUHbAY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 137Fuqgq071567
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Apr 2021 10:56:52 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 7 Apr
 2021 10:56:52 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 7 Apr 2021 10:56:52 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 137FuqKZ041650;
        Wed, 7 Apr 2021 10:56:52 -0500
Received: from localhost ([10.250.37.105])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 137Fuq6o075244;
        Wed, 7 Apr 2021 10:56:52 -0500
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
Subject: [PATCH v2 1/3] remoteproc: pru: Fixup interrupt-parent logic for fw events
Date:   Wed, 7 Apr 2021 10:56:39 -0500
Message-ID: <20210407155641.5501-2-s-anna@ti.com>
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

The PRU firmware interrupt mapping logic in pru_handle_intrmap() uses
of_irq_find_parent() with PRU device node to get a handle to the PRUSS
Interrupt Controller at present. This logic however requires that the
PRU nodes always define a interrupt-parent property. This property is
neither a required/defined property as per the PRU remoteproc binding,
nor is relevant from a DT node point of view without any associated
interrupts. The current logic finds a wrong interrupt controller and
fails to perform proper mapping without any interrupt-parent property
in the PRU nodes.

Fix this logic to always find and use the sibling interrupt controller.
Also, while at this, fix the acquired interrupt controller device node
reference properly.

Fixes: c75c9fdac66e ("remoteproc: pru: Add support for PRU specific interrupt configuration")
Signed-off-by: Suman Anna <s-anna@ti.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
v2:
 - Fixed one minor typo ((%s/curret/current) in patch description 
 - Picked up Reviewed-by tag
v1: https://patchwork.kernel.org/project/linux-remoteproc/patch/20210323223839.17464-2-s-anna@ti.com/

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

