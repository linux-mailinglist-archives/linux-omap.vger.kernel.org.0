Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A39DCC045
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2019 18:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390204AbfJDQKJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Oct 2019 12:10:09 -0400
Received: from muru.com ([72.249.23.125]:35378 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389835AbfJDQKJ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 4 Oct 2019 12:10:09 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0D72880BF;
        Fri,  4 Oct 2019 16:10:41 +0000 (UTC)
Date:   Fri, 4 Oct 2019 09:10:05 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>
Subject: Re: [PATCH] ARM: dts: logicpd-torpedo-som: Remove twl_keypad
Message-ID: <20191004161005.GN5610@atomide.com>
References: <20190816225812.14301-1-aford173@gmail.com>
 <CAHCN7x+xqarvou+0TOBDTEjQZnX_UCED8UTvJh=VYkRak6SN_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7x+xqarvou+0TOBDTEjQZnX_UCED8UTvJh=VYkRak6SN_A@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [191003 23:33]:
> On Fri, Aug 16, 2019 at 5:58 PM Adam Ford <aford173@gmail.com> wrote:
> >
> > The TWL4030 used on the Logit PD Torpedo SOM does not have the
> > keypad pins routed.  This patch disables the twl_keypad driver
> > to remove some splat during boot:
> >
> > [    5.902221] twl4030_keypad 48070000.i2c:twl@48:keypad: missing or malformed property linux,keymap: -22
> > [    5.911773] twl4030_keypad 48070000.i2c:twl@48:keypad: Failed to build keymap
> > [    5.918975] twl4030_keypad: probe of 48070000.i2c:twl@48:keypad failed with error -22
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> 
> Tony,
> 
> Any chance this can get accepted?

Yeah sure, I was thinking it for v5.5, but since  it's a one liner and
removes few lines of bogus warnings I'm applying it into fixes instead
of next.

Thanks,

Tony
