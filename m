Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46F6013B044
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jan 2020 18:04:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728767AbgANREd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Jan 2020 12:04:33 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.167]:32634 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726450AbgANREc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 14 Jan 2020 12:04:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1579021470;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=i4vTSHrZF74l95fwgGGq2i9iOXJ2vXfG6gNaBmjcx2Q=;
        b=Iic2PdG82Ru3vYCytkhBNit3sP5phwm4CCz016S5+tuUGP86lYSfM6kibz9L2DgQlO
        Ty7JxC6SmIC3Gs7/WUkz+Y5izMBrpQuC6YpuPD4sOj+sGeICBcSD+Jelu/vdh/QBu6uZ
        fQgJbk++Kb/Sjem7klJmOyV3U5KWFUipps9rmaIapLXlpicPbUr4RV1ff6ilQhLBG/24
        Go/L3R+k2GkkkcT2y4ynIByCykshEQLhBHxtugKVOnQV4iYrvU6hHBQ/obxJqFuNmQLk
        DFZdTMmDrenB5rTe+W66eqylqyJpLhdBzDwFywBbXdPk4kNW7O+tNA7ffY0GHxqgqdee
        LKyQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlaYXA4FNWc="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.1.4 DYNA|AUTH)
        with ESMTPSA id c04ea5w0EH4RPgE
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 14 Jan 2020 18:04:27 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH] ARM: dts: Configure omap5 AESS
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200114164613.GR5885@atomide.com>
Date:   Tue, 14 Jan 2020 18:04:26 +0100
Cc:     linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Matthijs van Duin <matthijsvanduin@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D51230C4-2642-4388-959F-313A3382AB99@goldelico.com>
References: <20200114150937.18304-1-tony@atomide.com> <52905C15-A2D1-4372-9781-D602D0B274B6@goldelico.com> <20200114164613.GR5885@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

> Am 14.01.2020 um 17:46 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * H. Nikolaus Schaller <hns@goldelico.com> [200114 16:38]:
>> Hi Tony,
>>=20
>>> Am 14.01.2020 um 16:09 schrieb Tony Lindgren <tony@atomide.com>:
>>>=20
>>> We are missing AESS for omap5. Looks like it's similar to what we =
have
>>> for omap4, and this gets ti-sysc interconnect target module driver =
to
>>> detect it properly.
>>>=20
>>> Note that we currently have no child device driver available for it.
>>=20
>> What I have is a non-working and no more compiling driver originally =
written by
>> Peter Ujfalusi and reworked by Andrej Utkin. We did have it almost =
running on
>> v4.14 or so except problems with firmware versions and headers...
>>=20
>> There we used classical hwmods and I could revert them now to try =
your new patches.
>> Unfortunately, I could only compile-test your two patches but nothing =
with AESS.
>>=20
>> We had tried to follow kernel API changes in the sound subsystem but =
today it is
>> not even compiling any more :(
>>=20
>> So getting a working device driver is an even bigger task than SGX =
was.
>=20
> OK. Well hopefully that's at least a little bit easier now though.
>=20
>>> Cc: H. Nikolaus Schaller <hns@goldelico.com>
>>> Cc: Matthijs van Duin <matthijsvanduin@gmail.com>
>>> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
>>> Cc: Tero Kristo <t-kristo@ti.com>
>>> Signed-off-by: Tony Lindgren <tony@atomide.com>
>>> ---
>>>=20
>>> Note that this depends on "[PATCH] clk: ti: omap5: Add missing AESS =
clock".
>>>=20
>>> arch/arm/boot/dts/omap5-l4-abe.dtsi | 16 ++++++++++++++--
>>> 1 file changed, 14 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git a/arch/arm/boot/dts/omap5-l4-abe.dtsi =
b/arch/arm/boot/dts/omap5-l4-abe.dtsi
>>> --- a/arch/arm/boot/dts/omap5-l4-abe.dtsi
>>> +++ b/arch/arm/boot/dts/omap5-l4-abe.dtsi
>>> @@ -426,8 +426,20 @@ target-module@c0000 {			/* =
0x401c0000, ap 30 1e.0 */
>>> 		};
>>>=20
>>> 		target-module@f1000 {			/* 0x401f1000, =
ap 32 20.0 */
>>=20
>> Here its may be good to have an "aess" label.
>=20
> Care to clarify what you have in mind? The module is generic, aess
> device will be the child node.

The existing driver is hooked into the sound root-node and looks for a
ti,aess =3D <&aess>; link:

/ {
	sound: sound {
		compatible =3D "ti,abe-twl6040";
		ti,model =3D "omap5-uevm";

		ti,jack-detection;
		ti,mclk-freq =3D <19200000>;

		ti,mcpdm =3D <&mcpdm>;
		ti,mcbsp1 =3D <&mcbsp1>;
		ti,mcbsp2 =3D <&mcbsp2>;
		ti,mcbsp3 =3D <&mcbsp3>;

		ti,twl6040 =3D <&twl6040>;
		ti,aess =3D <&aess>;

		...
	};
};

Well, this could be simply wrong... I.e. the aess node should request
all the phandles to mcpdm and mcbsps because it is connected to.

Or it is right to use the sound node to "connect" all subsystems.

Then the "aess" core could also become the child node of the =
target-module:

target-module@f1000 {			/* 0x401f1000, ap 32 20.0 */
	...
	aess: aess {
		compatible =3D "ti,aess";
		status =3D "disabled";
	};
};

Although it looks better this way, it may make it even one step
more difficult to resurrect the old code...

And DT maintainers are not happy with otherwise undefined compatible
definitions.

So maybe:

target-module@f1000 {			/* 0x401f1000, ap 32 20.0 */
	...

	aess: aess {
		/* revisit
		compatible =3D "ti,aess";
		status =3D "disabled";
		*/
	};
};

BR,
Nikolaus

