Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 483412BBCA7
	for <lists+linux-omap@lfdr.de>; Sat, 21 Nov 2020 04:21:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727048AbgKUDUq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 20 Nov 2020 22:20:46 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:54330 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726656AbgKUDUq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 20 Nov 2020 22:20:46 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AL3Ki8C088775;
        Fri, 20 Nov 2020 21:20:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1605928844;
        bh=cZWcMJfvF83UzHL9FrqB5NJItZJQGjIRAPeec50W65s=;
        h=From:To:CC:Subject:Date;
        b=Zo6FeerUkAy9VfJFiYGjOwAt74lMzfw5tYL2NgCOx74C8LvQuz0xeSM94wXIo8E+a
         KmfuThVHAPkp0wR2vG602OT8Uv5E0RwvKk1G+dFfGzJcqF5DWVcMSlH9IJHcV7W1ki
         BIFUH22ys7/eYWrWf8VzQyCDwiDlg2rh/p6/MgZ0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AL3KiAO036491
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Nov 2020 21:20:44 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 20
 Nov 2020 21:20:44 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 20 Nov 2020 21:20:44 -0600
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AL3KhVh019782;
        Fri, 20 Nov 2020 21:20:44 -0600
Received: from localhost ([10.250.68.46])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 0AL3KhPb056910;
        Fri, 20 Nov 2020 21:20:43 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH] remoteproc: Add a rproc_set_firmware() API
Date:   Fri, 20 Nov 2020 21:20:42 -0600
Message-ID: <20201121032042.6195-1-s-anna@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

A new API, rproc_set_firmware() is added to allow the remoteproc platform
drivers and remoteproc client drivers to be able to configure a custom
firmware name that is different from the default name used during
remoteproc registration. This function is being introduced to provide
a kernel-level equivalent of the current sysfs interface to remoteproc
client drivers, and can only change firmwares when the remoteproc is
offline. This allows some remoteproc drivers to choose different firmwares
at runtime based on the functionality the remote processor is providing.
The TI PRU Ethernet driver will be an example of such usage as it
requires to use different firmwares for different supported protocols.

Also, update the firmware_store() function used by the sysfs interface
to reuse this function to avoid code duplication.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/remoteproc_core.c  | 63 +++++++++++++++++++++++++++
 drivers/remoteproc/remoteproc_sysfs.c | 33 +-------------
 include/linux/remoteproc.h            |  1 +
 3 files changed, 66 insertions(+), 31 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index dab2c0f5caf0..46c2937ebea9 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1934,6 +1934,69 @@ struct rproc *rproc_get_by_phandle(phandle phandle)
 #endif
 EXPORT_SYMBOL(rproc_get_by_phandle);
 
+/**
+ * rproc_set_firmware() - assign a new firmware
+ * @rproc: rproc handle to which the new firmware is being assigned
+ * @fw_name: new firmware name to be assigned
+ *
+ * This function allows remoteproc drivers or clients to configure a custom
+ * firmware name that is different from the default name used during remoteproc
+ * registration. The function does not trigger a remote processor boot,
+ * only sets the firmware name used for a subsequent boot. This function
+ * should also be called only when the remote processor is offline.
+ *
+ * This allows either the userspace to configure a different name through
+ * sysfs or a kernel-level remoteproc or a remoteproc client driver to set
+ * a specific firmware when it is controlling the boot and shutdown of the
+ * remote processor.
+ *
+ * Return: 0 on success or a negative value upon failure
+ */
+int rproc_set_firmware(struct rproc *rproc, const char *fw_name)
+{
+	struct device *dev;
+	int ret, len;
+	char *p;
+
+	if (!rproc || !fw_name)
+		return -EINVAL;
+
+	dev = rproc->dev.parent;
+
+	ret = mutex_lock_interruptible(&rproc->lock);
+	if (ret) {
+		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
+		return -EINVAL;
+	}
+
+	if (rproc->state != RPROC_OFFLINE) {
+		dev_err(dev, "can't change firmware while running\n");
+		ret = -EBUSY;
+		goto out;
+	}
+
+	len = strcspn(fw_name, "\n");
+	if (!len) {
+		dev_err(dev, "can't provide empty string for firmware name\n");
+		ret = -EINVAL;
+		goto out;
+	}
+
+	p = kstrndup(fw_name, len, GFP_KERNEL);
+	if (!p) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	kfree(rproc->firmware);
+	rproc->firmware = p;
+
+out:
+	mutex_unlock(&rproc->lock);
+	return ret;
+}
+EXPORT_SYMBOL(rproc_set_firmware);
+
 static int rproc_validate(struct rproc *rproc)
 {
 	switch (rproc->state) {
diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 3fd18a71c188..cf846caf2e1a 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -159,42 +159,13 @@ static ssize_t firmware_store(struct device *dev,
 			      const char *buf, size_t count)
 {
 	struct rproc *rproc = to_rproc(dev);
-	char *p;
-	int err, len = count;
+	int err;
 
 	/* restrict sysfs operations if not allowed by remoteproc drivers */
 	if (rproc->deny_sysfs_ops)
 		return -EPERM;
 
-	err = mutex_lock_interruptible(&rproc->lock);
-	if (err) {
-		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, err);
-		return -EINVAL;
-	}
-
-	if (rproc->state != RPROC_OFFLINE) {
-		dev_err(dev, "can't change firmware while running\n");
-		err = -EBUSY;
-		goto out;
-	}
-
-	len = strcspn(buf, "\n");
-	if (!len) {
-		dev_err(dev, "can't provide a NULL firmware\n");
-		err = -EINVAL;
-		goto out;
-	}
-
-	p = kstrndup(buf, len, GFP_KERNEL);
-	if (!p) {
-		err = -ENOMEM;
-		goto out;
-	}
-
-	kfree(rproc->firmware);
-	rproc->firmware = p;
-out:
-	mutex_unlock(&rproc->lock);
+	err = rproc_set_firmware(rproc, buf);
 
 	return err ? err : count;
 }
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index dbc3767f7d0e..6e04b99413f8 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -655,6 +655,7 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, size_t len,
 
 int rproc_boot(struct rproc *rproc);
 void rproc_shutdown(struct rproc *rproc);
+int rproc_set_firmware(struct rproc *rproc, const char *fw_name);
 void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
 int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size);
 int rproc_coredump_add_custom_segment(struct rproc *rproc,
-- 
2.28.0

