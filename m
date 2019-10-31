Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD8BAEB1B4
	for <lists+linux-omap@lfdr.de>; Thu, 31 Oct 2019 14:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727593AbfJaN5S (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 31 Oct 2019 09:57:18 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:54354 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727567AbfJaN5S (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 31 Oct 2019 09:57:18 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9VDvEoc108392;
        Thu, 31 Oct 2019 08:57:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572530234;
        bh=4YlwT/V60+dZECqZ/QDeBj9qv8fK12xF8lC+GYswlFU=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=x/T1G3nQGRotX/KLfXv/QExIMVNaJLYkWMvR6Fux9WewHZyc8Iw5yL8ej9/ptWQHn
         Za8DIYcsy8H3XWqr0o2sigI2YmRkqHwZfZIsxXyi3PzECTvl/NVMuam80QQxkmsqFV
         F1inIPgFmhpsg9UZ86D960b1rn3LKzF5LgCGlwjI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9VDvEpl060093
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 31 Oct 2019 08:57:14 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 31
 Oct 2019 08:57:00 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 31 Oct 2019 08:57:00 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9VDvBY6034936;
        Thu, 31 Oct 2019 08:57:12 -0500
Subject: Re: [GIT PULL] clk: ti: changes for 5.5
From:   Tero Kristo <t-kristo@ti.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "tony@atomide.com" <tony@atomide.com>
CC:     linux-clk <linux-clk@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
References: <e9e6d829-10f8-81d8-c87f-6a12edbe7358@ti.com>
Message-ID: <6660a22a-57ff-0f6f-622c-a6161584ec41@ti.com>
Date:   Thu, 31 Oct 2019 15:57:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e9e6d829-10f8-81d8-c87f-6a12edbe7358@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 23/10/2019 16:11, Tero Kristo wrote:
> Hi Stephen,
> 
> Please pull these changes towards 5.5. Mostly needed for the reset 
> handling support with the upcoming PRM driver, but contains a couple of 
> other changes also.
> 
> Tony, I have also pushed a branch along with this to the git repository, 
> under for-5.5-ti-clk. Assuming this pull gets accepted, that branch can 
> be considered immutable.
> 
> -Tero

Please ignore this pull, I'll send an updated one.

-Tero

> 
> ---
> 
> The following changes since commit 
> 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:
> 
>    Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/kristo/linux 
> tags/ti-clk-for-5.5
> 
> for you to fetch changes up to e120b9bf798585f30ecbbd568c819f3672105124:
> 
>    clk: ti: am43xx: drop idlest polling from gfx clock (2019-10-23 
> 12:19:30 +0300)
> 
> ----------------------------------------------------------------
> TI clock driver changes for 5.5
> 
> As the clock and reset handling is tightly coupled on the hardware level
> on OMAP SoCs, we must ensure the events are sequenced properly. This
> series makes sure that the clock side is behaving properly, and the
> sequencing of the events is left for the bus driver (ti-sysc.)
> 
> Additionally, a couple of smaller changes needed by remoteproc support
> are added; checking of the standby status and some missing clkctrl data
> for omap5/dra7.
> 
> ----------------------------------------------------------------
> Suman Anna (2):
>        clk: ti: omap4: Drop idlest polling from IPU & DSP clkctrl clocks
>        clk: ti: omap5: Drop idlest polling from IPU & DSP clkctrl clocks
> 
> Tero Kristo (10):
>        clk: ti: clkctrl: fix setting up clkctrl clocks
>        clk: ti: clkctrl: convert to use bit helper macros instead of bitops
>        clk: ti: clkctrl: add new exported API for checking standby info
>        dt-bindings: clk: add omap5 iva clkctrl definitions
>        clk: ti: omap5: add IVA subsystem clkctrl data
>        clk: ti: dra7xx: Drop idlest polling from IPU & DSP clkctrl clocks
>        clk: ti: am43xx: drop idlest polling from pruss clkctrl clock
>        clk: ti: am33xx: drop idlest polling from pruss clkctrl clock
>        clk: ti: am33xx: drop idlest polling from gfx clock
>        clk: ti: am43xx: drop idlest polling from gfx clock
> 
>   drivers/clk/ti/clk-33xx.c         |  4 ++--
>   drivers/clk/ti/clk-43xx.c         |  4 ++--
>   drivers/clk/ti/clk-44xx.c         |  4 ++--
>   drivers/clk/ti/clk-54xx.c         | 11 ++++++++--
>   drivers/clk/ti/clk-7xx.c          |  8 ++++----
>   drivers/clk/ti/clkctrl.c          | 43 
> ++++++++++++++++++++++++++++++++++-----
>   include/dt-bindings/clock/omap5.h |  4 ++++
>   include/linux/clk/ti.h            |  3 ++-
>   8 files changed, 63 insertions(+), 18 deletions(-)
> -- 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
