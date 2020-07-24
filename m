Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B903F22BFEB
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 09:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727770AbgGXHnS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 03:43:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:37436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726607AbgGXHnR (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Jul 2020 03:43:17 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AC146207DF;
        Fri, 24 Jul 2020 07:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595576597;
        bh=vVrPJpnrKh1wJ6LdbFf4wRAAhGQO0li9B4zgOch67X8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oK0pLZKjQDf+Gnf2KXF0LQzFxSNdIcpwyg7pDNWGC7k/+0ja4u68Lfe+iWj8hqiic
         X1Ws8IdNMfZt0c5n7CaA5h2wow7rTsnHXmpi2YpSXv3agbQFETi8OJ/fFx9FsQjVyH
         8lh+MllUjS/K+1KK9WrKZd6eWb8e6oPEoPESjfLM=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Markus Mayer <mmayer@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Roger Quadros <rogerq@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Kukjin Kim <kgene@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 26/29] memory: fsl_ifc: Fix whitespace issues
Date:   Fri, 24 Jul 2020 09:40:35 +0200
Message-Id: <20200724074038.5597-27-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fix minor whitespace and comment issues.  Do not break message strings.
No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 drivers/memory/fsl_ifc.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/memory/fsl_ifc.c b/drivers/memory/fsl_ifc.c
index a2c971743ffe..89f99b5b6450 100644
--- a/drivers/memory/fsl_ifc.c
+++ b/drivers/memory/fsl_ifc.c
@@ -53,6 +53,7 @@ int fsl_ifc_find(phys_addr_t addr_base)
 
 	for (i = 0; i < fsl_ifc_ctrl_dev->banks; i++) {
 		u32 cspr = ifc_in32(&fsl_ifc_ctrl_dev->gregs->cspr_cs[i].cspr);
+
 		if (cspr & CSPR_V && (cspr & CSPR_BA) ==
 				convert_ifc_address(addr_base))
 			return i;
@@ -153,8 +154,8 @@ static irqreturn_t fsl_ifc_ctrl_irq(int irqno, void *data)
 	/* read for chip select error */
 	cs_err = ifc_in32(&ifc->cm_evter_stat);
 	if (cs_err) {
-		dev_err(ctrl->dev, "transaction sent to IFC is not mapped to"
-				"any memory bank 0x%08X\n", cs_err);
+		dev_err(ctrl->dev, "transaction sent to IFC is not mapped to any memory bank 0x%08X\n",
+			cs_err);
 		/* clear the chip select error */
 		ifc_out32(IFC_CM_EVTER_STAT_CSER, &ifc->cm_evter_stat);
 
@@ -163,24 +164,24 @@ static irqreturn_t fsl_ifc_ctrl_irq(int irqno, void *data)
 		err_addr = ifc_in32(&ifc->cm_erattr1);
 
 		if (status & IFC_CM_ERATTR0_ERTYP_READ)
-			dev_err(ctrl->dev, "Read transaction error"
-				"CM_ERATTR0 0x%08X\n", status);
+			dev_err(ctrl->dev, "Read transaction error CM_ERATTR0 0x%08X\n",
+				status);
 		else
-			dev_err(ctrl->dev, "Write transaction error"
-				"CM_ERATTR0 0x%08X\n", status);
+			dev_err(ctrl->dev, "Write transaction error CM_ERATTR0 0x%08X\n",
+				status);
 
 		err_axiid = (status & IFC_CM_ERATTR0_ERAID) >>
 					IFC_CM_ERATTR0_ERAID_SHIFT;
-		dev_err(ctrl->dev, "AXI ID of the error"
-					"transaction 0x%08X\n", err_axiid);
+		dev_err(ctrl->dev, "AXI ID of the error transaction 0x%08X\n",
+			err_axiid);
 
 		err_srcid = (status & IFC_CM_ERATTR0_ESRCID) >>
 					IFC_CM_ERATTR0_ESRCID_SHIFT;
-		dev_err(ctrl->dev, "SRC ID of the error"
-					"transaction 0x%08X\n", err_srcid);
+		dev_err(ctrl->dev, "SRC ID of the error transaction 0x%08X\n",
+			err_srcid);
 
-		dev_err(ctrl->dev, "Transaction Address corresponding to error"
-					"ERADDR 0x%08X\n", err_addr);
+		dev_err(ctrl->dev, "Transaction Address corresponding to error ERADDR 0x%08X\n",
+			err_addr);
 
 		ret = IRQ_HANDLED;
 	}
@@ -199,7 +200,7 @@ static irqreturn_t fsl_ifc_ctrl_irq(int irqno, void *data)
  * the resources needed for the controller only.  The
  * resources for the NAND banks themselves are allocated
  * in the chip probe function.
-*/
+ */
 static int fsl_ifc_ctrl_probe(struct platform_device *dev)
 {
 	int ret = 0;
@@ -250,8 +251,7 @@ static int fsl_ifc_ctrl_probe(struct platform_device *dev)
 	/* get the Controller level irq */
 	fsl_ifc_ctrl_dev->irq = irq_of_parse_and_map(dev->dev.of_node, 0);
 	if (fsl_ifc_ctrl_dev->irq == 0) {
-		dev_err(&dev->dev, "failed to get irq resource "
-							"for IFC\n");
+		dev_err(&dev->dev, "failed to get irq resource for IFC\n");
 		ret = -ENODEV;
 		goto err;
 	}
-- 
2.17.1

