Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61B936F2FB5
	for <lists+linux-omap@lfdr.de>; Mon,  1 May 2023 11:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232137AbjEAJFf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 1 May 2023 05:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbjEAJFe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 1 May 2023 05:05:34 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDF8510F7
        for <linux-omap@vger.kernel.org>; Mon,  1 May 2023 02:05:24 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so3151189e87.3
        for <linux-omap@vger.kernel.org>; Mon, 01 May 2023 02:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682931923; x=1685523923;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2j6rgQc/r/2Js3D3gLwomy+VWPn4uUg8B3ip4IjpuBc=;
        b=KAn3ODbIiRg4j4Zzg/nLhWKpOxSDpVsU9Zn/tajMDmj3ofpezi3MroE8tiPr5jqEVC
         5CedcIh3ba7clPnvywrYtUakcAxswbyLn9MAqR8+Lw8carcSiAPQsdgySQYkzDFg+sgD
         1lREin9W5NrFUxSkJIdhKRbzIJ0uyCOMEIMEOoCW4GKXanq4TjiqaL2Iq4PpvM/Gwb4E
         j07uZIaqNQLIgaMXxbPJGFwOpBSSpQ9z9imHnu1tfy46NWQDIE//E5Dm3B0GR9McWB5h
         naZHQvxkKWg4Uur0vxC+iV8mvfB62GMogmKFRuJvh8q48UphgDgwhHY3C2BnaGiRpTKC
         shdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682931923; x=1685523923;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2j6rgQc/r/2Js3D3gLwomy+VWPn4uUg8B3ip4IjpuBc=;
        b=NHxd3RQsUyLqMRrDIQNxX0lnIlCk57KlJaPOgRNJuwHnPEihwlS5moxn25b0ZhHbqA
         ldm5ZNmhV4Z6mnEqX8l9SSIZYpj4cZI+1SQjDo5AT7v+B9H1E3Cja1yAVhvA+jFWop8t
         UMEXAM2+y582zihOwxxiC9Wq8JCopbc4zlMRUUK52nmlKhAE//y9UI/NNAQb6pziTuvn
         aOuSQrexMQZYHSJSToEokTFr55O1W+3PZeelIboa738Kg646udox+42t67lrD4kycij3
         05sl5iMGCwdoTLlajU6qKtle82+lY6ENHo7kZZWI2kSUAYI4/zcnANtR3o0kTZdY4DID
         h8WA==
X-Gm-Message-State: AC+VfDzXwoyGWJ6wp0xBw5vbJZ7xF86e+csDSAIKJvXmqzLWQm09a/cQ
        RKiqoXc3GZK9WYbXSNtS3zeSY6E3kMu/EnoczcY=
X-Google-Smtp-Source: ACHHUZ4PKSBtvj/xLG1BW7/z1Xw6Jj+Ff/oBpQPTIV8KfzrvUyBivXgM1hxakXhkALJvhWCKUxV6Tg==
X-Received: by 2002:ac2:43bc:0:b0:4ea:5902:5af1 with SMTP id t28-20020ac243bc000000b004ea59025af1mr3668268lfl.52.1682931922845;
        Mon, 01 May 2023 02:05:22 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id f21-20020ac251b5000000b004eb554a1711sm4601208lfk.51.2023.05.01.02.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 02:05:22 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/3] Get rid of OMAP2 GPIO pdata quirks
Date:   Mon, 01 May 2023 11:05:20 +0200
Message-Id: <20230430-omap2-pdata-quirks-v1-0-e015f3a3ea46@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANCAT2QC/x2NwQqDQAwFf0VybmB1vbS/UnqI+qyhuG4TLQXx3
 7v2OAzD7OQwhdOt2snwUdclFagvFfWTpCdYh8LUhCaGNgZeZskN50FW4fem9nKO4VpcDbQjqIS
 dOLgzSf10prP4CjtFNoz6/d/uj+P4ARDKqrt9AAAA
To:     Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Lee Jones <lee@kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The OMAP2/3 has a few platform data quirks using the legacy
<linux/gpio.h> API and the associated global GPIO numberspace.

Since we started to use dynamic assignment of the OMAP GPIO
base this will not work, let's just rewrite and decomission
these bad habits.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (3):
      ARM/gpio: Push OMAP2 quirk down into TWL4030 driver
      ARM: omap2: Get USB hub reset GPIO from descriptor
      ARM: omap2: Rewrite WLAN quirk to use GPIO descriptors

 arch/arm/mach-omap2/omap_device.c  |   1 -
 arch/arm/mach-omap2/pdata-quirks.c | 132 ++++++++++++++++++-------------------
 drivers/gpio/gpio-twl4030.c        |  52 ++++++++++-----
 include/linux/mfd/twl.h            |   3 -
 4 files changed, 102 insertions(+), 86 deletions(-)
---
base-commit: 825a0714d2b3883d4f8ff64f6933fb73ee3f1834
change-id: 20230430-omap2-pdata-quirks-3093041ee4fe

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

