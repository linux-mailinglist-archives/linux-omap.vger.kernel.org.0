Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95C8C412EEB
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 09:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbhIUHCd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 03:02:33 -0400
Received: from muru.com ([72.249.23.125]:35232 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230027AbhIUHC3 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Sep 2021 03:02:29 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 18FD180A8;
        Tue, 21 Sep 2021 07:01:29 +0000 (UTC)
Date:   Tue, 21 Sep 2021 10:00:59 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Jarkko Nikula <jarkko.nikula@bitmer.com>,
        linux-omap@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: Regression with e428e250fde6 on BeagleBoard Rev C2
Message-ID: <YUmDKzMko81wc/C+@atomide.com>
References: <3f6924a7-1934-b94e-2441-4781fe737f32@bitmer.com>
 <YUiOA4QEbZXPmQ7F@atomide.com>
 <20210920165216.34abc4dd@aktux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210920165216.34abc4dd@aktux>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andreas Kemnade <andreas@kemnade.info> [210920 15:26]:
> Hi,
> 
> On Mon, 20 Sep 2021 16:34:59 +0300
> Tony Lindgren <tony@atomide.com> wrote:
> 
> > > I fail to understand how omap3isp affects this since it actually disable
> > > clocks after probe. Does it keep some power domain active which then
> > > keeps the timer active etc?  
> > 
> > Sounds like it's because omap3isp never allows the SoC to enter deeper
> > idle states. The mpu clock is stopped for idle states.
> 
> On GTA04 I experienced also some strange pm issues with omap3isp:
> rmmod clears up everything fine.
> 
> After probing, clocks seems to be turned off, but power consumption
> does not drop. It only drops when there is an iommu_detach paired to
> that iommu_attach in the driver.
> But if I add it, the driver does not work properly.

Are you also seeing a timer issue? Or just the omap3isp not idling the
SoC issue?

Regards,

Tony
