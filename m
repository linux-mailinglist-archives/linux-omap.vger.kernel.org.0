Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50315143796
	for <lists+linux-omap@lfdr.de>; Tue, 21 Jan 2020 08:31:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727350AbgAUHbg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Jan 2020 02:31:36 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:60984 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbgAUHbg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Jan 2020 02:31:36 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00L7VUPT052729;
        Tue, 21 Jan 2020 01:31:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579591890;
        bh=BXZqFPyDGHo4HfFbbcCFnyNmzgJs4IMbu2GrtrALQjM=;
        h=From:Subject:To:CC:Date;
        b=Jv3WuDvZV8RXTuLOiqvfAl+vU7CYuodETGzsBA+lMr/yiGAGMm9xUQYTwrxlwizH8
         5aQuRG6N5ok1bya2JM3kTIBywbWLDNjmZUJefhQec7mC9tkaDVAt9wJ1hpoeXz7won
         Y4vW+r3yASGi1KiNVC61hNnxPZTpBkWe0w1v4yA4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00L7VUxS085856
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 21 Jan 2020 01:31:30 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 21
 Jan 2020 01:31:29 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 21 Jan 2020 01:31:29 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00L7VRLA034702;
        Tue, 21 Jan 2020 01:31:28 -0600
From:   Tero Kristo <t-kristo@ti.com>
Subject: [GIT PULL] clk: ti: changes for 5.6
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "tony@atomide.com" <tony@atomide.com>
CC:     linux-clk <linux-clk@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Message-ID: <71d3d7dd-115a-4584-e3d7-e13e7ea7934e@ti.com>
Date:   Tue, 21 Jan 2020 09:31:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
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

Please pull these TI clock changes towards v5.6. Tony, the same branch 
(for-5.6-ti-clk) can be considered immutable towards your DTS changes if 
you wish to sync them with this.

-Tero

---

The following changes since commit
e42617b825f8073569da76dc4510bfa019b1c35a:

   Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kristo/linux 
tags/ti-clk-for-5.6

for you to fetch changes up to 6c3090520554d535db04f807c313d9a4b81a285c:

   clk: ti: clkctrl: Fix hidden dependency to node name (2020-01-20 
12:29:27 +0200)

----------------------------------------------------------------
TI clock driver changes for v5.6

This pull contains following changes:

- cam, vpe and sgx clock support for dra7
- fix gmac main clock for dra7
- aess clock support for omap5
- move dra7-atl clock header to correct location
- fix hidden node name dependency on clkctrl clocks

----------------------------------------------------------------
Benoit Parrot (2):
       clk: ti: dra7: add cam clkctrl data
       clk: ti: dra7: add vpe clkctrl data

Grygorii Strashko (1):
       clk: ti: dra7: fix parent for gmac_clkctrl

Peter Ujfalusi (1):
       dt-bindings: clock: Move ti-dra7-atl.h to dt-bindings/clock

Tony Lindgren (3):
       clk: ti: omap5: Add missing AESS clock
       clk: ti: add clkctrl data dra7 sgx
       clk: ti: clkctrl: Fix hidden dependency to node name

  .../devicetree/bindings/clock/ti-clkctrl.txt       | 11 ++-
  .../devicetree/bindings/clock/ti/dra7-atl.txt      |  4 +-
  arch/arm/boot/dts/dra7-evm-common.dtsi             |  2 +-
  arch/arm/boot/dts/dra72-evm-common.dtsi            |  2 +-
  arch/arm/boot/dts/dra7xx-clocks.dtsi               | 14 ++++
  drivers/clk/ti/clk-54xx.c                          | 15 ++++
  drivers/clk/ti/clk-7xx.c                           | 62 +++++++++++++-
  drivers/clk/ti/clk.c                               |  4 +-
  drivers/clk/ti/clkctrl.c                           | 96 
+++++++++++++++++++---
  include/dt-bindings/clock/dra7.h                   | 23 ++++++
  include/dt-bindings/clock/omap5.h                  |  1 +
  include/dt-bindings/{clk => clock}/ti-dra7-atl.h   |  0
  12 files changed, 214 insertions(+), 20 deletions(-)
  rename include/dt-bindings/{clk => clock}/ti-dra7-atl.h (100%)
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
