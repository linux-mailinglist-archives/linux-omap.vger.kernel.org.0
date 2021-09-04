Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFFE840089B
	for <lists+linux-omap@lfdr.de>; Sat,  4 Sep 2021 02:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350668AbhIDAGs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 3 Sep 2021 20:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240571AbhIDAGs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 3 Sep 2021 20:06:48 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73920C061757
        for <linux-omap@vger.kernel.org>; Fri,  3 Sep 2021 17:05:47 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id e6-20020ac84e46000000b0029baad9aaa0so2258091qtw.11
        for <linux-omap@vger.kernel.org>; Fri, 03 Sep 2021 17:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=mjzKqamzQmvzyqlVvUVvv6P1c+/kEZztjTn7I8qHctk=;
        b=VZ4p+EFnl9EXauvJ8dhmEDRVt8YHYnMZhZvV6h6nXYpS8v+LDxHvFjqrQR9eLsDsYy
         RHTaYj0wnWluvQm7nCyFHpVTY4X8aSkLuiIkTyUOtezLSN/w1eSH1tjAyXzk6Y6V+daF
         nD4NShWbq6Z7Q6wGJuPFkSLi3XRYi3l8fI7h5O9yxld6cQp6X5zUN7AIWAQFMwtKXCyM
         HXp04mNEFZ5P1u4dqby0/DAT3CrpF/59RTQZHoVwcvbSNnALUImixWgqC+Qcatbmm+Bl
         8cGxwkxOX9xAhBKt/slNqZhBiHfmq1ksDBxjPaOWBySvhq6EsQwZdcMREHamx96DGzud
         O5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=mjzKqamzQmvzyqlVvUVvv6P1c+/kEZztjTn7I8qHctk=;
        b=PTaoO9ZkrKglSb70VMqBZlBhgfrVVdOu7lif9qdM8eucOkDH6WqnTF7amnsSCE4bXH
         KoRtVa1+kWmKljaaBOe0W7gHMyhYvUJpNvtUfVTeRYeacaUYgeT7zRfgR9MAF/rKSSSY
         pFlaqTCBBOwRynqcaA6+WMV0OpfQ9qDvVmNyLMv5ZDqfCmhWom07fBB0iPrxNcXdGS9N
         b2xMl48gsKDKK3LSyCNc4L/Lc13SxtkFSBriX3MCQ9P6EvwYJojK4Zr92ExIilIe5/5A
         jKAH5dE95zHKl1iciyudDVu7vHZRBOA/Qkm7xtmiN93r8L4K7eO0LykdeZvmnXHcdOIK
         qCew==
X-Gm-Message-State: AOAM530kAKX9rXw7PhKcpeZgOxCU8UmR5Fl+G6N3atdsuehBSUJHhA7C
        zDppGrX7oLvwxFWNpzSOpzNWEueeZPfPTe0=
X-Google-Smtp-Source: ABdhPJxOh60dMGR+lUVir1U4lfhdWRVMUcj5x6W1LTUnNO5wGwN2dFR8tfzyyVUJVXZoWiFU6/iKXpuDy2rgCWU=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:b45b:ca56:952a:2176])
 (user=saravanak job=sendgmr) by 2002:ad4:4905:: with SMTP id
 bh5mr1667186qvb.63.1630713946609; Fri, 03 Sep 2021 17:05:46 -0700 (PDT)
Date:   Fri,  3 Sep 2021 17:05:40 -0700
Message-Id: <20210904000543.2019010-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
Subject: [PATCH v3 0/2] Fix simple-bus issues with fw_devlink
From:   Saravana Kannan <saravanak@google.com>
To:     Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Saravana Kannan <saravanak@google.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
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

Ulf, mind testing this?

v1->v2:
- Switched to probing the simple-bus device instead of marking it as
  NEVER_PROBES.

v2->v3:
- Moved all the code into the simple-pm-bus driver
- Addressed Ulf's comment about the remove() code missing a check.

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
 drivers/bus/Kconfig                 | 12 -----------
 drivers/bus/Makefile                |  2 +-
 drivers/bus/simple-pm-bus.c         | 32 ++++++++++++++++++++++++++---
 drivers/soc/canaan/Kconfig          |  1 -
 9 files changed, 30 insertions(+), 22 deletions(-)

-- 
2.33.0.153.gba50c8fa24-goog

