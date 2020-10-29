Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F84629F5D7
	for <lists+linux-omap@lfdr.de>; Thu, 29 Oct 2020 21:07:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbgJ2UG7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 29 Oct 2020 16:06:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:35192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725780AbgJ2UG6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 29 Oct 2020 16:06:58 -0400
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CE40920838;
        Thu, 29 Oct 2020 20:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604002018;
        bh=3ee2H3sUwyx/8rE8gP9aaBm6w6H9vu9kgempmOfZWZ0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mrX4ICg77DM2TA/Xnm8M3WWgU+PVNx204bdtsmHd4OenwIQTtmB8wNQM2tRmMS7EY
         6yoV4TdJVq1mh7A8FN+2r7SbsS2x39JM54ixGOFgeJfP3b/5Qd11QlKoASnv05ieDg
         xqBv1TBkQ12rfcAj5VeJPmy7eBon9fyF12rbT7yI=
Received: by mail-qt1-f177.google.com with SMTP id f93so2661499qtb.10;
        Thu, 29 Oct 2020 13:06:57 -0700 (PDT)
X-Gm-Message-State: AOAM533D5E4cs4qZQu4IGhlscJCyCvL0ldnAGNR2FqQP941yUdapBG3Z
        sC2lmsnm10UwbA0sDJ8KhZ73UQgw/n2u1C3n+FA=
X-Google-Smtp-Source: ABdhPJw55/tBQsFzDOvsZs3tdvpQx8BqJxYgXHmI2UwMHNOIXAEMY7afMdDadhUT8pGtDLsO2FcFGmOLFE/FYb8Zcvw=
X-Received: by 2002:ac8:7955:: with SMTP id r21mr5238436qtt.204.1604002016842;
 Thu, 29 Oct 2020 13:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20201001202725.16034-1-grygorii.strashko@ti.com>
 <20201002125000.5b5kho4e5de7jjrj@akan> <bb6e0bd9-a8fe-f63b-14fd-92a1f8cea0bb@ti.com>
In-Reply-To: <bb6e0bd9-a8fe-f63b-14fd-92a1f8cea0bb@ti.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 29 Oct 2020 21:06:39 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1-CCcKmEkdw+NNr4Yo7z+BEzX0g7uU_SnXOB+VEZm8HA@mail.gmail.com>
Message-ID: <CAK8P3a1-CCcKmEkdw+NNr4Yo7z+BEzX0g7uU_SnXOB+VEZm8HA@mail.gmail.com>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: ti: Enable networking options
 for nfs boot
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Nishanth Menon <nm@ti.com>, Tony Lindgren <tony@atomide.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Oct 29, 2020 at 8:15 PM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
> On 02/10/2020 15:50, Nishanth Menon wrote:
> > On 23:27-20201001, Grygorii Strashko wrote:
> >> Enable networking options required for NFS boot on TI platforms, which is
> >> widely for automated test systems.
> >> - enable new TI CPSW switch driver and related NET_SWITCHDEV config
> >> - enable TI DP83867 phy
> >> - explicitly enable PTP clock support to ensure dependent networking
> >> drivers will stay built-in
> >>
> >> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> >> ---
> >>   arch/arm/configs/multi_v7_defconfig | 5 +++++
> >>   1 file changed, 5 insertions(+)
> >>
> >
> > [...]
> >
> > Reviewed-by: Nishanth Menon <nm@ti.com>
> >
>
> Are there any actions need to be done to have this patch merged?

I would prefer if a platform maintainer (I assume Tony in this case)
picks it up and forwards it to soc@kernel.org together with other
related changes. Olof and I tend to ignore patches sent directly
to us, so we don't get in the way of platform maintainers that
may have already merged similar patches or have comments.

I suspect Tony didn't pick it up either because from the patch
subject and the description, it is not clear that he is the one
to act on it. It helps to be more specific and ask the maintainer
by addressing them in person below the '---' line, as well as
only putting one person in 'To:' and the rest in 'Cc:'.

One comment on the contents of the patch: IIRC this is a fairly
large driver. To ensure we don't burden other users too much,
can you include the size of the vmlinux file before and after
this patch?

      Arnd
