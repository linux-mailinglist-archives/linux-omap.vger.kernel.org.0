Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 002E7112780
	for <lists+linux-omap@lfdr.de>; Wed,  4 Dec 2019 10:32:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbfLDJcS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Dec 2019 04:32:18 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:35186 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727454AbfLDJcS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 4 Dec 2019 04:32:18 -0500
Received: by mail-pj1-f68.google.com with SMTP id w23so1678928pjd.2;
        Wed, 04 Dec 2019 01:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=MEMVCvrI0WADDr1Rd4hdPFBKPBKqjIAdQ9vka/nhGK8=;
        b=i5K8zGAUTIUpBxiaHwEGM4D2YvA7SW9lgKdvu84Kv7sk9nI3myu3aIGn9ByrlMTlGq
         FHNTHz9+fW0MMiDYmfQ0pO5F2ByyZ/ILSGS4Te8JT4wi+HtMqTJaChN9dxO2yUZ+ZF3+
         BFfEbVJRZaxq2gu17xlBlzbGYcJaAB69MnE6h1a9+jVrozrNN1LHCES+jB607D9sH2bZ
         FxLAEVnunzUWzZrwaJAe8lzVT0dr2EUo8NHbdRLXjmryXoFR3fPPl93iG94yGs9MC5/f
         mHHMs9sIO13RmpPCmWSACa1Wn9K1cTg0+W29WKz7PwPNNCV06oBUiuCZNQUkHfBNbwlN
         KwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=MEMVCvrI0WADDr1Rd4hdPFBKPBKqjIAdQ9vka/nhGK8=;
        b=tXZ5ULq10iYH6VL4I+fAefzfaseml0nRvZbaPSwiJlUnELoPUU/krGlRdhld63Tlza
         5+6AnPGZnabdEqMHdBs0ZVWAhU0ZaMZwq+co2uYjQHDr3bSWzOmIsUhWQUBy/hqaoEor
         NM6EomdZdDiHVJO1L+Ton1D6n3yHHZiy7TCdztz01c6NCWIcV2qCoI1POIGXuKuM0z4R
         7M3dY/7vxlTIIn5oIyiRNUKtjB6nu2N35PxHxR9awJOjH0pJrvD123cf/2qWi3AvdBM7
         zavzgmNAajEP8WJ6BqBVDX35959haWzptaT5Xw7zK0DKzPAg231irZ6Ux72CHoO5++Gx
         ROjA==
X-Gm-Message-State: APjAAAVid3CHu29vcwhQI/IfZkF1tlN++mzWblYV3URZ700qSp1hcWR5
        s3GrdtDhvPEsOx+TSAYfkwU=
X-Google-Smtp-Source: APXvYqwplGcbAvZMr4HiumdgY+xYjz5z42ip0t5oJwiw7gz+o0Z5pkzcOfWT+VscRPzzsiws9aDzuw==
X-Received: by 2002:a17:90a:94cc:: with SMTP id j12mr2206532pjw.3.1575451937556;
        Wed, 04 Dec 2019 01:32:17 -0800 (PST)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id 91sm2380086pjq.18.2019.12.04.01.32.15
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 04 Dec 2019 01:32:17 -0800 (PST)
From:   Baolin Wang <baolin.wang7@gmail.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     baolin.wang7@gmail.com, linux-omap@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] hwspinlock: omap: Use devm_hwspin_lock_register() to register hwlock controller
Date:   Wed,  4 Dec 2019 17:31:31 +0800
Message-Id: <84ccc6ffd5269a725359ff42e131c5aedf087546.1575451463.git.baolin.wang7@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1575451463.git.baolin.wang7@gmail.com>
References: <cover.1575451463.git.baolin.wang7@gmail.com>
In-Reply-To: <cover.1575451463.git.baolin.wang7@gmail.com>
References: <cover.1575451463.git.baolin.wang7@gmail.com>
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

