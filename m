Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D38739780B
	for <lists+linux-omap@lfdr.de>; Wed, 21 Aug 2019 13:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbfHULiz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 21 Aug 2019 07:38:55 -0400
Received: from muru.com ([72.249.23.125]:58386 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726372AbfHULiz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 21 Aug 2019 07:38:55 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B02F6809C;
        Wed, 21 Aug 2019 11:39:21 +0000 (UTC)
Date:   Wed, 21 Aug 2019 04:38:50 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Filip =?utf-8?Q?Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        kernel@pyra-handheld.com,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, maemo-leste@lists.dyne.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Lay common foundation to make PVR/SGX work without hacks on
 OMAP34xx, OMAP36xx, AM335x and potentially OMAP4, OMAP5
Message-ID: <20190821113850.GP52127@atomide.com>
References: <3b0a5e78-c4c2-1963-bac7-b49496a1e9b9@wizzup.org>
 <1F942AAB-1648-46C0-ADD5-90F6898778BE@goldelico.com>
 <84cac9b8-0eff-33f8-464d-4f8045d7db19@wizzup.org>
 <BFAA7FA6-A352-476A-99F9-02EA663A6AAD@goldelico.com>
 <20190814094755.GC52127@atomide.com>
 <6A6394A6-9D50-4E43-A8E4-716888897AD6@goldelico.com>
 <20190814131607.GD52127@atomide.com>
 <CAHCN7xJ2kcr7dOFvxTB_PX_62sX_QV5EyeMPHMaPbZ9fXts9pg@mail.gmail.com>
 <20190817070307.GJ52127@atomide.com>
 <CAHCN7xJH6ZjksNZ2cyb1rN_TiF-0GKAtW9KD1kv1-JE+gqLgEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xJH6ZjksNZ2cyb1rN_TiF-0GKAtW9KD1kv1-JE+gqLgEA@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [190819 19:26]:
> On Sat, Aug 17, 2019 at 2:03 AM Tony Lindgren <tony@atomide.com> wrote:
> >
> > * Adam Ford <aford173@gmail.com> [190816 23:02]:
> > > On Wed, Aug 14, 2019 at 8:16 AM Tony Lindgren <tony@atomide.com> wrote:
> > > > Well I just posted some sgx interconnect target module patches. We might
> > > > still have them in v5.4 assuming people manage to review and test them.
> > >
> > > Nikolaus,
> > >
> > > I tested Tony's change and I can confirm that I can read the value
> > > when enabled.  Should I apply his patches to your branch before I
> > > test, or is it go too to go as-is? I've got an AM3517, OMAP35 and a
> > > DM3730.  I am not sure if the AM3517 is even on the radar, but it has
> > > an sgx530 as well.
> >
> > My estimate is am3517 is wired the same way as omap34xx with a 60%
> > chance, then 30% chance it's wired the same way as omap36xx, and then
> > 10% chance for similar wiring to am335x.. So hopefully that leaves 0%
> > chance for yet something different for it's wiring :)
> 
> Based on [1], I went under the assumption it was wired like the
> omap34xx.  I applied your omap34 patches to the am3517.dtsi, and I was
> able to get the same response as I did for the omap3530.  Do you want
> me to post the patches to the mailing list, or do you want to do it?

OK great, yeah please post patches :)

Thanks,

TOny
