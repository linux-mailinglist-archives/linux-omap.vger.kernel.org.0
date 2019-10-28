Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D64EE71DF
	for <lists+linux-omap@lfdr.de>; Mon, 28 Oct 2019 13:44:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389458AbfJ1Mnc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 28 Oct 2019 08:43:32 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:37336 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389444AbfJ1Mnb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 28 Oct 2019 08:43:31 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9SChUE9034373;
        Mon, 28 Oct 2019 07:43:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572266610;
        bh=RjOxaFJF9928MExwXsThcLzcc0mTulOCLUMie9VmrpA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=MSpMeR3C94Knhds1rQEhThX7xPi6ZtSwvVbqGp02NXI4Fkqcig9lrELGkDc6BgrFt
         YszypclGnQOdKrcPhm05WLNYVy+qC9SmYK7CI+NnkhAB3h+gyxtX6Yr83kjP1WjV1T
         eJwus7NTNAK391rb2ssBP+ud89SGvalyxKLEjxes=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9SChUEr075731
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 28 Oct 2019 07:43:30 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 28
 Oct 2019 07:43:17 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 28 Oct 2019 07:43:29 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9SCgoh9063574;
        Mon, 28 Oct 2019 07:43:27 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 17/17] remoteproc/omap: fix auto-suspend failure warning during crashed state
Date:   Mon, 28 Oct 2019 14:42:38 +0200
Message-ID: <20191028124238.19224-18-t-kristo@ti.com>
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

The runtime autosuspend on a OMAP remoteproc device is attempted when
the suspend timer expires (autosuspend delay elapsed since the last
time the device is busy). This is the normal autosuspend scenario
for a device functioning normally. This timer can also expire during
the debugging of a remoteproc crash when the remoteproc recovery is
disabled. This is an invalid pre-condition though, so check for the
RPROC_CRASHED state and bail out before the actual check for the
RPROC_RUNNING state. The auto-suspend is also not re-attempted until
the remoteproc is recovered and restored to normal functional state.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/remoteproc/omap_remoteproc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 2eb05d7a4dec..1dfac82224f7 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -945,6 +945,11 @@ static int omap_rproc_runtime_suspend(struct device *dev)
 	struct omap_rproc *oproc = rproc->priv;
 	int ret;
 
+	if (rproc->state == RPROC_CRASHED) {
+		dev_dbg(dev, "rproc cannot be runtime suspended when crashed!\n");
+		return -EBUSY;
+	}
+
 	if (WARN_ON(rproc->state != RPROC_RUNNING)) {
 		dev_err(dev, "rproc cannot be runtime suspended when not running!\n");
 		return -EBUSY;
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
