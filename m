Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFD6EEF657
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2019 08:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387590AbfKEHUj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Nov 2019 02:20:39 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:47840 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387484AbfKEHUj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Nov 2019 02:20:39 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA57KYq9124809;
        Tue, 5 Nov 2019 01:20:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572938434;
        bh=4hR507F9d9RQok/WuN1OZB6tXcsHF2sZDCLwM6d2xbs=;
        h=To:CC:From:Subject:Date;
        b=RTbcbA7RrYL1r24Lt3Ht1Ge4Q4uSqj7mxq+3vdMMHStWkB1Gr6Xrxwm5x+l+FMaQ6
         IOVCpzMMmKepi0XQ5EQ8tO1nrJoBkEu9+dEVr9rETyWlBD90xsjzjsH2NXW331ymwR
         +jamUZBvn1VaxrH3pJXDrs9Sp6lzk5YbUw1Nrjec=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA57KYUO099171
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 5 Nov 2019 01:20:34 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 5 Nov
 2019 01:20:19 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 5 Nov 2019 01:20:19 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA57KWTW000999;
        Tue, 5 Nov 2019 01:20:32 -0600
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "tony@atomide.com" <tony@atomide.com>
CC:     linux-clk <linux-clk@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
From:   Tero Kristo <t-kristo@ti.com>
Subject: [GIT PULL] clk: ti: changes for 5.5 (take 2)
Message-ID: <2e823d30-ce52-1275-c958-6b82666dc46f@ti.com>
Date:   Tue, 5 Nov 2019 09:20:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Stephen,

This is a 2nd try of the TI clock changes towards 5.5. I added the 
divider clock revamp into this pull, and also fixed the one commend you 
had on the remoteproc support series.

Tony, this is also available as a branch as for-5.5-ti-clk-v2.

-Tero

---

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kristo/linux 
tags/ti-clk-for-5.5-v2

for you to fetch changes up to f5869190667951720f8c1ec4638bff4c682a3a4e:

   ARM: dts: omap3: fix DPLL4 M4 divider max value (2019-10-31 15:33:26 
+0200)

----------------------------------------------------------------
TI clock driver changes for 5.5

As the clock and reset handling is tightly coupled on the hardware level
on OMAP SoCs, we must ensure the events are sequenced properly. This
series makes sure that the clock side is behaving properly, and the
sequencing of the events is left for the bus driver (ti-sysc.)

The series also includes revamp of the TI divider clock implementation
to handle max divider values properly in cases where the max value is
not limited by the bitfield of the IO register but instead limited to
some arbitrary value. Previously this resulted in too high divider
values to be used in some cases causing HW malfunction.

Additionally, a couple of smaller changes needed by remoteproc support
are added; checking of the standby status and some missing clkctrl data
for omap5/dra7.

----------------------------------------------------------------
Suman Anna (2):
       clk: ti: omap4: Drop idlest polling from IPU & DSP clkctrl clocks
       clk: ti: omap5: Drop idlest polling from IPU & DSP clkctrl clocks

Tero Kristo (14):
       clk: ti: clkctrl: fix setting up clkctrl clocks
       clk: ti: clkctrl: convert to use bit helper macros instead of bitops
       clk: ti: clkctrl: add new exported API for checking standby info
       dt-bindings: clk: add omap5 iva clkctrl definitions
       clk: ti: omap5: add IVA subsystem clkctrl data
       clk: ti: dra7xx: Drop idlest polling from IPU & DSP clkctrl clocks
       clk: ti: am43xx: drop idlest polling from pruss clkctrl clock
       clk: ti: am33xx: drop idlest polling from pruss clkctrl clock
       clk: ti: am33xx: drop idlest polling from gfx clock
       clk: ti: am43xx: drop idlest polling from gfx clock
       clk: ti: divider: cleanup _register_divider and ti_clk_get_div_table
       clk: ti: divider: cleanup ti_clk_parse_divider_data API
       clk: ti: divider: convert to use min,max,mask instead of width
       ARM: dts: omap3: fix DPLL4 M4 divider max value

  arch/arm/boot/dts/omap36xx-clocks.dtsi |   4 +
  arch/arm/boot/dts/omap3xxx-clocks.dtsi |   2 +-
  drivers/clk/ti/clk-33xx.c              |   4 +-
  drivers/clk/ti/clk-43xx.c              |   4 +-
  drivers/clk/ti/clk-44xx.c              |   4 +-
  drivers/clk/ti/clk-54xx.c              |  11 +-
  drivers/clk/ti/clk-7xx.c               |   8 +-
  drivers/clk/ti/clkctrl.c               |  45 +++++-
  drivers/clk/ti/clock.h                 |   7 +-
  drivers/clk/ti/divider.c               | 282 
+++++++++++++--------------------
  include/dt-bindings/clock/omap5.h      |   4 +
  include/linux/clk/ti.h                 |   3 +-
  12 files changed, 187 insertions(+), 191 deletions(-)
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
