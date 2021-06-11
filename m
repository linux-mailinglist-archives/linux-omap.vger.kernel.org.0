Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA04A3A3B49
	for <lists+linux-omap@lfdr.de>; Fri, 11 Jun 2021 07:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230405AbhFKFTm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Jun 2021 01:19:42 -0400
Received: from muru.com ([72.249.23.125]:41580 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230361AbhFKFTl (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 11 Jun 2021 01:19:41 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id F405580E1;
        Fri, 11 Jun 2021 05:17:51 +0000 (UTC)
Date:   Fri, 11 Jun 2021 08:17:40 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Bhushan Shah <bshah@kde.org>,
        Drew Fustini <drew@beagleboard.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 1/2] usb: musb: Simplify cable state handling
Message-ID: <YMLx9O0DnWc1umPo@atomide.com>
References: <20210604080536.12185-1-tony@atomide.com>
 <YMCJL7KXI1GxwQBl@kroah.com>
 <YMCtQRbTIjNViMVB@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMCtQRbTIjNViMVB@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [210609 12:00]:
> * Greg Kroah-Hartman <gregkh@linuxfoundation.org> [210609 09:26]:
> > On Fri, Jun 04, 2021 at 11:05:35AM +0300, Tony Lindgren wrote:
> > > Simplify cable state handling a bit to leave out duplicated code.
> > > We are just scheduling work and showing state info if a recheck is
> > > needed. No intended functional changes.
> > > 
> > > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > Cc: Andreas Kemnade <andreas@kemnade.info>
> > > Cc: Bhushan Shah <bshah@kde.org>
> > > Cc: Drew Fustini <drew@beagleboard.org>
> > > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > > ---
> > >  drivers/usb/musb/musb_core.c | 40 ++++++++++++++++++------------------
> > >  1 file changed, 20 insertions(+), 20 deletions(-)
> > 
> > Does not apply to my usb-next branch, what tree/branch did you make this
> > against?
> 
> This was against Linux next last week, I'll take a look and
> repost.

Looks like the issue applying these patches is caused by commit
b65ba0c362be ("usb: musb: fix MUSB_QUIRK_B_DISCONNECT_99 handling")
that is in usb-linus but not in usb-next.

Probably best to merge usb-linus to usb-next and then these patches
apply no problem and a merge conflict is avoided?

Let me know if you still want me to repost against usb-next, I can
do that no problem if you prefer that :)

Regards,

Tony
