Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5F8A1AE11E
	for <lists+linux-omap@lfdr.de>; Fri, 17 Apr 2020 17:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728734AbgDQP3H (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Apr 2020 11:29:07 -0400
Received: from muru.com ([72.249.23.125]:49942 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728542AbgDQP3H (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 17 Apr 2020 11:29:07 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id CAEEC8047;
        Fri, 17 Apr 2020 15:29:53 +0000 (UTC)
Date:   Fri, 17 Apr 2020 08:29:03 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org, lkft-triage@lists.linaro.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Benoit Cousson <bcousson@baylibre.com>,
        Carlos Hernandez <ceh@ti.com>,
        Thomas Gleixner <tglx@linutronix.de>, t-kristo@ti.com,
        Olof Johansson <olof@lixom.net>, tomi.valkeinen@ti.com,
        Anders Roxell <anders.roxell@linaro.org>
Subject: Re: OF: ERROR: Bad of_node_put() on
 /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/l4per-cm@1700/l4per-clkctrl@28
Message-ID: <20200417152903.GO37466@atomide.com>
References: <CA+G9fYv5NxK+F5DX_q1c_wvnhjT_WTZBFJQXLWFeqMXsEcASZg@mail.gmail.com>
 <CA+G9fYu-qYP2wJw4p1p_C6_ttwK0fvw+qUnsN9mDuKOv3zGEBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYu-qYP2wJw4p1p_C6_ttwK0fvw+qUnsN9mDuKOv3zGEBw@mail.gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Naresh Kamboju <naresh.kamboju@linaro.org> [200327 16:44]:
> The reported problem still happening on arm beagle board x15 device
> running Linux next kernel 20200327.
...

> [    0.000000] OF: ERROR: Bad of_node_put() on
> /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/l4per-cm@1700/l4per-clkctrl@28
> [    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W
>   5.6.0-rc7-next-20200327 #1
> [    0.000000] Hardware name: Generic DRA74X (Flattened Device Tree)
> [    0.000000] [<c0311810>] (unwind_backtrace) from [<c030ba14>]
> (show_stack+0x10/0x14)
> [    0.000000] [<c030ba14>] (show_stack) from [<c0fb6604>]
> (dump_stack+0xbc/0xd0)
> [    0.000000] [<c0fb6604>] (dump_stack) from [<c0fbb07c>]
> (kobject_put+0xc0/0x104)
> [    0.000000] [<c0fbb07c>] (kobject_put) from [<c1639e4c>]
> (of_clk_init+0x18c/0x228)
> [    0.000000] [<c1639e4c>] (of_clk_init) from [<c1611544>]
> (omap_clk_init+0x3c/0x58)
> [    0.000000] [<c1611544>] (omap_clk_init) from [<c1611ea8>]
> (omap4_sync32k_timer_init+0x8/0x2c)
> [    0.000000] [<c1611ea8>] (omap4_sync32k_timer_init) from
> [<c161213c>] (omap5_realtime_timer_init+0x8/0x234)
> [    0.000000] [<c161213c>] (omap5_realtime_timer_init) from
> [<c1600c88>] (start_kernel+0x330/0x4b8)

Just FYI, Tero is looking at the clock issues that seem to be
causing these warnings.

Regards,

Tony
