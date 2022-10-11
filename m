Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D14755FB41A
	for <lists+linux-omap@lfdr.de>; Tue, 11 Oct 2022 16:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbiJKOGD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Oct 2022 10:06:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbiJKOGA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Oct 2022 10:06:00 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 311468B2DA
        for <linux-omap@vger.kernel.org>; Tue, 11 Oct 2022 07:05:56 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id l32so1055444wms.2
        for <linux-omap@vger.kernel.org>; Tue, 11 Oct 2022 07:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JcaFOKZyiS3+I2osyalTT+TO0sy9sHe6rL6zc8VNAUU=;
        b=Qb8JETzFWj62avgqJnKeCBzLel/wA3p733CwJz8qtRjZ79GeqOp/HRtwpk6dFn2kqE
         lh6awZJ1Uerm/QHQXpU0uUsA89pk4UlfayQWlQpC76Kkxsp8Ca877TBI3Y9ElzJ3+JbM
         N5lpzkzvK52OoQ38LlWh2D8iRgX6pQfoYu3GXFLFDVCJAr1GwZfnTPVaR4VcFtNRmSUd
         JOi0SnpaMph+pBxDYHazUEPIxnhiGvbGVkuEV0GUhjmmrGwVFbGAzzy04xEErsVWyJOB
         BAj9yI0fVXLmEIZKGPuq6EF3G3JP2zjdBjo10mvj6T8xVBRvvxbWpnM6fKQsvVb2iS+0
         0O3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JcaFOKZyiS3+I2osyalTT+TO0sy9sHe6rL6zc8VNAUU=;
        b=SBmMMfwsWmVg7ES5FPwNleqsSN6QQcklmONwP5NV61SFIJ77CVBA1vNENmGZhbDWAg
         +NxW5lSPYr30Y1z+j4Rd6KdHq++8ZiMStC+O7luDW3qaMhy1vAq49vCLEryNVjqNaPKQ
         507mh1HNPCO0QHp4C+Usx5EcsSDGKVG29wFkGxilVjpZCm+ZxOyWGbe23v10Big2daGs
         uGdVRtNeKpDXO8wXJOJr6e8fcbdGoxeI6yhri0D2FaGJQcmUAqZKdsd+lsPq505zNjUf
         CRgd4ePCA7z1pOGqu0G+Huroe968vmYC+u5HQdWQVXjGUqD+RaWPb1i/RTFqrjdWCPIH
         0u8A==
X-Gm-Message-State: ACrzQf0LjhD9wvC1nVBAV6+4CBfpyJ22ua5+afFKG2YgsuWRT9kRfy2X
        3d2Wfeeb3+b3oOOvjqDOgSIIIg==
X-Google-Smtp-Source: AMsMyM51kNiy2OQX6zFt2Ln9Qp8sp2w2oHjrFzWWJ5n7mgfX/EzIc4GEtVta1JL+fuztvdtzrpURkA==
X-Received: by 2002:a05:600c:a09:b0:3b9:f70f:aa72 with SMTP id z9-20020a05600c0a0900b003b9f70faa72mr23744191wmp.97.1665497155263;
        Tue, 11 Oct 2022 07:05:55 -0700 (PDT)
Received: from localhost.localdomain (192.201.68.85.rev.sfr.net. [85.68.201.192])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d44c2000000b0022e55f40bc7sm11437453wrr.82.2022.10.11.07.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 07:05:54 -0700 (PDT)
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
Subject: [PATCH v6 0/6] Add support for TI TPS65219 PMIC.
Date:   Tue, 11 Oct 2022 16:05:43 +0200
Message-Id: <20221011140549.16761-1-jneanne@baylibre.com>
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

bindings and regulator are already there as it is based on the regulator tree branch for-6.1:
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git
All review feedback except one have been integrated in v5. Waiting ack/nack for mfd part. 

Changes in v6:
- Remove not needed dev assignment reported by Dmitry Torokhov in Input. 

Regards,
Jerome

Previous versions:
v5 - https://lore.kernel.org/lkml/20220913121419.15420-1-jneanne@baylibre.com/
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
 drivers/input/misc/tps65219-pwrbutton.c | 148 ++++++++++
 drivers/mfd/Kconfig                     |  14 +
 drivers/mfd/Makefile                    |   1 +
 drivers/mfd/tps65219.c                  | 320 ++++++++++++++++++++++
 include/linux/mfd/tps65219.h            | 345 ++++++++++++++++++++++++
 10 files changed, 958 insertions(+)
 create mode 100644 drivers/input/misc/tps65219-pwrbutton.c
 create mode 100644 drivers/mfd/tps65219.c
 create mode 100644 include/linux/mfd/tps65219.h

-- 
2.17.1

