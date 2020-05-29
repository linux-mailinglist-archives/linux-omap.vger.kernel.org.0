Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32D001E8A77
	for <lists+linux-omap@lfdr.de>; Fri, 29 May 2020 23:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727879AbgE2VxT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 May 2020 17:53:19 -0400
Received: from muru.com ([72.249.23.125]:56302 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726975AbgE2VxS (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 29 May 2020 17:53:18 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 186A18030;
        Fri, 29 May 2020 21:54:07 +0000 (UTC)
Date:   Fri, 29 May 2020 14:53:14 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Faiz Abbas <faiz_abbas@ti.com>, Keerthy <j-keerthy@ti.com>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        bcousson@baylibre.com
Subject: Re: [PATCH v2] arm: dts: Move am33xx and am43xx mmc nodes to
 sdhci-omap driver
Message-ID: <20200529215314.GZ37466@atomide.com>
References: <20200512203804.9340-1-faiz_abbas@ti.com>
 <20200513162327.GM37466@atomide.com>
 <94025425-95e2-e53d-cfac-a1e73e6c011a@ti.com>
 <53c815db-dd7d-e6e1-f81a-cf05ef340c71@ti.com>
 <20200519154807.GT37466@atomide.com>
 <e37ed4be-aed5-8051-a9fd-c0704d947d75@ti.com>
 <20200519160458.GU37466@atomide.com>
 <20200527160543.GI37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527160543.GI37466@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [200527 16:06]:
> * Tony Lindgren <tony@atomide.com> [200519 09:05]:
> > * Tomi Valkeinen <tomi.valkeinen@ti.com> [200519 15:55]:
> > > (Dropping DT from cc)
> > > 
> > > On 19/05/2020 18:48, Tony Lindgren wrote:
> > > 
> > > > > > Suspend/resume on am43xx-gpevm is broken right now in mainline and the regression looks
> > > > > > like it is caused by the display subsystem. I have reported this to Tomi and
> > > > > > its being investigated.
> > > > > > 
> > > > > > Meanwhile I have tested this patch with display configs disabled and Keerthy's
> > > > > > suspend/resume tests pass on both am3 and am4.
> > > > 
> > > > OK great thanks for checking it. Do you have the display subsystem
> > > > related commit that broke PM? I'm wondering if my recent DSS platform
> > > > data removal changes might have caused the regression.
> > > 
> > > I spent a bit time looking at this, but unfortunately I wasn't even able to
> > > resume my AM4 evm from suspend. I tried with rtcwake and with plain console
> > > (with no_console_suspend). I did not have DSS loaded.
> > 
> > My test-bbb-suspend script seems to have:
> > 
> > sudo modprobe wkup_m3_ipc
> > sudo modprobe pm33xx
> > sudo modprobe rtc-omap
> > rtcwake -m mem -s 5
> > 
> > I think the same should work for am437x. But some boards do not support
> > deep sleep like am437x-idk.
> > 
> > > Anyone have quick hints on how to debug why resume doesn't seem to happen?
> > 
> > You might get some info with no_console_suspend, but that might also
> > cause other issues.
> 
> To me it seems we may have some dss clock missing with the ti-sysc dts
> changes that makes resume fail. Or else there is some ordering issue
> between the dss components now on resume, I'll try to debug more.

Looks like we now set the CLOCKATIVITY bit while earlier we did not
set it except for HWMOD_SET_DEFAULT_CLOCKACT cases. I've also found
few other minor issues, but I'm still seeing resume fail for DSS.
The clock and sysconfig registers look just fine, so getting closer.

Regards,

Tony
