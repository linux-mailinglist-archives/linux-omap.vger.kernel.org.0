Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD068B34D9
	for <lists+linux-omap@lfdr.de>; Mon, 16 Sep 2019 08:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729553AbfIPGrh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Sep 2019 02:47:37 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:36044 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfIPGrg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 16 Sep 2019 02:47:36 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8G6l9bp084505;
        Mon, 16 Sep 2019 01:47:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568616429;
        bh=Q+vfPQYIZod6i1uRqr0rDbbdKt/ABZvDFbHaEMEpByQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=nOSemX8dl1ArcozvxUsQcKzy9oFEzgIxkXe8cQdTobCKAHjMAN9HlmHRtxjBB4vHm
         +Z79F0UQ7ZUYHFoKk9gvmL3CETBh9nX9x2X2tr6bvHEn++37ePW+uyjm241WPJAcYv
         NIEojQE0mq1/ObILFlAPi9spmJbEcbaHu4trzKy8=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8G6l9CS081396
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 16 Sep 2019 01:47:09 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 16
 Sep 2019 01:47:06 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 16 Sep 2019 01:47:08 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8G6l4k3093156;
        Mon, 16 Sep 2019 01:47:05 -0500
Subject: Re: [PATCHv2 0/7] Non-urgent fixes and improvments for omap3-rom-rng
To:     Tony Lindgren <tony@atomide.com>, Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>
CC:     <linux-crypto@vger.kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        <devicetree@vger.kernel.org>
References: <20190914210300.15836-1-tony@atomide.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <364b98db-2b0a-6317-178e-910397b32ffb@ti.com>
Date:   Mon, 16 Sep 2019 09:47:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190914210300.15836-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 15/09/2019 00:02, Tony Lindgren wrote:
> Hi all,
> 
> Here are fixes and improvments for omap3-rom-rng that's been broken for
> a while.
> 
> The first four patches get it working, and then the last two patches add
> support for runtime PM.
> 
> I did not add Sebastian's acks from v1 set as many of the patches
> changed. Please review again :)

Series looks fine to me also, don't have possibility to test omap3 ROM 
RNG though (don't have HW for this.) For the whole series:

Reviewed-by: Tero Kristo <t-kristo@ti.com>



> Regards,
> 
> Tony
> 
> Changes since v1:
> - Use clk_prepare_enable() as pointed out by Sebastian
> - Simplify runtime PM changes patch
> - Add a new patch for devm changes as suggested by Sebastian
> 
> 
> Tony Lindgren (7):
>    ARM: OMAP2+: Check omap3-rom-rng for GP device instead of HS device
>    hwrng: omap3-rom - Fix missing clock by probing with device tree
>    hwrng: omap3-rom - Call clk_disable_unprepare() on exit only if not
>      idled
>    hwrng: omap3-rom - Initialize default quality to get data
>    hwrng: omap3-rom - Update to use standard driver data
>    hwrng: omap3-rom - Use runtime PM instead of custom functions
>    hwrng: omap3-rom - Use devm hwrng and runtime PM
> 
>   .../devicetree/bindings/rng/omap3_rom_rng.txt |  27 +++
>   arch/arm/boot/dts/omap3-n900.dts              |   6 +
>   arch/arm/mach-omap2/pdata-quirks.c            |  14 +-
>   drivers/char/hw_random/omap3-rom-rng.c        | 168 +++++++++++-------
>   4 files changed, 139 insertions(+), 76 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/rng/omap3_rom_rng.txt
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
