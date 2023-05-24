Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8319C70F742
	for <lists+linux-omap@lfdr.de>; Wed, 24 May 2023 15:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbjEXNHS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 May 2023 09:07:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232326AbjEXNHR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 24 May 2023 09:07:17 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D51C990
        for <linux-omap@vger.kernel.org>; Wed, 24 May 2023 06:07:15 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-565014fc2faso12530787b3.1
        for <linux-omap@vger.kernel.org>; Wed, 24 May 2023 06:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684933635; x=1687525635;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7T2td/HP9EXHaURHSmB+HEKZGzkbT+5xCwINot9A/Zw=;
        b=yi4ylD8eJiuNjIP4eECWuk48rWL8P+wmAU25nBZw8BFzcQxO/1sEfVaA4MIDtb6MS4
         6/0f5keWIZkT3bhRaOiauFkWFsWhIw7oytk+6wcwpw2KIEN2qo9IBdrVTCprGDuqNHZa
         NyrQBt5ZOzZJPwqY51BH8KDf2207rT44nuK64dPXCtudLUrHyWwtQS2jzJXLne6uTAK3
         YnNH2yVpOv4leOAwC4ti6kylg8HxCXWiqleqTRgjXHl8AZ9oYBMXJINWS50kU7rgdds2
         jVbpKicozPdhF8/H3MSha9f3LfVDSYTVjhvp1PK8TtBpwjSxnOJ3zAPNVlzR3b/UOU95
         koWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684933635; x=1687525635;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7T2td/HP9EXHaURHSmB+HEKZGzkbT+5xCwINot9A/Zw=;
        b=NEr7lAyLPFd+en1eRX2pLk46txe0WoYeaZ4IxZgdFLoc2LgDg5Mi4lcmfHG9HbyX8Z
         z8gXYsLb/A9a6zOBSlFgQ6FjZxTlBIyWSGZc26LWQ7y44OHRvoeo76KeET8Y8fRikLpK
         XP5+9h4oR7eRCa0tZkqWQ5O+f8QAiIF8x4+f4xysLSreZ/WbOEPTeTTZwjd2D5EcE1oV
         om3FswxOdYAXJ44HnZKcxUYtjSONLiWTQJXhESi6btC99d/23i+N1GErm9sUBINHQsFu
         kurId2usHzq6WzT/M1KiwlordEd5q9fTQGIxteJrFi3Nh4SJjsoVL7icbmtrioFf4qNP
         AzVg==
X-Gm-Message-State: AC+VfDyJO4/V7rh7epvGGzWm2FidLaU5y1cNeFWJfeGZsmGR+3hUx7B3
        aORoJ56OjL9VG9vlKaNCmLVpLCDhApGbhOQYX/DgBQ==
X-Google-Smtp-Source: ACHHUZ7V57h9injTXnZtjgFdZ71gBB4fHagZfU55PK9k8FuPbaFmWuRLP+stVoaf5OMAO0zgAhir1Y7zuTPJQeqN7sg=
X-Received: by 2002:a0d:ccd3:0:b0:562:7f3:beee with SMTP id
 o202-20020a0dccd3000000b0056207f3beeemr19710027ywd.45.1684933634934; Wed, 24
 May 2023 06:07:14 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 24 May 2023 15:07:03 +0200
Message-ID: <CACRpkdbtE9yfx9kZqGwsHim91WsxHERecrGwjnr6TQpCUMsQwg@mail.gmail.com>
Subject: [GIT PULL] OMAP GPIO numbers cleanup
To:     SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        ext Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi SoC maintainers,

please pull in this cleanup of the OMAP board files removing all
usage of the global GPIO numberspace.

It's reasonably reviewed and tested, any remaining issues can
be smoked out in-tree.

Required subsystem maintainer ACKs are in place.

Yours,
Linus Walleij

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-omap-descriptors-v6.5

for you to fetch changes up to 8e0285ab95a9baf374f2c13eb152221c8ecb3f28:

  ARM/musb: omap2: Remove global GPIO numbers from TUSB6010
(2023-05-24 15:01:59 +0200)

----------------------------------------------------------------
This removes all usage of global GPIO numbers from
arch/arm/mach-omap[12].

The patches have been reviewed and tested by everyone
who showed interest which was one person that tested
on OSK1 and Nokia 770, and we smoked out the bugs and
also addressed all review comments.

Any remaining problems can certainly be fixed in-tree.

----------------------------------------------------------------
Linus Walleij (13):
      ARM/mfd/gpio: Fixup TPS65010 regression on OMAP1 OSK1
      ARM: omap1: Drop header on AMS Delta
      ARM: omap1: Remove reliance on GPIO numbers from PalmTE
      ARM: omap1: Remove reliance on GPIO numbers from SX1
      Input: ads7846 - Convert to use software nodes
      ARM/mmc: Convert old mmci-omap to GPIO descriptors
      ARM: omap1: Fix up the Nokia 770 board device IRQs
      ARM: omap1: Make serial wakeup GPIOs use descriptors
      ARM: omap1: Exorcise the legacy GPIO header
      ARM/gpio: Push OMAP2 quirk down into TWL4030 driver
      ARM: omap2: Get USB hub reset GPIO from descriptor
      ARM: omap2: Rewrite WLAN quirk to use GPIO descriptors
      ARM/musb: omap2: Remove global GPIO numbers from TUSB6010

 arch/arm/mach-omap1/board-ams-delta.c   |   1 -
 arch/arm/mach-omap1/board-nokia770.c    | 207 ++++++++++++++++++++------------
 arch/arm/mach-omap1/board-osk.c         | 146 +++++++++++++++-------
 arch/arm/mach-omap1/board-palmte.c      |  51 +++++---
 arch/arm/mach-omap1/board-sx1-mmc.c     |   1 -
 arch/arm/mach-omap1/board-sx1.c         |  40 ++++--
 arch/arm/mach-omap1/devices.c           |   1 -
 arch/arm/mach-omap1/gpio15xx.c          |   1 -
 arch/arm/mach-omap1/gpio16xx.c          |   1 -
 arch/arm/mach-omap1/irq.c               |   1 -
 arch/arm/mach-omap1/serial.c            |  30 ++---
 arch/arm/mach-omap2/board-n8x0.c        | 156 +++++++-----------------
 arch/arm/mach-omap2/omap_device.c       |   1 -
 arch/arm/mach-omap2/pdata-quirks.c      | 132 ++++++++++----------
 arch/arm/mach-omap2/usb-tusb6010.c      |  20 +--
 arch/arm/mach-omap2/usb-tusb6010.h      |  12 ++
 arch/arm/mach-pxa/spitz.c               |  11 +-
 arch/mips/alchemy/devboards/db1000.c    |  11 +-
 drivers/gpio/gpio-twl4030.c             |  52 +++++---
 drivers/input/touchscreen/ads7846.c     | 113 +++++++----------
 drivers/mfd/tps65010.c                  |  14 +--
 drivers/mmc/host/omap.c                 |  46 ++++++-
 drivers/usb/musb/musb_core.c            |   1 -
 drivers/usb/musb/musb_core.h            |   2 -
 drivers/usb/musb/tusb6010.c             |  53 +++++---
 drivers/video/fbdev/omap/lcd_mipid.c    |  10 ++
 include/linux/mfd/tps65010.h            |  11 +-
 include/linux/mfd/twl.h                 |   3 -
 include/linux/platform_data/lcd-mipid.h |   2 -
 include/linux/platform_data/mmc-omap.h  |   2 -
 include/linux/spi/ads7846.h             |   2 -
 include/linux/usb/musb.h                |  13 --
 32 files changed, 636 insertions(+), 511 deletions(-)
 create mode 100644 arch/arm/mach-omap2/usb-tusb6010.h
