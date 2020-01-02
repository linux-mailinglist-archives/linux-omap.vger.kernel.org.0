Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6D1012EA4D
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2020 20:25:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728129AbgABTZo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jan 2020 14:25:44 -0500
Received: from muru.com ([72.249.23.125]:49936 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727951AbgABTZo (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 2 Jan 2020 14:25:44 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E003F8087;
        Thu,  2 Jan 2020 19:26:23 +0000 (UTC)
Date:   Thu, 2 Jan 2020 11:25:40 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Sebastian Reichel <sre@kernel.org>, nekit1000@gmail.com,
        Marcel Partap <mpartap@gmx.net>, merlijn@wizzup.org,
        martin_rysavy@centrum.cz
Subject: Re: Droid 4 regression in 5.5-rc1, armsoc-soc tree
Message-ID: <20200102192540.GD16702@atomide.com>
References: <20191228162929.GA29269@duo.ucw.cz>
 <20191228193622.GA13047@duo.ucw.cz>
 <20191230173507.GM35479@atomide.com>
 <20200102110025.GA29035@amd>
 <CAK8P3a2Ya+GZRRA_THZBVDq7SWO8UYoUPwW5fEyorCVjPnd1qA@mail.gmail.com>
 <20200102140609.7vsfwcjyvbbrmcjx@ucw.cz>
 <CAK8P3a1NU62zf8zJAMZq5KFNuvDdrf3dUcLU4HY83Q=oDC611w@mail.gmail.com>
 <20200102171140.GB16702@atomide.com>
 <20200102191804.nhnpd7q2eh4ul5a5@ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200102191804.nhnpd7q2eh4ul5a5@ucw.cz>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pavel Machek <pavel@ucw.cz> [200102 19:18]:
> > * Arnd Bergmann <arnd@arndb.de> [200102 14:48]:
> > > On Thu, Jan 2, 2020 at 3:06 PM Pavel Machek <pavel@ucw.cz> wrote:
> > > 
> > > > # good: [ab818f0999dc73af3f966194d087e9f6650f939f] Merge tag
> > > > # 'omap-for-v5.5/maintainers-signed' of
> > > > # git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
> > > > # arm/soc
> > > > git bisect good ab818f0999dc73af3f966194d087e9f6650f939f
> > > > # first bad commit: [38206c24ab09b4f4c2a57de5c1af0bb2e69cf5b6] Merge tag
> > > > # 'armsoc-soc' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
> > > >
> > > > ...and am not sure how to interpret the result, or what to do next :(.
> > > 
> > > This means that either the bisection is unreliable (it might be 100%
> > > reproducible or you mixed up good/bad once), or that the arm-soc
> > > branch was indeed good by itself but had a conflict with some other
> > > change that torvalds merged earlier.
> > > 
> > > I would suggest to go back to the list I had extracted in my previous
> > > email and revert all the commits that I identify there, on top of
> > > linux-5.5-rc4. If some commit is not easily reverted, skip that one
> > > at first.
> > > 
> > > Ideally this gets you a working kernel based on -rc4, and then
> > > you can bisect that to find which revert fixed it.
> > 
> > Also please check your dtb is up to date. We still have a lot of
> > stuff missing from the device tree meaning an old dtb will likely
> > be incomplete for many devices.
> 
> Aha, so it works ok when using matching kernel + dtb.

OK good to hear.

> Is 5.5 kernel with 5.3 dtb situation worth debugging?

Well producing a warning based on something would be good. Not sure
what the logic would be though, checking for some minimum dtb version
required would have to be bumped until we have complete dts data.

Regards,

Tony
