Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44F971D3F5C
	for <lists+linux-omap@lfdr.de>; Thu, 14 May 2020 22:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727835AbgENUxQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 May 2020 16:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727123AbgENUxP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Thu, 14 May 2020 16:53:15 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44ADAC061A0C;
        Thu, 14 May 2020 13:53:15 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id 82so2312312lfh.2;
        Thu, 14 May 2020 13:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8ZX5aSRmz5jYRhVNI33JYSnsQRmUFYEKnhmSj7lgJyc=;
        b=Ev2F/CLB7pA3dHkEJLfIS7zf50ZpNLO1iAl80R2/Mb9S7RrglW/0daTX5jfR9qa2Ss
         K6GevTqJ7CRO8I4Q7o8Y1HLw+S0jQ6ft0fcXig0YGSrIiGwrs1WFFuDF+cqTc2go+9fY
         TcVCCn65Ee+CwmfUtxtQzqpdX4/XC+7x6rYBIasvwmO1r5maTMJ9Zy3qlnWbYMob7R0c
         AIwrgBztPPi9Ve1ypwm7WADLnruDN5yoyb2YUpeUbRTJo20T3n8LOimnq/GnNbcn4NSF
         PZtUvliwv3n0w22iWpTbIIvOy1fQdEDM+1S3ZUox8EF0gn3hIh3g34eGQODp1nBB/0E9
         VV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8ZX5aSRmz5jYRhVNI33JYSnsQRmUFYEKnhmSj7lgJyc=;
        b=TXPy8ByOfrokzHdTaegMCnfYXSM8lAfHOgJUXNNEETyaCDx0Q7D8wXNSNaHEywPgms
         AD9RrJqrWzXLYFo0wSYLK6UCcLC+oWSWuIzBcrcRavVHItTUZsG2VCbeo+UFc1puyQJW
         Tl/CRC26ynRI7oO6WOLvVFGpxxy/wFEuCywM2voC4KzVZcAntd0RpZTk5iLz+XR/a/8H
         Wkb2vLIUvkI7Vu9s6UivXMZETf/xqnJDnXtWnIeuYjk6qsmCx06OCxVmhSYK45qUK3r2
         Z9SrwctRbbjH+34tx3GcU6DxgezU5Ujl2jKPLLzrZggE4MHPtczY2PrLKxsPlipHIGD7
         zknQ==
X-Gm-Message-State: AOAM5310KD7kBtutsKbdVamo27pq1NDli2sGPkxwMepev1VVY0d6zmvG
        Epy9+nNscVbUaHPJUSOheYU=
X-Google-Smtp-Source: ABdhPJwdhEYSKRvj3P/XNm29+bPUFCqmQUpncZwquIfbD0KmklXjKtbyavR9lREmIkPlSXuOsdSiNg==
X-Received: by 2002:ac2:5199:: with SMTP id u25mr39844lfi.80.1589489593816;
        Thu, 14 May 2020 13:53:13 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.gmail.com with ESMTPSA id m20sm17612ljb.23.2020.05.14.13.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 13:53:13 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Zack Pearsall <zpearsall@yahoo.com>
Cc:     linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] mfd: tps65910: Correct power-off programming sequence
Date:   Thu, 14 May 2020 23:50:21 +0300
Message-Id: <20200514205022.7024-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
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
 drivers/mfd/tps65910.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
index 11959021b50a..22116cee411d 100644
--- a/drivers/mfd/tps65910.c
+++ b/drivers/mfd/tps65910.c
@@ -440,8 +440,16 @@ static void tps65910_power_off(void)
 			DEVCTRL_PWR_OFF_MASK) < 0)
 		return;
 
-	tps65910_reg_clear_bits(tps65910, TPS65910_DEVCTRL,
-			DEVCTRL_DEV_ON_MASK);
+	if (tps65910_reg_clear_bits(tps65910, TPS65910_DEVCTRL,
+			DEVCTRL_DEV_SLP_MASK) < 0)
+		return;
+
+	if (tps65910_reg_clear_bits(tps65910, TPS65910_DEVCTRL,
+			DEVCTRL_DEV_ON_MASK) < 0)
+		return;
+
+	tps65910_reg_set_bits(tps65910, TPS65910_DEVCTRL,
+			DEVCTRL_DEV_OFF_MASK);
 }
 
 static int tps65910_i2c_probe(struct i2c_client *i2c,
-- 
2.26.0

