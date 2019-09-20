Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEE04B8D47
	for <lists+linux-omap@lfdr.de>; Fri, 20 Sep 2019 10:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437887AbfITIzl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 20 Sep 2019 04:55:41 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:43853 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408391AbfITIzj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 20 Sep 2019 04:55:39 -0400
Received: by mail-lf1-f67.google.com with SMTP id u3so4457685lfl.10
        for <linux-omap@vger.kernel.org>; Fri, 20 Sep 2019 01:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=agjOW8fEWWSUH9GPuMddR7LZQGwwWJK0R3sCAqQNNUM=;
        b=riWHbheMlhjS0/BRj5Q0HX6KJlVe8YW2UdvSV/+r2JXEB0QY8iWQ5mMbZYwZ0qG6+C
         S+Pla7kA81GEVyOfGdrHTxtIes3FzIt+uT60WnVIcEWpZnwijCccvhPYa7cQ+IMPuYmt
         quZVESx8r3C39VFLu5OMRE00LUtyGF9V9y/KC0Qjbm4hnsL71TaBhIDFcMG3yOtCuyeG
         XYOVJYNlvv4smxbmqOr8BCLzpa4O3LW2BA8tH+P12KmYiMl0DXrAs5eXVQTwTAOZtcgX
         TcX1N92zSaG4zUGVc2FPaeWzeTWLUCoUaZIpda/cLgMS3WjMzUoofWDvtk+Lob8/+nak
         /hmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=agjOW8fEWWSUH9GPuMddR7LZQGwwWJK0R3sCAqQNNUM=;
        b=N4S9eBf1jo/Xz/4jzC4Ugk68o6rxrbCCU1kTsqtN8t60VueGFeL6HXy5sR4F+su3n+
         OisBkN4ogSY7u1K169M3xQYG+q2YIb766RLMdrlpqfJXPtow3gA5Idd0S7JrSEknJ9p7
         hIzbxBR0XWx5av63MRXOZciHIToyBlnCW5OdZ70f29Sxq+bAyon7OuH5rBipu+is9t+Z
         JFEYwzrFD3L1ro8EVdALSVKqszlTQ7zuIk7fwljwKjAgcpeWKM7XZhEzKbbL9F8a/4Ft
         JhbKi4Qr20J6ue5bIrB0VtFb0CD1NUEd/nQNOq2onoqDEUgAG4mO4ajf7cgUtuxr/ZOn
         8bng==
X-Gm-Message-State: APjAAAU50bv14Z2N9j+7EPgnE8/sij7PGFeM4bU1XKedHXxIIGOblKhl
        rfiyjvj3BSZG6AZ7jGO0GANFMqH5qBOXxq8NXLnzBw==
X-Google-Smtp-Source: APXvYqzdv/WKlLJKAfAI4o8MIqgF26BHmG4sQZMrQ74tDgEzNegyR5ACtMU3sDtEHscw5drG+ZTqWly3lmqBUcL6nbo=
X-Received: by 2002:a19:48c3:: with SMTP id v186mr8211999lfa.141.1568969736324;
 Fri, 20 Sep 2019 01:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1562597164.git.hns@goldelico.com> <8ae7cf816b22ef9cecee0d789fcf9e8a06495c39.1562597164.git.hns@goldelico.com>
 <20190724194259.GA25847@bogus> <2EA06398-E45B-481B-9A26-4DD2E043BF9C@goldelico.com>
 <CAL_JsqLe_Y9Z6MRt7ojgSVKAb9n95S8j=eGidSVNz2T83j-zPQ@mail.gmail.com>
 <CACRpkdY0AVnkRa8sV_Z54qfX9SYufvaYYhU0k2+LitXo0sLx2w@mail.gmail.com>
 <20190831084852.5e726cfa@aktux> <ED6A6797-D1F9-473B-ABFF-B6951A924BC1@goldelico.com>
 <CACRpkdZQgPVvB=78vOFsHe5n45Vwe4N6JJOcm1_vz5FbAw9CYA@mail.gmail.com> <1624298A-C51B-418A-96C3-EA09367A010D@goldelico.com>
In-Reply-To: <1624298A-C51B-418A-96C3-EA09367A010D@goldelico.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 20 Sep 2019 10:55:24 +0200
Message-ID: <CACRpkdZvpPOM1Ug-=GHf7Z-2VEbJz3Cuo7+0yDFuNm5ShXK8=Q@mail.gmail.com>
Subject: Re: [Letux-kernel] [PATCH 2/2] DTS: ARM: gta04: introduce legacy
 spi-cs-high to make display work again
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        Rob Herring <robh@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        stable <stable@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Sep 17, 2019 at 4:26 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:
> > Am 17.09.2019 um 00:52 schrieb Linus Walleij <linus.walleij@linaro.org>:
> > On Mon, Sep 16, 2019 at 12:59 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:
> >
> >> ping.
> >>
> >> Device omap3-gta04 is neither working with v5.3 nor linux-next quite a while and we need a solution.
> >
> > Can't we just apply the last part of the patch in this thread:
> >
> > diff --git a/arch/arm/boot/dts/omap3-gta04.dtsi
> > b/arch/arm/boot/dts/omap3-gta04.dtsi
> > index 9a9a29fe88ec..47bab8e1040e 100644
> > --- a/arch/arm/boot/dts/omap3-gta04.dtsi
> > +++ b/arch/arm/boot/dts/omap3-gta04.dtsi
> > @@ -124,6 +124,7 @@
> >                        spi-max-frequency = <100000>;
> >                        spi-cpol;
> >                        spi-cpha;
> > +                       spi-cs-high;
> >
> >                        backlight= <&backlight>;
> >                        label = "lcd";
> >
> >
> > Surely this fixes the problem?
>
> yes, it is a workaround, but appears to violate some policies.
> E.g. the spi-cs-high; is undocumented but DT bindings maintainer
> seems to be against documenting it as I had proposed in my
> other patch.

It is documented as a boolean in
Documentation/devicetree/bindings/spi/spi-controller.yaml
with the following description:

      spi-cs-high:
        $ref: /schemas/types.yaml#/definitions/flag
        description:
          The device requires the chip select active high.

So I don't think it is about it being undocumented.

> Rather he seems to have proposed a white-list in the driver code.
> So that the legacy mode is only becoming active for those systems
> which really need the legacy mode instead of everyone.

Yeah that seems like a plausible way forward if we want to
move away from the legacy way of specifying polarity.

> Then, we do not need this patch for GTA04.

We don't need to implement the perfect solution up front.
We can aim for that in the long run. I usually go by the IETF
motto "rough consensus and running code".

> So its up to you to decide which way to go. We are happy with
> any one that makes mainline work again asap...

I suggest to go both way:
apply this oneliner and tag for stable so that GTA04 works
again.

Then for the next kernel think about a possible more abitious
whitelist solution and after adding that remove *all* "spi-cs-high"
flags from all device trees in the kernel after fixing them
all up.

Yours,
Linus Walleij
