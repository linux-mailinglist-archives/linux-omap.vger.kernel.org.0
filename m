Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A486F4D0785
	for <lists+linux-omap@lfdr.de>; Mon,  7 Mar 2022 20:20:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245076AbiCGTVD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Mar 2022 14:21:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245071AbiCGTU5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Mar 2022 14:20:57 -0500
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 442365DA45;
        Mon,  7 Mar 2022 11:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1646680790;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=fU2AT1DmaXjZbwSnr14Fi5UUMevEUVajWKWw4VNmtVU=;
    b=rVQ8m9B+gDSJekq4iPAF7G+lHD1yAFNUI3gBuE/Nd5wbKv1A27WSkIFLtlurutTXiC
    W+YpCQnQS885PCK01seblKsqKTTQXBQ1rQ5MG/QWTqBxAjJhFdcTJThRFhzmkKyOO8x9
    CPFdkc3vAO2sE0v98cZzElWwD2NXWbAs4B2KtrtrMmS5LD95/IONgMj3VDIZvlOh/9d8
    SLNVXbRCmJfLtPRingPcjVUHPbDTFJQm82tyLjVsDbganBKRwXc1hxqCiEnq9LcqKz2Y
    ssM9VuScQ+RbdIYowcsYO9xjXlzcp3vP6mLMkic/EOQv/izoJwIuUpU0I6s7J54ccCRP
    OvEw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw43pw1w="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.40.1 DYNA|AUTH)
    with ESMTPSA id n729cey27JJnME3
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Mon, 7 Mar 2022 20:19:49 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH] ARM: dts: am33xx-l4: Add missing touchscreen clock
 properties
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20220307111413.8903-1-miquel.raynal@bootlin.com>
Date:   Mon, 7 Mar 2022 20:19:48 +0100
Cc:     =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <511C8854-13D9-4B52-ACA7-6F519A9B3048@goldelico.com>
References: <20220307111413.8903-1-miquel.raynal@bootlin.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: Apple Mail (2.3445.104.21)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Miquel,
some tiny typos...

> Am 07.03.2022 um 12:14 schrieb Miquel Raynal =
<miquel.raynal@bootlin.com>:
>=20
> When adding support for TI magadc, the MFD driver (common to the

"magadc"?

> touchscreen and the ADC) got updated to ease the insertion of a new DT
> node for the ADC, with its own compatible, clocks, etc. Commit
> 235a96e92c16 ("mfd: ti_am335x_tscadc: Don't search the tree for our
> clock") removed one compatible specific information which was the =
clock
> name, because the clock was looked up from scratch in the DT while =
this
> hardware block was only fed by a single clock, already defined and
> properly filled in the DT.
>=20
> Problem is, this change was only validated with an am437x-based board,
> where the clocks are effectively correctly defined and referenced. But
> on am33xx, the ADC clock is also correctly defined but is not =
referenced
> with a clock phandle as it out to be.

maybe you mean "ought to be"?

>=20
> The touchscreen bindings clearly state that the clocks/clock-names
> properties are mandatory, but they have been forgotten in one DTSI. =
This
> was probably not noticed in the first place because of the clock
> actually existing and the clk_get() call going through all the tree
> anyway.
>=20
> Add the missing clock phandles in the am33xx touchscreen description.

Yes, makes touch on BeagleBoard Black with Chipsee 4"3 panel work again!

>=20
> Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
> Fixes: 235a96e92c16 ("mfd: ti_am335x_tscadc: Don't search the tree for =
our clock")
Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
>=20
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>=20
> Hello Nikolaus, as I told you I don't have the relevant hardware to
> verify that this actually fixes your situation but I am rather
> confident. Could you please give this a try?
> Thanks! Miquel

>=20
> arch/arm/boot/dts/am33xx-l4.dtsi | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi =
b/arch/arm/boot/dts/am33xx-l4.dtsi
> index c9629cb5ccd1..7da42a5b959c 100644
> --- a/arch/arm/boot/dts/am33xx-l4.dtsi
> +++ b/arch/arm/boot/dts/am33xx-l4.dtsi
> @@ -263,6 +263,8 @@ tscadc: tscadc@0 {
> 				compatible =3D "ti,am3359-tscadc";
> 				reg =3D <0x0 0x1000>;
> 				interrupts =3D <16>;
> +				clocks =3D <&adc_tsc_fck>;
> +				clock-names =3D "fck";
> 				status =3D "disabled";
> 				dmas =3D <&edma 53 0>, <&edma 57 0>;
> 				dma-names =3D "fifo0", "fifo1";
> --=20
> 2.27.0
>=20

BR and thanks,
Nikolaus


