Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AED1EA6397
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2019 10:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727969AbfICIK4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Sep 2019 04:10:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:49384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726062AbfICIK4 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 3 Sep 2019 04:10:56 -0400
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 428DB23402;
        Tue,  3 Sep 2019 08:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567498255;
        bh=mmY3hWUsfCuDZTERSlcQQns8+8xf4fjtCn2+x1QX+fQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jTK155zT+TTIFoc5p53LF+n1EyXl0NzBqTKFG7AHV860Goc52cSa/attMTIsNhxac
         ifVlelPhB37SgFvr6WQ3hSmIIuaVnMkvDd0XEQb2FxvyIEtVL4JoaatTYBJ9RIg8Qt
         7+fdONZfD/G54IgRbbgMgn8bbh2nefpI10QsGJfc=
Received: by mail-qt1-f181.google.com with SMTP id r15so12989835qtn.12;
        Tue, 03 Sep 2019 01:10:55 -0700 (PDT)
X-Gm-Message-State: APjAAAXvl1TIvS7CZUVEOqLh5U+CiCd8bGn9NHTfZXYr3NjSYVHYq/jK
        33Ebge97VjPg11QlRIQS6QAYE7MI8B+AZmFdOQ==
X-Google-Smtp-Source: APXvYqy5doxdwG87feSeQY0V4gTTDYw9M2LO6Y70U41ya0/OkgB02OHduhddwiPIXVxlZ6uyh6EYVmxF/KKNBOvDyoY=
X-Received: by 2002:ac8:6b05:: with SMTP id w5mr16898911qts.136.1567498254387;
 Tue, 03 Sep 2019 01:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190830121816.30034-1-t-kristo@ti.com> <20190830121816.30034-2-t-kristo@ti.com>
 <20190902042631.GA22055@bogus> <e8d700cd-8f3c-5cea-a022-b20a595fc1e1@ti.com>
In-Reply-To: <e8d700cd-8f3c-5cea-a022-b20a595fc1e1@ti.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 3 Sep 2019 09:10:42 +0100
X-Gmail-Original-Message-ID: <CAL_Jsq+AJj1bgOQYG=c86A5HC_g2UZph387oVEKZyP4M18kURw@mail.gmail.com>
Message-ID: <CAL_Jsq+AJj1bgOQYG=c86A5HC_g2UZph387oVEKZyP4M18kURw@mail.gmail.com>
Subject: Re: [PATCHv3 01/10] dt-bindings: omap: add new binding for PRM instances
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Santosh Shilimkar <ssantosh@kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>, Suman Anna <s-anna@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Sep 3, 2019 at 8:26 AM Tero Kristo <t-kristo@ti.com> wrote:
>
> On 02/09/2019 16:39, Rob Herring wrote:
> > On Fri, Aug 30, 2019 at 03:18:07PM +0300, Tero Kristo wrote:
> >> Add new binding for OMAP PRM (Power and Reset Manager) instances. Each
> >> of these will act as a power domain controller and potentially as a reset
> >> provider.
> >>
> >
> > Converting this to schema would be nice.
>
> Do you have documentation about schema somewhere? Basically what I need
> to do to fix this.

Documentation/devicetree/writing-schema.md (.rst in -next)
Documentation/devicetree/bindings/example-schema.yaml

> >> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> >> ---
> >>   .../devicetree/bindings/arm/omap/prm-inst.txt | 31 +++++++++++++++++++
> >
> > bindings/reset/
>
> I did not put this under reset, because this is basically a
> multi-purpose function. Reset just happens to be the first functionality
> it is going to provide. It will be followed by power domain support
> later on.
>
> Any thoughts?

I prefer that bindings be complete as possible even if driver support
is not there yet. Adding power domain support may only mean adding
'#power-domain-cells'.

The location is fine then.

> >>   1 file changed, 31 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/arm/omap/prm-inst.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/omap/prm-inst.txt b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
> >> new file mode 100644
> >> index 000000000000..7c7527c37734
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
> >> @@ -0,0 +1,31 @@
> >> +OMAP PRM instance bindings
> >> +
> >> +Power and Reset Manager is an IP block on OMAP family of devices which
> >> +handle the power domains and their current state, and provide reset
> >> +handling for the domains and/or separate IP blocks under the power domain
> >> +hierarchy.
> >> +
> >> +Required properties:
> >> +- compatible:       Must be one of:
> >> +            "ti,am3-prm-inst"
> >> +            "ti,am4-prm-inst"
> >> +            "ti,omap4-prm-inst"
> >> +            "ti,omap5-prm-inst"
> >> +            "ti,dra7-prm-inst"
> >
> > '-inst' seems a bit redundant.
>
> ti,xyz-prm is already reserved by the parent node of all these.
>
> The hierarchy is basically like this (omap4 as example):
>
> prm: prm@4a306000 {
>    compatible = "ti,omap4-prm";
>    ...
>
>    prm_dsp: prm@400 {
>      compatible = "ti,omap4-prm-inst";
>      ...
>    };
>
>    prm_device: prm@1b00 {
>      compatible = "ti,omap4-prm-inst";
>      ...
>    };
>
>    ...
> };

Okay. Then you need to state this binding must be a child of PRM. The
schema would need to take this into account too, so probably best to
not convert this yet.

Rob
