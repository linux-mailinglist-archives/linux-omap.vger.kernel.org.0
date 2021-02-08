Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15AFB312D1D
	for <lists+linux-omap@lfdr.de>; Mon,  8 Feb 2021 10:20:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbhBHJTq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Feb 2021 04:19:46 -0500
Received: from muru.com ([72.249.23.125]:58788 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231489AbhBHJQn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Feb 2021 04:16:43 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 485AB80A3;
        Mon,  8 Feb 2021 09:16:07 +0000 (UTC)
Date:   Mon, 8 Feb 2021 11:15:48 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: DM3730 Suspend-Resume with 5.11-rc6
Message-ID: <YCEBRBcfZa2D6J6X@atomide.com>
References: <CAHCN7xLXK774FTKVXPM1LQbg0KQm+7ASFxtiaYZsUbGKnwYfDQ@mail.gmail.com>
 <CAHCN7xKvUx7q0GL+JV8O7MEYo1zb8g2ePbHKQg8SxRmmsj+b6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xKvUx7q0GL+JV8O7MEYo1zb8g2ePbHKQg8SxRmmsj+b6g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [210206 22:22]:
> On Sat, Feb 6, 2021 at 3:57 PM Adam Ford <aford173@gmail.com> wrote:
> >
> > I am having issues with suspend on a DM3730 running 5.11-rc6, and it
> > seems like core_pwrdm may be the issue.

That probably just means you did not configure off mode for idle.

Suspend and resume still works for me based on a quick try with -rc7.
I use the following test script to enable idle FYI, then suspend,
and wake-up the system to a key press on serial console.

Also modprobe rtc-twl and rtcwake -m mem -s 5 worked.

Regards,

Tony

8< -------------
#!/bin/bash

# Detach kernel serial console
consoles=$(find /sys/bus/platform/devices/4*.serial/ -name console)
for console in ${consoles}; do
	echo -n N > ${console}
done

# Configure PM runtime autosuspend
uarts=$(find /sys/bus/platform/devices/4*.serial/power/ -type d)
for uart in $uarts; do
	echo -n 3000 > $uart/autosuspend_delay_ms
	echo -n enabled > $uart/wakeup
	echo -n auto > $uart/control
done

# Configure wake-up from suspend
uarts=$(find /sys/class/tty/tty[SO]*/power/ -type d 2>/dev/null)
for uart in $uarts; do
	echo -n enabled > $uart/wakeup
done

echo -n 1 > /sys/kernel/debug/pm_debug/enable_off_mode
