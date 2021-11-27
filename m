Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 906A546008B
	for <lists+linux-omap@lfdr.de>; Sat, 27 Nov 2021 18:32:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355655AbhK0Rfy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 27 Nov 2021 12:35:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244168AbhK0Rdx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 27 Nov 2021 12:33:53 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13691C061748;
        Sat, 27 Nov 2021 09:30:39 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id o13so26024653wrs.12;
        Sat, 27 Nov 2021 09:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7vBV1V0UwOB0nNvkc/KUfYZpNF52U4NJO9cyMKDODpE=;
        b=QWHUbuAlIOQEn0y7gFC+0eFrDk9tSBGXiWs1HsXZeTBkQbsAk8wJqT9oIGBZg39I6j
         8DhAxsjXzVq02exXN0Nx8ndumfZgOmvabejvQVVoQBjl5LrVpaof/t2G57HxrOmIh8do
         WI0BX8dMxAItBgYKjfhy08xJY+BZwte4Mof6HAPo8yG2dOyHLE7ErLK3B5F4d2Mb7o87
         sr6ubPeEg9gYxqCCUXMgkdZUZqOev24pvvDs5AymH8eBu+hilGjz7qoePoBl0xf5tY5k
         FSFYsDJNHX3wfVLKnLrRrdHyVd+h9JnDXFR6iGgRzgB/YaU+fDXLPTQLQ8nK/yeUqKDv
         nlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7vBV1V0UwOB0nNvkc/KUfYZpNF52U4NJO9cyMKDODpE=;
        b=YAcOb+Rd+De4FysdFzvRkgZ+jVutxrBrvEoL/gxJhXnL+abjHj7CQSJXTDtOZKX6kL
         NMjhOsD+qNkJRvNg/9BW576xfA/riaIkLvSF5drx8zZDbEdj7hh+hZjDEDCRSNIVc/Bl
         YUlfEpIBB7c0d8FdAgA7kWIw7RUw79ICsIOGkv45TEzRwAz1SW2NSyyPTl0nhElLXa+q
         lpNwyQhAIRGyB4HOoKjNu4G2dgwN66e+C1YogasEFC5R/bI4zhwbTCCPRNrDvYAcKL/e
         6vBhEZRm1zCLauTMRmDYhEoqpNXesK613FAH3FMDHf1g/uwxVgYWeFBRObcWO5CS9d7P
         dRTA==
X-Gm-Message-State: AOAM533VhImYgEIUkv046YjuOSciQO8pBMOPoYz8FO8lUE9lc1Vf4yeC
        6dNg6p/eOlVc9Mjs/v/dOvJe
X-Google-Smtp-Source: ABdhPJyEdDnihheAH3e28L5SSP3KEtu9/TYjKyUoIqLxgE8YvQNuhRYBpHmJyF90lswN6LAqLhRqeQ==
X-Received: by 2002:a05:6000:1787:: with SMTP id e7mr21937821wrg.433.1638034237666;
        Sat, 27 Nov 2021 09:30:37 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id y6sm14227526wma.37.2021.11.27.09.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 09:30:37 -0800 (PST)
From:   Colin Ian King <colin.i.king@googlemail.com>
X-Google-Original-From: Colin Ian King <colin.i.king@gmail.com>
To:     Tero Kristo <kristo@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk/ti/adpll: Make const pointer error a static const array
Date:   Sat, 27 Nov 2021 17:30:36 +0000
Message-Id: <20211127173036.150535-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Make const pointer error a static const array, removes a dereference
and shrinks object code a little.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/clk/ti/adpll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/adpll.c b/drivers/clk/ti/adpll.c
index b341cd990be7..962502ca7ff0 100644
--- a/drivers/clk/ti/adpll.c
+++ b/drivers/clk/ti/adpll.c
@@ -807,7 +807,7 @@ static int ti_adpll_init_registers(struct ti_adpll_data *d)
 
 static int ti_adpll_init_inputs(struct ti_adpll_data *d)
 {
-	const char *error = "need at least %i inputs";
+	static const char error[] = "need at least %i inputs";
 	struct clk *clock;
 	int nr_inputs;
 
-- 
2.33.1

