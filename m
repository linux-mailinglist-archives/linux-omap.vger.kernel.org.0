Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B60C7346D52
	for <lists+linux-omap@lfdr.de>; Tue, 23 Mar 2021 23:39:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233992AbhCWWj0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Mar 2021 18:39:26 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44572 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233884AbhCWWix (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 23 Mar 2021 18:38:53 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12NMcg09129795;
        Tue, 23 Mar 2021 17:38:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1616539123;
        bh=v0jTGCZ1oBPMU7LTD68AxfiI5GGeI84RrTgbBNlTmxE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Q3bZjckCHvWhjgwTVwo1bHC5CQteCOi9sCFEgZQScqZ+/bRjcvZhWsh+DLIZsHIDV
         fHCQj21H1BUKvvkX2Ex2mXoqLNemcB1ASYehl3un9ESTD8pwoM1un1+RNQ8xXUeaA4
         y8QIkbKI4uTC9JBsTLSocK02KIcfeNL/lxliEbyI=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12NMcgnV020633
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 23 Mar 2021 17:38:42 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 23
 Mar 2021 17:38:42 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 23 Mar 2021 17:38:42 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12NMcgcg117647;
        Tue, 23 Mar 2021 17:38:42 -0500
Received: from localhost ([10.250.221.195])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 12NMcgnm102217;
        Tue, 23 Mar 2021 17:38:42 -0500
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
Subject: [PATCH 2/3] remoteproc: pru: Fix wrong success return value for fw events
Date:   Tue, 23 Mar 2021 17:38:38 -0500
Message-ID: <20210323223839.17464-3-s-anna@ti.com>
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

The irq_create_fwspec_mapping() returns a proper virq value on success
and 0 upon any failure. The pru_handle_intrmap() treats this as an error
and disposes all firmware event mappings correctly, but is returning
this incorrect value as is, letting the pru_rproc_start() interpret it
as a success and boot the PRU.

Fix this by returning an error value back upon any such failure. While
at this, revise the error trace to print some meaningful info about the
failed event.

Fixes: c75c9fdac66e ("remoteproc: pru: Add support for PRU specific interrupt configuration")
Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/pru_rproc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index a9d07c0751be..87b43976c51b 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -339,8 +339,10 @@ static int pru_handle_intrmap(struct rproc *rproc)
 
 		pru->mapped_irq[i] = irq_create_fwspec_mapping(&fwspec);
 		if (!pru->mapped_irq[i]) {
-			dev_err(dev, "failed to get virq\n");
-			ret = pru->mapped_irq[i];
+			dev_err(dev, "failed to get virq for fw mapping %d: event %d chnl %d host %d\n",
+				i, fwspec.param[0], fwspec.param[1],
+				fwspec.param[2]);
+			ret = -EINVAL;
 			goto map_fail;
 		}
 	}
-- 
2.30.1

