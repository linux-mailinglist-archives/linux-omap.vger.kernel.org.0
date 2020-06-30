Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC64B20FF3A
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jun 2020 23:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbgF3VcA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 Jun 2020 17:32:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbgF3Vb7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 30 Jun 2020 17:31:59 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78C3DC03E97A
        for <linux-omap@vger.kernel.org>; Tue, 30 Jun 2020 14:31:59 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id y10so22162427eje.1
        for <linux-omap@vger.kernel.org>; Tue, 30 Jun 2020 14:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OTyuzRBwiZ4dXubOgCDgCwxBVHhrMMATaeMU0+yD1UU=;
        b=POTTToxPzO774WR4CwnAbOgWTAfQI7Cfssb9XB6FW1Yf6+jKtJ2Z54oPc8BR2f1eqV
         N94ZydqFmUAjG0mZN5gDTYE9VCrxt40nUojaAecQPu6i1OpQ2OwP0wTt2bpkl5N4sqaS
         d0dwW33cnFDgikEsbxRFfN0rbDxxm5FN9qBl9Dudx87c7sJoDXTMzfB/uv83+ClsPpRb
         qbKnQcn+HNGDkbW4CizE86wkBruzvPNnWCowdagsIZtw/fBicvPiV9sQ/AngVPayBhBq
         gCc4kxeHxRUeF23qyYAHBac8dS2+Tv9MCqgA9Gcc+zwnfoeqNf50iVYjXMdnHPeSwCmD
         aXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OTyuzRBwiZ4dXubOgCDgCwxBVHhrMMATaeMU0+yD1UU=;
        b=VVpQWKuDg0+MsKg+6rnbpoWmdvY3lCh1RGXvWm4657qQsrG25WYU4sYeZbyVyKVYuy
         Wh39bLnPzZvUHk0eY3mtIgCbHEqZFuLfalfKkODMwUIeare1eJrRZbY46vixw+nIJtu4
         hMOex5yJwQ8u5SsxbXb748ONHIvd6DJZoD5CGLUXYKSSoSEi5IdYH5amIXOGebxD1RjI
         cWQVebPc+fEuszMbaCgEjTDraHtTmXcF24WmNHdUtaKPIGqa/dZybSv2/J4L4pXN8glQ
         zEZaVasNEN8p9S+jhOxpDOqK5m0EdXk3gY0CZ6myPm+mJStPe71FqRHoH/hP1U4Af28x
         D0hA==
X-Gm-Message-State: AOAM530itC2/AAfXp1dHF62oGcUXWQn1FW5v/oZjVSiLwUP0udvUAdnT
        mvF2dkXyQOjVI9fLMRWtJSLPzw==
X-Google-Smtp-Source: ABdhPJyzdsv/4R92kRhkKbD+QzdCB5VchGWxCIO09/RLTW8Oj7bNRwTahUiPmsKbW4g6u1nloAD4qQ==
X-Received: by 2002:a17:906:8401:: with SMTP id n1mr19745399ejx.479.1593552718200;
        Tue, 30 Jun 2020 14:31:58 -0700 (PDT)
Received: from x1 ([2001:16b8:5c28:7601:2d3c:7dcb:fbf0:3875])
        by smtp.gmail.com with ESMTPSA id v24sm4051404eds.71.2020.06.30.14.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 14:31:57 -0700 (PDT)
Date:   Tue, 30 Jun 2020 23:31:55 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Rob Herring <robh+dt@kernel.org>, bcousson@baylibre.com,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] ARM: dts: am335x-pocketbeagle: set default mux for
 gpio pins
Message-ID: <20200630213155.GA115731@x1>
References: <20200628152442.322593-1-drew@beagleboard.org>
 <20200629170358.GT37466@atomide.com>
 <20200630020102.GA45128@x1>
 <20200630182037.GF37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630182037.GF37466@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jun 30, 2020 at 11:20:37AM -0700, Tony Lindgren wrote:
> * Drew Fustini <drew@beagleboard.org> [200630 02:02]:
> > On Mon, Jun 29, 2020 at 10:03:58AM -0700, Tony Lindgren wrote:
> > > Hi,
> > > 
> > > * Drew Fustini <drew@beagleboard.org> [200628 08:26]:
> > > > v2 changes:
> > > > - change default mux from output to input.  Input is safer as it does
> > > >   not drive the line.  If the user wants output, they will need to edit
> > > >   this device tree.
> > > 
> > > So can you please clarify this a bit, are you saying that gpio output can't
> > > be done via userspace?
> > 
> > As it stands, there is no way for userspace to change a pin from gpio 
> > input to gpio output as it is based on the reciever active bit in the
> > pin control register (table 9-60 in the AM3358 datasheet [0]).
> 
> OK. I guess one not so nice option would be to enable receiver active
> for all the gpio pins.. But this also affects power consumption a little.
> 
> > I thought it would be useful to at least define the GPIOs available for
> > use on the PocketBeagle by default (and eventually the other BeagleBone
> > device trees).  Input seems to be the safest value.  This patch at least
> > makes it more clear where the user should edit to switch from input to
> > output.
> 
> Some TI TRMs actually have tables listing the preferred mux logic
> for unused pins. I recall safe mode input pull down being one of the
> preferred modes. Sorry not sure which TRM that is, maybe omap3 or
> omap4 or omap5?

Yes, the AM3358 will default to mode 7 for all of these pins and the
receiver will be enabled (e.g. input).

So maybe it is redundant for me to specify in DT what is already the
hardware reset default?

I thought it might be helpful to at least show where the user should
edit to change it from the default reset behavior.

> > > Needing to change the dts does not sound good to me.. But maybe you mean
> > > this is needed until the gpio-omap and pinctrl-single patches are merged?
> >
> > I agree that I would like for userspace to be able to do run-time
> > changes.  However, I think something would need to be added to the
> > pinconf support in pinctrl-single for that to be possible.  There are
> > bias properties but non for receiver enable.
> > 
> > Does it seem sensible to add that?
> 
> Well let's see with Linus W says. To me it seems this might be a good
> reason to allow a sysfs interface to change the pinctrl if we don't
> have it yet? With the proper gpio line naming it should be quite simple
> to use too :)

I think if pinctrl-single allowed mux to be set through debugfs that
could be one solution to the use case of users prototyping with a
beaglebone.  Maybe that could be acceptable?

Thanks,
Drew

> 
> Regards,
> 
> Tony
