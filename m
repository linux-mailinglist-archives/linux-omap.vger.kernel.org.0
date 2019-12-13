Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 879EC11E42D
	for <lists+linux-omap@lfdr.de>; Fri, 13 Dec 2019 13:57:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727317AbfLMM5B (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Dec 2019 07:57:01 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:48486 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbfLMM4N (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Dec 2019 07:56:13 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBDCuCSx068969;
        Fri, 13 Dec 2019 06:56:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576241772;
        bh=FoynO9z6P/deyXUVpUBGISXV3a70IYkqN3HgGeVOdSY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=H9wZDKZXQwpV6h0y1sW1P7543qxkanGSbFOM0hJhNxDW2mc4YL4GAiC2dJvASJl0R
         igIayiMBn4nNrzdrFpvip+qynKNV2mRRNZcu69UNMo8huEL/tYdBJMpSp0tPfXa8EH
         L3pTH6jkcaP60O6MD7HtnYqueBJKz0+uI05TVFTQ=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBDCuCwa008930;
        Fri, 13 Dec 2019 06:56:12 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Dec 2019 06:56:11 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Dec 2019 06:56:11 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBDCtwVK127295;
        Fri, 13 Dec 2019 06:56:09 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-omap@vger.kernel.org>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCHv3 05/15] remoteproc/omap: Add the rproc ops .da_to_va() implementation
Date:   Fri, 13 Dec 2019 14:55:27 +0200
Message-ID: <20191213125537.11509-6-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213125537.11509-1-t-kristo@ti.com>
References: <20191213125537.11509-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

An implementation for the rproc ops .da_to_va() has been added
that provides the address translation between device addresses
to kernel virtual addresses for internal RAMs present on that
particular remote processor device. The implementation provides
the translations based on the addresses parsed and stored during
the probe.

This ops gets invoked by the exported rproc_da_to_va() function
and allows the remoteproc core's ELF loader to be able to load
program data directly into the internal memories.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/remoteproc/omap_remoteproc.c | 39 ++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 844703507a74..28f14e24b389 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -232,10 +232,49 @@ static int omap_rproc_stop(struct rproc *rproc)
 	return 0;
 }
 
+/**
+ * omap_rproc_da_to_va() - internal memory translation helper
+ * @rproc: remote processor to apply the address translation for
+ * @da: device address to translate
+ * @len: length of the memory buffer
+ *
+ * Custom function implementing the rproc .da_to_va ops to provide address
+ * translation (device address to kernel virtual address) for internal RAMs
+ * present in a DSP or IPU device). The translated addresses can be used
+ * either by the remoteproc core for loading, or by any rpmsg bus drivers.
+ * Returns the translated virtual address in kernel memory space, or NULL
+ * in failure.
+ */
+static void *omap_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
+{
+	struct omap_rproc *oproc = rproc->priv;
+	int i;
+	u32 offset;
+
+	if (len <= 0)
+		return NULL;
+
+	if (!oproc->num_mems)
+		return NULL;
+
+	for (i = 0; i < oproc->num_mems; i++) {
+		if (da >= oproc->mem[i].dev_addr && da + len <=
+		    oproc->mem[i].dev_addr +  oproc->mem[i].size) {
+			offset = da -  oproc->mem[i].dev_addr;
+			/* __force to make sparse happy with type conversion */
+			return (__force void *)(oproc->mem[i].cpu_addr +
+						offset);
+		}
+	}
+
+	return NULL;
+}
+
 static const struct rproc_ops omap_rproc_ops = {
 	.start		= omap_rproc_start,
 	.stop		= omap_rproc_stop,
 	.kick		= omap_rproc_kick,
+	.da_to_va	= omap_rproc_da_to_va,
 };
 
 static const char * const ipu_mem_names[] = {
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
