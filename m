Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B037322E5
	for <lists+linux-omap@lfdr.de>; Sun,  2 Jun 2019 12:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725977AbfFBKOs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 2 Jun 2019 06:14:48 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:56485 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbfFBKOs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 2 Jun 2019 06:14:48 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id DEEF080370; Sun,  2 Jun 2019 12:14:34 +0200 (CEST)
Date:   Sun, 2 Jun 2019 12:14:34 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 1/2] phy: core: Add phy_pm_runtime_enabled
Message-ID: <20190602101434.GA1126@atrey.karlin.mff.cuni.cz>
References: <20181117133755.9129-1-tony@atomide.com>
 <20181117133755.9129-2-tony@atomide.com>
 <20181117153845.GU19900@localhost>
 <20181117154353.GM53235@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181117154353.GM53235@atomide.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi!

> > > The phy driver may need to check phy_pm_runtime_enabled() in suspend as
> > > PM runtime for phy may be already disabled when phy power_off() is called.
> > > 
> > > Cc: Pavel Machek <pavel@ucw.cz>
> > > Cc: Sebastian Reichel <sre@kernel.org>
> > > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > > ---
> > >  drivers/phy/phy-core.c  | 9 +++++++++
> > >  include/linux/phy/phy.h | 6 ++++++
> > >  2 files changed, 15 insertions(+)
> > > 
> > > diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> > > --- a/drivers/phy/phy-core.c
> > > +++ b/drivers/phy/phy-core.c
> > 
> > > diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> > > --- a/include/linux/phy/phy.h
> > > +++ b/include/linux/phy/phy.h
> > > @@ -158,6 +158,7 @@ int phy_pm_runtime_get(struct phy *phy);
> > >  int phy_pm_runtime_get_sync(struct phy *phy);
> > >  int phy_pm_runtime_put(struct phy *phy);
> > >  int phy_pm_runtime_put_sync(struct phy *phy);
> > > +bool phy_pm_runtime_enabled(struct phy *phy);
> > >  void phy_pm_runtime_allow(struct phy *phy);
> > >  void phy_pm_runtime_forbid(struct phy *phy);
> > >  int phy_init(struct phy *phy);
> > > @@ -240,6 +241,11 @@ static inline int phy_pm_runtime_put_sync(struct phy *phy)
> > >  	return -ENOSYS;
> > >  }
> > >  
> > > +static inline bool phy_pm_runtime_enabled(struct phy *phy)
> > > +{
> > > +	return false
> > 
> > Missing semicolon.
> 
> Oops thanks for catching that. I guess I did not try building
> without CONFIG_GENERIC_PHY. Will fix and repost.

Did this series get lost/forgotten somewhere? Is it still needed? Any
way I can help?
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
