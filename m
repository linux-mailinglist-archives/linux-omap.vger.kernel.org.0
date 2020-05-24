Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB091E0280
	for <lists+linux-omap@lfdr.de>; Sun, 24 May 2020 21:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388452AbgEXT1u (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 24 May 2020 15:27:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387862AbgEXT1u (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 24 May 2020 15:27:50 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A320AC061A0E;
        Sun, 24 May 2020 12:27:49 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id a4so9349842lfh.12;
        Sun, 24 May 2020 12:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rKQHqAYuyPGCkAJDsVVw4O2WcuzpsiIQPL4viSQa7G0=;
        b=tAcJd41AAo8LrMlZLQNlAz7LYU4eMuMN3ndTg4otcrNEp1Hv+lk+cx2V2IjRq6kULk
         upwt3u9MKW0j0vmt1VQlQZYMRY04RH5yRro4gRui9YDO3BjHM9rf27POQfcCsyarP8V1
         yfyRznBNg8g6ctXtaOzFDseKwwoog+EVNFSIzyI/w/EY//RDDzMWnXYDrJy++yT+9OQZ
         ScMjRN166SrMp9hWQHeccljhhVEQ174/zy5KyvFDiRxiY/xWUSjjd5Tp42vP37NQulKM
         VEqYz3eUtYfS15ZiSafaikgKBbONNsoxkqcFayZmoP73dqf8+GtFJERNqdwMYZ1GlazF
         KAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rKQHqAYuyPGCkAJDsVVw4O2WcuzpsiIQPL4viSQa7G0=;
        b=CJTYchLBKbMKMmvfaq9oRDIZEm4UX9nqi/Zm5HfBAFy9gAxWTGfIh7Jjo59+JYyifD
         JcaF3mqw5Yst3d0YjUHmGf8XnfgIBLURikTRc1RGM1KYzFLDt6OfiqeWY5z5maMzyZJU
         0VmmYrefKkT3UNcjtbjnfUqbNgJKqXMjFNjLkUGP1sblFBL/NueoE1BOCjUoQcr7PFNA
         teuNJ2D0BRVR590ynwtm7d5zHduRo4QhXSb5b1E+TATr++BTcoWLX8p4+EGrMJVNnNe+
         zkRJfEzB7CHu5pGZV7NLzIaBzAuYJoNxltDyOe8lWpOIyenme4uwX5gOLQnUaC+8Bx45
         0YXg==
X-Gm-Message-State: AOAM530q5YtC0tCS+01H9MsXNqVOb+aaZFqLJ65MB522L6Nc7IJO9i9p
        JRrlqNFup/e2Ew0eG5dAfq4=
X-Google-Smtp-Source: ABdhPJy8024FpbHaKx/cRVMDCHBg1vTzwrl0TzfsFiiXVv1Y2Jz3TJTlE03IcaqYQbBS4oSuI3QZJw==
X-Received: by 2002:ac2:5324:: with SMTP id f4mr12993687lfh.209.1590348468196;
        Sun, 24 May 2020 12:27:48 -0700 (PDT)
Received: from localhost.localdomain (ppp91-76-17-204.pppoe.mtu-net.ru. [91.76.17.204])
        by smtp.gmail.com with ESMTPSA id x8sm3879864ljh.97.2020.05.24.12.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 12:27:47 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Zack Pearsall <zpearsall@yahoo.com>
Cc:     linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] mfd: tps65910: Correct power-off programming sequence
Date:   Sun, 24 May 2020 22:26:43 +0300
Message-Id: <20200524192643.18207-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This patch fixes system shutdown on a devices that use TPS65910 as a
system's power controller. In accordance to the TPS65910 datasheet, the
PMIC's state-machine transitions into the OFF state only when DEV_OFF
bit of DEVCTRL_REG is set. The ON / SLEEP states also should be cleared,
otherwise PMIC won't get into a proper state on shutdown. Devices like
Nexus 7 tablet and Ouya game console are now shutting down properly.

Tested-by: Zack Pearsall <zpearsall@yahoo.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v2: - Now using a single tps65910_reg_update_bits() instead of set+clear.
      Thanks to Michał Mirosław for the suggestion.

 drivers/mfd/tps65910.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
index 11959021b50a..3f4483dec871 100644
--- a/drivers/mfd/tps65910.c
+++ b/drivers/mfd/tps65910.c
@@ -440,8 +440,13 @@ static void tps65910_power_off(void)
 			DEVCTRL_PWR_OFF_MASK) < 0)
 		return;
 
-	tps65910_reg_clear_bits(tps65910, TPS65910_DEVCTRL,
-			DEVCTRL_DEV_ON_MASK);
+	if (tps65910_reg_clear_bits(tps65910, TPS65910_DEVCTRL,
+			DEVCTRL_DEV_SLP_MASK) < 0)
+		return;
+
+	tps65910_reg_update_bits(tps65910, TPS65910_DEVCTRL,
+				 DEVCTRL_DEV_OFF_MASK | DEVCTRL_DEV_ON_MASK,
+				 DEVCTRL_DEV_OFF_MASK);
 }
 
 static int tps65910_i2c_probe(struct i2c_client *i2c,
-- 
2.26.0

