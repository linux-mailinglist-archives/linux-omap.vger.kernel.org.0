Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB6B627182
	for <lists+linux-omap@lfdr.de>; Sun, 13 Nov 2022 19:11:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235085AbiKMSL5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 13 Nov 2022 13:11:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235214AbiKMSLz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 13 Nov 2022 13:11:55 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAB8D21A7
        for <linux-omap@vger.kernel.org>; Sun, 13 Nov 2022 10:11:54 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id u24so14240412edd.13
        for <linux-omap@vger.kernel.org>; Sun, 13 Nov 2022 10:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVJeOgU1MIdsaRRuNRXfWkoor1WXWdAlm1t56aPqLUQ=;
        b=ZeE7sehyqyO8yEGseHk2i8Alz+UA6NHE4c0cFh7YkV/8NlpSx2RpWD4vMfON3omgrB
         lMRk0aYkM8yi9B5gWpTacPadQ85MRiQorRk9YokTWE7FPEcTJoP9fO6AdmGdhw0YrOxG
         0OLBu3M43F13pPkadkbKJ/bHckw/gai77fgps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uVJeOgU1MIdsaRRuNRXfWkoor1WXWdAlm1t56aPqLUQ=;
        b=LkQkpYAOsJRV3wW1HaEKcqzuECu1dYJ6gAT9KFet/livSx61Cn8XLdfUCNA1QvzVBa
         XJOqmRARFXztUfanj23IbhBmnTXYoEjgBuTyP68fyTDbdM42m/qrW8hA6rjbDWr+Jk1m
         nIvjHRDhvr0+qB+azlK8G6P/6ljMIqWiBj7qisKZ4W8gybsq9CbVL7QcwMEHgabGDpxh
         7ttC0B/lVaYJikSJPzDv+Iy5+7doCkygO1U3JpFSvWpx1bFArV3onGcyhRiHgKNrTB7R
         hObtVXBxTD/mVgnUgfUxJNRCLZY0zwAxfBFILlATTc6aL03bWx0a4L6TJZNbblkKTaQF
         1etg==
X-Gm-Message-State: ANoB5pm6ETG9f8Os1bTQFA9vOF35FY64smM3OMegdVOQDWJ7Fuew9XEp
        ospK1YBe7KtZL3eoOdTlz6CXdw==
X-Google-Smtp-Source: AA0mqf5ezW1G+OZ8sWz55+aS7bofz0kd9bhX7jV4sX3OArkjBj2ZqzWGEEuR0nCjDcBecItFzHS4WA==
X-Received: by 2002:a05:6402:291e:b0:45c:98a9:7bbf with SMTP id ee30-20020a056402291e00b0045c98a97bbfmr8617406edb.372.1668363113421;
        Sun, 13 Nov 2022 10:11:53 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-40-103-33.business.telecomitalia.it. [79.40.103.33])
        by smtp.gmail.com with ESMTPSA id i20-20020a50fd14000000b004618a89d273sm3753534eds.36.2022.11.13.10.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 10:11:53 -0800 (PST)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Amarula patchwork <linux-amarula@amarulasolutions.com>,
        michael@amarulasolutions.com,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        kernel test robot <lkp@intel.com>,
        Allison Randal <allison@lohutok.net>,
        Miaoqian Lin <linmq006@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v4 2/2] clk: ti: dra7-atl: don't allocate `parent_names' variable
Date:   Sun, 13 Nov 2022 19:11:47 +0100
Message-Id: <20221113181147.1626585-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20221113181147.1626585-1-dario.binacchi@amarulasolutions.com>
References: <20221113181147.1626585-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The `parent_names' variable was freed also in case of kzalloc() error.
Instead of modifying the code to perform a proper memory release, I
decided to fix the bug by not allocating memory.
Since only one parent name is referenced, it is not necessary to
allocate this variable at runtime and therefore you can avoid calling
the kzalloc() function. This simplifies the code (even calls to kfree
can be removed) and improves the performance of the routine.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reported-by: kernel test robot <lkp@intel.com>

---

(no changes since v3)

Changes in v3:
- Add the "clk: ti: add of_ti_clk_register() helper" patch to the series.
- Use a variable of type struct clk_parent_data to furthermore simplify
  the code.
- Update the commit message.

Changes in v2:
- Fix compiling error
- Add kernel test robot's Reported-by tag.

 drivers/clk/ti/clk-dra7-atl.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/ti/clk-dra7-atl.c b/drivers/clk/ti/clk-dra7-atl.c
index 1c576599f6db..d964e3affd42 100644
--- a/drivers/clk/ti/clk-dra7-atl.c
+++ b/drivers/clk/ti/clk-dra7-atl.c
@@ -163,8 +163,8 @@ static const struct clk_ops atl_clk_ops = {
 static void __init of_dra7_atl_clock_setup(struct device_node *node)
 {
 	struct dra7_atl_desc *clk_hw = NULL;
+	struct clk_parent_data pdata = { .index = 0 };
 	struct clk_init_data init = { NULL };
-	const char **parent_names = NULL;
 	const char *name;
 	struct clk *clk;
 
@@ -188,24 +188,14 @@ static void __init of_dra7_atl_clock_setup(struct device_node *node)
 		goto cleanup;
 	}
 
-	parent_names = kzalloc(sizeof(char *), GFP_KERNEL);
-
-	if (!parent_names)
-		goto cleanup;
-
-	parent_names[0] = of_clk_get_parent_name(node, 0);
-
-	init.parent_names = parent_names;
-
+	init.parent_data = &pdata;
 	clk = of_ti_clk_register(node, &clk_hw->hw, name);
 
 	if (!IS_ERR(clk)) {
 		of_clk_add_provider(node, of_clk_src_simple_get, clk);
-		kfree(parent_names);
 		return;
 	}
 cleanup:
-	kfree(parent_names);
 	kfree(clk_hw);
 }
 CLK_OF_DECLARE(dra7_atl_clock, "ti,dra7-atl-clock", of_dra7_atl_clock_setup);
-- 
2.32.0

