Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54A01E71EE
	for <lists+linux-omap@lfdr.de>; Mon, 28 Oct 2019 13:44:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389309AbfJ1MnK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 28 Oct 2019 08:43:10 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48230 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389297AbfJ1MnH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 28 Oct 2019 08:43:07 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9SCh6f9016615;
        Mon, 28 Oct 2019 07:43:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572266586;
        bh=AaLjhHOmwp62B5A7lWLn5awjIayOT2x0x5f3vvXKOSk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=IW5MCy8i+ch4qe72edpVfUyr89IJxU9RlF3nW1C4ICYDwYLnMBZ3WZvVnd4Gxd5LQ
         NS3rmlHoO1qLGgZEoR0vz00a7lBRrS5WX4iina7zl+1eYINJejUupKvx7z/ZDRYr7q
         jmEgIB6V6ZpAG4ukeyrOKq8ycZJPyJ1lx9S5eHMs=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9SCh6Jh072841;
        Mon, 28 Oct 2019 07:43:06 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 28
 Oct 2019 07:42:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 28 Oct 2019 07:42:54 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9SCgogw063574;
        Mon, 28 Oct 2019 07:43:04 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 06/17] remoteproc/omap: Add the rproc ops .da_to_va() implementation
Date:   Mon, 28 Oct 2019 14:42:27 +0200
Message-ID: <20191028124238.19224-7-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191028124238.19224-1-t-kristo@ti.com>
References: <20191028124238.19224-1-t-kristo@ti.com>
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
 drivers/remoteproc/omap_remoteproc.c | 35 ++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index bbd6ff360e10..0524f7e0ffa4 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -230,10 +230,45 @@ static int omap_rproc_stop(struct rproc *rproc)
 	return 0;
 }
 
+/*
+ * Internal Memory translation helper
+ *
+ * Custom function implementing the rproc .da_to_va ops to provide address
+ * translation (device address to kernel virtual address) for internal RAMs
+ * present in a DSP or IPU device). The translated addresses can be used
+ * either by the remoteproc core for loading, or by any rpmsg bus drivers.
+ */
+static void *omap_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
+{
+	struct omap_rproc *oproc = rproc->priv;
+	void *va = NULL;
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
+			va = (__force void *)(oproc->mem[i].cpu_addr + offset);
+			break;
+		}
+	}
+
+	return va;
+}
+
 static const struct rproc_ops omap_rproc_ops = {
 	.start		= omap_rproc_start,
 	.stop		= omap_rproc_stop,
 	.kick		= omap_rproc_kick,
+	.da_to_va	= omap_rproc_da_to_va,
 };
 
 static const struct omap_rproc_dev_data omap4_dsp_dev_data = {
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
