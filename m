Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6518ADB25
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2019 16:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbfIIO0i (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Sep 2019 10:26:38 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:41778 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726774AbfIIO0i (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Sep 2019 10:26:38 -0400
Received: by mail-io1-f68.google.com with SMTP id r26so29028524ioh.8;
        Mon, 09 Sep 2019 07:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KazKYPGBG1a9BKrlXCLttJ1EE05FXkf2S4SfixOg0ts=;
        b=NIG2Kk2RmcDDnLUV+hWJbozopWGGp/tdxuvo88MeyuHXRpPUnd4dmZjoTyotugdmei
         50KGV1pQP9GJ1fUrbks9ZzygiqPRKpLXTNR3P4AR3XmNbA+YoXg5Ry5fY5U+4efz+Gpr
         Q0NB92PL5VUJAulnNPtZ4Jb9cp7OpiHIYPLiWerH4BHmee1c97JDieWRPHbnWyo4JALq
         V9OBujx/26cbGhraHJF/b6NLCAQE2JemX8mhQDD8xR0XCBCPTVk/VcKpURqp63n0/WUL
         iEa1k8S+bLZ30eHMFbTrwgC3mFjYqF3Jaw7w+1gItzlkToJuSrHQEjVvjw8TM6RUV4Eh
         PRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KazKYPGBG1a9BKrlXCLttJ1EE05FXkf2S4SfixOg0ts=;
        b=alJ7ioiNmrUlz19ub02Wuq3Z9pw0vvIDM6U7eXhM2To+7Xr2NRYQrA3GFrtHbjRW4N
         2R6JfiGJl6drj+ipGCK8i3QL+BRrnzAgGmBjV1GdC0ygNqHaqN8FxBWo23WTJ2sfwBo1
         98qqy7Q+qrKF+2vmc2uy9tkfEz2wJw3QWUrF6cFIZu+/peahZjAYR9zKMjfNFYXSQZAi
         xjhp7Gm7i7ypToFi5JZr65IwyLUfIYq4imRNZPG5F5Hy1N0DFG9S6fxjR3Y1JqpkTKNS
         TYXaGmnBgoWAc8IqCOlCWZ+vJa5ceAi1ys2fk2upldE/t+ppGTOQvvJXgS/B9WeyToEa
         r0nw==
X-Gm-Message-State: APjAAAWqzRCmiGQuziIxrdDi7BXNVxppMwomjG83gsCp3q2VYgqaAuxW
        M2GTJP7gpF8cIbJESJHYKp9lfh3cErIQnToc2oTgFNhzq6g=
X-Google-Smtp-Source: APXvYqxrppHK3F7WjN3leofeRWQOpM76xMzqPEuap0Mw6NrShZbOedsVHFPy95s3IP6BMpC+vwVafi7Vn6BK9AFLnJ0=
X-Received: by 2002:a6b:8e92:: with SMTP id q140mr4413737iod.205.1568039196607;
 Mon, 09 Sep 2019 07:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190801012823.28730-1-neolynx@gmail.com> <CAHCN7x+nD0J6KZYtfH+0ApQTPO5byO2obMkUwc9Uf4WubyRbTw@mail.gmail.com>
 <C04F49BA-1229-4E96-9FCF-4FC662D1DB11@goldelico.com> <CAHCN7x+Ye6sB_YqO0sAX1OJDw64B-qGS3pL545v3Xk5z914cwQ@mail.gmail.com>
 <0C1EF64E-B33C-4BFA-A7D3-471DD1B9EE86@goldelico.com> <515048DE-138D-4400-8168-F2B7D61F1005@goldelico.com>
 <CAHCN7xLPCX9rZ0+7KVBiA_bgZ6tg6VeCXqD-UXu+6iwpFMPVrA@mail.gmail.com>
 <7B3D1D77-3E8C-444F-90B9-6DF2641178B8@goldelico.com> <CAHCN7xLW58ggx3CpVL=HdCVHWo6D-MCTB91A_9rtSRoZQ+xJuQ@mail.gmail.com>
 <FA2920FE-B76A-4D44-A264-862A1CCBF7FC@goldelico.com>
In-Reply-To: <FA2920FE-B76A-4D44-A264-862A1CCBF7FC@goldelico.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 9 Sep 2019 09:26:25 -0500
Message-ID: <CAHCN7xJsPa0i+Z+qpCkWcdAh9+udmGT0RPNchdDsfB=8ptd3Nw@mail.gmail.com>
Subject: Re: [Letux-kernel] [RFC PATCH 0/3] Enable 1GHz support on omap36xx
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     =?UTF-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, Sep 7, 2019 at 2:38 AM H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
> Hi Adam,
>
> > Am 02.09.2019 um 23:10 schrieb Adam Ford <aford173@gmail.com>:
> >
> > On Mon, Sep 2, 2019 at 10:46 AM H. Nikolaus Schaller <hns@goldelico.com> wrote:
> >>
> >>
> >>
> >> But my tests show that decoding works now. So you already might give it a try.
> >
> > I am traveling all this week, but I have an omap3530, DM3730
> > (omap3630), and an AM3517 that I use for testing.
>
> now as the omap3430 and omap3630 opp-v2 tables are installed,
> we could add am35x7 as well.
>
> What needs to be done:
>
> 1. add OPP-v2 table to am3517.dtsi
>
> for example copy skeleton from omap36xx.dtsi
>
> and define reasonable clock speeds. I would think about
> 150 MHz, 300 MHz, 600MHz.

This might be more of a question for TI, but  can we match the 3430
list of frequencies?

Something like:
    125000  1200000
    250000  1200000
    500000  1200000
    550000  1200000
    600000  1200000


>
> Debatable is if we need a clock-latency definition.
>
> 2. change all voltages to 1.2V
>
>                         opp-microvolt = <1200000 1200000 1200000>;
>
> There is no point to specify 3 voltages <target min max> here since we
> will never need a min and a max value.
>
>                         opp-microvolt = <1200000>;
>
> should also be ok (AFAIK, parser handles single-value records).
>
> 3. AFAIK there is no speed binned eFuse...
>
> But the ti-cpufreq driver always wants to read some eFuse register.
>
> So please check if you can read 0x4800244C and 0x4830A204
> like on omap36xx and if they produce stable values (and not
> random noise).

For the AM3517,

0x4800244C = 0000 0cc0
0x4830A204 = 1b86 802f

The AM3517 shows these are valid addresses and I read them multiple
times and they yielded the same results even after power cycling.


>
> If yes, we simply assume that am3517 is similar enough to omap3630,
> ignore that there is no eFuse, but read the register anyways and
> then ignore the bit if it is 0 or 1.
>
> This means that all OPPs can get
>
>                         opp-supported-hw = <0xffffffff 0xffffffff>;
>
> There could also be a default handler if this property is missing,
> but I have not researched this.
>
Like this?

opp1-125000000 {
     opp-hz = /bits/ 64 <125000000>;
     opp-microvolt = <1200000>;
     opp-supported-hw = <0xffffffff 0xffffffff>;
};

opp2-250000000 {
     opp-hz = /bits/ 64 <250000000>;
     opp-microvolt = <1200000>;
    opp-supported-hw = <0xffffffff 0xffffffff>;
     opp-suspend;
};

opp3-500000000 {
     opp-hz = /bits/ 64 <500000000>;
     opp-microvolt = <1200000>;
     opp-supported-hw = <0xffffffff 0xffffffff>;
};

opp4-550000000 {
     opp-hz = /bits/ 64 <550000000>;
     opp-microvolt = <1200000>;
     opp-supported-hw = <0xffffffff 0xffffffff>;
};

opp5-600000000 {
     opp-hz = /bits/ 64 <600000000>;
     opp-microvolt = <1200000>;
     opp-supported-hw = <0xffffffff 0xffffffff>;
};

What does opp-suspend do?  I noticed it in the 34xx.dtsi

> 4. add compatible to ti-cpufreq
> and share the register offsets, bit masks etc. with omap3630:
>
>         { .compatible = "ti,am33xx", .data = &am3x_soc_data, },
>         { .compatible = "ti,am3517", .data = &omap36xx_soc_data, },
>         { .compatible = "ti,am43", .data = &am4x_soc_data, },
>         { .compatible = "ti,dra7", .data = &dra7_soc_data },
>         { .compatible = "ti,omap3430", .data = &omap34xx_soc_data, },
>         { .compatible = "ti,omap3630", .data = &omap36xx_soc_data, },
>
> 5. configure for CONFIG_ARM_TI_CPUFREQ=y
>
> This should IMHO suffice.

If you're OK with what I am proposing, I'll run some tests and submit
a patch.  I won't promise to fully understand what's happening.  :-)

>
> Since I can't test anything I can't define working OPP points
> and therefore I can't provide patches myself. Hope you can make
> it work this way.
>
> BR,
> Nikolaus
