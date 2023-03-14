Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9AB96BA119
	for <lists+linux-omap@lfdr.de>; Tue, 14 Mar 2023 22:01:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbjCNVB2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Mar 2023 17:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjCNVBE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 14 Mar 2023 17:01:04 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFA9C302AF
        for <linux-omap@vger.kernel.org>; Tue, 14 Mar 2023 14:01:03 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id m4so8718600lfj.2
        for <linux-omap@vger.kernel.org>; Tue, 14 Mar 2023 14:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678827662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=it6U6WO4SiAWUoCqFbqqzyS2RHciCqhrcTh+M14Dd8c=;
        b=x2BqJ/d316iVmCsG/M4+IT0D9zF6fgy5dQ5YTgHOkxxGKhogWk1SGv3C6n/OPL9UsQ
         LSMYvAhNA20TSvx3GV1gYKcIn3M/Kwp0FPSWRc2UQx2BbMLpEUeERNXz8VHaTkaGqMCB
         NNWb8x53LRNbcR7HsMP0Cei0wx+ElIlhnNMHPx87S3hNSaFgs7dVE9z2WnMylGVE5sw/
         4lLWzIf7mPDAbkvIwdK7DIzUuAPrkWK5TyQjlCnBliHY/ULUA9efcryqdF9vN6GaM82C
         K4bUBTL0DaiYuoyATgl96oeqeLTBPzs9LBbdfXIl5jL3cZf50bB81K2YWv/wrTwyMRx5
         LuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678827662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=it6U6WO4SiAWUoCqFbqqzyS2RHciCqhrcTh+M14Dd8c=;
        b=Bu+FQmecPX1QsSSHiVo33V+ksEcbMRDH149ziNSR7/db8nz40kz4TU1ELPcJA/vxhv
         AqxkJnyDrMF7dHRU7KfDYeK/TSJwflQFDXTjioGfrPVz+vVf6Sk+nKZUev5oopzeGgJf
         Sn37Xf+dWbmJmbgNFpRUKBAjWep64uRPoe55XT20GGZrTWXQNwJKmw6yD9mUt67SR3jy
         eAwfttcfbhBSjMDiOQEPJrMJ9EiFzgQu4Sjd6MhRE3os7v5OSL1MspCjd3Wn2m7QARoN
         YO+T/gGPhP9gNAxjC95US3UVSW9eD2Ecs67WuHFIv9WR9jMuuL9pd4PqomgphSi65xUt
         lqyw==
X-Gm-Message-State: AO0yUKW9TqOp0+eHtOHhr0yXfS5iTBAzZ+eekCgTPFtDjeMmo/tClVu/
        9Fe76z99WrPG6zLI9bbfX+aR7Q==
X-Google-Smtp-Source: AK7set+SxLoExkCQSz/+xVmYkfJyVnthfsz93f3Np4W6+v/0mpZ151kKOnunY08rK9LkoDAWw2qWaw==
X-Received: by 2002:a05:6512:21a7:b0:4dd:9f86:859d with SMTP id c7-20020a05651221a700b004dd9f86859dmr1179976lft.13.1678827661896;
        Tue, 14 Mar 2023 14:01:01 -0700 (PDT)
Received: from fedora.. ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id c3-20020ac244a3000000b0048a982ad0a8sm538081lfm.23.2023.03.14.14.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 14:01:01 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Tony Lindgren <tony@atomide.com>,
        Felipe Balbi <balbi@kernel.org>, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH v2] leds: Mark GPIO LED trigger broken
Date:   Tue, 14 Mar 2023 22:00:59 +0100
Message-Id: <20230314210059.419159-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The GPIO LED trigger exposes a userspace ABI where a user
can echo a GPIO number from the global GPIO numberspace into
a file that will trigger a certain LED when active.

This is problematic because the global GPIO numberspace is
inherently instable. The trigger came about at a time when
systems had one GPIO controller that defined hard-wired
GPIOs numbered 0..N and this number space was stable.

We have since moved to dynamic allocation of GPIO numbers
and there is no real guarantee that a GPIO number will stay
consistent even across a reboot: consider a USB attached
GPIO controller for example. Or two. Or the effect of
probe order after adding -EPROBE_DEFER to the kernel.

The trigger was added to support keypad LEDs on the Nokia
n810 from the GPIO event when a user slides up/down the
keypad. This is arch/arm/boot/dts/omap2420-n810.dts.
A userspace script is needed to activate the trigger.
This will be broken unless the script was updated recently
since the OMAP GPIO controller now uses dynamic GPIO
number allocations.

I want to know that this trigger has active users that
cannot live without it if we are to continue to support it.

Option if this is really needed: I can develop a new trigger
that can associate GPIOs with LEDs as triggers using device
tree, which should also remove the use of userspace custom
scripts to achieve this and be much more trustworthy, if
someone with the Nokia n810 or a device with a similar need
is willing to test it.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: linux-omap@vger.kernel.org
Cc: linux-gpio@vger.kernel.org

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Be less intrusive and just mark the feature broken
  for now.
---
 drivers/leds/trigger/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
index dc6816d36d06..2a57328eca20 100644
--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -83,6 +83,7 @@ config LEDS_TRIGGER_ACTIVITY
 config LEDS_TRIGGER_GPIO
 	tristate "LED GPIO Trigger"
 	depends on GPIOLIB || COMPILE_TEST
+	depends on BROKEN
 	help
 	  This allows LEDs to be controlled by gpio events. It's good
 	  when using gpios as switches and triggering the needed LEDs
-- 
2.34.1

