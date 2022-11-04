Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 008D3619B5F
	for <lists+linux-omap@lfdr.de>; Fri,  4 Nov 2022 16:23:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbiKDPXY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Nov 2022 11:23:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbiKDPXW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Nov 2022 11:23:22 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E45311FCE1
        for <linux-omap@vger.kernel.org>; Fri,  4 Nov 2022 08:23:19 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id p16so3228243wmc.3
        for <linux-omap@vger.kernel.org>; Fri, 04 Nov 2022 08:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ffzbfhF3JArv7StgArm/RAFAqMlZRvQlnFlIWw7AfHE=;
        b=u9WdLqJ7Y3Il1XZzawnfIogEzoT2KbWmJgZrl4NV5G82E3vrA85NkOLlEXuzyRGFr3
         RihCxDkNrspkw0QbcklMFaFzNg7gsE1LS4YsXr8KGyjLe4gV6n/D3GoXOOMrCBbRk8cJ
         g9lbLIK6YjwTkNnj8mYV0mVhvMtazHkScwLA9hh8kuPdcrssApjroi5DsFQq43efJ97n
         ZIqMZX9iCBlvK4VCnDYrma7ECAp3qGzE/K2hzrSffcpTIkweNxvfyXb4ITE350tP23Ly
         cJcMx3JL77Wwf7OdjQwVbPkoQqxBeglYDyvqIRqSEkrqtdOOVPFhgQxVPxM704fjGRo6
         JAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ffzbfhF3JArv7StgArm/RAFAqMlZRvQlnFlIWw7AfHE=;
        b=pgBP7nTlkOTi8NPIz9oU8pWu5EmFPZFp2c7LFZ6TVZQGCZmdfXWFCxVX/zwSYpm0pp
         o/zSWIns+erazfBCS//d6ddK5ItDx93wu+nCw5c4+JZcXYohCc5OyOoM8SHecZesWKix
         G19BfRjmdy79UdmMf+NImpwj/Gl0Wiv7eCfZgzSInxZdDdOt1cqE3YeLdleJHwuzTjQC
         4SL/qGEuAermDdhNbf2F85qXwAbXWM3yl2BidSQyEeviroGL+2qEiXy9Ggr9XXsqhrsL
         TLur2qIsaVAtHTTRQJtQKMMW+beewUdC9JK3Xzy53mXPVbyz/RsmUJZQd+gh1mENFKqR
         oZqg==
X-Gm-Message-State: ACrzQf3rTBG1pele/QuAsfozRQ68GVsgp4vQbDKyo7K3+WkMZ6sIaRGL
        hp8aMoWSjT3wo4Kia8OJpfNcOA==
X-Google-Smtp-Source: AMsMyM45TVc9nPqMJY2z6TPt7mcR5KZMm/yEkKf6aLpRWwtO/5VCzvKONKn6EGt02j+W+L5GApDM2w==
X-Received: by 2002:a05:600c:3c8e:b0:3b4:d224:addf with SMTP id bg14-20020a05600c3c8e00b003b4d224addfmr34469845wmb.132.1667575398358;
        Fri, 04 Nov 2022 08:23:18 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id l41-20020a05600c08a900b003b4935f04a4sm3689764wmp.5.2022.11.04.08.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 08:23:17 -0700 (PDT)
From:   Jerome Neanne <jneanne@baylibre.com>
To:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        nm@ti.com, kristo@kernel.org, dmitry.torokhov@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, catalin.marinas@arm.com,
        will@kernel.org, lee@kernel.org, tony@atomide.com, vigneshr@ti.com,
        shawnguo@kernel.org, geert+renesas@glider.be,
        dmitry.baryshkov@linaro.org, marcel.ziswiler@toradex.com,
        vkoul@kernel.org, biju.das.jz@bp.renesas.com, arnd@arndb.de,
        jeff@labundy.com
Cc:     afd@ti.com, khilman@baylibre.com, narmstrong@baylibre.com,
        msp@baylibre.com, j-keerthy@ti.com, jneanne@baylibre.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v7 0/6] Add support for TI TPS65219 PMIC.
Date:   Fri,  4 Nov 2022 16:23:05 +0100
Message-Id: <20221104152311.1098603-1-jneanne@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Jerome NEANNE <jneanne@baylibre.com>

Hi everyone,

bindings and regulator are already there, it has been rebased on master
6.1:
git@github.com:torvalds/linux.git
commit 8f71a2b3f435f29b787537d1abedaa7d8ebe6647

All review feedback have been integrated.

Changes in v7:
- defconfig: change commit message to indicate why (Krzysztof Kozlowski).
- mfd: integrate all feedback from Lee Jones and Biju Das.  

Regards,
Jerome

Previous versions:i
v6 - https://lore.kernel.org/all/20221011140549.16761-1-jneanne@baylibre.com/
v5 - https://lore.kernel.org/lkml/20220913121419.15420-1-jneanne@baylibre.com/
v4 - https://lore.kernel.org/lkml/20220825150224.826258-1-msp@baylibre.com/
v3 - https://lore.kernel.org/lkml/20220805121852.21254-1-jneanne@baylibre.com/
v2 - https://lore.kernel.org/lkml/20220726103355.17684-1-jneanne@baylibre.com/
v1 - https://lore.kernel.org/lkml/20220719091742.3221-1-jneanne@baylibre.com/

Jerome NEANNE (1):
  DONOTMERGE: arm64: dts: ti: Add TI TPS65219 PMIC support for AM642 SK
    board.

Jerome Neanne (4):
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
 drivers/mfd/tps65219.c                  | 299 ++++++++++++++++++++
 include/linux/mfd/tps65219.h            | 345 ++++++++++++++++++++++++
 10 files changed, 937 insertions(+)
 create mode 100644 drivers/input/misc/tps65219-pwrbutton.c
 create mode 100644 drivers/mfd/tps65219.c
 create mode 100644 include/linux/mfd/tps65219.h

-- 
2.25.1

