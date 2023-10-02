Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E5DD7B4C2E
	for <lists+linux-omap@lfdr.de>; Mon,  2 Oct 2023 09:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235641AbjJBHEq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 2 Oct 2023 03:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235626AbjJBHEp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 2 Oct 2023 03:04:45 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC96FB7
        for <linux-omap@vger.kernel.org>; Mon,  2 Oct 2023 00:04:41 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-32483535e51so4162476f8f.0
        for <linux-omap@vger.kernel.org>; Mon, 02 Oct 2023 00:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696230280; x=1696835080; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S7ijRdP/7w6YuyMyRRQZzwnMWCZUlvsf+At2pKxS9oA=;
        b=TJLEzUQ51CsBW31A8R8VKBpzY9o/tgTYx+meecwuCsWKldc7bIaXW+lOVXlmaBHh4M
         kNTaSFoGLJiUiCD0vTHNvuNKXckXuORu8ZBZURhgbsaJxOd/i6yG67+2nzakHNQi4PHd
         tWOHPGap505zKlB7jxEhZrPHAZG/qqlMS4HOswi/W0+dIFYDZTvwt6xOs3GVTMLktlfV
         lF5BVX+n2lrxRbaoyU16QxVm9fWvVyjLI6vN/DaMBAS4LPMgdW5QCqkbrys3+sr2B7au
         v5w/ikyV68gMMxVdqqtbFMo+SzBpxQAvDvyTimSahI7FYWzCqtqUbpzrmV9ltcUvnZQG
         T/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696230280; x=1696835080;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S7ijRdP/7w6YuyMyRRQZzwnMWCZUlvsf+At2pKxS9oA=;
        b=cPs+60kTNwyaAGomWxBbCeqBOdelh0lwCZiEuZbJrhv0zrkaW+LaKTQjJSrWzci3GK
         hWWSF5WcTOr2KZKa4Gliq4dqcWA5D/i7G5N/r8IHqpq5QIUmD4DxEQECfDLVK1k2PrxI
         kg+tlPmK0PLiYCTizTcWAA94D3XndqxG0H0Hiu4ov5vHdVecjPTm2Z+D1c6Nk9WVFWgq
         WCFLjKZZ3HH0HOuc6lxFzbqnPHqOHlOeWn840AXb6UTeouYlsS4RRWld/mYnwbziNUhZ
         8XhvLJ2pbq2+HW9S0ZM1lLLFOk0SxGrjJ7N5ZOSFohTf0KLznp13iNpmcpsaDyq+D5nr
         pS9g==
X-Gm-Message-State: AOJu0YwZSWlXfFV8RkQeQ9TPv2P4VKTN4gImKmssY3Fls2fG+zrMIt3f
        FhrfsmrhXwl9JRQAZbuJ4k6zIA==
X-Google-Smtp-Source: AGHT+IFsiV7LuyeR2PhowHbyLrLUsKqyjEGfArvG7roW2WS/P1f6n1ITL262F7Y4H8H+JiPhkc6Cfw==
X-Received: by 2002:a05:6000:110c:b0:313:f0d7:a43 with SMTP id z12-20020a056000110c00b00313f0d70a43mr8788075wrw.23.1696230280362;
        Mon, 02 Oct 2023 00:04:40 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id ay13-20020a5d6f0d000000b003179b3fd837sm20220121wrb.33.2023.10.02.00.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 00:04:40 -0700 (PDT)
Date:   Mon, 2 Oct 2023 10:04:36 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Tero Kristo <kristo@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: ti: fix double free in of_ti_divider_clk_setup()
Message-ID: <6d36eeec-6c8a-4f11-a579-aa3cd7c38749@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The "div" pointer is freed in _register_divider() and again in
of_ti_divider_clk_setup().  Delete the free in _register_divider()

Fixes: fbbc18591585 ("clk: ti: divider: cleanup _register_divider and ti_clk_get_div_table")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/clk/ti/divider.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/clk/ti/divider.c b/drivers/clk/ti/divider.c
index 768a1f3398b4..5d5bb123ba94 100644
--- a/drivers/clk/ti/divider.c
+++ b/drivers/clk/ti/divider.c
@@ -309,7 +309,6 @@ static struct clk *_register_divider(struct device_node *node,
 				     u32 flags,
 				     struct clk_omap_divider *div)
 {
-	struct clk *clk;
 	struct clk_init_data init;
 	const char *parent_name;
 	const char *name;
@@ -326,12 +325,7 @@ static struct clk *_register_divider(struct device_node *node,
 	div->hw.init = &init;
 
 	/* register the clock */
-	clk = of_ti_clk_register(node, &div->hw, name);
-
-	if (IS_ERR(clk))
-		kfree(div);
-
-	return clk;
+	return of_ti_clk_register(node, &div->hw, name);
 }
 
 int ti_clk_parse_divider_data(int *div_table, int num_dividers, int max_div,
-- 
2.39.2

