Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 378F08462D
	for <lists+linux-omap@lfdr.de>; Wed,  7 Aug 2019 09:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727634AbfHGHtf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Aug 2019 03:49:35 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:57888 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727541AbfHGHtf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Aug 2019 03:49:35 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x777nUpq026495;
        Wed, 7 Aug 2019 02:49:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565164170;
        bh=38KuTU80Xa1yf7f4cPI/hHILKIMORwhhd0n/rtt8q8Q=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=qJrtuztt9XsCmiZZHPPsnuPtHHCIsE0Oeyi1RzMafXYwi8gjMfQBey3JkOuJTQhVi
         y535iifnDhW1XM7NPFUI64FJvUdZ3mWibl+OwGatpfZZvMoVIfl3/HQm2FnrQQcxx3
         HiR7I7Aea7ndO8hxtcP4HOE/2LLcsW/Z/Q1ItGpY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x777nUC2051435
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Aug 2019 02:49:30 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 02:49:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 7 Aug 2019 02:49:30 -0500
Received: from gomoku.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x777nNHf118711;
        Wed, 7 Aug 2019 02:49:28 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <ssantosh@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>
CC:     <tony@atomide.com>, <s-anna@ti.com>, <devicetree@vger.kernel.org>
Subject: [PATCH 3/8] soc: ti: omap-prm: poll for reset complete during de-assert
Date:   Wed, 7 Aug 2019 10:48:54 +0300
Message-ID: <1565164139-21886-4-git-send-email-t-kristo@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565164139-21886-1-git-send-email-t-kristo@ti.com>
References: <1565164139-21886-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Poll for reset completion status during de-assertion of reset, otherwise
the IP in question might be accessed before it has left reset properly.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/soc/ti/omap_prm.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
index 7c89eb8..d412af3 100644
--- a/drivers/soc/ti/omap_prm.c
+++ b/drivers/soc/ti/omap_prm.c
@@ -107,6 +107,7 @@ static int omap_reset_deassert(struct reset_controller_dev *rcdev,
 	u32 v;
 	int st_bit = id;
 	bool has_rstst;
+	int timeout = 0;
 
 	/* check the current status to avoid de-asserting the line twice */
 	v = readl_relaxed(reset->prm->base + reset->prm->data->rstctl);
@@ -129,6 +130,22 @@ static int omap_reset_deassert(struct reset_controller_dev *rcdev,
 	v &= ~(1 << id);
 	writel_relaxed(v, reset->prm->base + reset->prm->data->rstctl);
 
+	if (!has_rstst)
+		return 0;
+
+	/* wait for the status to be set */
+	while (1) {
+		v = readl_relaxed(reset->prm->base + reset->prm->data->rstst);
+		v &= 1 << st_bit;
+		if (v)
+			break;
+		timeout++;
+		if (timeout > OMAP_RESET_MAX_WAIT)
+			return -EBUSY;
+
+		udelay(1);
+	}
+
 	return 0;
 }
 
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
