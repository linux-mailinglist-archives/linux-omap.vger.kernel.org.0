Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CAF8B504F
	for <lists+linux-omap@lfdr.de>; Tue, 17 Sep 2019 16:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727824AbfIQO0e (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Sep 2019 10:26:34 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:25713 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbfIQO0e (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 17 Sep 2019 10:26:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1568730389;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=8Hka5X/r+hzmoKvFtI6p5MPdNGRJa/0fGujvCNAxwys=;
        b=EjnzOXYHs3M+uQk0XR6CqMf12OLdDlPWur/87/urZNp/L79XTkZT8uqBjvrosN/SDK
        TAAc9fwlZh9wHwyNCRy5v8EbKAmD3bgIFGGJ3Dw/sYkvB2oXZq+OiIk6u56fpKlxagRc
        WvLzhuFI/PqGA4l1+kxviWAxkMCKIi7CMk0OBbDmh38md4bXhUfJ132jmMHO8ALzih6f
        iPtm+qNTugoa69Ht8AqqtdrL9n0SSmdsiZT/k9efP25e2gzmBx9d63u0d7gZDoitmCFX
        6kTsBs/ER8rV5r2wOVEuXbhAj3DVyhdpPnqBAttTSkq/v7Kw5m267TgiElx0SwP14Onc
        F9Lw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qOxWRk4dCyjDPUnsm74p9Jk5n8FSUKszBBBGbD3SfhNo/8="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2001:16b8:266f:d200:a80b:f72:f57a:c422]
        by smtp.strato.de (RZmta 44.27.0 AUTH)
        with ESMTPSA id u036f9v8HEQGXMX
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Tue, 17 Sep 2019 16:26:16 +0200 (CEST)
Subject: Re: [Letux-kernel] [PATCH 2/2] DTS: ARM: gta04: introduce legacy spi-cs-high to make display work again
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CACRpkdZQgPVvB=78vOFsHe5n45Vwe4N6JJOcm1_vz5FbAw9CYA@mail.gmail.com>
Date:   Tue, 17 Sep 2019 16:26:15 +0200
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
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1624298A-C51B-418A-96C3-EA09367A010D@goldelico.com>
References: <cover.1562597164.git.hns@goldelico.com> <8ae7cf816b22ef9cecee0d789fcf9e8a06495c39.1562597164.git.hns@goldelico.com> <20190724194259.GA25847@bogus> <2EA06398-E45B-481B-9A26-4DD2E043BF9C@goldelico.com> <CAL_JsqLe_Y9Z6MRt7ojgSVKAb9n95S8j=eGidSVNz2T83j-zPQ@mail.gmail.com> <CACRpkdY0AVnkRa8sV_Z54qfX9SYufvaYYhU0k2+LitXo0sLx2w@mail.gmail.com> <20190831084852.5e726cfa@aktux> <ED6A6797-D1F9-473B-ABFF-B6951A924BC1@goldelico.com> <CACRpkdZQgPVvB=78vOFsHe5n45Vwe4N6JJOcm1_vz5FbAw9CYA@mail.gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Lunus,

> Am 17.09.2019 um 00:52 schrieb Linus Walleij =
<linus.walleij@linaro.org>:
>=20
> On Mon, Sep 16, 2019 at 12:59 PM H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>=20
>> ping.
>>=20
>> Device omap3-gta04 is neither working with v5.3 nor linux-next quite =
a while and we need a solution.
>=20
> Can't we just apply the last part of the patch in this thread:
>=20
> diff --git a/arch/arm/boot/dts/omap3-gta04.dtsi
> b/arch/arm/boot/dts/omap3-gta04.dtsi
> index 9a9a29fe88ec..47bab8e1040e 100644
> --- a/arch/arm/boot/dts/omap3-gta04.dtsi
> +++ b/arch/arm/boot/dts/omap3-gta04.dtsi
> @@ -124,6 +124,7 @@
>                        spi-max-frequency =3D <100000>;
>                        spi-cpol;
>                        spi-cpha;
> +                       spi-cs-high;
>=20
>                        backlight=3D <&backlight>;
>                        label =3D "lcd";
>=20
>=20
> Surely this fixes the problem?

yes, it is a workaround, but appears to violate some policies.
E.g. the spi-cs-high; is undocumented but DT bindings maintainer
seems to be against documenting it as I had proposed in my
other patch.

Rather he seems to have proposed a white-list in the driver code.
So that the legacy mode is only becoming active for those systems
which really need the legacy mode instead of everyone.

Then, we do not need this patch for GTA04.

So its up to you to decide which way to go. We are happy with
any one that makes mainline work again asap...

BR and thanks,
Nikolaus

