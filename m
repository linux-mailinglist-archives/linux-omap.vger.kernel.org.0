Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF21516923
	for <lists+linux-omap@lfdr.de>; Tue,  7 May 2019 19:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727487AbfEGR00 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 May 2019 13:26:26 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:55293 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726985AbfEGR00 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 May 2019 13:26:26 -0400
Received: by mail-it1-f195.google.com with SMTP id a190so27787017ite.4;
        Tue, 07 May 2019 10:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GunWRoLds4jiLtAh6LLE2TsXCUmGwtbfVmLe2bjqlyk=;
        b=SneKo/eRyNH8XD4OOXcGl+oZeg2o4H7Hs6UoMjV02arVdpGkIcC+hKDMEk/lkgnswF
         Fo2ycvV456u0Uudr86kAys098Zr8pe4NbmlbK21DGdkNrcZqyzmB1b+Pedtb6RHXAdwe
         u79do2mly/Ld5n6j2sZjeTMJgBeL94+rQPTuqFo2+ItFSROp1CE9Ta71fQxUqjMhEqf+
         xP7YxZ4rCoM2Oggw/Yj0jIQqQK7fFOJQQCQtUA0MCPrDc1/JK3gKQS+JPbF3mTwDt3ms
         EYEV6yVQIlhz8YTDZXUlbb5/BMQUHp4p9B5aBp62OCI8Av5zvpWQaGHbvEGVwByCaj78
         EYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GunWRoLds4jiLtAh6LLE2TsXCUmGwtbfVmLe2bjqlyk=;
        b=SpiPEHQQrQ5YpCmwKsbMWQtAkXOmHVoq+QryPW29RObIubhl5yrRD+NvAOs/JzedET
         Nq4xRHInlIw2+6brp0OMSiFPOvP80dr8PxVK+2TEQcRC5F5R8RLE/nwNfUX60kGvaXE5
         AAJSuPks+XaRprOmDQ0ac/BAhZl0jaqRTNBgINdGCrw+0QH901bnkAo1CLatjxDt2Lky
         C1y3werCNkkTdeOh/AhfH34nlqmnhpj6W9e+MxTJOOAfJ1qGp+8v3+23ow/e2lRy7fXF
         HcP4WBmKXY1O9ESYB6ub8bx+z+UJmTn0zQhJdrRPAPxpSkUA20t278B+WU7wU+yczvsL
         jUSg==
X-Gm-Message-State: APjAAAUhOZ/GRyaFk1Uxcha/ERDv7aiBYYwb/BgFYBKtCkwGNinmLzIY
        aeWxauH+Ncuoy6NZHnWbC8U3aZkB7gVRRMIl780=
X-Google-Smtp-Source: APXvYqxyfWuptXTPdDd0CtFSwzhshxh5ikNJRvy2cALACSmI84A7Mb1Y0WbL7yYrhBbR/N/OOJmIKGRGEoCQ6Fd7YJc=
X-Received: by 2002:a24:c455:: with SMTP id v82mr25128040itf.143.1557249984946;
 Tue, 07 May 2019 10:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20181221011752.25627-1-sre@kernel.org> <4f47f7f2-3abb-856c-4db5-675caf8057c7@xs4all.nl>
 <20190319133154.7tbfafy7pguzw2tk@earth.universe>
In-Reply-To: <20190319133154.7tbfafy7pguzw2tk@earth.universe>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 7 May 2019 12:26:11 -0500
Message-ID: <CAHCN7xLZFLs=ed539bwuT6s-n6SDof-um7B3AeErQ2ChztC26A@mail.gmail.com>
Subject: Re: [PATCH 00/14] Add support for FM radio in hcill and kill TI_ST
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>,
        "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>,
        linux-media@vger.kernel.org,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Mar 19, 2019 at 8:33 AM Sebastian Reichel <sre@kernel.org> wrote:
>
> Hi Hans,
>
> On Thu, Mar 14, 2019 at 09:20:10AM +0100, Hans Verkuil wrote:
> > On 12/21/18 2:17 AM, Sebastian Reichel wrote:
> > > This moves all remaining users of the legacy TI_ST driver to hcill (patches
> > > 1-3). Then patches 4-7 convert wl128x-radio driver to a standard platform
> > > device driver with support for multiple instances. Patch 7 will result in
> > > (userless) TI_ST driver no longer supporting radio at runtime. Patch 8-11 do
> > > some cleanups in the wl128x-radio driver. Finally patch 12 removes the TI_ST
> > > specific parts from wl128x-radio and adds the required infrastructure to use it
> > > with the serdev hcill driver instead. The remaining patches 13 and 14 remove
> > > the old TI_ST code.
> > >
> > > The new code has been tested on the Motorola Droid 4. For testing the audio
> > > should be configured to route Ext to Speaker or Headphone. Then you need to
> > > plug headphone, since its cable is used as antenna. For testing there is a
> > > 'radio' utility packages in Debian. When you start the utility you need to
> > > specify a frequency, since initial get_frequency returns an error:
> >
> > What is the status of this series?
> >
> > Based on some of the replies (from Adam Ford in particular) it appears that
> > this isn't ready to be merged, so is a v2 planned?
>
> Yes, a v2 is planned, but I'm super busy at the moment. I don't
> expect to send something for this merge window. Neither LogicPD
> nor IGEP use FM radio, so I can just remove FM support from the
> TI_ST framework. Converting those platforms to hci_ll can be done
> in a different patchset.
>
> If that was the only issue there would be a v2 already. But Marcel
> Holtmann suggested to pass the custom packet data through the BT
> subsystem, which is non-trivial (at least for me) :)

I am running some tests today on the wl1283-st on the Logic PD Torpedo
board.  Tony had suggested a few options, so I'm going to try those.
Looking at those today.  If/when you have a V2, please CC me on it. If
it's been posted, can you send me a link?  I would really like to see
the st-kim driver go away so I'd like to resolve the issues with the
torpedo board.

thanks

adam
>
> -- Sebastian
