Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8DBD9421
	for <lists+linux-omap@lfdr.de>; Wed, 16 Oct 2019 16:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404596AbfJPOk5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Oct 2019 10:40:57 -0400
Received: from muru.com ([72.249.23.125]:37502 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727291AbfJPOk4 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 16 Oct 2019 10:40:56 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 54C148107;
        Wed, 16 Oct 2019 14:41:30 +0000 (UTC)
Date:   Wed, 16 Oct 2019 07:40:53 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 2/8] ARM: OMAP2+: Drop bogus wkup domain oswr setting
Message-ID: <20191016144053.GC5610@atomide.com>
References: <20191010001224.41826-1-tony@atomide.com>
 <20191010001224.41826-3-tony@atomide.com>
 <20191013150744.GD13278@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191013150744.GD13278@amd>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pavel Machek <pavel@ucw.cz> [191013 15:08]:
> Hi!
> 
> > The wkup domain is always on and does not have logic off setting. This
> > got accidentally added by commit f74297dd9354 ("ARM: OMAP2+: Make sure
> > LOGICRETSTATE bits are not cleared") but is harmless.
> > 
> > Cc: Merlijn Wajer <merlijn@wizzup.org>
> > Cc: Pavel Machek <pavel@ucw.cz>
> > Cc: Sebastian Reichel <sre@kernel.org>
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> >  arch/arm/mach-omap2/pm44xx.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm/mach-omap2/pm44xx.c b/arch/arm/mach-omap2/pm44xx.c
> > --- a/arch/arm/mach-omap2/pm44xx.c
> > +++ b/arch/arm/mach-omap2/pm44xx.c
> > @@ -137,8 +137,7 @@ static int __init pwrdms_setup(struct powerdomain *pwrdm, void *unused)
> >  	 * smsc911x at least if per hits retention during idle.
> >  	 */
> >  	if (!strncmp(pwrdm->name, "core", 4) ||
> > -	    !strncmp(pwrdm->name, "l4per", 5) ||
> > -	    !strncmp(pwrdm->name, "wkup", 4))
> > +	    !strncmp(pwrdm->name, "l4per", 5))
> >  		pwrdm_set_logic_retst(pwrdm, PWRDM_POWER_RET);
> 
> This is rather theoretical, but if the powerdomain is called
> "corelation-not-causation", do you still want the if() to trigger?

No need to if no writable register bits exists if I understand
your theoretical comment right :)

Regards,

Tony
