Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DFBAB4108
	for <lists+linux-omap@lfdr.de>; Mon, 16 Sep 2019 21:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390886AbfIPTVA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Sep 2019 15:21:00 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:34443 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390883AbfIPTU7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 16 Sep 2019 15:20:59 -0400
Received: by mail-io1-f65.google.com with SMTP id q1so1815721ion.1;
        Mon, 16 Sep 2019 12:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9GDrgnJ7nCyXTyNy+f2BGnD7myVmfDiu1YcJ6Bk0Q1s=;
        b=JZDDlzIlUsy6X9IIlrdFfhGMQZ/V5zT84a8Vu4vUIYmkNPLtJUERYyjVZhqlseWgf0
         lyD0bt1NBEyPAw+YWsBCnYxZvIWooM5tCrEm1m5c6Lf06M+XLLe4zTh4z9dQEgxMk+6m
         fA2KesLhhSVm5tLD1cQn0rt4e010nHbpJbohzNnV/J/HWIb6hYN9R1oA+eTrtRX6JjwY
         0anZhbHCFiYqfku3yy2gs37G4dPZyAkrE2rAy9oK51cRexMq4mft4qiRV9D5mmNGGxxu
         Y+sJflOxu2kwbSddr8I6az/vCuz1tETMngN3E5tlAQ1HruoEg4Y6GggoiHkW/AkccEVp
         gjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9GDrgnJ7nCyXTyNy+f2BGnD7myVmfDiu1YcJ6Bk0Q1s=;
        b=eB+knW4Mk/3pB0Sm5QT+blbphuTjNTqC//xIuMRh0S0ieT6J5dlIMP8t3RJdlnAw0Y
         WsKQttdYVc5E9b/UQ2lfqkzdUR3oHzbm/gTzesPyeG6zyHp+kObkj0Hbbw9t1lO+jKL6
         7+gFXE0pqkXw0ByYsspebQRVn1GIFM07rX1dFmnyErr5Fyx5HBPtQNzup09dqvjKsm3S
         /uIlPErLkTKFirRaOt28NJvChIRngLt1WugZHI06+/aSk3yaKulKylglZWFCYjUpYskn
         3TkaVHycw/jkpKmxUyppChUem8z3MagxxcJfIBea3CSCDd1RYq3Se31PGTI5qKjS1ftU
         mYnA==
X-Gm-Message-State: APjAAAUSy214GOKnx5Np6rc9fDsCXjgPpVuFEoEMf1RW1WOul46UaSbL
        y0aBRU96XYuL530ZGcIEZDn6ksbzX4ootCxGsB/+8OQ0
X-Google-Smtp-Source: APXvYqxWf3jr0xhKOkDAbwCKy7gD2E9vhIKzSrpfr1/jLUpG0Sqv5x7ImFuqRuSIXo05KKHwCQj7D81ZVv3SfO2d4ls=
X-Received: by 2002:a5e:dc47:: with SMTP id s7mr240503iop.228.1568661658258;
 Mon, 16 Sep 2019 12:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190814131408.57162-1-tony@atomide.com> <20190814131408.57162-7-tony@atomide.com>
 <92652315-A763-485F-A4FA-CB868016E045@goldelico.com> <20190916151730.GZ52127@atomide.com>
 <20190916180418.GH52127@atomide.com> <6CF46DDB-2EC1-454E-83A1-30CC7BFC335D@goldelico.com>
 <D413323E-6B96-473E-979B-18D476AB3065@goldelico.com>
In-Reply-To: <D413323E-6B96-473E-979B-18D476AB3065@goldelico.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 16 Sep 2019 14:20:46 -0500
Message-ID: <CAHCN7xJ3vpT-7Wdjy9d=N_9VuThczwYV0TZ2Dm-1iMDP52jzog@mail.gmail.com>
Subject: Re: [PATCH 6/6] ARM: dts: Configure rstctrl reset for SGX
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        devicetree <devicetree@vger.kernel.org>,
        =?UTF-8?Q?Filip_Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Sep 16, 2019 at 2:15 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
>
> > Am 16.09.2019 um 20:12 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> >
> >
> >> Am 16.09.2019 um 20:04 schrieb Tony Lindgren <tony@atomide.com>:
> >>
> >> Hi,
> >>
> >> * Tony Lindgren <tony@atomide.com> [190916 15:18]:
> >>> * H. Nikolaus Schaller <hns@goldelico.com> [190913 09:50]:
> >>>> Hi Tony,
> >>>>
> >>>>> Am 14.08.2019 um 15:14 schrieb Tony Lindgren <tony@atomide.com>:
> >>>>>
> >>>>> The following can be tested via sysfs with the following to ensure the SGX
> >>>>> module gets enabled and disabled properly:
> >>>>>
> >>>>> # echo on > /sys/bus/platform/devices/5600fe00.target-module/power/control
> >>>>> # rwmem 0x5600fe00                # revision register
> >>>>> 0x5600fe00 = 0x40000000
> >>>>> # echo auto > /sys/bus/platform/devices/5600fe00.target-module/power/control
> >>>>> # rwmem 0x5000fe00
> >>>>> Bus error
> >>>>>
> >>>>> Note that this patch depends on the PRM rstctrl driver that has
> >>>>> been recently posted.
> >>>>
> >>>> Do you have a list of these patches or a git for pulling the complete set
> >>>> of changes? Does it depend on mainline or linux-next?
> >>>
> >>> You need the drivers/bus/ti-sysc.c changes from Linux next,
> >>> and the most recent clkctrl and rstctrl patches posted by
> >>> Tero.
> >>>
> >>>> I tried to find the correct patches but it does not seem to work for
> >>>> me on beaglebone.
> >>>
> >>> OK can you please check the dependencies again and let me know
> >>> if you still have issues?
> >>
> >> To make things easier to test, I pushed out a test branch with
> >> all the pending dependencies :)
> >>
> >> It's basically v5.3 + ti-sysc changes in Linux next, and
> >> the following patches posted by Tero:
> >>
> >> [PATCHv5 00/10] soc: ti: add OMAP PRM driver (for reset)
> >> [PATCHv3 00/10] clk: ti: remoteproc / iommu support patches
> >> [PATCH 00/10] ARM: dts: omap changes for IOMMU / reset support
> >>
> >> And then finally the $subject patch applied on top, and the
> >> tests above still work for me.
> >
> > Ok, fine!
> >
> >>
> >> The test branch is test-pending-ti-sysc-clkctrl-rstctrl-v5.3
> >> at [0] and [1] below.
> >>
> >> Can you please test and see if that works for you?
> >>
> >> Regards,
> >>
> >> Tony
> >>
> >> [0] git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git test-pending-ti-sysc-clkctrl-rstctrl-v5.3
> >> [1] https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git/log/?h=test-pending-ti-sysc-clkctrl-rstctrl-v5.3
> >
> > I'll check out and try to locate missing pieces.
>
> Ok, this variant works as a basis! At least for register access.
>
> root@letux:~# devmem2 0x5600fe00
> Value at address 0x5600FE00 (0xb6fede00): 0x40000000
> root@letux:~# devmem2 0x5600fe04
> Value at address 0x5600FE04 (0xb6fa1e04): 0x5
> root@letux:~# devmem2 0x5600fe10
> Value at address 0x5600FE10 (0xb6f80e10): 0x28
> root@letux:~#
>
> This is quite similar to OMAP5 where I got
>
> > root@letux:~# devmem2 0x5600fe00
> > Value at address 0x5600FE00 (0xb6f87e00): 0x40000000
> > root@letux:~# devmem2 0x5600fe04
> > Value at address 0x5600FE04 (0xb6f11e04): 0x5
> > root@letux:~# devmem2 0x5600fe10
> > Value at address 0x5600FE10 (0xb6f93e10): 0x3C
>
> or OMAP3:
>
> > root@letux:~# devmem2 0x5000fe00
> > Value at address 0x5000FE00 (0xb6f81e00): 0x40000000
> > root@letux:~# devmem2 0x5000fe04
> > Value at address 0x5000FE04 (0xb6f28e04): 0x5
> > root@letux:~# devmem2 0x5000fe10
> > Value at address 0x5000FE10 (0xb6f5fe10): 0x28
> > root@letux:~#
>
> But SGX driver initialization still fails with a reset_deassert timeout.
>
> root@letux:~# modprobe pvrsrvkm_omap_am335x_sgx530_125
> [  187.528139] pvrsrvkm_omap_am335x_sgx530_125: module is from the staging directory, the quality is unknown, you have been warned.
> [  187.584580] omap_reset_deassert: timedout waiting for gfx:0
> [  187.614430] [drm] Initialized pvr 1.14.3699939 20110701 for 56000000.sgx on minor 1
> root@letux:~# pvrsrvctl --start --no-module
> [  209.085931] PVR_K: UM DDK-(3699939) and KM DDK-(3699939) match. [ OK ]
> [  209.116399] PVR_K:(Error): BridgedDispatchKM: Initialisation failed.  Driver unusable.
> PVR:(Error): LoaduKernelProgram : SGX ukernel program Device Addr: 0xe400000 invalid alignment [0, ]
> PVR:(Error): SetupuKernel : Failed to load uKernel programs [0, ]
> PVR:(Error): SrvInit: Initialisation for device of class 0, type 7, index 0, failed (1) [0, ]
> PVR:(Error): PVRSRVBridgeCall: Failed to access device.  Function ID:3223086862 (strerror returns no value.). [0, ]
> pvrsrvctl: SrvInit failed (already initialized?) (err=PVRSRV_ERROR_OUT_OF_MEMORY - Unable to allocate required memory)
> root@letux:~#
>
> A simple reason may be that I have a bad offset in my device tree setup
> and the driver doesn't see feedback from SGX.
>
> " for 56000000.sgx on minor 1" is suspect.
> IMHO, it should have to be " for 5600fe00.sgx on minor 1"
> But anyways this is a big step forwards having giving me three different
> platforms for testing and comparisons.

I can try to help again with the SGX once I can get the LCD stuff
working.  At some point, the panel-dpi driver was removed, and I am
struggling to get my LCD's back.  Until I can get the LCD's fully
function, I can't test the SGX.  I got a little distracted with the
OPP stuff you did and the thermal throttling.

adam
>
> BR and thanks,
> Nikolaus
>
>
