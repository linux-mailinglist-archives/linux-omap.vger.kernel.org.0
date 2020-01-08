Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04F58133981
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2020 04:14:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbgAHDOa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jan 2020 22:14:30 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38261 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726757AbgAHDO2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Jan 2020 22:14:28 -0500
Received: by mail-pl1-f196.google.com with SMTP id f20so517917plj.5;
        Tue, 07 Jan 2020 19:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=MEMVCvrI0WADDr1Rd4hdPFBKPBKqjIAdQ9vka/nhGK8=;
        b=cjA+8s6BieRSdKkZZL6r9MDFx2P3Rkf0tVFLPBVtAuVqIuiznU66SXDNOEYoLYV2GV
         PavIpJ9NZm5cubQ08N4vO7fJ4qmEVVX/hVlcWWpyp2sfnDABnAZvaehqEQf6GIYbacVT
         dkWxwGLTQMF7mWKRk26Oc6YWr42K0ajSp9fdCIobtPRmoUIk8EUuDygVgPEI6isxLY3+
         gWhy8Bbd8uLAvGPNAh+bKsNZ+Tc2FZLpeTYPVxqD4MeueP5SmgZ84c6HUGZOCoPJxlTv
         3KNUCCsXFlOrNMY91CnEev9qTghLF5v75bLrVUJsTQeGJqOVAvoC9G9+C9SvH/h6PBKP
         yWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=MEMVCvrI0WADDr1Rd4hdPFBKPBKqjIAdQ9vka/nhGK8=;
        b=CDxTkOUouFGvoB+3sf8bKbpmJ/xhqe9YuxkrIrvHhML+71FuWStkfFFNejj4R3yLKW
         j0AOfoOFGPyZx/susWS8e5Cm7OcXtmCDPcnzaQ39d/xwKu/exuKBEcSmrYvPR0WEVEE0
         M+FQsP9saNoOCe/RMTcdPABzAQvmbexzmwfsHt1aKn+QGBdcsNfgZW+3lePMq3C3XSPe
         Zo3YPCwb8k33N4BGQZ0S1MXiw89A7PFGDse3O387mt4yUL2sv6LhXkEVhJsb31unxk6H
         Zq/XrzlBbhYMLVC7zBzfzMQtXHqi36u5SM1iDDLM0YHrE6HDppsTmIJqhq5hqyBh5X26
         PaaQ==
X-Gm-Message-State: APjAAAW62jBW6vGcYsdhwXCrft01HXily2ebFGMAoxZ0gm46NKHmZfn8
        oWwy5S9l25P8adX4gri/ICQ=
X-Google-Smtp-Source: APXvYqyLt8wcr8zHu/gJz+x9jIYAWiQGf4diuYdoxJFt5UvVAKXJNb077Nb+ebThPHThkllp1h9Emg==
X-Received: by 2002:a17:90b:145:: with SMTP id em5mr1990768pjb.20.1578453268158;
        Tue, 07 Jan 2020 19:14:28 -0800 (PST)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id z4sm1016811pfn.42.2020.01.07.19.14.25
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 07 Jan 2020 19:14:27 -0800 (PST)
From:   Baolin Wang <baolin.wang7@gmail.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     baolin.wang7@gmail.com, linux-omap@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 3/3] hwspinlock: omap: Use devm_hwspin_lock_register() to register hwlock controller
Date:   Wed,  8 Jan 2020 11:14:01 +0800
Message-Id: <315adcc5dfc6aa5c001448401dda4065e33deef2.1578453062.git.baolin.wang7@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1578453062.git.baolin.wang7@gmail.com>
References: <cover.1578453062.git.baolin.wang7@gmail.com>
In-Reply-To: <cover.1578453062.git.baolin.wang7@gmail.com>
References: <cover.1578453062.git.baolin.wang7@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use devm_hwspin_lock_register() to register the hwlock controller instead of
unregistering the hwlock controller explicitly when removing the device.

Signed-off-by: Baolin Wang <baolin.wang7@gmail.com>
---
 drivers/hwspinlock/omap_hwspinlock.c |   13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index 3b05560..9e8a8c2 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -131,8 +131,8 @@ static int omap_hwspinlock_probe(struct platform_device *pdev)
 	for (i = 0, hwlock = &bank->lock[0]; i < num_locks; i++, hwlock++)
 		hwlock->priv = io_base + LOCK_BASE_OFFSET + sizeof(u32) * i;
 
-	ret = hwspin_lock_register(bank, &pdev->dev, &omap_hwspinlock_ops,
-						base_id, num_locks);
+	ret = devm_hwspin_lock_register(&pdev->dev, bank, &omap_hwspinlock_ops,
+					base_id, num_locks);
 	if (ret)
 		goto runtime_err;
 
@@ -148,15 +148,6 @@ static int omap_hwspinlock_probe(struct platform_device *pdev)
 
 static int omap_hwspinlock_remove(struct platform_device *pdev)
 {
-	struct hwspinlock_device *bank = platform_get_drvdata(pdev);
-	int ret;
-
-	ret = hwspin_lock_unregister(bank);
-	if (ret) {
-		dev_err(&pdev->dev, "%s failed: %d\n", __func__, ret);
-		return ret;
-	}
-
 	pm_runtime_disable(&pdev->dev);
 
 	return 0;
-- 
1.7.9.5

