Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE2112242F2
	for <lists+linux-omap@lfdr.de>; Fri, 17 Jul 2020 20:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726256AbgGQSMx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Jul 2020 14:12:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgGQSMx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 17 Jul 2020 14:12:53 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0632C0619D3
        for <linux-omap@vger.kernel.org>; Fri, 17 Jul 2020 11:12:52 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z15so12058314wrl.8
        for <linux-omap@vger.kernel.org>; Fri, 17 Jul 2020 11:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=upQFUli2BQIGphggAgwr2cwewfby5/PoH7Z2pUjM4Zw=;
        b=GevRKqO8V0nIo6VlLT39Y80u7jyMrcnpKhYLBSxM2rYq9grq7LaAmuC6H/QwH4UY8k
         NIbIgkG5TDF1KmGYTF2NvExwLc8uC2hqfAjbkBuUDBMGRz/J/g7r3BRuzZ42pxw80uT9
         hz8/N6qdGkD5jAvD1ZTrhEhm/T+L1/PJSvOlYf1PR/nmcgaZrlO9oig0SgTNPC2VQCkq
         GEakW/zxNS6EemXQQYzzVtyKz2CxKkzwT8kN+qVTnRvbM4p7LR1KhIbT68TszE4/mO8Y
         VdY7Xott9If0xVkN8dFssdk5hYzpxKDnIRGULu3fQDsKHJCyb41l7+lEGxbXlwuFCPaj
         0X6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=upQFUli2BQIGphggAgwr2cwewfby5/PoH7Z2pUjM4Zw=;
        b=V25UW2g5MOzxiggcz3eNj8YPQatmvh20AAWPncS4p89si0UFIMJmMr9rl5FNCEkZmZ
         txzGlMTdKMr/rubp5grHUk0iHpMJqIOMZCKvaPKByfV00xq0N2ss5okqYJaE2TUBCTXl
         faoM2iVkE3zRni0f6MY0SHqqdDs979sGFZp2NL3J3Nt/kSoTjXoaZIqXh/8CTKnpRRdP
         vrArczDGH8WwLpBAmWPqIJQJWrntleoN5IoICTlZtn6JNDau0wXbg8utKP3mLJwQLBH8
         5BJ/Qvv4nrTc9qFHtYOTuJ0F3UCcU6MLf2qbvvfc24gDao0zEZQi+exh6Oi2d40H5AK2
         7E0w==
X-Gm-Message-State: AOAM530bHEB/PlMYcI/nkCxCCSIgA6KLwe9P3N9aVN+QsklCndyLzwae
        jPSMwAOQmFc5fKOQX1dGrA7vkw==
X-Google-Smtp-Source: ABdhPJx0ec7bpGVb4a5i7w/ggaTEBxYQtbPa16wKdFAoxK1bjIScZtUp4P7w0Ui/3jJxO8Md5G7r+g==
X-Received: by 2002:adf:a3d0:: with SMTP id m16mr10938057wrb.232.1595009571526;
        Fri, 17 Jul 2020 11:12:51 -0700 (PDT)
Received: from localhost.localdomain (94.197.121.234.threembb.co.uk. [94.197.121.234])
        by smtp.gmail.com with ESMTPSA id y77sm17081135wmd.36.2020.07.17.11.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 11:12:50 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH v2] gpio: omap: handle pin config bias flags
Date:   Fri, 17 Jul 2020 20:12:21 +0200
Message-Id: <20200717181220.1773543-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Modify omap_gpio_set_config() to handle pin config bias flags by calling
gpiochip_generic_config().

The pin group for the gpio line must have the corresponding pinconf
properties:

PIN_CONFIG_BIAS_PULL_UP requires "pinctrl-single,bias-pullup"
PIN_CONFIG_BIAS_PULL_DOWN requires "pinctrl-single,bias-pulldown"

This is necessary for pcs_pinconf_set() to find the requested bias
parameter in the PIN_MAP_TYPE_CONFIGS_GROUP pinctrl map.

Signed-off-by: Drew Fustini <drew@beagleboard.org>
Acked-by: Grygorii Strashko <grygorii.strashko@ti.com>
Acked-by: Tony Lindgren <tony@atomide.com>
Link: https://lore.kernel.org/r/20200715213738.1640030-1-drew@beagleboard.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-omap.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

V2 changes:
- adjust the braces to match the correct coding style
- Linus: should I be creating a patch that is just the delta for the
  braces?

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index b8e2ecc3eade..0ccb31de0b67 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -896,12 +896,18 @@ static int omap_gpio_set_config(struct gpio_chip *chip, unsigned offset,
 				unsigned long config)
 {
 	u32 debounce;
+	int ret = -ENOTSUPP;
+
+	if ((pinconf_to_config_param(config) == PIN_CONFIG_BIAS_DISABLE) ||
+	    (pinconf_to_config_param(config) == PIN_CONFIG_BIAS_PULL_UP) ||
+	    (pinconf_to_config_param(config) == PIN_CONFIG_BIAS_PULL_DOWN)) {
+		ret = gpiochip_generic_config(chip, offset, config);
+	} else if (pinconf_to_config_param(config) == PIN_CONFIG_INPUT_DEBOUNCE) {
+		debounce = pinconf_to_config_argument(config);
+		ret = omap_gpio_debounce(chip, offset, debounce);
+	}
 
-	if (pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
-		return -ENOTSUPP;
-
-	debounce = pinconf_to_config_argument(config);
-	return omap_gpio_debounce(chip, offset, debounce);
+	return ret;
 }
 
 static void omap_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
-- 
2.25.1

