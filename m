Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 503E52B3934
	for <lists+linux-omap@lfdr.de>; Sun, 15 Nov 2020 21:47:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbgKOUpS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 15 Nov 2020 15:45:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727521AbgKOUpS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 15 Nov 2020 15:45:18 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B81CC0613CF;
        Sun, 15 Nov 2020 12:45:17 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id e139so2740799lfd.1;
        Sun, 15 Nov 2020 12:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EvAr5l6x8R1ZKsiDO25B9g1HeqAGy1ECZZd5R5VjR7w=;
        b=LhkUaMlFNTZANwx3QeKF3C2npLoWVGVQfYq1PAznTt4eaYGAWPY11gwdyKnW8d7JHx
         xeTrLmeCxViyNJAbwRTaD0uthsKq1uO+HuwgBBi9B5o4A/wB8BtrMzhy0swXaa9F2Zfp
         DuyPidTQQYZ08umdeQepsrj44Oq0lvVcv2E+0tGHSlN/moiA9INZX9SmZ9UvvFAElg9q
         wph8urmaBKaQTQbq3MJx2/kq0CfUrO/g1QJ+/2ePe2vFZJKo0rMdkHzU1jGEmBw75R6n
         E1AGpNdHGqj+LZVuBMSp6pFuWnKZr5WFfMU3Yhbcwzj9LgNBPdqUx8+fleliiaNPBaQQ
         mTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EvAr5l6x8R1ZKsiDO25B9g1HeqAGy1ECZZd5R5VjR7w=;
        b=gz4lY5WuoKBf2ZfkMcWuTHTxxifcXze9umzU7HPy1M7lY99OZKXVPw68qM03SzefF8
         vBwGHhBZ78SiHlfh+c/M1o6UbMsUHRHKbTzRm+tM3neGwfYk8SN3r1CC9zj1BO7pv15U
         bXCWWsfGsROqCxwyOcLPs3jp6+H6XyMgiPv2CC6Coc6bc0Ka0sMBAmq+7ACrfmw7PCy+
         SGzeHetZ7eczwUMHGax3GteFLeC4rdeiIFlwvQFMF5mead6pYsBCET+UIVXUUEb4XFNh
         Y4jjrmUqNY9J9lsNZbFoZ3Yy9ROop/yFP76d5IJoJvLDVeUFTVEKvwL/ZUqFK+UCl4jx
         aWRA==
X-Gm-Message-State: AOAM532QEtctWHOsFtFmRVBrGCieQMKzdCkmc6eXinSpkg84zE4T4tci
        OIoZwyBpHouI7esOz95ERJs=
X-Google-Smtp-Source: ABdhPJxE2jSTiMae7xDNOxvGdD9IRvLvaUOWEkRK3U58BZsAA16hYZ5BLrYSu2UViLXpmZgqpvJ52Q==
X-Received: by 2002:a19:4352:: with SMTP id m18mr4310119lfj.129.1605473116088;
        Sun, 15 Nov 2020 12:45:16 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru. [109.252.193.159])
        by smtp.gmail.com with ESMTPSA id j2sm2451891lfe.23.2020.11.15.12.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2020 12:45:15 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Zack Pearsall <zpearsall@yahoo.com>
Cc:     linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4] mfd: tps65910: Correct power-off programming sequence
Date:   Sun, 15 Nov 2020 23:45:05 +0300
Message-Id: <20201115204505.18616-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Correct power-off programming sequence in order to fix shutting down
devices which are using TPS65910 PMIC.

In accordance to the TPS65910 datasheet, the PMIC's state-machine
transitions into the OFF state only when DEV_OFF bit of DEVCTRL_REG is
set. The ON / SLEEP states also should be cleared, otherwise PMIC won't
get into a proper state on shutdown. Devices like Nexus 7 tablet and Ouya
game console are shutting down properly now.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Zack Pearsall <zpearsall@yahoo.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v4: - Rebased on a recent linux-next.

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
index ca0b61011def..6e105cca27d4 100644
--- a/drivers/mfd/tps65910.c
+++ b/drivers/mfd/tps65910.c
@@ -436,12 +436,18 @@ static void tps65910_power_off(void)
 
 	tps65910 = dev_get_drvdata(&tps65910_i2c_client->dev);
 
+	/*
+	 * The PWR_OFF bit needs to be set separately, before transitioning
+	 * to the OFF state. It enables the "sequential" power-off mode on
+	 * TPS65911, it's a NO-OP on TPS65910.
+	 */
 	if (regmap_set_bits(tps65910->regmap, TPS65910_DEVCTRL,
 			    DEVCTRL_PWR_OFF_MASK) < 0)
 		return;
 
-	regmap_clear_bits(tps65910->regmap, TPS65910_DEVCTRL,
-			  DEVCTRL_DEV_ON_MASK);
+	regmap_update_bits(tps65910->regmap, TPS65910_DEVCTRL,
+			   DEVCTRL_DEV_OFF_MASK | DEVCTRL_DEV_ON_MASK,
+			   DEVCTRL_DEV_OFF_MASK);
 }
 
 static int tps65910_i2c_probe(struct i2c_client *i2c,
-- 
2.29.2

