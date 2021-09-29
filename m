Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2934D41BB92
	for <lists+linux-omap@lfdr.de>; Wed, 29 Sep 2021 02:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbhI2AJU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Sep 2021 20:09:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbhI2AJT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Sep 2021 20:09:19 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C00FCC06161C
        for <linux-omap@vger.kernel.org>; Tue, 28 Sep 2021 17:07:39 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id z6-20020a056214060600b0037a3f6bd9abso2563327qvw.3
        for <linux-omap@vger.kernel.org>; Tue, 28 Sep 2021 17:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=7bhHNrTbsYTqBLjHn1hrc5X3bZzxwJdrljl1/EisLbY=;
        b=SFhQ44BEJvgZXM6Y3b8tJZsJVKICkrX+cWoxn4bjqC2mJRMaLw4+CVQZwT428ZQVKj
         vo8dtohZv8E8JOCNJC1+VtMvhM9rM4fzGcrEZwFVOjZGBQszHQfDrWEx4r3m7AB8kT4P
         VtCwFEUlgOGc3GFKkdJA/FIh1CpYSCTl7U3hzUk8EUVoPFZ+/UXjzr4ryIUkYbE4ERvX
         7FlwQoXubV/0ubzcWcwpUNs4t61aWfq2FGaFVr15uLaavAEiZio8P4X7LcCzXyz63Dmf
         +CmAYkmlBNJTqdfIcNTM4vFZ6GyoHas+dKz3n+r769jAFgbjqcWYOvewAX7WZUdQ+h9A
         QGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=7bhHNrTbsYTqBLjHn1hrc5X3bZzxwJdrljl1/EisLbY=;
        b=pVAh2owa32OE3/NAFeRkTdo7ZR0TfNPolMAmRiHSi+LVD39x0BeUFby8+tavuiXymT
         kuUkSMg+Kl14UMfQJUsxsbQBW3FUBYGB4WbEbYZ1lxexgzVqsKYDpfMOqYFM3iI59taj
         5NM9kFjwbI4+msM7ILizDKgJGUwcx3WonCU1i6pwUeglBXDMgVpeWKl4FP32qn6BKejK
         cisk3FBnhBWI9sHSpEPYvQsCAc38p+somaAXNh/xPK3GZHuDml7mrchHdxu7WZeOA/Ij
         RhCjtvgxsHsuYkCkvXzmzf1octE8Zu50sTemfIE/w9hub5LlrQZDH/bmMqPhbwjKhpCT
         H85g==
X-Gm-Message-State: AOAM531DlNV7sGv/RCEYqHXij+QcQkXTWrghiOsW+93+Q8muz2NXO8vE
        kt9inBqh8ZoH7pvU7mpSxN3Pu+IxoHj5cV4=
X-Google-Smtp-Source: ABdhPJye4QI1NEVEPWMBOPRbcvbdZVtnBhd3yJ370PIHC8VFWHXatkZn+kG3+hbWIbfGsm/EDJi2ogilCFhtxyw=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:5241:a7e9:90c9:9c91])
 (user=saravanak job=sendgmr) by 2002:ad4:4652:: with SMTP id
 y18mr8331213qvv.31.1632874058881; Tue, 28 Sep 2021 17:07:38 -0700 (PDT)
Date:   Tue, 28 Sep 2021 17:07:32 -0700
Message-Id: <20210929000735.585237-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
Subject: [PATCH v4 0/2] Fix simple-bus issues with fw_devlink
From:   Saravana Kannan <saravanak@google.com>
To:     Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, kernel-team@android.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Ulf reported an issue[1] with fw_devlink. This series tries to fix that
issue.

I replicated a similar set up on my end and I confirmed:
- A simple-bus only device is probed.
- Another device listing simple-bus as a 2nd compatible string isn't
  probed.

v1->v2:
- Switched to probing the simple-bus device instead of marking it as
  NEVER_PROBES.

v2->v3:
- Moved all the code into the simple-pm-bus driver
- Addressed Ulf's comment about the remove() code missing a check.

v3->v4:
- Added support for driver_override to accommodate the case where new
  transparent bus compatible strings are added to DT, but the kernel hasn't
  been updated yet.
- Added/updated comments to give more details.
- Adding Ulf's Tested-by that he have for v3 (v4 didn't change by much).

Thanks,
Saravana
[1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/

Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh+dt@kernel.org>

Saravana Kannan (2):
  drivers: bus: simple-pm-bus: Add support for probing simple bus only
    devices
  drivers: bus: Delete CONFIG_SIMPLE_PM_BUS

 arch/arm/configs/multi_v7_defconfig |  1 -
 arch/arm/configs/oxnas_v6_defconfig |  1 -
 arch/arm/configs/shmobile_defconfig |  1 -
 arch/arm/mach-omap2/Kconfig         |  1 -
 arch/arm64/configs/defconfig        |  1 -
 drivers/bus/Kconfig                 | 12 ---------
 drivers/bus/Makefile                |  2 +-
 drivers/bus/simple-pm-bus.c         | 42 ++++++++++++++++++++++++++---
 drivers/soc/canaan/Kconfig          |  1 -
 9 files changed, 40 insertions(+), 22 deletions(-)

-- 
2.33.0.685.g46640cef36-goog

