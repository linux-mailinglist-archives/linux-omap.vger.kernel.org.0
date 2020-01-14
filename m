Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D18A13B21D
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jan 2020 19:29:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728346AbgANS3T (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Jan 2020 13:29:19 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.165]:25569 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbgANS3T (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 14 Jan 2020 13:29:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1579026557;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=4eH815wjmGTQGs+W/6mMPH6V/M4/712HINAuLDXrFIQ=;
        b=HP/1n8upJ01wMJADw4yLVNbrNzM2wIZ2fwQQUOt20XhyIN8ZzUh0diIrJHI99VlNax
        Hz/nTRgtX/EfdXZpeRnlx9FydeJVygS0j48R+72jUspbiUHaRZvPKEYOVg10HbgCZLCk
        +WeMWmML0lY/rtxwVSsg2xmjj1fmp98tL0U1YwhQx68lyatfK8lSamR9P2wadNBmbk+b
        a6MjngS6W2Oj2rtldhqbNr5n6i1UiI+xHWxn+7K8rpb7p9TXObG2dYvEs53Re6Io/WdD
        ddNDS8drs0sJMyJfR+JwJ/FWhyGYNIiuboUxa2D4XIWgxfAHvhubOz8q4XbUomIz7WYy
        XlcA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlaYXA4FNWc="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.1.4 DYNA|AUTH)
        with ESMTPSA id c04ea5w0EITBPuS
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 14 Jan 2020 19:29:11 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH] ARM: dts: Configure omap5 AESS
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200114171634.GS5885@atomide.com>
Date:   Tue, 14 Jan 2020 19:29:10 +0100
Cc:     linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Matthijs van Duin <matthijsvanduin@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <632E66D6-47EF-44CF-BF02-B0F5A215D904@goldelico.com>
References: <20200114150937.18304-1-tony@atomide.com> <52905C15-A2D1-4372-9781-D602D0B274B6@goldelico.com> <20200114164613.GR5885@atomide.com> <D51230C4-2642-4388-959F-313A3382AB99@goldelico.com> <20200114171634.GS5885@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 14.01.2020 um 18:16 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * H. Nikolaus Schaller <hns@goldelico.com> [200114 17:05]:
>>> Am 14.01.2020 um 17:46 schrieb Tony Lindgren <tony@atomide.com>:
>>> Care to clarify what you have in mind? The module is generic, aess
>>> device will be the child node.
>>=20
>> The existing driver is hooked into the sound root-node and looks for =
a
>> ti,aess =3D <&aess>; link:
>>=20
>> / {
>> 	sound: sound {
>> 		compatible =3D "ti,abe-twl6040";
>> 		ti,model =3D "omap5-uevm";
>>=20
>> 		ti,jack-detection;
>> 		ti,mclk-freq =3D <19200000>;
>>=20
>> 		ti,mcpdm =3D <&mcpdm>;
>> 		ti,mcbsp1 =3D <&mcbsp1>;
>> 		ti,mcbsp2 =3D <&mcbsp2>;
>> 		ti,mcbsp3 =3D <&mcbsp3>;
>>=20
>> 		ti,twl6040 =3D <&twl6040>;
>> 		ti,aess =3D <&aess>;
>>=20
>> 		...
>> 	};
>> };
>>=20
>> Well, this could be simply wrong... I.e. the aess node should request
>> all the phandles to mcpdm and mcbsps because it is connected to.
>=20
> The aess label above should be in the child aess node, not in the
> target-module.
>=20
>> Or it is right to use the sound node to "connect" all subsystems.
>=20
> Sounds like that's all taken care of nowadays with the generic
> graph binding:
>=20
> Documentation/devicetree/bindings/graph.txt
>=20
> See also snd-soc-audio-graph-card and various users for it:
>=20
> Documentation/devicetree/bindings/sound/audio-graph-card.txt

Ok. Will become a major rework of the driver...
On the other hand the audio graph library could simplify a lot of =
things.

>=20
>> Then the "aess" core could also become the child node of the =
target-module:
>>=20
>> target-module@f1000 {			/* 0x401f1000, ap 32 =
20.0 */
>> 	...
>> 	aess: aess {
>> 		compatible =3D "ti,aess";
>> 		status =3D "disabled";
>> 	};
>> };
>=20
> Yeah this is how it should be :)
>=20
>> Although it looks better this way, it may make it even one step
>> more difficult to resurrect the old code...
>=20
> Well the old phandles and properties should work the same, just put =
them
> into the child aess node. No need to stuff anything else there at the
> target-module level AFAIK.

What it might need is to make the aess driver a completely separate =
module
loaded identified through the compatible record.

>=20
>> And DT maintainers are not happy with otherwise undefined compatible
>> definitions.
>>=20
>> So maybe:
>>=20
>> target-module@f1000 {			/* 0x401f1000, ap 32 =
20.0 */
>> 	...
>>=20
>> 	aess: aess {
>> 		/* revisit
>> 		compatible =3D "ti,aess";
>> 		status =3D "disabled";
>> 		*/
>> 	};
>> };
>=20
> But we have no binding and no driver for the aess at this point..

That is why I propose a comment around it...
But I am not sure if empty nodes are even allowed.

> If and when the aess driver work the child node can be just added :)

Yes, surely. So it is up to you to decide.

Best regards,
Nikolaus

