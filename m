Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07973102655
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2019 15:18:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728203AbfKSORZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Nov 2019 09:17:25 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:50576 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728181AbfKSORV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 Nov 2019 09:17:21 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAJEHKJj017670;
        Tue, 19 Nov 2019 08:17:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574173040;
        bh=Kr87n77gFeBbSKWKSZnMedn8yql6reeiLpFLg4xIjN0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=lcG2Jf/vApwoM3krCe0PQ8uVBxi8Siyf6nDMrJm4edLzJwIok+jYM3Zc/c/9GcE1R
         5jr4ezVFWGBUZ6tGuIJqjuXSEDHxW+FsMWQkwaMf15vzckF/WGBjiiVSvQUSrxfSeE
         6MQn+PaaXTiolB25mMpylqTtLH5DkUznkPI3tJzk=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAJEHKR4084111;
        Tue, 19 Nov 2019 08:17:20 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 19
 Nov 2019 08:17:20 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 19 Nov 2019 08:17:20 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAJEGvZ3027070;
        Tue, 19 Nov 2019 08:17:18 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>
Subject: [PATCHv2 10/15] remoteproc/omap: Check for undefined mailbox messages
Date:   Tue, 19 Nov 2019 16:16:40 +0200
Message-ID: <20191119141645.19777-11-t-kristo@ti.com>
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

Add some checks in the mailbox callback function to limit
any processing in the mailbox callback function to only
certain currently valid messages, and drop all the remaining
messages. A debug message is added to print any such invalid
messages when the appropriate trace control is enabled.

Co-developed-by: Subramaniam Chanderashekarapuram <subramaniam.ca@ti.com>
Signed-off-by: Subramaniam Chanderashekarapuram <subramaniam.ca@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/omap_remoteproc.c | 6 ++++++
 drivers/remoteproc/omap_remoteproc.h | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 4af55d1f2702..62734eaafaad 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -127,6 +127,12 @@ static void omap_rproc_mbox_callback(struct mbox_client *client, void *data)
 		dev_info(dev, "received echo reply from %s\n", name);
 		break;
 	default:
+		if (msg >= RP_MBOX_READY && msg < RP_MBOX_END_MSG)
+			return;
+		if (msg > oproc->rproc->max_notifyid) {
+			dev_dbg(dev, "dropping unknown message 0x%x", msg);
+			return;
+		}
 		/* msg contains the index of the triggered vring */
 		if (rproc_vq_interrupt(oproc->rproc, msg) == IRQ_NONE)
 			dev_dbg(dev, "no message was found in vqid %d\n", msg);
diff --git a/drivers/remoteproc/omap_remoteproc.h b/drivers/remoteproc/omap_remoteproc.h
index 1e6fef753c4f..18f522617683 100644
--- a/drivers/remoteproc/omap_remoteproc.h
+++ b/drivers/remoteproc/omap_remoteproc.h
@@ -31,6 +31,12 @@
  *
  * @RP_MBOX_ABORT_REQUEST: a "please crash" request, used for testing the
  * recovery mechanism (to some extent).
+ *
+ * Introduce new message definitions if any here.
+ *
+ * @RP_MBOX_END_MSG: Indicates end of known/defined messages from remote core
+ * This should be the last definition.
+ *
  */
 enum omap_rp_mbox_messages {
 	RP_MBOX_READY		= 0xFFFFFF00,
@@ -39,6 +45,7 @@ enum omap_rp_mbox_messages {
 	RP_MBOX_ECHO_REQUEST	= 0xFFFFFF03,
 	RP_MBOX_ECHO_REPLY	= 0xFFFFFF04,
 	RP_MBOX_ABORT_REQUEST	= 0xFFFFFF05,
+	RP_MBOX_END_MSG		= 0xFFFFFF06,
 };
 
 #endif /* _OMAP_RPMSG_H */
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
