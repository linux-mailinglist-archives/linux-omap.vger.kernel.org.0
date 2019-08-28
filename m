Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 887169FB55
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 09:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbfH1HUG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 03:20:06 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:59396 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbfH1HUG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Aug 2019 03:20:06 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7S7JxAl116149;
        Wed, 28 Aug 2019 02:19:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566976799;
        bh=lun/IihhVZD0SSuBuE72idtwD4SSrSW8blVhgZgqk2U=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=sE5yNRtkvGyAPqmNv20ep8YkcF+5JLPMY4UC7vGG9gyEVOtYrxe3ZN0AU5DmyGY6/
         jqSEMF1M0TASDP6kp4ALgZV6Ov++akIxnWCuuC/MoHaIBbxQ1iqskeaJUYqHoHP9VC
         XtWuhxZg1vfdeNP0W+tjXKfRDMKSUHBgzvKNoTRg=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7S7Jxsw078153
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 28 Aug 2019 02:19:59 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 28
 Aug 2019 02:19:57 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 28 Aug 2019 02:19:57 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7S7JmfF052201;
        Wed, 28 Aug 2019 02:19:55 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <ssantosh@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>,
        <p.zabel@pengutronix.de>
CC:     <tony@atomide.com>, <s-anna@ti.com>, <devicetree@vger.kernel.org>
Subject: [PATCHv2 03/11] soc: ti: omap-prm: poll for reset complete during de-assert
Date:   Wed, 28 Aug 2019 10:19:33 +0300
Message-ID: <20190828071941.32378-4-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828071941.32378-1-t-kristo@ti.com>
References: <20190828071941.32378-1-t-kristo@ti.com>
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
 drivers/soc/ti/omap_prm.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
index fd5c431f8736..afeb70761b27 100644
--- a/drivers/soc/ti/omap_prm.c
+++ b/drivers/soc/ti/omap_prm.c
@@ -127,6 +127,7 @@ static int omap_reset_deassert(struct reset_controller_dev *rcdev,
 	u32 v;
 	int st_bit;
 	bool has_rstst;
+	int timeout = 0;
 
 	if (!_is_valid_reset(reset, id))
 		return -EINVAL;
@@ -153,6 +154,25 @@ static int omap_reset_deassert(struct reset_controller_dev *rcdev,
 	v &= ~(1 << id);
 	writel_relaxed(v, reset->prm->base + reset->prm->data->rstctrl);
 
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
+		if (timeout > OMAP_RESET_MAX_WAIT) {
+			pr_err("%s: timedout waiting for %s:%lu\n", __func__,
+			       dev_name(rcdev->dev), id);
+			return -EBUSY;
+		}
+
+		udelay(1);
+	}
+
 	return 0;
 }
 
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
