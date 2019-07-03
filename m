Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 434C65E4FF
	for <lists+linux-omap@lfdr.de>; Wed,  3 Jul 2019 15:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbfGCNN5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 3 Jul 2019 09:13:57 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:32844 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbfGCNN5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 3 Jul 2019 09:13:57 -0400
Received: by mail-pl1-f193.google.com with SMTP id c14so1254987plo.0;
        Wed, 03 Jul 2019 06:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ItrCKk9rVMhc8Ni9vjTa7N99Q4LdwZTLTD5gVmBlIPs=;
        b=Ez1oNv+wDub0prSXGNncUTQgBGmJFbEEoCAzvXWpRMAcWGBkagg7iRMgg1J8QGnOKK
         AHdet5Y3osv4tB4+n+PupYUKDBBwyVoJCypi5dJqGu8FMnlR7A3wrNtOf8x5wkT1pEks
         wzn6xGSw8FLUGX+0l9G3chBl9VAWUmMvQ4q/79JjlqwdU4fZzoS4Lo1FWJ4ig6XkMO+M
         nTO4T9uvW3+CFC3edMr4HdOUAnZgOZKew59KgvsuzvBsLp6oL4TouKpaa1aQK5YdqIJC
         v2IN0TvyZ+x0N7x24p3LbceBfSO4dj4gaQ4H6/btm4GseHmuObGNGbqk5t29xqx8L3cY
         zUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ItrCKk9rVMhc8Ni9vjTa7N99Q4LdwZTLTD5gVmBlIPs=;
        b=BZrj3kRGsPgz0ahzEu51hllJ+vDM3ldIbTlfcbv+khl0X5elIRf/zo86KWSsXwbq7m
         D4IFZT5Sd+y5YKLUCA4JZ0qnpYl9icUOafiXcMI/iQQIgccwcqhBPipWhRLWzwUcPIB0
         LFDtG1BKTdCb+pp0U5+9TrWssiwPXxg4Z3akJQAHpjc3MNQgo+3EGntyQeaFaM0F/2fn
         MHKAqhSUpsA8irkmdnILnJoNMVP1mReDa8rK0ITSvhpmUXjbKCGsTMbypETOiJtstNwI
         qS4eXwJ3qZVsHJJWkVOtUv9FmYOm05I3XJuX05yJhE+aUz7Q97R9/rj/RY4iLiuheWPr
         tcNA==
X-Gm-Message-State: APjAAAWCp4sO2ql2U4aGfOuVVngYUGWLb/7KVF/ZOxaQq02R3tpZ2lfs
        tWmfJFlUtBp3DArM8Yru6Uk=
X-Google-Smtp-Source: APXvYqwyQl6CFvsivbsqTq54NMvAuOhMKhm7N+xXTr2nAqP+P484bNjxXWzJt5MIVfaRjLXADdh3Ow==
X-Received: by 2002:a17:902:d887:: with SMTP id b7mr42220562plz.28.1562159636378;
        Wed, 03 Jul 2019 06:13:56 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.googlemail.com with ESMTPSA id 30sm4183150pjk.17.2019.07.03.06.13.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 06:13:55 -0700 (PDT)
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Tero Kristo <t-kristo@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fuqian Huang <huangfq.daxian@gmail.com>
Subject: [PATCH 04/30] clk/ti: Use kmemdup rather than duplicating its implementation
Date:   Wed,  3 Jul 2019 21:13:46 +0800
Message-Id: <20190703131346.24854-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

kmemdup is introduced to duplicate a region of memory in a neat way.
Rather than kmalloc/kzalloc + memset, which the programmer needs to
write the size twice (sometimes lead to mistakes), kmemdup improves
readability, leads to smaller code and also reduce the chances of mistakes.
Suggestion to use kmemdup rather than using kmalloc/kzalloc + memset.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
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

