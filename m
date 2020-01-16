Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C10D213DC9B
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jan 2020 14:56:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729219AbgAPNy1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Jan 2020 08:54:27 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:60096 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726951AbgAPNyZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Jan 2020 08:54:25 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00GDsOZc068788;
        Thu, 16 Jan 2020 07:54:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579182864;
        bh=ChiSm7sDZkA3ZG+3Op+2Q2SX5WXopwOatWF4IS/4smI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=lGDHQUnI04996NgW5ES//lT3znV/EuLK23DBZ667g1j8dLsPMMctqQZgdJHzoEjvR
         SFsd3cE2X3QEqoxBsIhhUFm/8R7FiQ7sMNFGDeAuyt7A30NULbb2yU9oCMWMk7xtCF
         lFZMuzxHCq5s580GohUeFNUkIRASA48OH5egdDwA=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00GDsOtM022699
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 Jan 2020 07:54:24 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 16
 Jan 2020 07:54:23 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 16 Jan 2020 07:54:23 -0600
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00GDrqdf048732;
        Thu, 16 Jan 2020 07:54:22 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <s-anna@ti.com>, <linux-omap@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCHv5 13/14] remoteproc/omap: report device exceptions and trigger recovery
Date:   Thu, 16 Jan 2020 15:53:31 +0200
Message-ID: <20200116135332.7819-14-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200116135332.7819-1-t-kristo@ti.com>
References: <20200116135332.7819-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The OMAP remote processors send a special mailbox message
(RP_MBOX_CRASH) when they crash and detect an internal device
exception.

Add support to the mailbox handling function upon detection of
this special message to report this crash to the remoteproc core.
The remoteproc core can trigger a recovery using the prevailing
recovery mechanism, already in use for MMU Fault recovery.

Co-developed-by: Subramaniam Chanderashekarapuram <subramaniam.ca@ti.com>
Signed-off-by: Subramaniam Chanderashekarapuram <subramaniam.ca@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
v5: no changes

 drivers/remoteproc/omap_remoteproc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 0700d2b332f7..ebc9ebba506c 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -381,8 +381,12 @@ static void omap_rproc_mbox_callback(struct mbox_client *client, void *data)
 
 	switch (msg) {
 	case RP_MBOX_CRASH:
-		/* just log this for now. later, we'll also do recovery */
+		/*
+		 * remoteproc detected an exception, notify the rproc core.
+		 * The remoteproc core will handle the recovery.
+		 */
 		dev_err(dev, "omap rproc %s crashed\n", name);
+		rproc_report_crash(oproc->rproc, RPROC_FATAL_ERROR);
 		break;
 	case RP_MBOX_ECHO_REPLY:
 		dev_info(dev, "received echo reply from %s\n", name);
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
