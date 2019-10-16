Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B63AD95B9
	for <lists+linux-omap@lfdr.de>; Wed, 16 Oct 2019 17:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404850AbfJPPhL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Oct 2019 11:37:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:49386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726707AbfJPPhL (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 16 Oct 2019 11:37:11 -0400
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D380320854;
        Wed, 16 Oct 2019 15:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571240230;
        bh=kewc2DHCxPax0/As8Dys1vVHnw4VcjP7TAGHyJnCm3U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=e/1YPbJN2q6MW1B2PLR7tF/VsizhEwRlx2jWIO+PGFB7nQsA+W3L40aNX+4e4meou
         wa/+akdLGCSd3lnmxG/a2oDCPp8YqydfEk55ZXTBrL+IvmsriSRm3L+997cCx7LmxW
         Z2M2v6ABbRZpirXk12MlNjgDzpkMsCRBLE+G0AWI=
Received: by mail-yb1-f178.google.com with SMTP id z125so7950690ybc.4;
        Wed, 16 Oct 2019 08:37:09 -0700 (PDT)
X-Gm-Message-State: APjAAAXDlckBGDKsUMz91BzM7EjuDlnABHKZ2OVLfzoVYopfY1nnBVDV
        xLnmX7IY+dlY6X6n3Qibly2NDvmfd0nzVoaf6Q==
X-Google-Smtp-Source: APXvYqyQKovpJMvdc7d8KZIJ6YAr98uicEeI6atpwgB7s7JZpNePYfmdWhWwkMnddX4aoxlCOjiIRZ54XNh3gZE8uQE=
X-Received: by 2002:a25:7543:: with SMTP id q64mr27841489ybc.414.1571240229011;
 Wed, 16 Oct 2019 08:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20191009175628.20570-1-bparrot@ti.com> <20191009175628.20570-2-bparrot@ti.com>
 <20191015222947.GA13388@bogus> <20191016132239.ufptwl44ktmhvylo@ti.com>
In-Reply-To: <20191016132239.ufptwl44ktmhvylo@ti.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 16 Oct 2019 10:36:54 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKAGE=CytS89ET+r4+mSGfYPR5FMRUo2_jjVTZgW9o=Nw@mail.gmail.com>
Message-ID: <CAL_JsqKAGE=CytS89ET+r4+mSGfYPR5FMRUo2_jjVTZgW9o=Nw@mail.gmail.com>
Subject: Re: [Patch 1/3] dt-bindings: media: ti-vpe: Document VPE driver
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 16, 2019 at 8:20 AM Benoit Parrot <bparrot@ti.com> wrote:
>
> Rob Herring <robh@kernel.org> wrote on Tue [2019-Oct-15 17:29:47 -0500]:
> > On Wed, Oct 09, 2019 at 12:56:26PM -0500, Benoit Parrot wrote:
> > > Device Tree bindings for the Video Processing Engine (VPE) driver.
> > >
> > > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > > ---
> > >  .../devicetree/bindings/media/ti-vpe.txt      | 48 +++++++++++++++++++
> > >  MAINTAINERS                                   |  1 +
> > >  2 files changed, 49 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/ti-vpe.txt
> >
> > Please convert to DT schema format.
>
> I can do that.
> Before posting/merging a .yaml, are we supposed to be able to pass these?
> # make dt_binding_check
> # make dtbs_check

Only dt_binding_check needs to be warning free. It is good to test
your schema with dtbs_check and make sure any warnings seem valid.

> Because currently with 5.4-rc3 these fails.

Yeah, still waiting on regulator and media fixes. :( linux-next is fixed.

> Is there a way to run these "test command" target a specific .yaml and not
> the whole set?

Yes, it's documented in writing-schema.rst. Use DT_SCHEMA_FILES  to
test just your schema file.

[...]

> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 8598f49fa2c8..63dcda51f8ae 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -16299,6 +16299,7 @@ W:  http://linuxtv.org/
> > >  Q: http://patchwork.linuxtv.org/project/linux-media/list/
> > >  S: Maintained
> > >  F: drivers/media/platform/ti-vpe/
> > > +F: Documentation/devicetree/bindings/media/ti-vpe.txt
>
> Now with the dt_schemas, I noticed that the maintainer's name is part of
> the yaml file. Do we still need to add this to the MAINTAINERS file as
> well?

Within the schema is really preparation for having schema outside of
the kernel tree and because lots of bindings don't have a MAINTAINERS
entry. So yes, you can still have both.

Rob
