Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD0092BBC85
	for <lists+linux-omap@lfdr.de>; Sat, 21 Nov 2020 04:03:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727162AbgKUDCO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 20 Nov 2020 22:02:14 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50548 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727244AbgKUDCL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 20 Nov 2020 22:02:11 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AL323Ii047239;
        Fri, 20 Nov 2020 21:02:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1605927723;
        bh=HMdSdR7V2x6ONvh3fs4KsUST5GUzlhQZ7uiFijupU2c=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Lqj+7k291l4uOnCc3kVwF8kQYBHb0BW5o8eF8kGAj9iRLYLA9cz/1vUohnuLBztDk
         +tviOeX/3dnyBSKwLsqhK6rmttpuzlfodLBoQdPnCM6UKKYlhCGssWYgYqfldg4y3S
         MEoKytFEBXH64ai8JApLvpaTOXndTo9ORGocMOs4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AL323oP021875
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Nov 2020 21:02:03 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 20
 Nov 2020 21:02:02 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 20 Nov 2020 21:02:03 -0600
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AL322tm006992;
        Fri, 20 Nov 2020 21:02:02 -0600
Received: from localhost ([10.250.68.46])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 0AL322mX038651;
        Fri, 20 Nov 2020 21:02:02 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Loic Pallardy <loic.pallardy@st.com>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 2/3] remoteproc: Introduce deny_sysfs_ops flag
Date:   Fri, 20 Nov 2020 21:01:55 -0600
Message-ID: <20201121030156.22857-3-s-anna@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201121030156.22857-1-s-anna@ti.com>
References: <20201121030156.22857-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The remoteproc framework provides sysfs interfaces for changing
the firmware name and for starting/stopping a remote processor
through the sysfs files 'state' and 'firmware'. The 'recovery'
sysfs file can also be used similarly to control the error recovery
state machine of a remoteproc. These interfaces are currently
allowed irrespective of how the remoteprocs were booted (like
remoteproc self auto-boot, remoteproc client-driven boot etc).
These interfaces can adversely affect a remoteproc and its clients
especially when a remoteproc is being controlled by a remoteproc
client driver(s). Also, not all remoteproc drivers may want to
support the sysfs interfaces by default.

Add support to deny the sysfs state/firmware/recovery change by
introducing a state flag 'deny_sysfs_ops' that the individual
remoteproc drivers can set based on their usage needs. The default
behavior is to allow the sysfs operations as before.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
v2: revised to account for the 'recovery' sysfs file as well, patch
    description updated accordingly
v1: https://patchwork.kernel.org/project/linux-remoteproc/patch/20180915003725.17549-5-s-anna@ti.com/

 drivers/remoteproc/remoteproc_sysfs.c | 12 ++++++++++++
 include/linux/remoteproc.h            |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index bd2950a246c9..3fd18a71c188 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -49,6 +49,10 @@ static ssize_t recovery_store(struct device *dev,
 {
 	struct rproc *rproc = to_rproc(dev);
 
+	/* restrict sysfs operations if not allowed by remoteproc drivers */
+	if (rproc->deny_sysfs_ops)
+		return -EPERM;
+
 	if (sysfs_streq(buf, "enabled")) {
 		/* change the flag and begin the recovery process if needed */
 		rproc->recovery_disabled = false;
@@ -158,6 +162,10 @@ static ssize_t firmware_store(struct device *dev,
 	char *p;
 	int err, len = count;
 
+	/* restrict sysfs operations if not allowed by remoteproc drivers */
+	if (rproc->deny_sysfs_ops)
+		return -EPERM;
+
 	err = mutex_lock_interruptible(&rproc->lock);
 	if (err) {
 		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, err);
@@ -225,6 +233,10 @@ static ssize_t state_store(struct device *dev,
 	struct rproc *rproc = to_rproc(dev);
 	int ret = 0;
 
+	/* restrict sysfs operations if not allowed by remoteproc drivers */
+	if (rproc->deny_sysfs_ops)
+		return -EPERM;
+
 	if (sysfs_streq(buf, "start")) {
 		if (rproc->state == RPROC_RUNNING)
 			return -EBUSY;
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 3fa3ba6498e8..dbc3767f7d0e 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -508,6 +508,7 @@ struct rproc_dump_segment {
  * @has_iommu: flag to indicate if remote processor is behind an MMU
  * @auto_boot: flag to indicate if remote processor should be auto-started
  * @autonomous: true if an external entity has booted the remote processor
+ * @deny_sysfs_ops: flag to not permit sysfs operations on state, firmware and recovery
  * @dump_segments: list of segments in the firmware
  * @nb_vdev: number of vdev currently handled by rproc
  * @char_dev: character device of the rproc
@@ -545,6 +546,7 @@ struct rproc {
 	bool has_iommu;
 	bool auto_boot;
 	bool autonomous;
+	bool deny_sysfs_ops;
 	struct list_head dump_segments;
 	int nb_vdev;
 	u8 elf_class;
-- 
2.28.0

