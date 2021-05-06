Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 398573752BA
	for <lists+linux-omap@lfdr.de>; Thu,  6 May 2021 13:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234639AbhEFLBu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 6 May 2021 07:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234580AbhEFLBt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 6 May 2021 07:01:49 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91E84C061574
        for <linux-omap@vger.kernel.org>; Thu,  6 May 2021 04:00:49 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id u13so5657164edd.3
        for <linux-omap@vger.kernel.org>; Thu, 06 May 2021 04:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=AdJUhkXJ0RE0gA8rQiRatnY1RC7xIq+gLRVNuKyv4zk=;
        b=yXjsWw1RP+V7P8yFV+MEP4lidWXgt92J0/EgUmwODNiDWT5hNfkKXlaz7BDy82Femm
         q7oPTyidG6yskxN7dWTknGA+EoV9kqqlTpEPBaFY08ipld2nllpUlurIroxUUIUr/myE
         OoDl2EbLkwXGuhcQIIDrUD9ImV/TbYq5RaRbjJlZoRfOfZ+VdH+X4UwZ0dRAJ17/wH5I
         PVKsPTQeMEoChpQtVFkuxqKd8mHkUk48K0FmmaLUmD/Q8NDjleJ8tEuRJm3Yxd5DmHp4
         H3YWLWzK+SDqjZEFL1m54h5uxGeZFier1anJL+dlNokMzwCDecPGpg5HIHu8VFxTWxIe
         DwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=AdJUhkXJ0RE0gA8rQiRatnY1RC7xIq+gLRVNuKyv4zk=;
        b=Zu4gnIhzLIu/FArBa/9hxDbdDZUdOziVC9Afbqg5vTz1T/YTbCpDp0BEWkufRa0wNl
         xaFDKksd/EjfVD9L6cbPDSoLgwoQzNTgx8Rxajb8mvRSVef082wQYnkmQYgUzoYgpYoV
         virF+v5AMfkG4kP9vfHTGOJsVDpSo+nnKI791+vMRiQkqF9HSmGD8irHdNIeRLcgPRp6
         ZAznlNwBhaFSJwFrAO9PqzeGatlzbCg30uTrlFtq/UwxUGTAJMcJxlO/CeSIEJVGg+al
         inhXrqpGNhAXYK1EQueqHr46PaZ5YMCyZGdB9wVuBRGcgOREHXM/bTlS2NTt+DbqMAFR
         S91g==
X-Gm-Message-State: AOAM531uECFgoB47VFMhowM3HA9MT4UKTIq+PwBwCM4MPR/BioeSBG9S
        GhEQH0UCozsi5a+XFYOcBcd63CNxGshmfEym7bAc0A==
X-Google-Smtp-Source: ABdhPJzzg1f47/TCh4naYuf/+uyutWrGXzwqvmRLBN7VgJa8XfcE9nK2c7vpAmPWbkrDepZWGynD3NM+DXnxO/NUm/Y=
X-Received: by 2002:a05:6402:145:: with SMTP id s5mr4338384edu.221.1620298848045;
 Thu, 06 May 2021 04:00:48 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 6 May 2021 16:30:36 +0530
Message-ID: <CA+G9fYtTN6ug3eBAW3wMcDeESUo+ebj7L5HBe5_fj4uqDExFQg@mail.gmail.com>
Subject: #regzb introduced: 98feab31ac49 ("ARM: OMAP2+: Drop legacy platform
 data for dra7 sata")
To:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Tony Lindgren <tony@atomide.com>,
        lkft-triage@lists.linaro.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        regressions@lists.linux.dev
Cc:     Benoit Cousson <bcousson@baylibre.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

[If it is already reported please ignore]

LKFT test reported regression on TI BeagleBoard-X15 arm32 bit platform as
The device was not able to detect SATA drive.

dmesg short log:
----------------------
jitterentropy: Initialization failed with host not compliant with
requirements: 2
ata1: SATA max UDMA/133 mmio [mem 0x4a140000-0x4a1410ff] port 0x100 irq 101
wkupaon-clkctrl:0068:0: failed to disable
ata1: SATA link down (SStatus 0 SControl 300)
ata1: softreset failed (1st FIS failed)

Our bisect script pointed this as the first bad commit on linux
mainline master branch.

Full test log:
----------------
SATA detection failed log link,
https://lkft.validation.linaro.org/scheduler/job/2580998#L1973

--
commit 98feab31ac491400f28b76a04dabd18ce21e91ba
Author: Tony Lindgren <tony@atomide.com>
Date:   Wed Mar 10 14:03:51 2021 +0200

    ARM: OMAP2+: Drop legacy platform data for dra7 sata

    We can now probe devices with ti-sysc interconnect driver and dts data.
    Let's drop the related platform data and custom ti,hwmods dts property.

    As we're just dropping data, and the early platform data init is based on
    the custom ti,hwmods property, we want to drop both the platform data and
    ti,hwmods property in a single patch.

    Signed-off-by: Tony Lindgren <tony@atomide.com>
-- 

steps to reproduce:
-------------------------
- Build arm zImage/dtb/modules on mainline tree and configs
- connect SATA drive and boot x15 device
- check the dmesg for failed logs
 - check to find /dev/sda

metadata:
  git branch: master
  git repo: https://gitlab.com/Linaro/lkft/mirrors/torvalds/linux-mainline
  git commit: f0728bfeb21a24bbb7d5ad1828b67a359550fa17
  kernel-config: https://builds.tuxbuild.com/1rjBx0LdvYwlWdINXaDPvIigvcC/config
  build-url: https://gitlab.com/Linaro/lkft/mirrors/torvalds/linux-mainline/-/pipelines/292686420

Steps to build:
--------------------
# TuxMake is a command line tool and Python library that provides
# portable and repeatable Linux kernel builds across a variety of
# architectures, toolchains, kernel configurations, and make targets.
#
# TuxMake supports the concept of runtimes.
# See https://docs.tuxmake.org/runtimes/, for that to work it requires
# that you install podman or docker on your system.
#
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.


tuxmake --runtime podman --target-arch arm --toolchain gcc-9 --kconfig
defconfig --kconfig-add
https://raw.githubusercontent.com/Linaro/meta-lkft/sumo/recipes-kernel/linux/files/lkft.config
--kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/sumo/recipes-kernel/linux/files/lkft-crypto.config
--kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/sumo/recipes-kernel/linux/files/distro-overrides.config
--kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/sumo/recipes-kernel/linux/files/systemd.config
--kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/sumo/recipes-kernel/linux/files/virtio.config
--kconfig-add CONFIG_ARM_TI_CPUFREQ=y --kconfig-add
CONFIG_SERIAL_8250_OMAP=y --kconfig-add CONFIG_POSIX_MQUEUE=y
--kconfig-add CONFIG_OF=y --kconfig-add CONFIG_SYN_COOKIES=y


--
Linaro LKFT
https://lkft.linaro.org
