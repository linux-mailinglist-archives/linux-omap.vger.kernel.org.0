Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87D3D102649
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2019 15:17:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728313AbfKSORl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Nov 2019 09:17:41 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:58586 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728256AbfKSOR3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 Nov 2019 09:17:29 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAJEHSGB117294;
        Tue, 19 Nov 2019 08:17:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574173048;
        bh=q2AkjbhpWbUsFgOXMbxJrY5HMphD3VfMwU/ROrm6D2I=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=AWSL8hvC6KXdde/QNYqmAKDDcHxzvoy3XP5RDw4tIj8zgrxEmSOeZFw+4Yz+7LhSO
         6mgldBulwyDo/59P+sG+sjbp2Mhf6bNBNAwEMXjlyJP2Hnx3Xpiwas0G26UPDhzKsu
         AHhDGHhhKbMzGcC6QD/oFxqYKXhTc2hFVuBSaL5Y=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAJEHS2t023025
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 19 Nov 2019 08:17:28 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 19
 Nov 2019 08:17:28 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 19 Nov 2019 08:17:28 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAJEGvZ7027070;
        Tue, 19 Nov 2019 08:17:26 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>
Subject: [PATCHv2 14/15] remoteproc/omap: report device exceptions and trigger recovery
Date:   Tue, 19 Nov 2019 16:16:44 +0200
Message-ID: <20191119141645.19777-15-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191119141645.19777-1-t-kristo@ti.com>
References: <20191119141645.19777-1-t-kristo@ti.com>
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
 drivers/remoteproc/omap_remoteproc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 81642bf30423..e024a1cefbbf 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -364,8 +364,12 @@ static void omap_rproc_mbox_callback(struct mbox_client *client, void *data)
 
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
