Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA2292B4C99
	for <lists+linux-omap@lfdr.de>; Mon, 16 Nov 2020 18:23:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731394AbgKPRXZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Nov 2020 12:23:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731167AbgKPRXY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 16 Nov 2020 12:23:24 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 234A5C0613CF
        for <linux-omap@vger.kernel.org>; Mon, 16 Nov 2020 09:23:24 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id e139so6750557lfd.1
        for <linux-omap@vger.kernel.org>; Mon, 16 Nov 2020 09:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xe0fMMeWtHOe5r/TW86ewhH8HsHgvaAGNFwF6cTdlFA=;
        b=c8RGXFROHQu8boX9DdGFDwF3PhECcZPFQvj5T9RyQm3N5h2KMHDuqHdz+CsbMyyg8/
         gkTctVOMzGHsRSOoOpL/E765Ch4nBh1DpDoodhZZfwgYWAUYq6iRFzovqctwoX9DgqqY
         2mkalWGL6cUDK/oxzUyDn/m64D1FdZSWh51IGZe+sgG9J0KOseiuFcjqE3uLhxgYvSLb
         NZlq30CTtv1Z1v2QGWrfOBUGWYdS1BtVwrD2P/gFSMdR0stw22slrPbpvqVOiR7sEAyL
         iAI6fBbeLwMpijiik3h44fLEGB16k+Q+BaEvuptLBRwMfKSpE4vwQl3xTYQ+pkeDbsLI
         7kuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xe0fMMeWtHOe5r/TW86ewhH8HsHgvaAGNFwF6cTdlFA=;
        b=TrPz9xEOZdO2A3wPfKsJKiNph63b+iGzOY1HuDtwYRnvU1ci4NxlqnJN79Uh7mOBsm
         vInmV88XJ72xqydi+iBKxgqY+1wbrq531LthA/MZzYmkbNdNEtbuG1Sq6Mz2Whxi2q2w
         inBrEOs5Y2H08eDYuJIh0zpZ6caOR9NWvJ0vte5z8stMQa+aYcIVVJPDEIzSdBTQvjvZ
         nGp/xdhfqtSCleceidpweCxtDqC4EpCtoy8Dhfk8y+pu5lzWFRDCalAPHfpoiye6Yge5
         rsk053XbBKLRJVUp7OOYIaoIO6BG7jVh2JRJZYkRBExakrLdo4rDxBof/CmoB7rXV4QB
         IydQ==
X-Gm-Message-State: AOAM530tRUX+KzigU9hjWlyZX5mBmUETSlGRHpD4m7m5zNg5jFMu5534
        UvmsA6VXF8TtYi9Dda1av5OQag==
X-Google-Smtp-Source: ABdhPJxWBigDJOTdzFbPNBFUBYEo5pxgVegR1CuNzj3Tmktf9fM+63oaZ3B6V0GLx6L6wv4WkT+xAw==
X-Received: by 2002:a05:6512:1095:: with SMTP id j21mr138346lfg.309.1605547402624;
        Mon, 16 Nov 2020 09:23:22 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id d28sm256378lfm.201.2020.11.16.09.23.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2020 09:23:21 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ssantosh@kernel.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, santosh.shilimkar@oracle.com,
        lee.jones@linaro.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, tony@atomide.com,
        Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH v2] soc: ti: pruss: Fix wrong check against *get_match_data return value
Date:   Mon, 16 Nov 2020 18:22:33 +0100
Message-Id: <20201116172233.18459-1-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Since the of_device_get_match_data() doesn't return error code, remove
wrong IS_ERR test. Proper check against NULL pointer is already done
later before usage: if (data && data->...).

Additionally, proceeding with empty device data is valid (e.g. in case
of "ti,am3356-pruss").

Fixes: ba59c9b43c86 ("soc: ti: pruss: support CORECLK_MUX and IEPCLK_MUX")
Reported-by: Wei Yongjun <weiyongjun1@huawei.com>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Acked-by: Suman Anna <s-anna@ti.com>
---
v1->v2:
- Add the appropriate Fixes: tag.
- %s/Remove/Fix/ in patch title.
- Add Suman's Acked-by.
---
 drivers/soc/ti/pruss.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
index cc0b4ad7a3d3..5d6e7132a5c4 100644
--- a/drivers/soc/ti/pruss.c
+++ b/drivers/soc/ti/pruss.c
@@ -126,8 +126,6 @@ static int pruss_clk_init(struct pruss *pruss, struct device_node *cfg_node)
 	int ret = 0;
 
 	data = of_device_get_match_data(dev);
-	if (IS_ERR(data))
-		return -ENODEV;
 
 	clks_np = of_get_child_by_name(cfg_node, "clocks");
 	if (!clks_np) {
@@ -175,10 +173,6 @@ static int pruss_probe(struct platform_device *pdev)
 	const char *mem_names[PRUSS_MEM_MAX] = { "dram0", "dram1", "shrdram2" };
 
 	data = of_device_get_match_data(&pdev->dev);
-	if (IS_ERR(data)) {
-		dev_err(dev, "missing private data\n");
-		return -ENODEV;
-	}
 
 	ret = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
 	if (ret) {
-- 
2.29.0

