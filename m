Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A34512E68C
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2020 14:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728413AbgABNTK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jan 2020 08:19:10 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:59462 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728330AbgABNTK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Jan 2020 08:19:10 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 002DJ8AE035103;
        Thu, 2 Jan 2020 07:19:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1577971148;
        bh=9nz8I3FlvwbtR6z+Kh50FcpfT6Ue0HAht142PF2OSrE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=hLLJcsjCZ3vAYF5LZLaQQ3Gqs7sAGISlXBNfigBtHkzc4U2clm+M1LR/zt6MpJ9SV
         a+HuV3716Yxd5la4d1KaQUtJRoCHsbwIgV5azaWXJ/CXJCfNYut7aaQo5BTMPhFtEj
         OpLNWf/od/Ev2jHCah9UWu/MGfV8GatACJ+gniYw=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 002DJ8uD090160
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 2 Jan 2020 07:19:08 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 2 Jan
 2020 07:19:04 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 2 Jan 2020 07:19:04 -0600
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 002DIp3W075354;
        Thu, 2 Jan 2020 07:19:02 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-omap@vger.kernel.org>, <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCHv4 05/14] remoteproc/omap: Add the rproc ops .da_to_va() implementation
Date:   Thu, 2 Jan 2020 15:18:36 +0200
Message-ID: <20200102131845.12992-6-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200102131845.12992-1-t-kristo@ti.com>
References: <20200102131845.12992-1-t-kristo@ti.com>
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
v4:
  - some whitespace fixes

 drivers/remoteproc/omap_remoteproc.c | 39 ++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index e429b2296d7a..9ca337f18ac2 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -245,10 +245,49 @@ static int omap_rproc_stop(struct rproc *rproc)
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
+		    oproc->mem[i].dev_addr + oproc->mem[i].size) {
+			offset = da - oproc->mem[i].dev_addr;
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
 
 static const struct omap_rproc_mem_data ipu_mems[] = {
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
