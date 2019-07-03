Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0F875E8CC
	for <lists+linux-omap@lfdr.de>; Wed,  3 Jul 2019 18:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbfGCQ1I (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 3 Jul 2019 12:27:08 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44070 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726890AbfGCQ1I (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 3 Jul 2019 12:27:08 -0400
Received: by mail-pg1-f193.google.com with SMTP id i18so1492131pgl.11;
        Wed, 03 Jul 2019 09:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=TEzZFcG2ux6XyZ++qvllUzv8fwdbc/Y07ZwzuS6e5J8=;
        b=gh5m5TBhcC7qBwPsdP2tODNXbKTzgMXdRhN/vdS/gDK5qvHgBqJpxgl3B/0qeJInI2
         r5bqud/fdSvl/CqrOsMumauiFRiwWgVr90YBgBkuMKtczX+2KtmTf0QqNNQffZga5237
         Lxz1Xt+m2Tp8wVg/Ss3ntSnmYZzksVrFtY9fb8CJfuHmwqeMuJEcKYcaaO7ANPdlnDnb
         pYj2rojJNJqHsk73Dn+ogiNk2dt4klUGiAE6COyEN6hjgFSbSTsLykAkVsHTuzUaQ6yt
         QT3+V84GrwGZooZbyu4p2x08C0LXPxcBZq6jwHCGgsYEbLxV5euDAebva3cJN9yy38F1
         KywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=TEzZFcG2ux6XyZ++qvllUzv8fwdbc/Y07ZwzuS6e5J8=;
        b=EeePICMln4v++m0KurnNrpaGrsx/4FWjynzaYvZPyIoYXW6PAypiAE585nJ0Qtk/X4
         Ml2OHGrwIwkAlW/wxpHVKKf77ndBnZA4B+aPO57r640B9fBH2bF6QdPcH45zqwv2gH2g
         kYWjEamPwpQzPj6S7h6oiQgnvHsJ/PEcifnyJc4ckRth/jv6dwTBRZkOvhhrhB3P6Lu8
         xC/iakKyobDLFDF3oIGeyI+BE0c0Sqi3rmyBT6HPkABCi/Hp1CsF1zhfyc8YgLPoczQ3
         cMTgYgwuzXOtQQ+mcAVPLPovssz2wjVdx1qp526Xr5jwLQl7FSxgbi2P7bZjY6ymxJw5
         JkEw==
X-Gm-Message-State: APjAAAUp4vKXHN2W5OF8cu4iGFSEsJMLPyUXAeZiLlgYnAcyyR4OjbXy
        mn5mSsd8Jkzl7X/aKlVSJ44=
X-Google-Smtp-Source: APXvYqz00MKUXknmNwmBzla2cR8L6An8m4ro4xbf2reOWqqaqMB0hCczYqnPD/GwHjWM0vxWtsrWbA==
X-Received: by 2002:a63:24c1:: with SMTP id k184mr7356709pgk.120.1562171227347;
        Wed, 03 Jul 2019 09:27:07 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.googlemail.com with ESMTPSA id u65sm10496017pjb.1.2019.07.03.09.27.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 09:27:07 -0700 (PDT)
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Tero Kristo <t-kristo@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fuqian Huang <huangfq.daxian@gmail.com>
Subject: [PATCH v2 05/35] clk/ti: Use kmemdup rather than duplicating its implementation
Date:   Thu,  4 Jul 2019 00:27:00 +0800
Message-Id: <20190703162700.32091-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

kmemdup is introduced to duplicate a region of memory in a neat way.
Rather than kmalloc/kzalloc + memcpy, which the programmer needs to
write the size twice (sometimes lead to mistakes), kmemdup improves
readability, leads to smaller code and also reduce the chances of mistakes.
Suggestion to use kmemdup rather than using kmalloc/kzalloc + memcpy.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
Changes in v2:
  - Fix a typo in commit message (memset -> memcpy)

 drivers/clk/ti/dpll.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/ti/dpll.c b/drivers/clk/ti/dpll.c
index 659dadb23279..f728d987ebac 100644
--- a/drivers/clk/ti/dpll.c
+++ b/drivers/clk/ti/dpll.c
@@ -291,14 +291,12 @@ static void __init of_ti_dpll_setup(struct device_node *node,
 	struct dpll_data *dd = NULL;
 	u8 dpll_mode = 0;
 
-	dd = kzalloc(sizeof(*dd), GFP_KERNEL);
+	dd = kmemdup(ddt, sizeof(*dd), GFP_KERNEL);
 	clk_hw = kzalloc(sizeof(*clk_hw), GFP_KERNEL);
 	init = kzalloc(sizeof(*init), GFP_KERNEL);
 	if (!dd || !clk_hw || !init)
 		goto cleanup;
 
-	memcpy(dd, ddt, sizeof(*dd));
-
 	clk_hw->dpll_data = dd;
 	clk_hw->ops = &clkhwops_omap3_dpll;
 	clk_hw->hw.init = init;
-- 
2.11.0

