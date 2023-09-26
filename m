Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85B047AEDE8
	for <lists+linux-omap@lfdr.de>; Tue, 26 Sep 2023 15:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231362AbjIZNZo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Sep 2023 09:25:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjIZNZn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 26 Sep 2023 09:25:43 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B20B4
        for <linux-omap@vger.kernel.org>; Tue, 26 Sep 2023 06:25:36 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5041d6d8b10so14636395e87.2
        for <linux-omap@vger.kernel.org>; Tue, 26 Sep 2023 06:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695734735; x=1696339535; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7NRfxGrMOqSfOG3v3ZLD3nG7Q9arSiNCsFf5J1mFyQw=;
        b=Dm7eOGN55bMcBZYkCMQTey5s41Zkjci++gfZ9ch95sS0WySm64QBeCbSf6HcOaf6aW
         r3XUgRJ2yZnBqYtCXlQnm6QtkfS5QaQz6XBExW/RQR5e+wNevOKvbwpjnsi3ikfeb1Qb
         Qg4KQw6GuYqYfiyfExbNrOXgX6wNXP3rPaEI5lviGl9rgGn9SGv7zO5p8ga1eSWRcCgF
         +ZwkCsyPHzryCnCPvt5SHwZWbsy5RC47car2ra4JGG8n7oO2lyZeDv2lHffKyZ0FKwkC
         9elQHZYD6Wkjl50YX1GBcbnVspmviU4lSiqtSystR9W0gHaYayt7imYHy3glXgW3KcFv
         tVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695734735; x=1696339535;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7NRfxGrMOqSfOG3v3ZLD3nG7Q9arSiNCsFf5J1mFyQw=;
        b=RE4nvKfyQ9tseOs6SFtD5Vdzq9lfEQUNxQOcfuTEiGp9YtJ53rlqmcev5Hgky1baCD
         7uRb76bRnAH4YHfa3CIjP0RAw3do5g1fDO9w5/9umXnMY5Vj75HEi+Jn5+2ZB8aa7w5c
         m13BmMlhH/EioZeor5H/nX3yh2pC9Tw9A9y1d9/l9YzGQp3gSa+na/q2CzIihFq7geDq
         qM49VP4+sqo9keTn7Am6e5cNLDnsh5PmQ7JsE91bYPbZfCiMoHkmmFJwTRcotxIj6/pJ
         5d9nVzQBYHZ/D6pS+L1v/LxeZ9nEi22L6UadVgeUD8wyQ46w8XjuB7jtqjFD1DhxroTa
         g3Fg==
X-Gm-Message-State: AOJu0Yw0IaAEuwclGd6dHmE7eqRtStdLP1jWvWLVK2hMxx87qZ7+GAHe
        bic5lVx3BWZwgRbqGYE82cdt6x8s9wrUSS9XoUQ=
X-Google-Smtp-Source: AGHT+IHAg0Bp/wi4V4DDaV11/b+CpdNwq4NJCdF+2HwL/+gKGTZiazhI7ctuPHYrMgccKJRbjt9Qiw==
X-Received: by 2002:a05:6512:5d6:b0:503:8fa:da22 with SMTP id o22-20020a05651205d600b0050308fada22mr7923388lfo.22.1695734734372;
        Tue, 26 Sep 2023 06:25:34 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id eq25-20020a056512489900b0050307bf2bcdsm2221540lfb.247.2023.09.26.06.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 06:25:34 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/5] GPIO descriptors for TI ASoC codecs
Date:   Tue, 26 Sep 2023 15:25:28 +0200
Message-Id: <20230926-descriptors-asoc-ti-v1-0-60cf4f8adbc5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMjbEmUC/x3MPQqAMAxA4atIZgMaFX+uIg6lTTWLlUREEO9uc
 fyG9x4wVmGDqXhA+RKTtGfUZQF+c/vKKCEbqKKmGokwsHmV40xq6Cx5PAXd0BHH2PYjB8jloRz
 l/q/z8r4fstvD22UAAAA=
To:     Tony Lindgren <tony@atomide.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        alsa-devel@alsa-project.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This cleans up and rewrites the GPIO usage in the TI
ASoC components to use GPIO descriptors exclusively.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (5):
      ASoC: ti: Convert N810 ASoC to GPIO descriptors
      ASoC: ti: Convert RX51 to use exclusively GPIO descriptors
      ASoC: ti: Convert TWL4030 to use GPIO descriptors
      ASoC: ti: Convert Pandora ASoC to GPIO descriptors
      ASoC: ti: osk5912: Drop unused include

 arch/arm/mach-omap2/board-n8x0.c           | 10 +++++
 arch/arm/mach-omap2/pdata-quirks.c         | 10 +++++
 include/linux/platform_data/omap-twl4030.h |  3 --
 sound/soc/ti/n810.c                        | 31 ++++++++-------
 sound/soc/ti/omap-twl4030.c                | 20 ++++------
 sound/soc/ti/omap3pandora.c                | 63 +++++++++++-------------------
 sound/soc/ti/osk5912.c                     |  1 -
 sound/soc/ti/rx51.c                        | 19 ++-------
 8 files changed, 72 insertions(+), 85 deletions(-)
---
base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
change-id: 20230922-descriptors-asoc-ti-a852eff479ed

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

