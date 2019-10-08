Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50F60CFF7B
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 19:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbfJHRDE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Oct 2019 13:03:04 -0400
Received: from muru.com ([72.249.23.125]:36050 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725900AbfJHRDE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 8 Oct 2019 13:03:04 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 50D6E8081;
        Tue,  8 Oct 2019 17:03:36 +0000 (UTC)
Date:   Tue, 8 Oct 2019 10:02:59 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Jeroen Hofstee <jhofstee@victronenergy.com>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Koen Kooi <koen@dominion.thruhere.net>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: am335x-sancloud-bbe: Fix PHY mode for ethernet
Message-ID: <20191008170259.GI5610@atomide.com>
References: <20191002095416.19603-1-jhofstee@victronenergy.com>
 <d027ef07-807d-6a7b-2939-b67be4542469@ti.com>
 <436f1712-7dec-db40-d08f-1a3032af3596@victronenergy.com>
 <d85cd860-22a3-6142-7f2d-736a428d7a31@ti.com>
 <20191008142349.GE5610@atomide.com>
 <1f779973-1702-47eb-158f-7000770c435a@victronenergy.com>
 <20191008161416.GG5610@atomide.com>
 <4fa5393d-0b2c-4b8c-128a-81ab05a14a82@victronenergy.com>
 <20191008165154.GH5610@atomide.com>
 <a8a72544-7f30-c896-22e4-7d85bd0b4235@victronenergy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8a72544-7f30-c896-22e4-7d85bd0b4235@victronenergy.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Jeroen Hofstee <jhofstee@victronenergy.com> [191008 17:00]:
> Hi,
> 
> On 10/8/19 6:51 PM, Tony Lindgren wrote:
> > * Jeroen Hofstee <jhofstee@victronenergy.com> [191008 16:43]:
> >> Hello Tony,
> >>
> >> On 10/8/19 6:14 PM, Tony Lindgren wrote:
> >>> * Jeroen Hofstee <jhofstee@victronenergy.com> [191008 16:03]:
> >>>> Hello Tony,
> >>>>
> >>>> On 10/8/19 4:23 PM, Tony Lindgren wrote:
> >>>>> * Grygorii Strashko <grygorii.strashko@ti.com> [191003 02:32]:
> >>>>>> On 03/10/2019 11:16, Jeroen Hofstee wrote:
> >>>>>>> Furthermore 4.19 is fine, so there is no need to include it in stable
> >>>>>>> and have a note to make sure also other patches are required etc.
> >>>>>> Hence all above patches went in 5.1 it would be correct to mention only
> >>>>>> 6d4cd041f0af net: phy: at803x: disable delay only for RGMII mode
> >>>>> Jeroen, can you please send an updated patch with the fixes
> >>>>> tag changed?
> >>>>>
> >>>> For completeness, there is no "Fixes tag" as you mentioned.
> >>>> The commit only refers to another commit which introduces
> >>>> a problem.
> >>> Well please add the fixes tag, that way this will get
> >>> properly applied to earlier stable kernels too :)
> >> But 4.19 is fine, this is an issue in 5.1 as in EOL...
> >> I really don't understand why I should waste time
> >> to figure out what happened exactly during the 5.1
> >> release cycle...
> > Hmm so what's the issue with just adding the fixes tag Grygorii
> > suggested:
> >
> > 6d4cd041f0af ("net: phy: at803x: disable delay only for RGMII mode")
> >
> > No need to dig further?
> 
> Grygorii doesn't suggest to add a fixes tag, just to change the referenced
> commit to another. Obviously I would like to understand why another commit
> should be referenced. And then I should read and parse the response, so there
> is no special reason, just time...

OK sure. Well once you guys have the commit figured out, let me
know what to apply. And we know Grygorii is mostly right based
on his history of comments so best to not ignore that :)

Cheers,

Tony
