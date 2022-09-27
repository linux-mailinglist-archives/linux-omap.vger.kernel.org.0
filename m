Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 794E05EBD6A
	for <lists+linux-omap@lfdr.de>; Tue, 27 Sep 2022 10:36:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbiI0IgP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Sep 2022 04:36:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231663AbiI0Ifl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 27 Sep 2022 04:35:41 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B130412A81
        for <linux-omap@vger.kernel.org>; Tue, 27 Sep 2022 01:35:27 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id o5so6061992wms.1
        for <linux-omap@vger.kernel.org>; Tue, 27 Sep 2022 01:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Wgzj4PEma5PTYVT9ZoB1Xyd1riKSuBv/hZE/DnlehtA=;
        b=dhVS1R/5nouuaVhxiWKee3goPDCx1/Zb9H2ran+I5j0m2f/soQPt4tau/DCtke8DZm
         4tBmSjPN0W1R9SKYH9wUMzPLh1tX8y+BnNwHfTpef6y2CDRXBzNvs97wqjVWvlqoZrFy
         blZQ65qCmymBjpQHysBpwu115sn2FUuN3LdFdXAIqZjivi0d6fevLy5hUG53mnVJUsZs
         bdtP8v8lVNRm4qMb1moZdTUGMUxVTz9SAC0Bk7nrywjzujjX0G64n7WH2poxOmXf3BHh
         b4z11LEac58P31f438pempIAe+4VozUWPkCHGtNjOKZ9nkWyzXxQyZmMDcEUzkub/UCG
         Lbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Wgzj4PEma5PTYVT9ZoB1Xyd1riKSuBv/hZE/DnlehtA=;
        b=ysyLxlU7Nwt7tLJx11y4aERwCsy3EWxG/cQ5yZuUE0GqYqgXtqrkSHg9K35eSnouFU
         MdEtH8aYvV+OjUDF8XyWqBmwkF9M3Uefuq7Bh4I370tSChnUa3rGtx/VdS5v7lt4zXMN
         Slu5rW+qpj1bMQbTb+ml+csQlF81jPhuo9L/iboxiHpWjE5WHo5ab75Wn873f8EtZiap
         l1cHLV7353J/WfCFYeDtlRQQuVV0QtHOeM3mP9OA6j6eUXcA8eS0PPKCVAdCPv7ANlA/
         82VmIOBcTsWHvEOzvkFlw4Cxy6h08DtK5vWGGHyFv5A8R/93/Y1HPiiSG/jAwjSAeSj0
         7/jQ==
X-Gm-Message-State: ACrzQf2MMGADqKxPd+IE8wNprePdVvLeELKfHBv60owXpe3PKODkOpmv
        laQjsW+tUeHE/l75wB4KH0XReQ==
X-Google-Smtp-Source: AMsMyM7xzvDY5xB8UD85ebsPVp6soLExVLIxGPsyigmSohRtp+2G9pnLZ+jOaw80MTkGpyYvAt5A0A==
X-Received: by 2002:a7b:c40e:0:b0:3b3:3faa:10c2 with SMTP id k14-20020a7bc40e000000b003b33faa10c2mr1776728wmi.32.1664267726249;
        Tue, 27 Sep 2022 01:35:26 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b003b492b30822sm1122120wmr.2.2022.09.27.01.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 01:35:25 -0700 (PDT)
From:   Jerome Neanne <jneanne@baylibre.com>
To:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        nm@ti.com, kristo@kernel.org, dmitry.torokhov@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, catalin.marinas@arm.com,
        will@kernel.org, lee@kernel.org, tony@atomide.com, vigneshr@ti.com,
        bjorn.andersson@linaro.org, shawnguo@kernel.org,
        geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
        marcel.ziswiler@toradex.com, vkoul@kernel.org,
        biju.das.jz@bp.renesas.com, arnd@arndb.de, jeff@labundy.com
Cc:     afd@ti.com, khilman@baylibre.com, narmstrong@baylibre.com,
        msp@baylibre.com, j-keerthy@ti.com, jneanne@baylibre.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v5 0/6] Add support for TI TPS65219 PMIC.
Date:   Tue, 27 Sep 2022 10:35:14 +0200
Message-Id: <20220927083520.15766-1-jneanne@baylibre.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi everyone,

Sending again v5 changing deprecated mail for Lee Jones.
bindings and regulator are already there as it is based on the regulator tree branch for-6.1:
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git

Changes in v5:
- Remove pm_power_off functionality as it is unused in ARM64 systems
- Change mfd subject to prefixes matching subsystem

Validation:
regulator: tps65219: Fix .bypass_val_on setting
reported by Axel Lin has been validated on board. 

Regards,
Jerome

Previous versions:
v4 - https://lore.kernel.org/lkml/20220825150224.826258-1-msp@baylibre.com/
v3 - https://lore.kernel.org/lkml/20220805121852.21254-1-jneanne@baylibre.com/
v2 - https://lore.kernel.org/lkml/20220726103355.17684-1-jneanne@baylibre.com/
v1 - https://lore.kernel.org/lkml/20220719091742.3221-1-jneanne@baylibre.com/


Jerome Neanne (5):
  DONOTMERGE: arm64: dts: ti: Add TI TPS65219 PMIC support for AM642 SK
    board.
  DONOTMERGE: arm64: dts: ti: Add pinmux and irq mapping for TPS65219
    external interrupts
  DONOTMERGE: arm64: dts: ti: k3-am642-sk: Enable tps65219 power-button
  mfd: tps65219: Add driver for TI TPS65219 PMIC
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
 drivers/mfd/tps65219.c                  | 320 ++++++++++++++++++++++
 include/linux/mfd/tps65219.h            | 345 ++++++++++++++++++++++++
 10 files changed, 959 insertions(+)
 create mode 100644 drivers/input/misc/tps65219-pwrbutton.c
 create mode 100644 drivers/mfd/tps65219.c
 create mode 100644 include/linux/mfd/tps65219.h

-- 
2.17.1

