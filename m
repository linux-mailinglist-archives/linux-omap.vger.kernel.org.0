Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96AEAEB1BA
	for <lists+linux-omap@lfdr.de>; Thu, 31 Oct 2019 14:58:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727705AbfJaN6d (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 31 Oct 2019 09:58:33 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:34522 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727567AbfJaN6d (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 31 Oct 2019 09:58:33 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9VDwVXZ014847;
        Thu, 31 Oct 2019 08:58:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572530311;
        bh=vgs2sY3lNnlt0h9nHIVlQcwMqmHA66X85kfE8pyTKSA=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=utHzjVPbZGEv5PiIpLb2euKNvlxc1v5rj257Z+X/ytrqoIBvZXCqX6K7hpMZSt1R+
         VWC1fQyzQxqX5daXOoAPW3WnAWpv2or5DG09Fsw7lFB4XfK+Lm2ZrQLn06XnfJ7bTq
         9SMUR8ZTYy36/r+PZT7nYgqRrw5B3tXp4bzOrWJM=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9VDwVr0075579
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 31 Oct 2019 08:58:31 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 31
 Oct 2019 08:58:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 31 Oct 2019 08:58:17 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9VDwSHF121432;
        Thu, 31 Oct 2019 08:58:29 -0500
Subject: Re: [GIT PULL] clk: ti: fixes for v5.4
From:   Tero Kristo <t-kristo@ti.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
CC:     linux-clk <linux-clk@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
References: <fc8fa6fe-5050-ec41-6fdc-c8b726255860@ti.com>
Message-ID: <51c37126-1b51-0f96-7ea0-14e64bfa5cd1@ti.com>
Date:   Thu, 31 Oct 2019 15:58:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <fc8fa6fe-5050-ec41-6fdc-c8b726255860@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 23/10/2019 15:35, Tero Kristo wrote:
> Hi Stephen,
> 
> Please pull these fixes for 5.4.
> 
> Thanks,
> Tero

Please ignore this pull. Divider changes are moving out to v5.5.

Stephen, about the other two patches, do you want to pick these as fixes 
yourself or whats your preference for them?

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
> tags/ti-clk-fixes-for-5.4
> 
> for you to fetch changes up to 1c7630688a0fa0738688f987c48b6be412e200dd:
> 
>    clk: ti: dra7-atl-clock: Remove ti_clk_add_alias call (2019-10-23 
> 12:14:06 +0300)
> 
> ----------------------------------------------------------------
> TI clock driver fixes for 5.4
> 
> - Divider clock fixes to accommodate max divider values properly
> - Fix for certain clkctrl clocks failing to enable due to timeout
> - Remove duplicate clock aliases for dra7-atl-clocks
> 
> ----------------------------------------------------------------
> Peter Ujfalusi (1):
>        clk: ti: dra7-atl-clock: Remove ti_clk_add_alias call
> 
> Tero Kristo (4):
>        clk: ti: divider: cleanup _register_divider and ti_clk_get_div_table
>        clk: ti: divider: cleanup ti_clk_parse_divider_data API
>        clk: ti: divider: convert to use min,max,mask instead of width
>        ARM: dts: omap3: fix DPLL4 M4 divider max value
> 
> Tony Lindgren (1):
>        clk: ti: clkctrl: Fix failed to enable error with double udelay 
> timeout
> 
>   arch/arm/boot/dts/omap36xx-clocks.dtsi |   4 +
>   arch/arm/boot/dts/omap3xxx-clocks.dtsi |   2 +-
>   drivers/clk/ti/clk-dra7-atl.c          |   6 -
>   drivers/clk/ti/clkctrl.c               |   7 +-
>   drivers/clk/ti/clock.h                 |   7 +-
>   drivers/clk/ti/divider.c               | 282 
> +++++++++++++--------------------
>   6 files changed, 127 insertions(+), 181 deletions(-)
> -- 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
