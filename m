Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F300A6995
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2019 15:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728538AbfICNUH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Sep 2019 09:20:07 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:37880 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727667AbfICNUH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 Sep 2019 09:20:07 -0400
Received: by mail-io1-f68.google.com with SMTP id r4so20542638iop.4;
        Tue, 03 Sep 2019 06:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QO73V7U4P5FcoQaqB03BTF1Z/eOeNjoTtjraa/tL4tI=;
        b=Sa85tWhiLvuujArkOIaJ7cjZuD6XjLQY/uNB/TnzTCgdO63OuiOoFH0o0xQK98W3lD
         xQjLNSZN5hWiwwOT4MaK7q5PT5JJZRVEAnFqVROOhAs+oGGuC6BuahwZVMgjIL18HfDG
         8sy1jbGqXQG7qoNrSw7sPJOuw8vHIAzAyrvvqeC5m+uoZeBxYrqA+OL/jBgPXoP6fFx4
         uVgJB4Z6xEhnP8IY5Bzh0Q1fHjIreTYfU7EsOAK7wNw6fPQ5o8ezkJBKmHROzx9fEnAV
         0aCQtnC3lGwVl/mB9iS5Gw1xqG7F7nfBw9x4AKC5KMvdoCE49KAa6nMXXGGpSC8s5Nny
         Hthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QO73V7U4P5FcoQaqB03BTF1Z/eOeNjoTtjraa/tL4tI=;
        b=UMBcxapvviVhFEcqhCA9OsuLWKQemlD0l1jN15g+c1dHlmSwspx32hWd4xz77HpuOh
         s6icLs0grDi8uDAZmtrEBJ4/FQ4chJUclBK2oHnzEH6OELzqjIp3dvede24H5R1vSYMx
         u8j8zUlmCmQVCmCqfsHyO8Vc2kSnT34EBBnmA2H5ygzwbxQIa3JRQqzVB0tcJK2d2wBU
         O0ycI5v1FL2WDiHYMFsFrIYL1RhqEzpwQVEfxyrICVMmQucPxcO3e6uzZ5ZZjb4dQcgA
         NV6waILpeep3+ZctwUuAWTvhvpzT6CTqM5xzfbD+NiHOA6wARwHexHAuCZ1+MO9mSq3A
         7b7A==
X-Gm-Message-State: APjAAAVhGLPpgyAWUwCgJ2C6zMGHnCM2ppkODW2t1YIQ8MC0OEjKH7fn
        yyB3sld6jcKnPdPqEzYIulcS5Z2D1YfSkAa2Ko1MDgRe
X-Google-Smtp-Source: APXvYqzIs9dDUyrM7HLzw7t8+BgyKYSvmKDMvUE0T1arOXRdt+G73zsvKOtONNAiZSPx90VKMIt74gkjN0wf0KZ9sI4=
X-Received: by 2002:a5e:de47:: with SMTP id e7mr3371804ioq.127.1567516806161;
 Tue, 03 Sep 2019 06:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190830121816.30034-1-t-kristo@ti.com> <20190830121816.30034-2-t-kristo@ti.com>
 <20190902042631.GA22055@bogus> <e8d700cd-8f3c-5cea-a022-b20a595fc1e1@ti.com>
In-Reply-To: <e8d700cd-8f3c-5cea-a022-b20a595fc1e1@ti.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 3 Sep 2019 08:19:54 -0500
Message-ID: <CAHCN7xKNSj_DW+Gcbpy4ehphBYCbJw9mSATOcWzT7ZcZR81r6g@mail.gmail.com>
Subject: Re: [PATCHv3 01/10] dt-bindings: omap: add new binding for PRM instances
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Rob Herring <robh@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>, Suman Anna <s-anna@ti.com>,
        p.zabel@pengutronix.de,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Sep 3, 2019 at 2:26 AM Tero Kristo <t-kristo@ti.com> wrote:
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
>
> >
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
>
> >
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

Would it make sense to call it am33 instead of am3?  The AM35xx is
different than AM33.

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
>
>
>
> >
> >> +- reg:              Contains PRM instance register address range
> >> +            (base address and length)
> >> +
> >> +Optional properties:
> >> +- #reset-cells:     Should be 1 if the PRM instance in question supports resets.
> >> +- clocks:   Associated clocks for the reset signals if any. Certain reset
> >> +            signals can't be toggled properly without functional clock
> >> +            being active for them.
> >> +
> >> +Example:
> >> +
> >> +prm_dsp2: prm@1b00 {
> >
> > reset-controller@...
>
> Well, as said, the same node is going to be also power domain provider
> later on...
>
> >
> >> +    compatible = "ti,dra7-prm-inst";
> >> +    reg = <0x1b00 0x40>;
> >> +    #reset-cells = <1>;
> >> +    clocks = <&dsp2_clkctrl DRA7_DSP2_MMU0_DSP2_CLKCTRL 0>;
> >> +};
> >> --
> >> 2.17.1
> >>
> >> --
> >
>

adam
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
