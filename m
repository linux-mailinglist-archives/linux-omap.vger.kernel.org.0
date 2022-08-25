Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1F6B5A1505
	for <lists+linux-omap@lfdr.de>; Thu, 25 Aug 2022 17:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241903AbiHYPCe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Aug 2022 11:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241489AbiHYPCd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 25 Aug 2022 11:02:33 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C220A2622
        for <linux-omap@vger.kernel.org>; Thu, 25 Aug 2022 08:02:31 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id u15so31428875ejt.6
        for <linux-omap@vger.kernel.org>; Thu, 25 Aug 2022 08:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=KQTIg5jCKpBCPFk2L7wdYoB1lmJQPzPoMVtc6KYHvS4=;
        b=pdmdfMkJpnHiZtIS6VJA51oFwb0n0D7fvAsuYwQEkJ9JL8Yufc70yS7IXmmwGsgo1B
         T0djDZRs4rGK46gqGaKl9yJeI7HWy3eIKe5DPwn0hiKP84qb6RfgP0TwKrXc6cDl5vQe
         FvFJLLQCr6bl9x1YIXap/s3P8N5w/J1AGn/7oLd+r5pIvJUxreMS/Stenguh6oeudnfM
         DpsVUZ652iOywehY0U/jLPrRe//StG6j63RqBVUhFxzNka5L83UPShrEqjKRKxb/3bXa
         Ckp3ZBSgU4ShYj6/dnYHzQH95JtSRVMlCoj1QwqfqbU+McbAOVCL1dt4F7RzkB20UL3j
         XLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=KQTIg5jCKpBCPFk2L7wdYoB1lmJQPzPoMVtc6KYHvS4=;
        b=gSh7gU2r7zn6FDwH9091bab+18GgrMYiEe8gnvTCF0qfJ58P8uKinxUvtrJTs7wc+M
         RBIfCsBsaLaKsnSstG6Zf/pRLsL7W6xOFVENKLJyssCRpIGC2p5ZWuzgL5mZ+1sx2Bt4
         XcizEaHtB47Wo8wAB3kVMUEACrJkn1tnnbMHOw6jSv0vgbo5cINFW4DHCGybB6rpuwbP
         OYos+NiwI1xwGddwhSDSF9SRFeFsZkteurOuekm88dosjJvBZNwdRK0JX08ScOFJJ58j
         8fLDRT12EfHGGlUnS2smsN5prEfjymx0HozYZWfTU633HZ+WsFk+FyCY1esMDFbFzM+8
         w82Q==
X-Gm-Message-State: ACgBeo2e9LbFMRn/PP0EwHCsXfVxYXy+xGSbttzf+V77I3eHr2H04lUk
        L0Afeo5sex7MIk/gl0UHAsOVDg==
X-Google-Smtp-Source: AA6agR5CXljSDCvli5lhhrm6AxqnYomGfl3hTxXo0GFubNcs4OJPNfK9hzK+WGrCGZuV52m/ZjorBg==
X-Received: by 2002:a17:906:dc90:b0:73d:670d:5975 with SMTP id cs16-20020a170906dc9000b0073d670d5975mr2695541ejc.515.1661439750061;
        Thu, 25 Aug 2022 08:02:30 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4090:a245:8020:2658:1f7c:362:3e99])
        by smtp.gmail.com with ESMTPSA id r10-20020a17090609ca00b00732e3d94f4fsm2548771eje.124.2022.08.25.08.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 08:02:29 -0700 (PDT)
From:   Markus Schneider-Pargmann <msp@baylibre.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee@kernel.org>, Tony Lindgren <tony@atomide.com>,
        nm@ti.com, kristo@kernel.org
Cc:     Jerome Neanne <jneanne@baylibre.com>, khilman@baylibre.com,
        narmstrong@baylibre.com, j-keerthy@ti.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v4 0/6] Add support for TI TPS65219 PMIC.
Date:   Thu, 25 Aug 2022 17:02:18 +0200
Message-Id: <20220825150224.826258-1-msp@baylibre.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi everyone,

I am submitting this update for Jerome, he will probably do the next
version again.

v4 is a lot smaller now as I squashed some patches as requested and
some were applied. It is mainly the fixes of the things that Lee Jones
pointed out in his review on v2, thanks for that.

It is now based on the regulator tree branch for-6.1:
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git

Best,
Markus

Previous versions:
v3 - https://lore.kernel.org/lkml/20220805121852.21254-1-jneanne@baylibre.com/
v2 - https://lore.kernel.org/lkml/20220726103355.17684-1-jneanne@baylibre.com/
v1 - https://lore.kernel.org/lkml/20220719091742.3221-1-jneanne@baylibre.com/

Jerome Neanne (5):
  DONOTMERGE: arm64: dts: ti: Add TI TPS65219 PMIC support for AM642 SK
    board.
  DONOTMERGE: arm64: dts: ti: Add pinmux and irq mapping for TPS65219
    external interrupts
  DONOTMERGE: arm64: dts: ti: k3-am642-sk: Enable tps65219 power-button
  mfd: drivers: Add TI TPS65219 PMIC support
  arm64: defconfig: Add tps65219 as modules

Markus Schneider-Pargmann (1):
  Input: Add tps65219 interrupt driven powerbutton

 MAINTAINERS                             |   1 +
 arch/arm64/boot/dts/ti/k3-am642-sk.dts  | 115 ++++++++
 arch/arm64/configs/defconfig            |   3 +
 drivers/input/misc/Kconfig              |  10 +
 drivers/input/misc/Makefile             |   1 +
 drivers/input/misc/tps65219-pwrbutton.c | 149 ++++++++++
 drivers/mfd/Kconfig                     |  14 +
 drivers/mfd/Makefile                    |   1 +
 drivers/mfd/tps65219.c                  | 357 ++++++++++++++++++++++++
 include/linux/mfd/tps65219.h            | 345 +++++++++++++++++++++++
 10 files changed, 996 insertions(+)
 create mode 100644 drivers/input/misc/tps65219-pwrbutton.c
 create mode 100644 drivers/mfd/tps65219.c
 create mode 100644 include/linux/mfd/tps65219.h

-- 
2.37.2

