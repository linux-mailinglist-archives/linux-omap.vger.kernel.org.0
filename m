Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA486403105
	for <lists+linux-omap@lfdr.de>; Wed,  8 Sep 2021 00:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346246AbhIGW0W (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Sep 2021 18:26:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:47218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346453AbhIGW0N (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 7 Sep 2021 18:26:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D7FC6112F;
        Tue,  7 Sep 2021 22:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631053505;
        bh=9GW7+zpSMN2qeM3WSsXAJVBAxrbmV3JTq1EUtyre6II=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qlgk3BkFkMRvHlDBIrGkpAU4Rg4w4byLFAU40SxZtN+9DU0nwlNgFEm1k9JhW8U+6
         u1M1fgAhNFJkSC81FjeDlBaZgeZk719I9np9dxcbECf24EU5jZxlhDUW1iv6jjGk4c
         +7u+G1PEcENXsLL8UMU/+Qi1r+hp4xRezHKudO6Pkt97kYTs78s2DgMJEeeNQ1kyMP
         37GAWxeKGetukRCxQhyvq5C53pfkYkufCHo3i1R8/1ohrAQ5BBEX2xXnFah7GjJfz0
         nMdVqORwtt428iPhuYaJyDrc2ktm8jfzGLjjodmPA5TC53Etd6DjnOnwey3ZG0srqk
         vUTPmoBc989UA==
Received: by mail-ed1-f41.google.com with SMTP id n11so42082edv.11;
        Tue, 07 Sep 2021 15:25:05 -0700 (PDT)
X-Gm-Message-State: AOAM533oF5FViLIAnc37WRCLVjGy+o7qO6hZgZ+8NzxUBc3NdbpgSxqs
        GuCNoBiAtiNOU0tya9mWNTYFJ87nJMIb7NTbGQ==
X-Google-Smtp-Source: ABdhPJwD8K1BbaWDkRuhr6KubeiVI2FL8MSc+ON3KnYoTOlEbhQvP0JcSZqOBr6yOx8pCN2SBedZSWprVrhG4QF1+A4=
X-Received: by 2002:aa7:c514:: with SMTP id o20mr527840edq.318.1631053504047;
 Tue, 07 Sep 2021 15:25:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210907113226.31876-1-rogerq@kernel.org> <20210907113226.31876-6-rogerq@kernel.org>
 <20210907160317.2ec5304a@xps13> <dc3d465f-50d5-31e5-07e6-f83223b90800@ti.com>
 <20210907183545.3e281b7d@xps13> <2c6491c2-dae8-c8b3-9f8c-14a7583720f1@kernel.org>
In-Reply-To: <2c6491c2-dae8-c8b3-9f8c-14a7583720f1@kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 7 Sep 2021 17:24:52 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJPnUawYafrk4XmeVBETf-Lr+MZn+j_0nGfJTpvfzbkRA@mail.gmail.com>
Message-ID: <CAL_JsqJPnUawYafrk4XmeVBETf-Lr+MZn+j_0nGfJTpvfzbkRA@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] dt-bindings: mtd: ti,gpmc-nand: Convert to yaml
To:     Roger Quadros <rogerq@kernel.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>, tony@atomide.com,
        nm@ti.com, lokeshvutla@ti.com, nsekhar@ti.com,
        krzysztof.kozlowski@canonical.com, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Sep 7, 2021 at 11:57 AM Roger Quadros <rogerq@kernel.org> wrote:
>
> Hi Miquel,
>
> On 07/09/2021 19:35, Miquel Raynal wrote:
> > Hi Grygorii,
> >
> >>>
> >>>> +
> >>>> +  nand-bus-width:
> >>>> +    description:
> >>>> +      Bus width to the NAND chip
> >>>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>>> +    enum: [8, 16]
> >>>> +    default: 8
> >>>
> >>> This is part of nand-controller.yaml binding and should not be there.
> >>>
> >>>> +
> >>>> +allOf:
> >>>> +  - $ref: "../memory-controllers/ti,gpmc-child.yaml"
> >>>
> >>> Maybe you need to reference the nand controller bindings as well
> >>>
> >>
> >> This will not work out of the box :( as nand-controller.yaml defines both
> >>   nand controller and nand memory. It potentially might work if it will be possible to split
> >> nand memory definition (or nand memory properties) out of and-controller.yaml, similarly to
> >> ti,gpmc-child.yaml from this series.
> >
> > What you think would be the issue?
>
> The issue is that dt_binding checks will fail if I reference nand-controller.yaml
> as we currently represent the controller as follows
>
> memory-controller { /* GPMC controller */
>         memory-controller-props;
>         nand-chip {
>                 /* @chip select 0 */
>                 nand-controller-props;
>                 memory-controller-timing-props;
>                 chip-props;
>         }
>         nand-chip {
>                 /* @chip select 1 */
>                 nand-controller-props;
>                 memory-controller-timing-props;
>                 chip-props;
>         }
>         nor-chip {
>                 /* @chip select 2 */
>                 memory-controller-timing-props;
>                 chip-props;
>         }
> }
>
> The NAND controller IO registers are at different addresses for different
> chip select regions. Also, this is one way we can specify GPMC settings/timings
> for different chip selects.
>
> >
> > I am not opposed to split nand-controller.yaml into
> > nand-controller.yaml and nand-chip.yaml if it simplifies the
> > description of controllers but I don't get why it would be needed. In
> > particular since we expect all drivers to support the
> >
> > nand-controller {
> >       controller-props;
> >       nand-chip {
> >               chip-props;
> >       }
> > }
>
> Changing to this format will cause a lot of churn in DT files, which I'm not sure
> if it gives enough benefit.
> TI platforms will never have 2 NAND chips in the same chip select region.

Probably best to just leave this alone. Unless this is getting used in
new chips? If so, I'd say it's a separate change.

> > organization which has been enforced since at least 2018. Having a
> > controller vs. chip representation is fundamentally right. But here I
> > see how "legacy" are these bindings with so much unneeded specific "ti,"
> > properties... On one side it would be good to verify that the driver
> > supports this representation (which I believe is true) and on the other
> > side maybe it's time to advertise "better" bindings as well.
>
> Yes, I'm OK to mark ti specific properties deprecated and use standard NAND chip
> bindings.

I don't think it's really worth it to go half way using common
properties but not the common structure.

Rob
