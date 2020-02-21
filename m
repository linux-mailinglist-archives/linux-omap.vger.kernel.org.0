Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA907167A8E
	for <lists+linux-omap@lfdr.de>; Fri, 21 Feb 2020 11:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728994AbgBUKUb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Feb 2020 05:20:31 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60412 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728983AbgBUKUa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 21 Feb 2020 05:20:30 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01LAKTiD088511;
        Fri, 21 Feb 2020 04:20:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582280429;
        bh=2pWA9it0Oo3uFpj5kWmPmhTIBaICa315y9ozwepEgKk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=wTXNkEOpbtrGuSQRFCPzb3OVfV0avlKZ9WiTSG5dbAsmRsGzeS334X04ijRq51VoZ
         aczRG6KuAzChPy/qfYovYesQBCFefCQlUwQ9ai8yQ21LY2OUlAdzhr/OplCB6ITAtF
         Ty9Sdhaieqc9YePLuzxu+dDxjCInfHpHWZ54Zwnw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01LAKTkL105147;
        Fri, 21 Feb 2020 04:20:29 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 21
 Feb 2020 04:20:29 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 21 Feb 2020 04:20:29 -0600
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01LAJnww034983;
        Fri, 21 Feb 2020 04:20:12 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>, <afd@ti.com>, <s-anna@ti.com>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-omap@vger.kernel.org>, Tero Kristo <t-kristo@ti.com>
Subject: [PATCHv7 09/15] remoteproc/omap: Check for undefined mailbox messages
Date:   Fri, 21 Feb 2020 12:19:30 +0200
Message-ID: <20200221101936.16833-10-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200221101936.16833-1-t-kristo@ti.com>
References: <20200221101936.16833-1-t-kristo@ti.com>
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
index 8c3dc0edae95..5d6f32974aa3 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -130,6 +130,12 @@ static void omap_rproc_mbox_callback(struct mbox_client *client, void *data)
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
index f6d2036d383d..72f656c93caa 100644
--- a/drivers/remoteproc/omap_remoteproc.h
+++ b/drivers/remoteproc/omap_remoteproc.h
@@ -56,6 +56,12 @@
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
@@ -64,6 +70,7 @@ enum omap_rp_mbox_messages {
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
