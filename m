Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA574A80F4
	for <lists+linux-omap@lfdr.de>; Thu,  3 Feb 2022 10:07:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234328AbiBCJHW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Feb 2022 04:07:22 -0500
Received: from muru.com ([72.249.23.125]:45886 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234046AbiBCJHW (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 3 Feb 2022 04:07:22 -0500
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 20FD180EE;
        Thu,  3 Feb 2022 09:07:07 +0000 (UTC)
Date:   Thu, 3 Feb 2022 11:07:20 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     qianfan <qianfanguijin@163.com>
Cc:     linux-omap@vger.kernel.org,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>
Subject: Re: OMAP GPIO ready too later
Message-ID: <YfubSOB+uq9jYf/N@atomide.com>
References: <63abe475-710f-9ff5-ef20-c78b2a3d5e5c@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63abe475-710f-9ff5-ef20-c78b2a3d5e5c@163.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* qianfan <qianfanguijin@163.com> [220119 08:36]:
> Hi everyone:
> 
> On my board there has a gpio watchdong connected on am3358. And I found that
> the omap gpio device ready too later so it takes about 5 seconds when the
> gpio-wdt is ready.
> 
> I had tested on some version of linux, check when the OMAP GPIO is ready.
> Next is the log:
> 
> v4.19 [    0.195191] OMAP GPIO hardware version 0.1
> 
> v5.4  [    1.168868] OMAP GPIO hardware version 0.1
> 
> v5.9  [    4.598052] OMAP GPIO hardware version 0.1
> 
> v5.15 [    1.253851] OMAP GPIO hardware version 0.1
> 
> I can't find which commit slowdown omap gpio driver. could you please give
> me some advice?

We've moved to probe pretty much everything at normal module_init time
instead of trying to probe everything early. Only clocks and system timers
need to be probed early for the omap variants.

One of the reasons for the device drivers probing later on during the boot
is caused by drivers/bus/ti-sysc.c. As ti-sysc is the parent device on the
interconnect, none of it's child devices probe before it. And there should
not be any need to probe ti-sysc early. The total boot-up time should be
about the same, just the probe order has changed. If there are issues with
the boot-up time in general, then that's a bug.

Maybe you want to configure the watchdog in the bootloader initially until
the Linux device drivers get probed?

Regards,

Tony
