Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE346ADFB9
	for <lists+linux-omap@lfdr.de>; Tue,  7 Mar 2023 14:05:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbjCGNFR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Mar 2023 08:05:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbjCGNFO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Mar 2023 08:05:14 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A106E9ECA
        for <linux-omap@vger.kernel.org>; Tue,  7 Mar 2023 05:04:48 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id h3so13026325lja.12
        for <linux-omap@vger.kernel.org>; Tue, 07 Mar 2023 05:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678194285;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aWAazNHBDVRAh2BONHNMgJ6UofOBNN4Fn8MZeeYeiu0=;
        b=pkj0393XpFRI99wm6saQTaQPPmMUBplQtNlf1h4PD/Zay63D1nQisoaVe95PSHJwpN
         ygvUWiwScJvDaV3Qe0PmHcXYpGaY9oYV0Gm/e28LQX7jl8pK/q4nQ3eM0pSpjMezHbPW
         H6PXcnX+D+M8x3lOF27cHdUdwokO7ggt0zBh2mB7Xil4V66wDg3blNn4emtr0iooL/U/
         cK3lNt3eIE14tUXw57R31rqUhT9FgZCfEhpJX271vdEjMhNqiZT4zQqK6FxSEZClUIfI
         LtnKt4NpstuXMZxk+P7Knq9c5kOTBkMVtdk4GxBEmsHt3DSDrq+mDUcZRmfspMzrn5xO
         a1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678194285;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWAazNHBDVRAh2BONHNMgJ6UofOBNN4Fn8MZeeYeiu0=;
        b=wLVwVhTqUkAZnx2Nm1103qKlRfw0J2Wn6ThAVjK9vNMBJm98H0pQsWIeWXHbRoxLhp
         6qLokOd1XVqXApuDuNIiG6FTJtD4tKtivOgRjDEboWV5zsnPXCR4ia9RG/OYgbCSDC5g
         dHjHJHhWJ/DDr65gZXRyzIOd3y060TG9aai++ylwcQJxRwJBtUr/rHIugWpO+v2eGKKw
         wFYQsI/fmD9bbvr8iIF2ReOkg4EcUwgb1BY+hHl0NhtPzBZFdipTPCXosTaHtTQvwBhV
         xgG8F71t8YKxiuvR/SwzV0moq88WkOx+sT+2kBrrqSdP1dAxDXRt1YDk+RZALiwHo2ab
         rcRg==
X-Gm-Message-State: AO0yUKUhw+xfT5nq2nvSg/S9Fl8I6LHKWcKEq19F3v/8ToBCx0ui821n
        iTD0hGvGlyukA6oqneYe5XD1Dg==
X-Google-Smtp-Source: AK7set/+CaDoWlGsmws8NLZ0ArqU7rN6NOrFt0w/Lq4mckNLP+Uoto4U0QDcb4hzd4153c9yamDYeA==
X-Received: by 2002:a05:651c:544:b0:298:4424:aea9 with SMTP id q4-20020a05651c054400b002984424aea9mr2870926ljp.21.1678194285179;
        Tue, 07 Mar 2023 05:04:45 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id w14-20020ac2598e000000b004caf992bba9sm2030548lfn.268.2023.03.07.05.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:04:44 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 00/16] Mass convert GPIO IRQ chips to be immutable
Date:   Tue, 07 Mar 2023 14:04:42 +0100
Message-Id: <20230215-immutable-chips-v2-0-d6b0e3f2d991@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGo2B2QC/3WOwQ6CMBBEf4X07Jp2FVFP/ofhUGChm0BLtkg0h
 H+3cPHk8U3mZWZRkYQpqnu2KKGZIwefAA+Zqp31HQE3iRVqPGk0OfAwvCZb9QS14zFCccEbIhZ
 Fa0glq7KRoBLra7d53cjh52yFUajl9z75LBM7jlOQz/5gNlv6f2w2oCE39toinm3e6EfP3ko4B
 ulUua7rF6W1ixPQAAAA
To:     Mun Yew Tham <mun.yew.tham@intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, Alban Bedel <albeu@free.fr>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Jay Fang <f.fangjian@huawei.com>,
        Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        William Breathitt Gray <william.gray@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-omap@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Arnd Bergmann <arnd@arndb.de>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We are getting tired of these irq_chips not getting converted
to be immutable, so I just take out the big hammer and fix
some that I deem not too complex as best I can.

I stopped after doing some, I will take another sweep at some
point I guess.

This is v6.4 material.

The last two patches to pci-idio-* (patch 15 and 16) can be
omitted if William's patches to convert this driver to
regmap GPIO are merged first.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Rebased on v6.3-rc1
- Collected some test and ACK tags
- Link to v1: https://lore.kernel.org/r/20230215-immutable-chips-v1-0-51a8f224a5d0@linaro.org

---
Linus Walleij (16):
      gpio: altera: Convert to immutable irq_chip
      gpio: adnp: Convert to immutable irq_chip
      gpio: aspeed: Convert to immutable irq_chip
      gpio: aspeed-sgpio: Convert to immutable irq_chip
      gpio: ath79: Convert to immutable irq_chip
      gpio: cadence: Convert to immutable irq_chip
      gpio: hisi: Convert to immutable irq_chip
      gpio: hlwd: Convert to immutable irq_chip
      gpio: idt3243x: Convert to immutable irq_chip
      gpio: msc313: Convert to immutable irq_chip
      gpio: mlxbf2: Convert to immutable irq_chip
      gpio: max732x: Convert to immutable irq_chip
      gpio: omap: Drop irq_base
      gpio: omap: Convert to immutable irq_chip
      gpio: pci-idio-16: Convert to immutable irq_chip
      gpio: pcie-idio-24: Convert to immutable irq_chip

 drivers/gpio/gpio-adnp.c         |  9 ++++-
 drivers/gpio/gpio-altera.c       | 25 +++++++-----
 drivers/gpio/gpio-aspeed-sgpio.c | 44 +++++++++++++++++----
 drivers/gpio/gpio-aspeed.c       | 44 ++++++++++++++++++---
 drivers/gpio/gpio-ath79.c        |  8 +++-
 drivers/gpio/gpio-cadence.c      | 10 +++--
 drivers/gpio/gpio-hisi.c         | 25 +++++++-----
 drivers/gpio/gpio-hlwd.c         | 33 ++++++++++++----
 drivers/gpio/gpio-idt3243x.c     | 11 ++++--
 drivers/gpio/gpio-max732x.c      |  8 +++-
 drivers/gpio/gpio-mlxbf2.c       | 32 ++++++++++++----
 drivers/gpio/gpio-msc313.c       | 26 +++++++++++--
 drivers/gpio/gpio-omap.c         | 83 ++++++++++++++++++++++------------------
 drivers/gpio/gpio-pci-idio-16.c  | 12 ++++--
 drivers/gpio/gpio-pcie-idio-24.c | 12 ++++--
 15 files changed, 273 insertions(+), 109 deletions(-)
---
base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
change-id: 20230215-immutable-chips-762922277f1e

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

