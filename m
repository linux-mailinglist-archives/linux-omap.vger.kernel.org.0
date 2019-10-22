Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98455E082F
	for <lists+linux-omap@lfdr.de>; Tue, 22 Oct 2019 18:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389072AbfJVQDz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Oct 2019 12:03:55 -0400
Received: from muru.com ([72.249.23.125]:38962 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387746AbfJVQDy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 22 Oct 2019 12:03:54 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 66F6380FA;
        Tue, 22 Oct 2019 16:04:29 +0000 (UTC)
Date:   Tue, 22 Oct 2019 09:03:51 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Add logicpd-som-lv and logicpd-torpedo to
 OMAP TREE
Message-ID: <20191022160351.GQ5610@atomide.com>
References: <20190923135908.23080-1-aford173@gmail.com>
 <CAHCN7xLQvYbY_Pu5hQOO8o+1o8CAVvXq_-RM78Q=jYvtLxtmbg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xLQvYbY_Pu5hQOO8o+1o8CAVvXq_-RM78Q=jYvtLxtmbg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [191021 21:41]:
> On Mon, Sep 23, 2019 at 8:59 AM Adam Ford <aford173@gmail.com> wrote:
> >
> > The OMAP DEVICE TREE SUPPORT lists a bunch of device tree files
> > with wildcard names using am3*, am4*, am5*, dra7*, and *omap*.
> > Unfortunately, the LogicPD boards do not follow this convention
> > so changes to these boards don't get automatically flagged to
> > route to the omap mailing list.  After consulting with Tony
> > Lindgren, he agreed it made sense to add these boards to the
> > list.
> >
> > This patch adds the omap based boards to the omap device tree
> > maintainer list.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> 
> Tony,
> 
> Are you ok with this?  I am not sure who to bug, but I am guessing
> whomever it is will want/need your approval too.

Yeah looks fine to me thanks, I'll apply it into
omap-for-v5.5/maintainers branch.

Regards,

Tony

> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index a50e97a63bc8..0ee89575699c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11645,6 +11645,8 @@ F:      arch/arm/boot/dts/*am3*
> >  F:     arch/arm/boot/dts/*am4*
> >  F:     arch/arm/boot/dts/*am5*
> >  F:     arch/arm/boot/dts/*dra7*
> > +F:     arch/arm/boot/dts/logicpd-som-lv*
> > +F:     arch/arm/boot/dts/logicpd-torpedo*
> >
> >  OMAP DISPLAY SUBSYSTEM and FRAMEBUFFER SUPPORT (DSS2)
> >  L:     linux-omap@vger.kernel.org
> > --
> > 2.17.1
> >
