Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8BB251E20
	for <lists+linux-omap@lfdr.de>; Tue, 25 Jun 2019 00:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbfFXWVS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Jun 2019 18:21:18 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:38197 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726441AbfFXWVS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Jun 2019 18:21:18 -0400
Received: by mail-io1-f68.google.com with SMTP id j6so4513367ioa.5;
        Mon, 24 Jun 2019 15:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C1hxUVhPxMAJ8iC1Jpoywv+GpiOlXAEZ3JQKKj0idbA=;
        b=cNRvk4jikf3M94qtfs0doJvC56m6xUDf8lVQVIQlsKY3ojvMPoTaz2vmfm5Xog3xtb
         8/2WGqdKWy+uu/7o2fNnZh7Avi25axp9SYpY6QO7WP/u4PtJ2Fbir9QXJJzz8A5JE4tv
         8Fr+GgfuBewCi1Lw6lbVsBxcZVA9krmg5KyY4vORS77bDUpUa7k96gVk2VDT0jeWJ+sk
         utABP5mcN9hMnaL4LzWvmxY4kCyjVlMdjQXQ4n2Zo5sOni8u1mQVOLN2iIJeN6BBXb4b
         j8Reqdh+Z6FsJM+ePoQJE5IqK7U9BS44g70B3RGfTnli1jwkQqUTgt+rdCu/Rt46IJG4
         i5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C1hxUVhPxMAJ8iC1Jpoywv+GpiOlXAEZ3JQKKj0idbA=;
        b=mq73THV5ie6oBYjiYY0KkvLvxoZ6WWlUW7Vdww6EJEUUvhZiRWIlyIDIIKcUyb6UOP
         tlTVXasC0JO2AG8nqZ1HcPXD3GG8s1nkHj2Xy27r7HuauZSVUSXoZ7bXv6MY7/K/8Xl6
         Is1VfEl8jrbwU7s2iFRLSrudFeiVOYKNPrHsOa6ac4T1dpRNg9lfl9BNpzhyXdUABZ83
         ClOIGQlcYEZlWV7vFZz4KXOPP2ObWImB7uyPeNeRg2Pqg+ThVfWKTowILdPeV3y7p+S1
         SmKLM7EAP+tpLsL3quAMntYvtLNs+wY2dJop9A5BZj4OPrX97wtFzWslJU6044JbGmz1
         Ltew==
X-Gm-Message-State: APjAAAWncYlS0dC9Z1LvzoS+gUbw80S2hQeddjHLrF/ch+Rs+Rmtfam7
        SNAwiaSK/euIh+q2cPFZH0aQ5kFGrYkwnAd8NW4=
X-Google-Smtp-Source: APXvYqyFWsOl+fg45q4H1f0m++1DSGjcTD7K0R/xRLC2C+yf1/Hj6drnDfWHx1wFtrD6k+/4rGRwk4rOL83I4swr8f0=
X-Received: by 2002:a5d:8c81:: with SMTP id g1mr4054068ion.239.1561414877512;
 Mon, 24 Jun 2019 15:21:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190604170146.12205-1-s-anna@ti.com> <47b8f278-85ff-18be-d5a0-fde9de6e17f2@ti.com>
In-Reply-To: <47b8f278-85ff-18be-d5a0-fde9de6e17f2@ti.com>
From:   Jassi Brar <jassisinghbrar@gmail.com>
Date:   Mon, 24 Jun 2019 17:21:06 -0500
Message-ID: <CABb+yY0xOd_oJLg_BffKXuRtnpHeR-jg1EtKE4KVovy2u3MBuA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add Mailbox support for TI K3 SoCs
To:     Suman Anna <s-anna@ti.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jun 24, 2019 at 3:39 PM Suman Anna <s-anna@ti.com> wrote:
>
> Hi Jassi,
>
> On 6/4/19 12:01 PM, Suman Anna wrote:
> > Hi Jassi,
> >
> > The following series adds the support for the Mailbox IP present
> > within the Main NavSS module on the newer TI K3 AM65x and J721E SoCs.
> >
> > The Mailbox IP is similar to the previous generation IP on OMAP SoCs
> > with a few differences:
> >  - Multiple IP instances from previous DRA7/AM57 family each form a
> >    cluster and are part of the same IP. The driver support will continue
> >    to be based on a cluster.
> >  - The IP is present within a Main NaVSS, and interrupts have to go
> >    through an Interrupt Router within Main NavSS before they reach the
> >    respective processor sub-system's interrupt controllers.
> >  - The register layout is mostly same, with difference in two registers
> >
> > Support is added by enhancing the existing OMAP Mailbox driver to
> > support the K3 IP using a new compatible. The driver also has to be
> > adjusted to deal with the 32-bit mailbox payloads vs the 64-bit
> > pointers used by the Mailbox API on these Arm v8 platforms.
> >
> > DT nodes will be posted separately once the binding is acked.
>
> Can you please pick this series up for 5.3 merge window if you do not
> have any comments.
>
I will. Usually I leave the code to cook in the open for as long as
possible, more so when no acks are coming.
Cheers!
