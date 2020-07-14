Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1821821E82B
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jul 2020 08:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgGNGeP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Jul 2020 02:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgGNGeO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 14 Jul 2020 02:34:14 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5A08C061755;
        Mon, 13 Jul 2020 23:34:14 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id i4so16117075iov.11;
        Mon, 13 Jul 2020 23:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mg7wgDULy0lIYE5hnNqN0j2UtYPwULkhOaQ9Kls/Nyc=;
        b=tyB5kEh80h4y6UqY/UvTDtTj1/IY5xUlBHVQVix/iwHkP+r7UPrvX1yge1andtOWaU
         mk/1qV78d18S7ZRJ9GhbfiVg1DdsBX9wba0scX51M8BJEwHps8NVftl1kGQ4lBYVpqf7
         M1jyWUwNxD74fSXeClEQOIRXqBGZ2+rXeD6di4xSv7B2MBSHAne9ofkIyIhv7wF+by1l
         zxS3BQhuHwsAJN9x2DfjVI9F2sl7Zc8+285WDIEveOwSHKmMd/8Kf1/8lQ/dxqdlUaxj
         BNasa0voiAVzQlCrE7uFkQIpMh8YIts77J4Rf2rCZZ887byAJ2+nHZQ0RFhH/98PoX2R
         XNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mg7wgDULy0lIYE5hnNqN0j2UtYPwULkhOaQ9Kls/Nyc=;
        b=XyFf5cZs6tVzyu+v+PxlVP2+v5AiDALH8clf8DojsjRsHn/71/HWEt6cwgUljUSHHE
         UhZR46Hi8bGYU8U06g8s0b1CU2ow+GFGNbEgRbgkkSvJ/ncowxYGAF1LdKhVMNFgR5IH
         wg7cnuUITTfdan+x812YwqisDs0rr2ddL1aAnR42rgCeG3R6mPVer0Y11av7nb4HeYG9
         FJI6E8A5OA0ZovgIVK68SIE3Fhgfb/F6s4HTppITVpY7legsC6soiXXshoQIhUDgvFWD
         78qdIhb7/rD0wwCNRQBawMCwD8xw3IohkU4vtYB4AD4E4/EEkHr02qMfpG8fm8bjx8Wp
         hwwA==
X-Gm-Message-State: AOAM532A5VngAImTyv3vuV9XEGQ6g5iT2+bFs8E2Jf8qbczKluvsCt3Y
        IRIpIc9+48xLezZosaEOTrJ/3rBl88Cb5t9TztY=
X-Google-Smtp-Source: ABdhPJwT7lxoi1W5OkuUSDXYa65U0eLsDbZo+QW7nVqjhL+XvY+W+cBhzor2TTtyvrY+kkqGl3UK6GC8McCAFTbKtMU=
X-Received: by 2002:a6b:ee02:: with SMTP id i2mr3525208ioh.110.1594708454180;
 Mon, 13 Jul 2020 23:34:14 -0700 (PDT)
MIME-Version: 1.0
References: <1594696998-3995-1-git-send-email-dillon.minfei@gmail.com>
 <1594696998-3995-2-git-send-email-dillon.minfei@gmail.com>
 <20200714133835.3b03b8af@canb.auug.org.au> <CAL9mu0JurdBoXbSxvHUmNFSBOa=RneNyYtzT=C1MvJs10Y-Geg@mail.gmail.com>
 <20200714135407.35992389@canb.auug.org.au> <CAL9mu0L5=khi2oXaei=EhTmRJC5mC1hj5gZVBHJgowi_3vxk=Q@mail.gmail.com>
 <20200714153656.4a044437@canb.auug.org.au>
In-Reply-To: <20200714153656.4a044437@canb.auug.org.au>
From:   dillon min <dillon.minfei@gmail.com>
Date:   Tue, 14 Jul 2020 14:33:38 +0800
Message-ID: <CAL9mu0+sbCPEuriONAzWAFdpb+ak+ufG=vP7Z10eGL8TC=c3JQ@mail.gmail.com>
Subject: Re: [PATCH v2] Since am437x have the same clock structure with am335x
 [1][2], reuse the code from Tony Lindgren's patch [3] to fix dcan probe
 failed on am437x platform.
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Benoit Cousson <bcousson@baylibre.com>, tony@atomide.com,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Stephen,

On Tue, Jul 14, 2020 at 1:37 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Dillon,
>
> On Tue, 14 Jul 2020 13:21:07 +0800 dillon min <dillon.minfei@gmail.com> wrote:
> >
> > Thanks, how about the below commit message.
> >
> > Subject: [PATCH v4] Fix dcan driver probe failed on am437x platform
> >
> > Got following d_can probe errors with kernel 5.8-rc1 on am437x
> >
> > [   10.730822] CAN device driver interface
> > Starting Wait for Network to be Configured...
> > [  OK  ] Reached target Network.
> > [   10.787363] c_can_platform 481cc000.can: probe failed
> > [   10.792484] c_can_platform: probe of 481cc000.can failed with
> > error -2
> > [   10.799457] c_can_platform 481d0000.can: probe failed
> > [   10.804617] c_can_platform: probe of 481d0000.can failed with
> > error -2
> >
> > actually, Tony has fixed this issue on am335x with the patch [3]
> >
> > Since am437x has the same clock structure with am335x
> > [1][2], so reuse the code from Tony Lindgren's patch [3] to fix it.
> >
> >
> > [1]: https://www.ti.com/lit/pdf/spruh73 Chapter-23, Figure 23-1. DCAN
> > Integration
> > [2]: https://www.ti.com/lit/pdf/spruhl7 Chapter-25, Figure 25-1. DCAN
> > Integration
> > [3]: commit 516f1117d0fb ("ARM: dts: Configure osc clock for d_can on am335x")
> >
> > Fixes: 1a5cd7c23cc5 ("bus: ti-sysc: Enable all clocks directly during
> > init to read revision")
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
> >
> > Hi Stephen,
> >
> > This changes correct commit messages based on your reviewing.
> > make Fixes tags to oneline.
> > make all commit message tags at the end of commit message
> > make Fixes tags before Signed-off-by line.
> > add probe failed log to commit message.
>
> Apart from the line wrapping, that looks better.  I assume that your
> email client (looks like Gmail web gui) is wrapping the lines, please
> see if you can stop it doing that (see the section on Gmail in
> Documentation/process/email-clients.rst).
>
Thanks.
I checked with git send-email , there is no line wrapping. maybe gmail just has
the feature which text be split into lines of about 78 characters in
gmail web clients.

if add '>' before the line which exceeds 78 characters in gmail web
clients, this line will not be wrapped.

>Fixes: 1a5cd7c23cc5 ("bus: ti-sysc: Enable all clocks directly during init to read revision")

I will sumit v4 version for you.

thanks,
dillon,

> --
> Cheers,
> Stephen Rothwell
