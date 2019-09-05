Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E19AA99EA
	for <lists+linux-omap@lfdr.de>; Thu,  5 Sep 2019 07:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730785AbfIEFDF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Sep 2019 01:03:05 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:32823 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbfIEFDF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Sep 2019 01:03:05 -0400
Received: by mail-pl1-f195.google.com with SMTP id t11so710325plo.0
        for <linux-omap@vger.kernel.org>; Wed, 04 Sep 2019 22:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4kF3e1zsFRcXZceVWYoKwvOb0B8jkCH1xLzvA0xA6lE=;
        b=KizyhipGjkEgmtMTKybiHzm6jb3VM2fPNbn/ucG6Zjg04C6K6+tpxoJhQSYsUz0f+l
         DgO2hmSz+dsjpN5r1fg2pFWZPto71JAv5pGRYUru6vOiP2h2DaSFsqGcnaBVA94fru2J
         7T/ssB1SdbYipqOrsDHMY9TxljHSCKi+zsMKUmj7E7Vkf8nnB0WrFyQDRXFwMtojk0FN
         yUnMeqIc3feZ5vuuoVYAcVjUAKHqnjiuIfmQddQ6GMdnR/Z7+jHPxU9VfTuFOiz6LBlN
         UQEhe2S3skIdfY8seiu15fWsgR3JDrquku6DFAbjM8YiF4XWnuVtDTXJVdK8QF1lC28u
         6aYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4kF3e1zsFRcXZceVWYoKwvOb0B8jkCH1xLzvA0xA6lE=;
        b=HhKXKEWiyt1/o4H5rioeqq3O63g4ldt8l82Q9t+MTHOiVET5CLtKz232xOl1QO0jQU
         TLpbQ7E9gOS9ThkX4ZD3JxQ6BlHxwdO8e2/FnCZiAvrOZAA+Z9GKNqRM5qktUyO7bn1V
         PV6p4uM3O63tozFElWWiBBrqqGtQLEqePdqkWpjJOHkcNHCyT8HTx/R/j6k/dAR5NSSd
         e/qvqmFL03bnx98P0gpj+b+P00oub8kN0L9NqSyJ7irBI6VR3itUURAmfrs2GUoMs4PN
         qEGBUTd+HTgcFK38VmJpMo9OHnZr/kOwMW+L03JRoLmEVTqAj8Wt2iFoocizz6lt+aus
         1+Cg==
X-Gm-Message-State: APjAAAVqu+57KnNjwTI8d8EX0UGh2wrGyNTJXJVF7/A6BuvpZ8a/WNls
        MQDrEV6DU8ZK2s3EG6BjpfMsAw==
X-Google-Smtp-Source: APXvYqyT6Wj0CVdxSGtdOLntILebZr38S2rX5CcajMvuY6Vi2Qck71OpHBK+DDdImEW/4d/3+ViFEg==
X-Received: by 2002:a17:902:ba16:: with SMTP id j22mr1275680pls.253.1567659784719;
        Wed, 04 Sep 2019 22:03:04 -0700 (PDT)
Received: from localhost ([122.167.132.221])
        by smtp.gmail.com with ESMTPSA id k14sm677205pgi.20.2019.09.04.22.03.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Sep 2019 22:03:03 -0700 (PDT)
Date:   Thu, 5 Sep 2019 10:33:02 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        =?utf-8?B?QW5kcsOp?= Roth <neolynx@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com
Subject: Re: [RFC v2 0/3] OMAP3: convert opp-v1 to opp-v2 and read speed
 binned / 720MHz grade bits
Message-ID: <20190905050302.t7dsmyl7xa25umjg@vireshk-i7>
References: <cover.1567587220.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1567587220.git.hns@goldelico.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 04-09-19, 10:53, H. Nikolaus Schaller wrote:
> Changes V2:
> * merge separate patch to remove opp-v1 table from n950-n9 into
>   the general omap3xxx.dtsi patch
> * add legacy compatibility to ti,omap3430 and ti,omap3630 for
>   the ti-cpufreq driver
> * make driver and omap3xxx.dtsi patches pass checkpatch
> * add bulk patch to explicitly define compatibility to ti,omap3430
>   and ti,omap36xx in addition to ti,omap3 of all in-tree boards
>   where it was missing
> 
> RFC V1 2019-09-02 12:55:55:
> 
> This patch set converts the opp tables to opp-v2 format
> and extends the ti-cpufreq to support omap3.
> 
> It adds 720 MHz (omap34xx) and 1 GHz (omap36xx) OPPs but
> tells the ti-cpufreq driver to disable them if the speed
> binned / 720MHz grade eFuse bits indicate that the chip
> is not rated for that speed. 
> 
> It has been tested (for chip variant detection, not reliability
> of the high speed OPPs) on:
> 
> * BeagleBoard C2 (omap3430 600MHz)
> * BeagleBoard XM B (dm3730 800MHz)
> * GTA04A4 (dm3730 800MHz)
> * GTA04A5 (dm3730 1GHz)
> 
> 
> H. Nikolaus Schaller (3):
>   cpufreq: ti-cpufreq: add support for omap34xx and omap36xx
>   ARM: dts: replace opp-v1 tables by opp-v2 for omap34xx and omap36xx
>   ARM: dts: omap3: bulk convert compatible to be explicitly ti,omap3430
>     or ti,omap36xx
> 
>  arch/arm/boot/dts/am3517_mt_ventoux.dts       |  2 +-
>  .../boot/dts/logicpd-som-lv-35xx-devkit.dts   |  2 +-
>  .../boot/dts/logicpd-som-lv-37xx-devkit.dts   |  2 +-
>  .../boot/dts/logicpd-torpedo-35xx-devkit.dts  |  2 +-
>  .../boot/dts/logicpd-torpedo-37xx-devkit.dts  |  2 +-
>  arch/arm/boot/dts/omap3-beagle.dts            |  2 +-
>  arch/arm/boot/dts/omap3-cm-t3530.dts          |  2 +-
>  arch/arm/boot/dts/omap3-devkit8000-lcd43.dts  |  2 +-
>  arch/arm/boot/dts/omap3-devkit8000-lcd70.dts  |  2 +-
>  arch/arm/boot/dts/omap3-devkit8000.dts        |  2 +-
>  arch/arm/boot/dts/omap3-evm-37xx.dts          |  2 +-
>  arch/arm/boot/dts/omap3-ha-lcd.dts            |  2 +-
>  arch/arm/boot/dts/omap3-ha.dts                |  2 +-
>  arch/arm/boot/dts/omap3-ldp.dts               |  2 +-
>  arch/arm/boot/dts/omap3-n950-n9.dtsi          |  7 --
>  arch/arm/boot/dts/omap3-sbc-t3530.dts         |  2 +-
>  arch/arm/boot/dts/omap3-thunder.dts           |  2 +-
>  arch/arm/boot/dts/omap3430-sdp.dts            |  2 +-
>  arch/arm/boot/dts/omap34xx.dtsi               | 65 ++++++++++++--
>  arch/arm/boot/dts/omap36xx.dtsi               | 53 +++++++++--
>  drivers/cpufreq/cpufreq-dt-platdev.c          |  2 +-
>  drivers/cpufreq/ti-cpufreq.c                  | 87 ++++++++++++++++++-
>  22 files changed, 204 insertions(+), 44 deletions(-)

Most of the stuff looks fine to me here. I will pick the patches when
the SoC maintainers provide an Ack.

-- 
viresh
