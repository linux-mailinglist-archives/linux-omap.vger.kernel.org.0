Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9F3112777
	for <lists+linux-omap@lfdr.de>; Wed,  4 Dec 2019 10:32:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727403AbfLDJcN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Dec 2019 04:32:13 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:32812 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbfLDJcN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 4 Dec 2019 04:32:13 -0500
Received: by mail-pj1-f65.google.com with SMTP id r67so2773365pjb.0;
        Wed, 04 Dec 2019 01:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=UDt70vT9CBypJ9FiN1tWwjjJ5WMMLvj4KFgZR5+sM14=;
        b=krt+D5l86FTp5xIjbF7wEDBtiow4XVnqgi0QH4JJ7JrN1o+yESZrJzG8ALom06Z1v+
         L8jTD2DGKLoTJLWqHPk3M/a4qZLtol8UqR1YtJpuinzGrROFXHMy0LwKI/ySThGQH+yr
         d7dtzBk2PnQ2Pwfulex65VHHTxetOelz/I1bD9hR9KLqtOu1541gG0oeFM/ughIE3+NN
         0KiNrzO0/2kuy7snuEuggOAD6X7o71fknTMjgCgJg5pCcVGfi3ukesv9PtL2I5+2PtDk
         PG1Lcc1lIS0+nYqshHMhOz3Yh2PjGfXHHpKiXeGBGeBK0JOjRsh7ZeRd3+1XprepVF6v
         uOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=UDt70vT9CBypJ9FiN1tWwjjJ5WMMLvj4KFgZR5+sM14=;
        b=bCum4tapWvAsHKgYhoPJuqprWZ2E0/glcfhydH9tQezFW8vVcAt3CYZd/BA0NanYDI
         QSim9VQyrETlRz5ZWjJ38AXFclh85mHWK51LBfuS7WW6V40oq5LXn/fknusRUNJQwtQJ
         jnbx6X8SE0l8vhoh6rLIeENZVHxTQYisT4HhyrZBBDmTNLdDJ92azCu81O1yC7SOyDII
         dJ5dbegg1YuqoZf1wK8MgFIXww0phCglM7VkDlqG93KToisCf0d2HHBjgHUjynQ11AHr
         mqJElumkExeyrNm2R1DPQuUSUS1EqdQuF1kG5HQhDT9AleDZ02xDz/dEdBPEqscpkW5l
         SCgQ==
X-Gm-Message-State: APjAAAXdgeC48GEnO/m7ysb0gr7J4NVw+veseINx5xme9FqEvGwj+8GV
        CX9d0Ud+Qq6q/VjdjFF6S3w=
X-Google-Smtp-Source: APXvYqy3dFeYp+QCEBWHRiCD5prV3RWJpLvF/6ZgMZB7gwQEqt1Or8GXBaXU4PLKw9UXJ76fMjKGkw==
X-Received: by 2002:a17:902:9882:: with SMTP id s2mr2289782plp.31.1575451932421;
        Wed, 04 Dec 2019 01:32:12 -0800 (PST)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id 91sm2380086pjq.18.2019.12.04.01.32.09
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 04 Dec 2019 01:32:12 -0800 (PST)
From:   Baolin Wang <baolin.wang7@gmail.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     baolin.wang7@gmail.com, linux-omap@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] hwspinlock: omap: Change to use devm_platform_ioremap_resource()
Date:   Wed,  4 Dec 2019 17:31:29 +0800
Message-Id: <0f3bb58703fac8b18b4a6b5fc8dc00b21b7c7e07.1575451463.git.baolin.wang7@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1575451463.git.baolin.wang7@gmail.com>
References: <cover.1575451463.git.baolin.wang7@gmail.com>
In-Reply-To: <cover.1575451463.git.baolin.wang7@gmail.com>
References: <cover.1575451463.git.baolin.wang7@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use the new helper that wraps the calls to platform_get_resource()
and devm_ioremap_resource() together, which can simpify the code.
Meanwhile renaming the error label to make more sense after removing
iounmap().

Signed-off-by: Baolin Wang <baolin.wang7@gmail.com>
---
 drivers/hwspinlock/omap_hwspinlock.c |   24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index 14e1a53..dbb1a4c 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -76,7 +76,6 @@ static int omap_hwspinlock_probe(struct platform_device *pdev)
 	struct device_node *node = pdev->dev.of_node;
 	struct hwspinlock_device *bank;
 	struct hwspinlock *hwlock;
-	struct resource *res;
 	void __iomem *io_base;
 	int num_locks, i, ret;
 	/* Only a single hwspinlock block device is supported */
@@ -85,13 +84,9 @@ static int omap_hwspinlock_probe(struct platform_device *pdev)
 	if (!node)
 		return -ENODEV;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
-
-	io_base = ioremap(res->start, resource_size(res));
-	if (!io_base)
-		return -ENOMEM;
+	io_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(io_base))
+		return PTR_ERR(io_base);
 
 	/*
 	 * make sure the module is enabled and clocked before reading
@@ -101,7 +96,7 @@ static int omap_hwspinlock_probe(struct platform_device *pdev)
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0) {
 		pm_runtime_put_noidle(&pdev->dev);
-		goto iounmap_base;
+		goto runtime_err;
 	}
 
 	/* Determine number of locks */
@@ -114,12 +109,12 @@ static int omap_hwspinlock_probe(struct platform_device *pdev)
 	 */
 	ret = pm_runtime_put(&pdev->dev);
 	if (ret < 0)
-		goto iounmap_base;
+		goto runtime_err;
 
 	/* one of the four lsb's must be set, and nothing else */
 	if (hweight_long(i & 0xf) != 1 || i > 8) {
 		ret = -EINVAL;
-		goto iounmap_base;
+		goto runtime_err;
 	}
 
 	num_locks = i * 32; /* actual number of locks in this device */
@@ -127,7 +122,7 @@ static int omap_hwspinlock_probe(struct platform_device *pdev)
 	bank = kzalloc(struct_size(bank, lock, num_locks), GFP_KERNEL);
 	if (!bank) {
 		ret = -ENOMEM;
-		goto iounmap_base;
+		goto runtime_err;
 	}
 
 	platform_set_drvdata(pdev, bank);
@@ -147,16 +142,14 @@ static int omap_hwspinlock_probe(struct platform_device *pdev)
 
 reg_fail:
 	kfree(bank);
-iounmap_base:
+runtime_err:
 	pm_runtime_disable(&pdev->dev);
-	iounmap(io_base);
 	return ret;
 }
 
 static int omap_hwspinlock_remove(struct platform_device *pdev)
 {
 	struct hwspinlock_device *bank = platform_get_drvdata(pdev);
-	void __iomem *io_base = bank->lock[0].priv - LOCK_BASE_OFFSET;
 	int ret;
 
 	ret = hwspin_lock_unregister(bank);
@@ -166,7 +159,6 @@ static int omap_hwspinlock_remove(struct platform_device *pdev)
 	}
 
 	pm_runtime_disable(&pdev->dev);
-	iounmap(io_base);
 	kfree(bank);
 
 	return 0;
-- 
1.7.9.5

