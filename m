Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C4ED3A139F
	for <lists+linux-omap@lfdr.de>; Wed,  9 Jun 2021 14:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233337AbhFIMCC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Jun 2021 08:02:02 -0400
Received: from muru.com ([72.249.23.125]:40030 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231928AbhFIMCB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 9 Jun 2021 08:02:01 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id DD70280F5;
        Wed,  9 Jun 2021 12:00:12 +0000 (UTC)
Date:   Wed, 9 Jun 2021 15:00:01 +0300
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
Message-ID: <YMCtQRbTIjNViMVB@atomide.com>
References: <20210604080536.12185-1-tony@atomide.com>
 <YMCJL7KXI1GxwQBl@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMCJL7KXI1GxwQBl@kroah.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Greg Kroah-Hartman <gregkh@linuxfoundation.org> [210609 09:26]:
> On Fri, Jun 04, 2021 at 11:05:35AM +0300, Tony Lindgren wrote:
> > Simplify cable state handling a bit to leave out duplicated code.
> > We are just scheduling work and showing state info if a recheck is
> > needed. No intended functional changes.
> > 
> > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Cc: Andreas Kemnade <andreas@kemnade.info>
> > Cc: Bhushan Shah <bshah@kde.org>
> > Cc: Drew Fustini <drew@beagleboard.org>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> >  drivers/usb/musb/musb_core.c | 40 ++++++++++++++++++------------------
> >  1 file changed, 20 insertions(+), 20 deletions(-)
> 
> Does not apply to my usb-next branch, what tree/branch did you make this
> against?

This was against Linux next last week, I'll take a look and
repost.

Regards,

Tony
