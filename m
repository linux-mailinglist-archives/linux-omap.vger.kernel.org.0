Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98218D922A
	for <lists+linux-omap@lfdr.de>; Wed, 16 Oct 2019 15:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728122AbfJPNPf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Oct 2019 09:15:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:37220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727496AbfJPNPf (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 16 Oct 2019 09:15:35 -0400
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D2BAB21925;
        Wed, 16 Oct 2019 13:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571231734;
        bh=IcnqT7RQVBovweaVEALr0lBoNn170n6vif3YcfLUwK8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nb3sfhmWYplKyJ6Jp3DpoLlQq/qomzbD39TynD+136xDVYL8TWUi2rX7ZCbnvO85y
         c+DTLJP2AsYG8A/3H9pgWFU2/OJBdQDNVvPW6wYaVYuIzXXtx/x4jStH6DXd8K1Uqs
         Z9s8mgbv7Y6+C1biIH7R0yLCavlmbP0O1VT/zn1w=
Received: by mail-qt1-f169.google.com with SMTP id 3so36068090qta.1;
        Wed, 16 Oct 2019 06:15:33 -0700 (PDT)
X-Gm-Message-State: APjAAAVdr4L4pXj4ATLFp0l1LfqOTGeDvC3xbUGP34RGbeib8G1dvD2a
        4LPKHN/RjAQht1RNlF5oq6Iq/Tx59p/SrtLAiA==
X-Google-Smtp-Source: APXvYqwKs5UdvUeaFRW8bLvhtjp7znKBxIpTPywHIn8FBNhWh5DCfYY8yxrL5NLWwtGcIotNhvWLT8UwzY3fVixQOzY=
X-Received: by 2002:ac8:44d9:: with SMTP id b25mr45955617qto.300.1571231732993;
 Wed, 16 Oct 2019 06:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191001233923.16514-1-aford173@gmail.com> <20191001233923.16514-5-aford173@gmail.com>
 <20191009233130.GA1002@bogus> <CAHCN7xLCvN1v00H10KUX625awz+nea6rhA_LYnftspjaZ+od-g@mail.gmail.com>
In-Reply-To: <CAHCN7xLCvN1v00H10KUX625awz+nea6rhA_LYnftspjaZ+od-g@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 16 Oct 2019 08:15:21 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJoPda6Oj14WTdm737Mydn+pzvdqkyCPry+zU7drheq=g@mail.gmail.com>
Message-ID: <CAL_JsqJoPda6Oj14WTdm737Mydn+pzvdqkyCPry+zU7drheq=g@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] dt-bindings: Add Logic PD Type 28 display panel
To:     Adam Ford <aford173@gmail.com>
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

On Tue, Oct 15, 2019 at 6:04 PM Adam Ford <aford173@gmail.com> wrote:
>
> On Wed, Oct 9, 2019 at 6:31 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Tue, Oct 01, 2019 at 06:39:22PM -0500, Adam Ford wrote:
> > > This patch adds documentation of device tree bindings for the WVGA panel
> > > Logic PD Type 28 display.
> > >
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > ---
> > > V4:  Update per Rob H's suggestions and copy other panel yaml example from 5.4-rc1
> > > V3:  Correct build errors from 'make dt_binding_check'
> >
> > The example still fails to build here.
>
> I cannot replicate the build error on 5.4-RC3 at least for this
> binding on V4 of the patch.  I get build error on other bindings.
>
> $ make dt_binding_check ARCH=arm
> scripts/kconfig/conf  --syncconfig Kconfig
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
> /home/aford/src/linux/Documentation/devicetree/bindings/net/adi,adin.yaml:
> ignoring, error in schema 'adi,rx-internal-delay-ps'
> warning: no schema found in file:
> Documentation/devicetree/bindings/net/adi,adin.yaml
> /home/aford/src/linux/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml:
> ignoring, error in schema '0'
> warning: no schema found in file:
> Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
>   CHKDT   Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
>   ....
>   CHKDT   Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml
>   CHKDT   Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.yaml
>   CHKDT   Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml
>   CHKDT   Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
>  ...
>  CHKDT   Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
>   CHKDT   Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml:
> $id: path/filename 'arm/allwinner,sun4i-a10-csi.yaml' doesn't match
> actual filename
> Documentation/devicetree/bindings/Makefile:12: recipe for target
> 'Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.example.dts'
> failed
> make[1]: *** [Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.example.dts]
> Error 1
> Makefile:1263: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
>
>
> I took out some of the logs to make it less chatty.  I don't know
> anything about yaml or what the expectations are, so if there is a
> test beyond 'make dt_binding_check' please let me know.

Perhaps 'make -k' is needed because of the other failures. Or try on
top of linux-next which should all be fixed.

Rob
