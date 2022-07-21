Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28DAB57CD2A
	for <lists+linux-omap@lfdr.de>; Thu, 21 Jul 2022 16:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbiGUORl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 Jul 2022 10:17:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbiGUORk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 21 Jul 2022 10:17:40 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 738B67FE66;
        Thu, 21 Jul 2022 07:17:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 26041B82472;
        Thu, 21 Jul 2022 14:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B43FDC3411E;
        Thu, 21 Jul 2022 14:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658413056;
        bh=Eh2C4aITvaLQEiGsMNBpPw6UurolrVcixN6eqDOt2PM=;
        h=From:To:Cc:Subject:Date:From;
        b=Glhv+SQqG16r77ENTWknlvdgnUqsROh3K2+kcJElNGOzjsG5CpgSR8GbATdrAf+wN
         crFyRQQD/z6p3m/dnqIELnlsoZZ3PJRfUSuDuHkOfWNH6X8BJf9B1Isn7jHXbTIp68
         AjLll/6qf/ATI1IWmgwSwcKCZVXYFv6nYHcDVQyZYdF9eulli5++DWmmpkWScEfnZ2
         2VSDzAVzSsyJs4wnW9g004w+rlMpGzYrCYBKplJK82MOCmxQZQLVybJQWgUNJyV6ZQ
         Z/OSljQwvoz0GXqd7c7t8vJg9U18B/qhLHXWMQq7bxtPT5Q05Xsm2i5XUe8b9u2evY
         d5XWobATRivFA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Dan Williams <dan.j.williams@intel.com>,
        Daniel Mack <daniel@zonque.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Kristoffer Ericson <kristoffer.ericson@gmail.com>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Laurence de Bruxelles <lfdebrux@gmail.com>,
        Lennert Buytenhek <buytenh@wantstofly.org>,
        Linus Walleij <linusw@kernel.org>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Lukasz Majewski <lukma@denx.de>, Marc Zyngier <maz@kernel.org>,
        Mauri Sandberg <maukka@ext.kapsi.fi>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        linux-omap@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH 00/13] ARM: mark most boards as unused
Date:   Thu, 21 Jul 2022 16:17:09 +0200
Message-Id: <20220721141722.2414719-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Based on the recent mailing list discussion I started [1], I have now
turned the findings into a set of patches that marks most board files as
'depends on UNUSED_BOARD_FILES', leaving only 38 of the 196 boards.

Please double-check the lists for each platform to make sure I got the
right set. The only functional change here is in the Kconfig dependencies,
so I would still apply this as a late fix for the coming merge window,
to give any remaining users the most time to run into this and speak up
in case any of these boards are actually still in use.

    Arnd

[1] https://lore.kernel.org/linux-arm-kernel/CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com/

Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Daniel Mack <daniel@zonque.org>
Cc: Gregory Clement <gregory.clement@bootlin.com>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Cc: Krzysztof Halasa <khalasa@piap.pl>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Laurence de Bruxelles <lfdebrux@gmail.com>
Cc: Lennert Buytenhek <buytenh@wantstofly.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Lubomir Rintel <lkundrak@v3.sk>
Cc: Lukasz Majewski <lukma@denx.de>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mauri Sandberg <maukka@ext.kapsi.fi>
Cc: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Sekhar Nori <nsekhar@ti.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org

Arnd Bergmann (13):
  ARM: add ATAGS dependencies to non-DT platforms
  ARM: add CONFIG_UNUSED_BOARD_FILES
  ARM: pxa: add Kconfig dependencies for ATAGS based boards
  ARM: orion: add ATAGS dependencies
  ARM: davinci: mark all ATAGS board files as unused
  ARM: ep93xx: mark most board files as unused
  ARM: mmp: mark all board files for removal
  ARM: footbridge: mark cats board for removal
  ARM: sa1100: mark most boards as unused
  ARM: omap1: add Kconfig dependencies for unused boards
  ARM: s3c: mark most board files as unused
  ARM: iop32x: mark as unused
  ARM: cns3xxx: add CONFIG_UNUSED_BOARD_FILES dependency

 arch/arm/Kconfig                          | 21 ++++++-
 arch/arm/configs/badge4_defconfig         |  1 +
 arch/arm/configs/cerfcube_defconfig       |  1 +
 arch/arm/configs/cm_x300_defconfig        |  1 +
 arch/arm/configs/cns3420vb_defconfig      |  1 +
 arch/arm/configs/colibri_pxa270_defconfig |  1 +
 arch/arm/configs/colibri_pxa300_defconfig |  1 +
 arch/arm/configs/corgi_defconfig          |  1 +
 arch/arm/configs/davinci_all_defconfig    | 11 ----
 arch/arm/configs/ep93xx_defconfig         |  9 ---
 arch/arm/configs/eseries_pxa_defconfig    |  1 +
 arch/arm/configs/ezx_defconfig            |  1 +
 arch/arm/configs/footbridge_defconfig     |  1 -
 arch/arm/configs/h5000_defconfig          |  1 +
 arch/arm/configs/hackkit_defconfig        |  1 +
 arch/arm/configs/iop32x_defconfig         |  1 +
 arch/arm/configs/jornada720_defconfig     |  1 +
 arch/arm/configs/lart_defconfig           |  1 +
 arch/arm/configs/lpd270_defconfig         |  1 +
 arch/arm/configs/lubbock_defconfig        |  1 +
 arch/arm/configs/magician_defconfig       |  1 +
 arch/arm/configs/mainstone_defconfig      |  1 +
 arch/arm/configs/mini2440_defconfig       |  1 +
 arch/arm/configs/mmp2_defconfig           |  5 +-
 arch/arm/configs/multi_v5_defconfig       | 17 -----
 arch/arm/configs/mv78xx0_defconfig        |  1 +
 arch/arm/configs/mvebu_v5_defconfig       |  8 ---
 arch/arm/configs/omap1_defconfig          |  9 ---
 arch/arm/configs/orion5x_defconfig        | 13 ----
 arch/arm/configs/palmz72_defconfig        |  1 +
 arch/arm/configs/pcm027_defconfig         |  1 +
 arch/arm/configs/pleb_defconfig           |  1 +
 arch/arm/configs/pxa255-idp_defconfig     |  1 +
 arch/arm/configs/pxa3xx_defconfig         |  7 +--
 arch/arm/configs/pxa_defconfig            | 77 ++++-------------------
 arch/arm/configs/s3c2410_defconfig        |  1 +
 arch/arm/configs/s3c6400_defconfig        |  9 ---
 arch/arm/configs/shannon_defconfig        |  1 +
 arch/arm/configs/simpad_defconfig         |  1 +
 arch/arm/configs/tct_hammer_defconfig     |  1 +
 arch/arm/configs/trizeps4_defconfig       |  1 +
 arch/arm/configs/viper_defconfig          |  1 +
 arch/arm/configs/xcep_defconfig           |  1 +
 arch/arm/configs/zeus_defconfig           |  1 +
 arch/arm/mach-cns3xxx/Kconfig             |  1 +
 arch/arm/mach-davinci/Kconfig             |  8 +++
 arch/arm/mach-dove/Kconfig                |  1 +
 arch/arm/mach-ep93xx/Kconfig              | 10 +++
 arch/arm/mach-footbridge/Kconfig          |  1 +
 arch/arm/mach-iop32x/Kconfig              |  1 +
 arch/arm/mach-mmp/Kconfig                 |  9 +++
 arch/arm/mach-mv78xx0/Kconfig             |  1 +
 arch/arm/mach-omap1/Kconfig               | 11 ++++
 arch/arm/mach-orion5x/Kconfig             | 17 +++++
 arch/arm/mach-pxa/Kconfig                 | 53 ++++++++++++++++
 arch/arm/mach-s3c/Kconfig.s3c24xx         |  2 +-
 arch/arm/mach-s3c/Kconfig.s3c64xx         | 20 +++---
 arch/arm/mach-sa1100/Kconfig              | 11 ++++
 58 files changed, 199 insertions(+), 166 deletions(-)

-- 
2.29.2

