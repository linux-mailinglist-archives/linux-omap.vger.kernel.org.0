Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A03C1F9411
	for <lists+linux-omap@lfdr.de>; Mon, 15 Jun 2020 11:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729585AbgFOJ5c (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 15 Jun 2020 05:57:32 -0400
Received: from mga06.intel.com ([134.134.136.31]:59474 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728369AbgFOJ5b (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 15 Jun 2020 05:57:31 -0400
IronPort-SDR: DQ4VVTd9bpJfXh0sMYOy2FFxK9NCU9kqPx74jx+P9zt7zMq0m2RE/Ofhwd7J/wlM2tabdjq8Lv
 10pRocL3Wdbw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 02:57:30 -0700
IronPort-SDR: RjkgDfsWSWEoQvV9dUX30JYTzaTHqYboGDi5Dc8vaZeBgcgY0/Z2yMTiS5MnCxFLYvvFzHnml0
 hw7NcqkTJBiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="290640218"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002.jf.intel.com with ESMTP; 15 Jun 2020 02:57:28 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1jklru-00DXZQ-8o; Mon, 15 Jun 2020 12:57:30 +0300
Date:   Mon, 15 Jun 2020 12:57:30 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Peter Hurley <peter@hurleysoftware.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH] serial: 8250_port: Fix imprecise external abort for
 mctrl if inactive
Message-ID: <20200615095730.GT2428291@smile.fi.intel.com>
References: <20200602001813.30459-1-tony@atomide.com>
 <20200602080811.GI19480@localhost>
 <CAHp75Vfi5nDgwT10J_EKYn90vGuiL1hyfre+t_w_OFREFY-Tqg@mail.gmail.com>
 <20200602133659.GD37466@atomide.com>
 <20200602185515.GF37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200602185515.GF37466@atomide.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jun 02, 2020 at 11:55:15AM -0700, Tony Lindgren wrote:
> * Tony Lindgren <tony@atomide.com> [200602 13:38]:
> > * Andy Shevchenko <andy.shevchenko@gmail.com> [200602 08:33]:
> > Now that we can detach and reattach the kernel serial console,
> > there should not be any need for pm_runtime_irq_safe() anymore :)
> 
> Below is a hastily tested RFC patch to remove pm_runtime_irq_safe()
> for 8250_omap.c that seems to work for idle use case :)
> 
> > And the UART wake-up from deeper idle states can only happen with
> > help of external hardware like GPIO controller or pinctrl controller.
> 
> It does not yet include the check for configured wakeirq though.
> And omap-serial.c needs a similar patch or maybe we can attempt
> to just drop it this time as 8250_omap.c should be used nowadays.
> Or just drop PM from omap-serial.c if it can't be dropped.
> 
> Andy, is the change below the only remaining blocker now for
> your serial PM runtime changes?

In private chat we have got more or less working solution. We both will going
to give more tests and then I will share (at least as a branch on some public
Git service) the set.

-- 
With Best Regards,
Andy Shevchenko


