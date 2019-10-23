Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 684D6E1BEE
	for <lists+linux-omap@lfdr.de>; Wed, 23 Oct 2019 15:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405680AbfJWNMB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 23 Oct 2019 09:12:01 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33002 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405679AbfJWNMA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 23 Oct 2019 09:12:00 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9NDBuwF055095;
        Wed, 23 Oct 2019 08:11:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571836316;
        bh=/CXU45E9pT9yRzmSUQtX052zpmzcRXJ6M+Xeiie17tA=;
        h=To:CC:From:Subject:Date;
        b=ZfhNcZI2LZu8bZ8IZE55G6XP2h6ShWJX5p/+GP0uCEfq91YJr53r8uqskZLBb8ywY
         FDz8YLeN6KeARxHFdKZYUunv/XO0i6kYK+Fqs5e3scPOrsoI9rNVZskH0m3UBsiiY5
         UyYwZcAMYDNJWZCYc0Jd8ZpXNfOB5BFzDDREpSsc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9NDBusD089875
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 23 Oct 2019 08:11:56 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 23
 Oct 2019 08:11:56 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 23 Oct 2019 08:11:46 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9NDBs80020117;
        Wed, 23 Oct 2019 08:11:54 -0500
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "tony@atomide.com" <tony@atomide.com>
CC:     linux-clk <linux-clk@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
From:   Tero Kristo <t-kristo@ti.com>
Subject: [GIT PULL] clk: ti: changes for 5.5
Message-ID: <e9e6d829-10f8-81d8-c87f-6a12edbe7358@ti.com>
Date:   Wed, 23 Oct 2019 16:11:53 +0300
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

Please pull these changes towards 5.5. Mostly needed for the reset 
handling support with the upcoming PRM driver, but contains a couple of 
other changes also.

Tony, I have also pushed a branch along with this to the git repository, 
under for-5.5-ti-clk. Assuming this pull gets accepted, that branch can 
be considered immutable.

-Tero

---

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kristo/linux 
tags/ti-clk-for-5.5

for you to fetch changes up to e120b9bf798585f30ecbbd568c819f3672105124:

   clk: ti: am43xx: drop idlest polling from gfx clock (2019-10-23 
12:19:30 +0300)

----------------------------------------------------------------
TI clock driver changes for 5.5

As the clock and reset handling is tightly coupled on the hardware level
on OMAP SoCs, we must ensure the events are sequenced properly. This
series makes sure that the clock side is behaving properly, and the
sequencing of the events is left for the bus driver (ti-sysc.)

Additionally, a couple of smaller changes needed by remoteproc support
are added; checking of the standby status and some missing clkctrl data
for omap5/dra7.

----------------------------------------------------------------
Suman Anna (2):
       clk: ti: omap4: Drop idlest polling from IPU & DSP clkctrl clocks
       clk: ti: omap5: Drop idlest polling from IPU & DSP clkctrl clocks

Tero Kristo (10):
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

  drivers/clk/ti/clk-33xx.c         |  4 ++--
  drivers/clk/ti/clk-43xx.c         |  4 ++--
  drivers/clk/ti/clk-44xx.c         |  4 ++--
  drivers/clk/ti/clk-54xx.c         | 11 ++++++++--
  drivers/clk/ti/clk-7xx.c          |  8 ++++----
  drivers/clk/ti/clkctrl.c          | 43 
++++++++++++++++++++++++++++++++++-----
  include/dt-bindings/clock/omap5.h |  4 ++++
  include/linux/clk/ti.h            |  3 ++-
  8 files changed, 63 insertions(+), 18 deletions(-)
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
