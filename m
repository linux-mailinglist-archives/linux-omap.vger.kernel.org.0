Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77AAD20D41C
	for <lists+linux-omap@lfdr.de>; Mon, 29 Jun 2020 21:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729476AbgF2TFN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Jun 2020 15:05:13 -0400
Received: from muru.com ([72.249.23.125]:59962 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730521AbgF2TFL (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 29 Jun 2020 15:05:11 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3161D818E;
        Mon, 29 Jun 2020 15:30:22 +0000 (UTC)
Date:   Mon, 29 Jun 2020 08:29:26 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 4/7] mach-omap1: board-ams-delta.c: remove soc_camera
 dependencies
Message-ID: <20200629152926.GQ37466@atomide.com>
References: <20200626115321.1898798-1-hverkuil-cisco@xs4all.nl>
 <20200626115321.1898798-5-hverkuil-cisco@xs4all.nl>
 <CAK8P3a0XNb5=4F3QMpO+CtQZuxvKdmKrHPjZ80fv0Rgt4U0pfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0XNb5=4F3QMpO+CtQZuxvKdmKrHPjZ80fv0Rgt4U0pfA@mail.gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Arnd Bergmann <arnd@arndb.de> [200626 12:59]:
> On Fri, Jun 26, 2020 at 1:53 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >
> > The soc_camera driver is about to be removed, so drop camera
> > support from this board. Note that the soc_camera driver itself has
> > long since been deprecated and can't be compiled anymore (it depends
> > on BROKEN), so camera support on this board has been broken for a long
> > time (at least since 4.6 when the omap1_camera.c was removed from soc_camera).
> >
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Tony Lindgren <tony@atomide.com>
> > ---
> >  arch/arm/mach-omap1/board-ams-delta.c         | 32 --------------
> >  arch/arm/mach-omap1/camera.h                  | 14 ------
> >  arch/arm/mach-omap1/devices.c                 | 43 -------------------
> >  .../linux/platform_data/media/omap1_camera.h  | 32 --------------
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> Please merge this through the media tree if there are no objections.

Yes agreed, this is unlikely to conflict with anything:

Acked-by: Tony Lindgren <tony@atomide.com>
