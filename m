Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B86B23980A9
	for <lists+linux-omap@lfdr.de>; Wed,  2 Jun 2021 07:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbhFBFck (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Jun 2021 01:32:40 -0400
Received: from muru.com ([72.249.23.125]:35172 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229953AbhFBFce (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 2 Jun 2021 01:32:34 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5210080E0;
        Wed,  2 Jun 2021 05:30:59 +0000 (UTC)
Date:   Wed, 2 Jun 2021 08:30:49 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc:     linux-omap@vger.kernel.org
Subject: Re: Regression with 6cfcd5563b4f on BeagleBoard Rev C2
Message-ID: <YLcXicwDxue0a52/@atomide.com>
References: <68f28473-a196-b106-b4ae-e9162b7002e6@bitmer.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68f28473-a196-b106-b4ae-e9162b7002e6@bitmer.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Jarkko Nikula <jarkko.nikula@bitmer.com> [210528 13:56]:
> My old BeagleBoard Rev C2 stopped booting properly.
> 
> Booting stops "Waiting for root device /dev/mmcblk0p2..." but goes
> forward if I feed e.g. ENTER over serial and have to press it through
> almost the whole userspace booting. At some point during process it
> seems to start working. Perhaps userspace fires some timer etc?

Sounds like the beagleboard timer errata handling is either picking
a wrong clockevent timer, or later on ti-sysc misdetects the active
timer for clockevent and idles it.

What does dmesg say in the beginning for clockevent and clocksource
timers?

> I bisected the issue into commit 6cfcd5563b4f
> ("clocksource/drivers/timer-ti-dm: Fix suspend and resume for am3 and
> am4"). I used omap2plus_defconfig.

OK

Regards,

Tony
