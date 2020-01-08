Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 813AF13397B
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2020 04:14:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbgAHDOY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jan 2020 22:14:24 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:40466 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725908AbgAHDOY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Jan 2020 22:14:24 -0500
Received: by mail-pj1-f66.google.com with SMTP id bg7so440540pjb.5;
        Tue, 07 Jan 2020 19:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=UDt70vT9CBypJ9FiN1tWwjjJ5WMMLvj4KFgZR5+sM14=;
        b=rXGSfnOdNFjAAO8OGOpbD7qmBASFq4LJQGLaWaS6oDyNgpPZektf8QFw5nUfWNXK9z
         IsiA0zcaGmF71e9p/bksTn4kT5jzNeTyesIDMmg9VJmZtfPdL9KJs9PInIo7x6g0/Ry/
         qNSFJ3lagn9DTA3edjXoN4yyOoTJiYT78p1YTQoaXnNBRQdGH1jB3n/J8IzEspM1mhXQ
         TtGh9cmEsLRsBot+6A7C7XwKd8Ij0DqyBbEt94F33Oc7kwtG9LhWzkHi7jloeuLhmB7o
         Ic6ml9RcgWbPqGepl7cdNvpZqgTyW5aAPuvfBeLcdcZ4fA3KlAXigjkMeJraJ5MqB47k
         8AAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=UDt70vT9CBypJ9FiN1tWwjjJ5WMMLvj4KFgZR5+sM14=;
        b=d9V9Zgnjr0fdpEeMI1C+0D7GRxoNH18WpGd5efbAyuKp46YB85bFG1BxT9uj2iKQT4
         zuTxVrHDCr6jb403rfRWMX/8UVBO3VvbwbzKN7j2vSbjqVdf5jbZsJYOAqSXJPqrReqj
         A1MwmZ01QQt9gny74mld1PCZ9T37dgu6An3buD+SNVHgXrON7Y+Lh1cRqmMo2hj+BLfY
         Nb2ZZ5Ls/7q1XZXDBpNi2fOoFWv9p0Biyc/Fhtxb5cn/EUBa/nrpgCgn5BheRG32bo31
         p+b6JBTsJkvDjV83Zda5PEp2iMfZSJajdUzOSTqrtr7iJNv8AkeWiQ9M8iiF6NRSHxcp
         S9fA==
X-Gm-Message-State: APjAAAXpFzSzy9xdYaCbpcZfWd6klXMMeGouVOR0MiueCD/5uKoYFyxN
        gJtqgH14PYaWc8Gy8CmdS+w=
X-Google-Smtp-Source: APXvYqyz7eGu7Qm8kFTYBlWn4ZJtcTU7XVR3gWZJTxrkiHPhAWl/LG7yjJ6m58wfXDjIDS6QE9+9Kw==
X-Received: by 2002:a17:902:5a85:: with SMTP id r5mr3188552pli.222.1578453263274;
        Tue, 07 Jan 2020 19:14:23 -0800 (PST)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id z4sm1016811pfn.42.2020.01.07.19.14.21
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 07 Jan 2020 19:14:22 -0800 (PST)
From:   Baolin Wang <baolin.wang7@gmail.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     baolin.wang7@gmail.com, linux-omap@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 1/3] hwspinlock: omap: Change to use devm_platform_ioremap_resource()
Date:   Wed,  8 Jan 2020 11:13:59 +0800
Message-Id: <6c09c5034a7e68fdfc22d2cb5daa375bccb33a66.1578453062.git.baolin.wang7@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1578453062.git.baolin.wang7@gmail.com>
References: <cover.1578453062.git.baolin.wang7@gmail.com>
In-Reply-To: <cover.1578453062.git.baolin.wang7@gmail.com>
References: <cover.1578453062.git.baolin.wang7@gmail.com>
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

