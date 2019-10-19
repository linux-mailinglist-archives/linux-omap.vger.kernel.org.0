Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 333A2DD5F2
	for <lists+linux-omap@lfdr.de>; Sat, 19 Oct 2019 03:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbfJSB1j (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 21:27:39 -0400
Received: from smtprelay0079.hostedemail.com ([216.40.44.79]:33163 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725793AbfJSB1j (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Fri, 18 Oct 2019 21:27:39 -0400
X-Greylist: delayed 499 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 Oct 2019 21:27:38 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave04.hostedemail.com (Postfix) with ESMTP id 163E91802C65C
        for <linux-omap@vger.kernel.org>; Sat, 19 Oct 2019 01:19:21 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay08.hostedemail.com (Postfix) with ESMTP id 268FB182CED28;
        Sat, 19 Oct 2019 01:19:19 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::::,RULES_HIT:41:355:379:599:857:960:966:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:2196:2198:2199:2200:2393:2553:2559:2562:2693:2828:2899:3138:3139:3140:3141:3142:3354:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:4321:4385:5007:6119:7903:7904:8603:10004:10400:10848:11026:11232:11658:11914:12043:12297:12438:12555:12740:12760:12895:12986:13439:14096:14097:14659:21080:21433:21627:21773:21795:30012:30051:30054:30090:30091,0,RBL:47.151.135.224:@perches.com:.lbl8.mailshell.net-62.8.0.100 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:542,LUA_SUMMARY:none
X-HE-Tag: books16_8b4f00402920f
X-Filterd-Recvd-Size: 3041
Received: from XPS-9350.home (unknown [47.151.135.224])
        (Authenticated sender: joe@perches.com)
        by omf02.hostedemail.com (Postfix) with ESMTPA;
        Sat, 19 Oct 2019 01:19:17 +0000 (UTC)
Message-ID: <184cdd47d4064420b05c16f10588595c65f789e5.camel@perches.com>
Subject: Re: [PATCH] omapfb: reduce stack usage
From:   Joe Perches <joe@perches.com>
To:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Ladislav Michl <ladis@linux-mips.org>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Date:   Fri, 18 Oct 2019 18:19:15 -0700
In-Reply-To: <20191018223012.tkpwbo3mg5mthlnz@debian>
References: <20191018163004.23498-1-sudipm.mukherjee@gmail.com>
         <20191018172728.GA11857@lenoch> <20191018223012.tkpwbo3mg5mthlnz@debian>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 2019-10-18 at 23:30 +0100, Sudip Mukherjee wrote:
> On Fri, Oct 18, 2019 at 07:27:28PM +0200, Ladislav Michl wrote:
> > On Fri, Oct 18, 2019 at 05:30:04PM +0100, Sudip Mukherjee wrote:
> > > The build of xtensa allmodconfig is giving a warning of:
> > > In function 'dsi_dump_dsidev_irqs':
> > > warning: the frame size of 1120 bytes is larger than 1024 bytes
> > > 
> > > Allocate the memory for 'struct dsi_irq_stats' dynamically instead
> > > of assigning it in stack.
> > 
> > So now function can fail silently, executes longer, code is sligthly
> > bigger... And all that to silent warning about exceeding frame size.
> > Is it really worth "fixing"?

Depends if it could fail in practice due to a stack overrun.

> The only point of failure is if kmalloc() fails and if kmalloc() fails then
> there will be error prints in dmesg to tell the user that there is no
> memory left in the system. About the size bigger, it seems
> the drivers/video/fbdev/omap2/omapfb/dss/dsi.o file is smaller with the
> patch.
> This is without the patch:
> -rw-r--r-- 1 sudip sudip 316856 Oct 18 22:27 drivers/video/fbdev/omap2/omapfb/dss/dsi.o
> And this is with the patch:
> -rw-r--r-- 1 sudip sudip 316436 Oct 18 20:09 drivers/video/fbdev/omap2/omapfb/dss/dsi.o
> 
> And also, objdump shows me that <dsi_dump_dsidev_irqs> was taking up 0xD7D
> bytes, and now with the patch it is taking up 0xBED bytes, thats a saving
> of 400 bytes. If it has 400 bytes of less code to execute will it not be
> faster now?

You should try compiling without all the debugging symbols (defconfig)

> But, I may be totally wrong in my thinking, and in that case, please feel
> free to reject the patch.

Without your patch:

$ objdump -x drivers/video/fbdev/omap2/omapfb/dss/dsi.o | grep dsi_dump_dsidev_irqs
00000d20 l     F .text	0000061c dsi_dump_dsidev_irqs

With your patch:

$ objdump -x drivers/video/fbdev/omap2/omapfb/dss/dsi.o | grep dsi_dump_dsidev_irqs
00000d20 l     F .text	00000638 dsi_dump_dsidev_irqs


