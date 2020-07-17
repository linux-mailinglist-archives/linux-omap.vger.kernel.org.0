Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33F0A224466
	for <lists+linux-omap@lfdr.de>; Fri, 17 Jul 2020 21:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbgGQTk4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Jul 2020 15:40:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728183AbgGQTk4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 17 Jul 2020 15:40:56 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CF7FC0619D2
        for <linux-omap@vger.kernel.org>; Fri, 17 Jul 2020 12:40:56 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id q15so16565363wmj.2
        for <linux-omap@vger.kernel.org>; Fri, 17 Jul 2020 12:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OoH8Or/IPJIsOCZ4EnlsBe9p7xcB0tU6AO6jsyU5+sE=;
        b=tx2mCyHWPxA14VO1hMs2RyJ3fY9i/7Vjbo/1ikK5NZ2xfcjMfxjr1y3lkJEFST9zPq
         fKNXMcxPd+qgGcoJKrowaZVcw4n3Bs3OAQveZtPTn5Esrk8IUZlltMGN3pCBLOD1PNvg
         ejJ14RNercOe+x5lWRD3D5FXGRWRfKgSU9VvwLW0JW//VBmuSHZDhmkmzDGmVUzrVZHB
         Px8gn13Bf5737YswyvZUk1M6oF2Q9s+lbguSvJwWXidD3TWuhL0LJRFkCMi4YzfytgT4
         DwIBGWl19vbKR8egdbH+vQRLFHiT5W2RxXUPlNsl+frNNJcZNqzoGl3/Cy2Wxq7zfkro
         rKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OoH8Or/IPJIsOCZ4EnlsBe9p7xcB0tU6AO6jsyU5+sE=;
        b=HaLbrI2XDzMg35SAYlusAALP98l/DK79nHFAna/hZ0Z9uRMtDVAZRfB1PBib/Mvz8h
         cbkPJPjsDhIKr8EbBkqMXewRaVXN6uAn98Cp2L/pXVlpU6N/iVp8/+4bXYR2nvWdBFPn
         vYCPEcG5YTmzz9eyl9iRKHOdlZmAO2KNV3cC0DRH2hjJImNSoIwafj/dK2nMI7Ffulsw
         rNx8rGAnmBENq+QY77fzEeagjNNm43KUQh2DmOGodgn5s+AM0hQeDuJD6wq0hEa4UPub
         4kIvE9wBhOBZmIFvffqQyIHmQv9nq/6bLlUfaeuo8bD8U/uV+EXJskV5Id09jCdmd+EO
         1w7g==
X-Gm-Message-State: AOAM531OOsh4vxtxRYzRj9k9Cao85/sGmHx5CdO9NA/ihnxX7Ux+1/jD
        AbkFJQnnT/UJnqTMsYbeMDeznw==
X-Google-Smtp-Source: ABdhPJxMmKf1pkL1S/hRw0oESDt+ihs9q/hgAyy0bsFE6cJd0L0QaydAblCwFc4JGgiBlZIxScr+Vw==
X-Received: by 2002:a1c:5f41:: with SMTP id t62mr10565560wmb.53.1595014854898;
        Fri, 17 Jul 2020 12:40:54 -0700 (PDT)
Received: from localhost.localdomain (92.40.249.21.threembb.co.uk. [92.40.249.21])
        by smtp.gmail.com with ESMTPSA id v5sm15153799wmh.12.2020.07.17.12.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 12:40:53 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v3] gpio: omap: handle pin config bias flags
Date:   Fri, 17 Jul 2020 21:40:43 +0200
Message-Id: <20200717194043.1774643-1-drew@beagleboard.org>
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

v3 changes:
- adjust the braces to match the correct coding style
- note: I originally re-submitted this as v2 by accident when it should
  have been v3. Sorry for the noise.

v2 changes:
- simplify handling of -ENOTSUPP return value per Grygorii's suggestion

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

