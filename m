Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC40545CCAA
	for <lists+linux-omap@lfdr.de>; Wed, 24 Nov 2021 20:01:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234768AbhKXTFB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Nov 2021 14:05:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230468AbhKXTFA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 24 Nov 2021 14:05:00 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1F7BC061574;
        Wed, 24 Nov 2021 11:01:50 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id i63so7546519lji.3;
        Wed, 24 Nov 2021 11:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HB5Uno7mPEgJ7bG9gHGpKx58JbhDKtKcQ9mk992LdI8=;
        b=GL4bZUuqm+wkEX2j2dAm5uvA+8tXowQCu7EWl2vXN1PNEtMP2+sUhSEcAAkwXUNlUi
         YcAHBNGzXEDyJwTvpk1UvHzhgOb9oD5ILkOe5yzqjffeXjWrbbvTpXA10c89hebBJPFf
         b/vTAqdWXgb183fiQoL/huEgTRK93E6BNwZE8YgJczjm8GniQ7hVtKFTKuDS2SeTnaKZ
         d0cKF7w1wBhAngkJocKAU/cNUKpgH1qJpvm5KPpKmjVSXKOyALabPDl3n/uXnJnJqsk5
         3mPGBGUc834/GQjkUK0xM0mOlqsaFaerr3T9GAGR7roy6/RDrMnBDgZem3i2v/GHTa0/
         MdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HB5Uno7mPEgJ7bG9gHGpKx58JbhDKtKcQ9mk992LdI8=;
        b=0rsz57+9EdlX2J8k2AexGGdq6MO1M+jze1l5BXgy19EwdCPrsS4e+vHS14O1h66Ee2
         /YH38R0iHSXujIySa1e7BG/Gd0BDU71GEsf6Xm52Ltzhr4ls8m9yJvdLv4uJZJ9CnY0v
         7C9WPRc2LULns3vecIQ8LHcTZjH4ueurbkDOY8nA5cLIMXmVvPuAfoOMb+e/q2U4OqNC
         0fo3nG5lwT6UyJhzg03rkRTRD1iJnxuqZczLWcTNbzLBINn7Vl7YYKfk8QranKd0xQ/G
         HrTlKNV94tFnVs71LSWCAzJ70d42uN8TiUjIz6G222ZbH0VbWueeOff6ATMYLUHjn3bl
         iVgQ==
X-Gm-Message-State: AOAM532gX5y6gI3VikigULH5Gd2rWLCzj0GxIvilhcK/h8HG/xb1S+tV
        GG6ZvHbuX+x0kVzbk4+GZ78O+p9E8Hk=
X-Google-Smtp-Source: ABdhPJx6+3Bv4REdEvYQPqth18YMMEmulgzz509fJMrNya8E42TOFHvZVKeBgIrqx/ki+Mo3WNAcJQ==
X-Received: by 2002:a2e:5c04:: with SMTP id q4mr18915802ljb.334.1637780508620;
        Wed, 24 Nov 2021 11:01:48 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id u21sm58366ljl.76.2021.11.24.11.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 11:01:48 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] mfd: tps65910: Set PWR_OFF bit during driver probe
Date:   Wed, 24 Nov 2021 22:01:04 +0300
Message-Id: <20211124190104.23554-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The PWR_OFF bit needs to be set in order to power off properly, without
hanging PMIC. This bit needs to be set early in order to allow thermal
protection of NVIDIA Terga SoCs to power off hardware properly, otherwise
a battery re-plug may be needed on some devices to recover after the hang.

Cc: <stable@vger.kernel.org>
Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # ASUS TF201
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mfd/tps65910.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
index 6e105cca27d4..67e2707af4bc 100644
--- a/drivers/mfd/tps65910.c
+++ b/drivers/mfd/tps65910.c
@@ -436,15 +436,6 @@ static void tps65910_power_off(void)
 
 	tps65910 = dev_get_drvdata(&tps65910_i2c_client->dev);
 
-	/*
-	 * The PWR_OFF bit needs to be set separately, before transitioning
-	 * to the OFF state. It enables the "sequential" power-off mode on
-	 * TPS65911, it's a NO-OP on TPS65910.
-	 */
-	if (regmap_set_bits(tps65910->regmap, TPS65910_DEVCTRL,
-			    DEVCTRL_PWR_OFF_MASK) < 0)
-		return;
-
 	regmap_update_bits(tps65910->regmap, TPS65910_DEVCTRL,
 			   DEVCTRL_DEV_OFF_MASK | DEVCTRL_DEV_ON_MASK,
 			   DEVCTRL_DEV_OFF_MASK);
@@ -504,6 +495,19 @@ static int tps65910_i2c_probe(struct i2c_client *i2c,
 	tps65910_sleepinit(tps65910, pmic_plat_data);
 
 	if (pmic_plat_data->pm_off && !pm_power_off) {
+		/*
+		 * The PWR_OFF bit needs to be set separately, before
+		 * transitioning to the OFF state. It enables the "sequential"
+		 * power-off mode on TPS65911, it's a NO-OP on TPS65910.
+		 */
+		ret = regmap_set_bits(tps65910->regmap, TPS65910_DEVCTRL,
+				      DEVCTRL_PWR_OFF_MASK);
+		if (ret) {
+			dev_err(&i2c->dev, "failed to set power-off mode: %d\n",
+				ret);
+			return ret;
+		}
+
 		tps65910_i2c_client = i2c;
 		pm_power_off = tps65910_power_off;
 	}
-- 
2.33.1

