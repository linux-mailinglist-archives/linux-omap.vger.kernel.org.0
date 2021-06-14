Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57F113A5E5A
	for <lists+linux-omap@lfdr.de>; Mon, 14 Jun 2021 10:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232606AbhFNI23 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Jun 2021 04:28:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:40672 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232528AbhFNI21 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 14 Jun 2021 04:28:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ED03161370;
        Mon, 14 Jun 2021 08:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623659184;
        bh=W2RPS+Z+VUaNMKPxturxYJggYGMg7qaXHXxoHbT6lAI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0Sl/ImlClxlRVKEwpreoJ3XSHheoMQTh17BvObmk04CSvAz0T0HiTJFZgUZViJCFe
         /tJ20LYsR7gKuQYBRieRNhgXuV9YBChTZkfxo0wl+U2ZDn+MBTBfzQbDfezwSn+Fm2
         zQw4BU26b4ELGpnqo6a7lQkyQkC+7w/z6epLYjhc=
Date:   Mon, 14 Jun 2021 10:26:21 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Bhushan Shah <bshah@kde.org>,
        Drew Fustini <drew@beagleboard.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 1/2] usb: musb: Simplify cable state handling
Message-ID: <YMcSrUXLZxaQM6St@kroah.com>
References: <20210604080536.12185-1-tony@atomide.com>
 <YMCJL7KXI1GxwQBl@kroah.com>
 <YMCtQRbTIjNViMVB@atomide.com>
 <YMLx9O0DnWc1umPo@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMLx9O0DnWc1umPo@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jun 11, 2021 at 08:17:40AM +0300, Tony Lindgren wrote:
> * Tony Lindgren <tony@atomide.com> [210609 12:00]:
> > * Greg Kroah-Hartman <gregkh@linuxfoundation.org> [210609 09:26]:
> > > On Fri, Jun 04, 2021 at 11:05:35AM +0300, Tony Lindgren wrote:
> > > > Simplify cable state handling a bit to leave out duplicated code.
> > > > We are just scheduling work and showing state info if a recheck is
> > > > needed. No intended functional changes.
> > > > 
> > > > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > > Cc: Andreas Kemnade <andreas@kemnade.info>
> > > > Cc: Bhushan Shah <bshah@kde.org>
> > > > Cc: Drew Fustini <drew@beagleboard.org>
> > > > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > > > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > > > ---
> > > >  drivers/usb/musb/musb_core.c | 40 ++++++++++++++++++------------------
> > > >  1 file changed, 20 insertions(+), 20 deletions(-)
> > > 
> > > Does not apply to my usb-next branch, what tree/branch did you make this
> > > against?
> > 
> > This was against Linux next last week, I'll take a look and
> > repost.
> 
> Looks like the issue applying these patches is caused by commit
> b65ba0c362be ("usb: musb: fix MUSB_QUIRK_B_DISCONNECT_99 handling")
> that is in usb-linus but not in usb-next.
> 
> Probably best to merge usb-linus to usb-next and then these patches
> apply no problem and a merge conflict is avoided?
> 
> Let me know if you still want me to repost against usb-next, I can
> do that no problem if you prefer that :)

Now that I have merged usb-linus into usb-next, I can take these,
thanks.

greg k-h
