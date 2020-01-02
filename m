Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 611D812E693
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2020 14:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728334AbgABNTY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jan 2020 08:19:24 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:36516 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728472AbgABNTX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Jan 2020 08:19:23 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 002DJMCl020899;
        Thu, 2 Jan 2020 07:19:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1577971162;
        bh=+KjgukgePflClvPnhmf33TdnVwrkug4uDDrdlsW9Ewg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ZFpT6FhWKkSoYyKbn1Amci5saIjg48l0MfSlcQZZh0b2JZ2LLO+vZZhYgw+odEO1w
         aLYvSwTLfaar8+feA4Z02eEc2CTrBG1Oy16Vgf1laIkQZa0q4eGq3C7QXkgteiyLWy
         ZiBMh0jbxlQgVrqRxMEeI5hpwIv5ykrzW9g5wZhU=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 002DJMtI090351
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 2 Jan 2020 07:19:22 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 2 Jan
 2020 07:19:22 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 2 Jan 2020 07:19:22 -0600
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 002DIp3e075354;
        Thu, 2 Jan 2020 07:19:20 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-omap@vger.kernel.org>, <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCHv4 13/14] remoteproc/omap: report device exceptions and trigger recovery
Date:   Thu, 2 Jan 2020 15:18:44 +0200
Message-ID: <20200102131845.12992-14-t-kristo@ti.com>
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
index 06e269983ea1..0318cde3d1fb 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -378,8 +378,12 @@ static void omap_rproc_mbox_callback(struct mbox_client *client, void *data)
 
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
