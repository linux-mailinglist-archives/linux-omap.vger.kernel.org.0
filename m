Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26CA6230543
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jul 2020 10:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbgG1IXk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Jul 2020 04:23:40 -0400
Received: from muru.com ([72.249.23.125]:38272 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728068AbgG1IXj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 28 Jul 2020 04:23:39 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7B4BF8105;
        Tue, 28 Jul 2020 08:23:37 +0000 (UTC)
Date:   Tue, 28 Jul 2020 01:23:48 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        kernel@pyra-handheld.com, Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: BUG: omap5: v5.8-rc7 boot fails
Message-ID: <20200728082348.GD2811@atomide.com>
References: <3FEECC44-3156-4786-8DF9-149F8CA9B41D@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3FEECC44-3156-4786-8DF9-149F8CA9B41D@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [200727 20:51]:
> Hi Tony,
> after trying v5.8-rc7 the Pyra boot hangs after ca. 3 seconds
> (a little random what the last log line is).
> 
> I could bisect it to:
> 
> 6cfcd5563b4fadbf49ba8fa481978e5e86d30322 is the first bad commit
> commit 6cfcd5563b4fadbf49ba8fa481978e5e86d30322
> Author: Tony Lindgren <tony@atomide.com>
> Date:   Mon Jul 13 09:26:01 2020 -0700
> 
>     clocksource/drivers/timer-ti-dm: Fix suspend and resume for am3 and am4
> 
> And a git revert makes it boot again.
> 
> I haven't had time to do more tests (e.g. with omap3/4 or on omap5uevm).

Oops sorry about that, I'll take a look.

Regards,

Tony
