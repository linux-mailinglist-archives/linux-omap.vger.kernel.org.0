Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5C8D931B
	for <lists+linux-omap@lfdr.de>; Wed, 16 Oct 2019 15:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390307AbfJPN4C (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Oct 2019 09:56:02 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:40885 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388087AbfJPN4C (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 16 Oct 2019 09:56:02 -0400
Received: by mail-il1-f194.google.com with SMTP id o16so2676860ilq.7;
        Wed, 16 Oct 2019 06:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9evKAakxTzcQ7kdnAG8O0duW0PQfeoTSmI1HDrhmXzs=;
        b=Husn15unpBnUiUApRTjryg0iOFD/ZK/bLuqbpAPz1y8/BIXb3io3FkV5CUojUXZ6qH
         uVvs4/pOdYWTADJVc5t8EFH8a8FQc6wf/WFnunoJ+N+Dz0F2zyPUuIe8IfEojjAghKUD
         iKroHh+kGvUwsxahclwyS0d/8QrbQWzSpx8fkFwDVFuzMrdaJAafYPpfO7WYaGRDhqYB
         iY/VS4F2aOH++PsfXp2d9npik0xMU8ghyZa2D440LmTLKXYH1piRBkP30RpnT9O9j2DE
         vwISrPEn4qbcfa0Lf263v6DODZ8U0mEUOQcX//5oOpq+YZfX+7U3Bml0ddWlzKdIyNfk
         ejyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9evKAakxTzcQ7kdnAG8O0duW0PQfeoTSmI1HDrhmXzs=;
        b=DSDZO6Z+Wl3oqS7rpcszUjBTVLAICh4tjZ4jgv/n5Fm9M4sWIzM1gPneXFi+sMEgbt
         v58mJgqAxdjJb23QQBR92XHkrCo+znCGOUDAvOsDNQ78LcZZShjNIp0BzZVWkuhXp5Xx
         +Lm0zDJtrWW9By2vTuR92bMLzxvU7lj1Kp3y2wKzSmA6KYWolnP7IhTf0rqhP9dMH1DV
         iWUE6wVp2RgEu3VQnvNsRYjiNQv9ppw8w2Y7sR2jGp3lQdrtMp+6NdUxLvIV9f45WePu
         PQq63SFmu2UY6EwFCXy3HtwEv14baAmT5zBqDNTR+T/SA98iCjAMDrQdDZlabw26MO3M
         hHAg==
X-Gm-Message-State: APjAAAW27ii1urg6ksLs4fTVivlinVRLkk3g01D9nthFnyZ/ikCOYvCK
        WgFF7cjfe+/pcBbabJFD6qKTTba9uqTn9giQWyc=
X-Google-Smtp-Source: APXvYqz6T1Cj2dTtiLoaoLYVvqyfZ7Zqfc1a9CSHlOX32P7IvKsXtPYe1zmRiq06cQd+YD+kYrow42edQZqwlqMfuCQ=
X-Received: by 2002:a92:8384:: with SMTP id p4mr11801473ilk.276.1571234159767;
 Wed, 16 Oct 2019 06:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <20191001233923.16514-1-aford173@gmail.com> <20191001233923.16514-5-aford173@gmail.com>
 <20191009233130.GA1002@bogus> <CAHCN7xLCvN1v00H10KUX625awz+nea6rhA_LYnftspjaZ+od-g@mail.gmail.com>
 <CAL_JsqJoPda6Oj14WTdm737Mydn+pzvdqkyCPry+zU7drheq=g@mail.gmail.com>
In-Reply-To: <CAL_JsqJoPda6Oj14WTdm737Mydn+pzvdqkyCPry+zU7drheq=g@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 16 Oct 2019 08:55:48 -0500
Message-ID: <CAHCN7xLN99HyZRBr-CkxvkZntx3LfBd5ELcdLPjPRH7kLKr2uw@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] dt-bindings: Add Logic PD Type 28 display panel
To:     Rob Herring <robh@kernel.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 16, 2019 at 8:15 AM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Oct 15, 2019 at 6:04 PM Adam Ford <aford173@gmail.com> wrote:
> >
> > On Wed, Oct 9, 2019 at 6:31 PM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Tue, Oct 01, 2019 at 06:39:22PM -0500, Adam Ford wrote:
> > > > This patch adds documentation of device tree bindings for the WVGA panel
> > > > Logic PD Type 28 display.
> > > >
> > > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > > ---
> > > > V4:  Update per Rob H's suggestions and copy other panel yaml example from 5.4-rc1
> > > > V3:  Correct build errors from 'make dt_binding_check'
> > >
> > > The example still fails to build here.
> >
> > I cannot replicate the build error on 5.4-RC3 at least for this
> > binding on V4 of the patch.  I get build error on other bindings.
> >
> > $ make dt_binding_check ARCH=arm
> > scripts/kconfig/conf  --syncconfig Kconfig
> >   SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
> > /home/aford/src/linux/Documentation/devicetree/bindings/net/adi,adin.yaml:
> > ignoring, error in schema 'adi,rx-internal-delay-ps'
> > warning: no schema found in file:
> > Documentation/devicetree/bindings/net/adi,adin.yaml
> > /home/aford/src/linux/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml:
> > ignoring, error in schema '0'
> > warning: no schema found in file:
> > Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
> >   CHKDT   Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
> >   ....
> >   CHKDT   Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml
> >   CHKDT   Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.yaml
> >   CHKDT   Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml
> >   CHKDT   Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
> >  ...
> >  CHKDT   Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
> >   CHKDT   Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> > Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml:
> > $id: path/filename 'arm/allwinner,sun4i-a10-csi.yaml' doesn't match
> > actual filename
> > Documentation/devicetree/bindings/Makefile:12: recipe for target
> > 'Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.example.dts'
> > failed
> > make[1]: *** [Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.example.dts]
> > Error 1
> > Makefile:1263: recipe for target 'dt_binding_check' failed
> > make: *** [dt_binding_check] Error 2
> >
> >
> > I took out some of the logs to make it less chatty.  I don't know
> > anything about yaml or what the expectations are, so if there is a
> > test beyond 'make dt_binding_check' please let me know.
>
> Perhaps 'make -k' is needed because of the other failures. Or try on
> top of linux-next which should all be fixed.

Thanks.  I didn't know about the '-k'  I replaced GPIO_ACTIVE_HIGH
with 0 and it seems to have fixed the error.
Sorry about all the noise.  Hopefully I did it right.  There is a V5
patch waiting now starting at [1]

[1] - https://patchwork.kernel.org/patch/11193399/

adam




>
> Rob
