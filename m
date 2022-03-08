Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA7C4D13BD
	for <lists+linux-omap@lfdr.de>; Tue,  8 Mar 2022 10:48:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237499AbiCHJtq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Mar 2022 04:49:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbiCHJtp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Mar 2022 04:49:45 -0500
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14DB92C10D;
        Tue,  8 Mar 2022 01:48:47 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 5255E60002;
        Tue,  8 Mar 2022 09:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1646732926;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=H0/DxN1tGwMmByVAngh9ItKEWa2Bf1tuyBhfItAjLAk=;
        b=oA09jwWJP7Qh4NlEsCzzAJo/ndvVctIq8vhkEuvq/WZKcHjueOjl64fqHofjAXttROiQyg
        VuZY9hepxmUX3cMeH3qFfACsFn4wHo6+iEWupl7YtnqeKl6vZN5A2rhFIirDUddTfo+L0e
        hwTPww2VGZ+L5yzhbge4mlRvTfUTT8nl5pcG9ncojxW5u7wY1pHDVt01RAgQyXXnVS9P6b
        KiJ43mpef9yiXs8wIICv8etbCeMBLvD6X3q1URN1O83naOfzOXLPyzjKc2nzZMJh2NbO4D
        rj49eYIVTAn5CSWlc2OFqRrj/GsgS/55Pe0eai3bFeqRo3aduvrKjAIR4yigFA==
Date:   Tue, 8 Mar 2022 10:48:43 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     =?UTF-8?B?QmVub8OudA==?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Subject: Re: [PATCH] ARM: dts: am33xx-l4: Add missing touchscreen clock
 properties
Message-ID: <20220308104843.23142c85@xps13>
In-Reply-To: <511C8854-13D9-4B52-ACA7-6F519A9B3048@goldelico.com>
References: <20220307111413.8903-1-miquel.raynal@bootlin.com>
        <511C8854-13D9-4B52-ACA7-6F519A9B3048@goldelico.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi H.,

hns@goldelico.com wrote on Mon, 7 Mar 2022 20:19:48 +0100:

> Hi Miquel,
> some tiny typos...
>=20
> > Am 07.03.2022 um 12:14 schrieb Miquel Raynal <miquel.raynal@bootlin.com=
>:
> >=20
> > When adding support for TI magadc, the MFD driver (common to the =20
>=20
> "magadc"?

It's actually the name of the hardware block. It stands for 'magnetic
stripe reader and/or ADC', very much like the first ADC which has a
specific Touchscreen hardware feature as well. You can wire X lines to
a touchscreen, and TOTAL - X lines to the ADC, same applies to the
magnetic stripe reader.

I can s|magadc|Magnetic Stripe Reader/second ADC| to clarify.

> > touchscreen and the ADC) got updated to ease the insertion of a new DT
> > node for the ADC, with its own compatible, clocks, etc. Commit
> > 235a96e92c16 ("mfd: ti_am335x_tscadc: Don't search the tree for our
> > clock") removed one compatible specific information which was the clock
> > name, because the clock was looked up from scratch in the DT while this
> > hardware block was only fed by a single clock, already defined and
> > properly filled in the DT.
> >=20
> > Problem is, this change was only validated with an am437x-based board,
> > where the clocks are effectively correctly defined and referenced. But
> > on am33xx, the ADC clock is also correctly defined but is not referenced
> > with a clock phandle as it out to be. =20
>=20
> maybe you mean "ought to be"?

I knew there was something wrong with it, but not what exactly :)

> > The touchscreen bindings clearly state that the clocks/clock-names
> > properties are mandatory, but they have been forgotten in one DTSI. This
> > was probably not noticed in the first place because of the clock
> > actually existing and the clk_get() call going through all the tree
> > anyway.
> >=20
> > Add the missing clock phandles in the am33xx touchscreen description. =
=20
>=20
> Yes, makes touch on BeagleBoard Black with Chipsee 4"3 panel work again!
>=20
> >=20
> > Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
> > Fixes: 235a96e92c16 ("mfd: ti_am335x_tscadc: Don't search the tree for =
our clock") =20
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>

Thanks!
Miqu=C3=A8l

> >=20
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >=20
> > Hello Nikolaus, as I told you I don't have the relevant hardware to
> > verify that this actually fixes your situation but I am rather
> > confident. Could you please give this a try?
> > Thanks! Miquel =20
>=20
> >=20
> > arch/arm/boot/dts/am33xx-l4.dtsi | 2 ++
> > 1 file changed, 2 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33x=
x-l4.dtsi
> > index c9629cb5ccd1..7da42a5b959c 100644
> > --- a/arch/arm/boot/dts/am33xx-l4.dtsi
> > +++ b/arch/arm/boot/dts/am33xx-l4.dtsi
> > @@ -263,6 +263,8 @@ tscadc: tscadc@0 {
> > 				compatible =3D "ti,am3359-tscadc";
> > 				reg =3D <0x0 0x1000>;
> > 				interrupts =3D <16>;
> > +				clocks =3D <&adc_tsc_fck>;
> > +				clock-names =3D "fck";
> > 				status =3D "disabled";
> > 				dmas =3D <&edma 53 0>, <&edma 57 0>;
> > 				dma-names =3D "fifo0", "fifo1";
> > --=20
> > 2.27.0
> >  =20
>=20
> BR and thanks,
> Nikolaus
>=20
>=20

