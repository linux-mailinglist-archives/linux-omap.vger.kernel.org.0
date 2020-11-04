Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0F552A656E
	for <lists+linux-omap@lfdr.de>; Wed,  4 Nov 2020 14:44:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730156AbgKDNoX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Nov 2020 08:44:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbgKDNoW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 4 Nov 2020 08:44:22 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69F31C0613D3;
        Wed,  4 Nov 2020 05:44:22 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id d24so22967660ljg.10;
        Wed, 04 Nov 2020 05:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lG8m8t2C1nVbYj88S+huwSckf3svcG0HOa4scIOwtCo=;
        b=iUYHWfpU1L0CGH8EmSM+0BT/5Si5FL+ncB+hcQFEex4UbnogWuVlMYS/1PW9SjtDbQ
         1f0WpK7FHbBDKD6vQXiK49W75jrYqjBTub520BSBEtUQMj/hdDD+MmLhnumdFjM5Sgtw
         u7qo8Thulo9G5EMPCPJxsyW9ZZRzhTAzm+LEm0prgS/7gM1mastOGvrF2V276Oj+AfVP
         GE5ETCVlhMgC4CUSKXq2Gmt5lBNf2cFFna9WK1hadwofOU+ohVfTZEL5PcmtOeYyLCn8
         HMmk/4/0PnyTF0D6hZCWPAHz/W3PwnWsbhILkAd6uEhBb6CNvRImhvLPjH7D9hbWI7yU
         A4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lG8m8t2C1nVbYj88S+huwSckf3svcG0HOa4scIOwtCo=;
        b=gmFLET84ypxH5Pv20Rs4s823DLpbtShNfjgoefr5dSZvpw84XkN0yW45VforS7t4Ul
         uff4/xWkeD0hvcQJTqvyoMxUf+RHQr9xpuF48uV/5g9nmj1WVMOm2vtfHIlpmH3IHOPO
         Dq8Y8lIg5fohqM7p2OAy5x9mzxRP7S7SBtvYW5jgjTeEIFhEjtI6V+oXPiIxSRH9/VAe
         pRMEmTenO8VnyVvtz8QPXAE62B5q++KZ03e3lincuG+soA8YcpMp8Zr9yc6ZvPyYDrQ9
         ymTOa8Q6EJT5KY6W4gXrylfn4fPManYKqnieqZuoG2Cm6bhq03IqmZocFUCWznOhTNtB
         IPJg==
X-Gm-Message-State: AOAM530WHhvvVO6JufXoCeiIB/pmvovjKAW6ahM+wri3LVAld7HvOvwC
        OK/YP+uOWZyYnqPl+p4+FHY=
X-Google-Smtp-Source: ABdhPJxsgKjH0LL5sRzuD8Zd282iKCvLxxZR96OZRsJmrhz9DirmeE8AJF0UHrwhf5fMPwMQxAkdUA==
X-Received: by 2002:a2e:87d2:: with SMTP id v18mr10046561ljj.371.1604497460963;
        Wed, 04 Nov 2020 05:44:20 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru. [109.252.192.83])
        by smtp.gmail.com with ESMTPSA id c24sm521947ljj.33.2020.11.04.05.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 05:44:20 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Zack Pearsall <zpearsall@yahoo.com>
Cc:     linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3] mfd: tps65910: Correct power-off programming sequence
Date:   Wed,  4 Nov 2020 16:44:08 +0300
Message-Id: <20201104134408.19911-1-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This patch fixes system shutdown on a devices that use TPS65910 as a
system's power controller. In accordance to the TPS65910 datasheet, the
PMIC's state-machine transitions into the OFF state only when DEV_OFF
bit of DEVCTRL_REG is set. The ON / SLEEP states also should be cleared,
otherwise PMIC won't get into a proper state on shutdown. Devices like
Nexus 7 tablet and Ouya game console are now shutting down properly.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Zack Pearsall <zpearsall@yahoo.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v3: - Removed the DEV_SLP_MASK clearing and adding clarifying comment to
      the code about why clearing PWR_OFF bit needs to be done, which was
      suggested by  Michał Mirosław in a review comment to v2.

    - Added tested-by from Peter Geis who tested v3 on his Ouya game
      console.

v2: - Now using a single tps65910_reg_update_bits() instead of set+clear.
      Thanks to Michał Mirosław for the suggestion.

 drivers/mfd/tps65910.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
index 11959021b50a..388214241558 100644
--- a/drivers/mfd/tps65910.c
+++ b/drivers/mfd/tps65910.c
@@ -436,12 +436,18 @@ static void tps65910_power_off(void)
 
 	tps65910 = dev_get_drvdata(&tps65910_i2c_client->dev);
 
+	/*
+	 * Note that the PWR_OFF bit needs to be set separately, before
+	 * transitioning to the OFF state. It enables the "sequential"
+	 * power-off mode on TPS65911, it's a NO-OP on TPS65910.
+	 */
 	if (tps65910_reg_set_bits(tps65910, TPS65910_DEVCTRL,
 			DEVCTRL_PWR_OFF_MASK) < 0)
 		return;
 
-	tps65910_reg_clear_bits(tps65910, TPS65910_DEVCTRL,
-			DEVCTRL_DEV_ON_MASK);
+	tps65910_reg_update_bits(tps65910, TPS65910_DEVCTRL,
+				 DEVCTRL_DEV_OFF_MASK | DEVCTRL_DEV_ON_MASK,
+				 DEVCTRL_DEV_OFF_MASK);
 }
 
 static int tps65910_i2c_probe(struct i2c_client *i2c,
-- 
2.27.0

