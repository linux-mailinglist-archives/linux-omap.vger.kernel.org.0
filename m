Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85A39133980
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2020 04:14:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgAHDO3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jan 2020 22:14:29 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42200 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725908AbgAHDO0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Jan 2020 22:14:26 -0500
Received: by mail-pg1-f194.google.com with SMTP id s64so829975pgb.9;
        Tue, 07 Jan 2020 19:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=4bkpUfs7eIWG8ngSeP18jBoFZdQNW5P5Kn+adde7u5o=;
        b=vNrxg+7Rf+tWo8jf9OHR26y1P20aJIfEscmVIi7vtGVBT3WB2C/ycErDqFMLvyVOAP
         wfzM3rmjiGzHQX/1wQ8LMjTV5XFQd4xZsrYcEWjZxu1lbp1CS+oE1yLefmUMQ0wE4T8j
         qw1mta5QY83FBnVqw5gwCUJZmP1/qdWWUe7ehlJf/esyT7wjMDE9e2rnMPops2bgPIKK
         0uSK4qNcLuBj8GluGMylkbTT3GpxmIijYwisMOucPYA76C3GQDf3ixhXUN/z4cZfuJ1m
         OT10JeLEP0dMWMFrQ15kJrysxzFY8np6FvY77KIU1qb6DObjcfICpQnZoH1YMM1Z3Xxa
         nZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=4bkpUfs7eIWG8ngSeP18jBoFZdQNW5P5Kn+adde7u5o=;
        b=EA6pi4WlupWqxQmjaxsrJ/gmDbH72w5EKZ7ZF30evnH/yAdOYUnntBLbbG1XxBiNCT
         Uc8JF4vrssrypes/xz4Gmq8gz+w3xlh+VUecga2K9hOnUayBbSvg6+K6qspt3CozJSQi
         VpAf9F3NdTjGU+VOOltoyGYbUIxLYvXz8dX4qthp3F+Z6QGtK5e+q/d/GugVdpdABwWX
         RGuwEubpuNt8peN2oSXvpsKR45m9bU586lMgytWxB8NXziw2y0p8a+dfVLUoPrwPPKlN
         FB9ONMU4dwboNQ9XCON3A8xH9R0Bj5+k4Q+LLhkE5iBJfZ39jZrAtSjJsBiGEW3W5Tjh
         raRA==
X-Gm-Message-State: APjAAAX2HbIXF6pSVcBpiyC8b5E6SloqDxnggg/c2QoPNtXhrq0PPD0h
        PudXiVpV4lGpeCI7t3zRCGo=
X-Google-Smtp-Source: APXvYqwvuv5efVJHnAEOZ2h9lY7js3XK6QbUOxhKwdrqRGRP51XOqjXb9zJqeSfDHtYEQLbsZoUYDg==
X-Received: by 2002:aa7:8687:: with SMTP id d7mr2786761pfo.164.1578453265726;
        Tue, 07 Jan 2020 19:14:25 -0800 (PST)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id z4sm1016811pfn.42.2020.01.07.19.14.23
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 07 Jan 2020 19:14:25 -0800 (PST)
From:   Baolin Wang <baolin.wang7@gmail.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     baolin.wang7@gmail.com, linux-omap@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 2/3] hwspinlock: omap: Use devm_kzalloc() to allocate memory
Date:   Wed,  8 Jan 2020 11:14:00 +0800
Message-Id: <c066ad704c1a5fd52c3002cac80ddd59b3901b01.1578453062.git.baolin.wang7@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1578453062.git.baolin.wang7@gmail.com>
References: <cover.1578453062.git.baolin.wang7@gmail.com>
In-Reply-To: <cover.1578453062.git.baolin.wang7@gmail.com>
References: <cover.1578453062.git.baolin.wang7@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use devm_kzalloc() to allocate memory, which can simplify the error
handling.

Signed-off-by: Baolin Wang <baolin.wang7@gmail.com>
---
 drivers/hwspinlock/omap_hwspinlock.c |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index dbb1a4c..3b05560 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -119,7 +119,8 @@ static int omap_hwspinlock_probe(struct platform_device *pdev)
 
 	num_locks = i * 32; /* actual number of locks in this device */
 
-	bank = kzalloc(struct_size(bank, lock, num_locks), GFP_KERNEL);
+	bank = devm_kzalloc(&pdev->dev, struct_size(bank, lock, num_locks),
+			    GFP_KERNEL);
 	if (!bank) {
 		ret = -ENOMEM;
 		goto runtime_err;
@@ -133,15 +134,13 @@ static int omap_hwspinlock_probe(struct platform_device *pdev)
 	ret = hwspin_lock_register(bank, &pdev->dev, &omap_hwspinlock_ops,
 						base_id, num_locks);
 	if (ret)
-		goto reg_fail;
+		goto runtime_err;
 
 	dev_dbg(&pdev->dev, "Registered %d locks with HwSpinlock core\n",
 		num_locks);
 
 	return 0;
 
-reg_fail:
-	kfree(bank);
 runtime_err:
 	pm_runtime_disable(&pdev->dev);
 	return ret;
@@ -159,7 +158,6 @@ static int omap_hwspinlock_remove(struct platform_device *pdev)
 	}
 
 	pm_runtime_disable(&pdev->dev);
-	kfree(bank);
 
 	return 0;
 }
-- 
1.7.9.5

