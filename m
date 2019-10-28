Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19FE9E71E3
	for <lists+linux-omap@lfdr.de>; Mon, 28 Oct 2019 13:44:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389373AbfJ1MnT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 28 Oct 2019 08:43:19 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:46276 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389353AbfJ1MnS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 28 Oct 2019 08:43:18 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9SChHrg047782;
        Mon, 28 Oct 2019 07:43:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572266597;
        bh=GcuJhLy2/UdXK6FDSfnKUOcBg0bgb5KT7rF6axB5KyM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=vw1pOpbHBBTy5qPwt5quy5Y33ZYmdS26AXuhvhi93bwyhkbZw7HqW95+2xPg+SPXa
         A/bCr5eH42Hdg40cfKYZ8NNOlN9DlT8axd/Io4GNOE4aWFEsBogt4sYpHtlkc90z/+
         FZn64kE21RfQbY0D42iqMvpiV0mR6LtY812gqKnI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9SChGFK040486
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 28 Oct 2019 07:43:16 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 28
 Oct 2019 07:43:05 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 28 Oct 2019 07:43:04 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9SCgoh3063574;
        Mon, 28 Oct 2019 07:43:14 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 11/17] remoteproc/omap: Check for undefined mailbox messages
Date:   Mon, 28 Oct 2019 14:42:32 +0200
Message-ID: <20191028124238.19224-12-t-kristo@ti.com>
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

Add some checks in the mailbox callback function to limit
any processing in the mailbox callback function to only
certain currently valid messages, and drop all the remaining
messages. A debug message is added to print any such invalid
messages when the appropriate trace control is enabled.

Signed-off-by: Subramaniam Chanderashekarapuram <subramaniam.ca@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/remoteproc/omap_remoteproc.c | 6 ++++++
 drivers/remoteproc/omap_remoteproc.h | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index e46bb4c790d7..016d5beda195 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -124,6 +124,12 @@ static void omap_rproc_mbox_callback(struct mbox_client *client, void *data)
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
