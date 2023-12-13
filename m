Return-Path: <linux-omap+bounces-141-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE4A807B01
	for <lists+linux-omap@lfdr.de>; Wed,  6 Dec 2023 23:03:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 429501F218F4
	for <lists+linux-omap@lfdr.de>; Wed,  6 Dec 2023 22:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A02DE56392;
	Wed,  6 Dec 2023 22:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="cQiqp85C";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="M72ksU6R"
X-Original-To: linux-omap@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.170])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D46512F;
	Wed,  6 Dec 2023 14:03:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701900157; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=qEtNFithtbtbT5kvCB1bcxft1JwKxupkuyxYYSM8jR0psds9sYyQqrT+QQiRWE5Ei+
    QLMwNxuOkdnFZC6FJec4IBt7DaRZ9TbchK2oTIfzBoCJdvlVOJHxzglFrXaX7uAi8WCy
    T6uj3FmCjHZOJNp8PlO+zhZ6nzpLIhViVVUfa5Zhq4K3V5yEQ64DB+6StbFex2Zm/cwv
    mRz0cHXoGKYsCkWqRpvAVTg90o/C+g8Q0o7eyCm5M0rPRByuoFj2AO3rIH3dF4CJifsx
    JioC4Ejz8zqglJg+lRxYyqiXgknEIrFwmbrHk+oS5q9yk9UXwJut+Fje17m4ivNuaA8k
    1wOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1701900157;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=b7N6TMTtL9mF/E7SNl70t4vsVFtL/VG18eTOiMqO3Zs=;
    b=mY0WpbOYHU5VFRwWF2qFIZ2lW2lye0PvYheCAyS/z2+7mmEqFfHjHw92JmhynzBwqk
    +wN8UfJDIXI9rD3eTUYKoSx4/qutvNDah8BJ1qh3HzHaTI8+wZqipElijW3CXZVbaWkt
    c6SuYUN62vvWL0aHJbeTaKb+VDyfjStEGYm8VLkOX+iJvnTJzr9DkoBtxZ5Tu/DJgKDq
    WZ34vd6GV7enYLj6V2KkIklUC1nQd7c4//AIXAqBpB5tXZwwLTcpDRCI4VaHDE6PiJZC
    Aav+SWydOhdgvgdiv0XDLJlaOT7X2H4UGHP5zehjNUAa8oEIDkt31LY36J3lPRUFo4sL
    SlcA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1701900157;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=b7N6TMTtL9mF/E7SNl70t4vsVFtL/VG18eTOiMqO3Zs=;
    b=cQiqp85CU2Ka7mIca5N1sRlcb6Kku1JkKzAAWwrpJ3LetadQbqTxwj3r2+Cs9+xXmC
    drjlPQker7TIlaPtYDdcJjzap4CBrWcDp2ADveKOc8i2xXOeSWk6a16XOInNwWcQWHAT
    /pEr3AUVqe2eJ+z7ZyXaG/b94JGqa7wFEJuWjNMJMymTFPtL7ANLqnr8btfxW/LXfeRm
    WlFxMlBYCf1/cbuIfrm8O0qxglex7FAU5yG9mpjfhPTnwZghFcM41k6E7FUmH8Kxr0t/
    3pPTyeU/uCxZ/4K0NAeDvejC1TAEe8X1HZxzmkCM8osWM9EiRrESeM8Z10SBXG5WjM2z
    OJtA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1701900157;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=b7N6TMTtL9mF/E7SNl70t4vsVFtL/VG18eTOiMqO3Zs=;
    b=M72ksU6RC6fuhk40KEhoUlPYg0CI4JkdBtFnjGH9gwxLnUxhJRA5teP1qqWVe20ffT
    Qf5LthSt2quR3uJKH5CQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Apz9PSN6LgsXcGeqHQ="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 49.10.0 DYNA|AUTH)
    with ESMTPSA id wfeb35zB6M2a9SZ
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Wed, 6 Dec 2023 23:02:36 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
From: H. Nikolaus Schaller <hns@goldelico.com>
In-Reply-To: <8328bec9-a963-4f8a-ae03-a531749a30db@ti.com>
Date: Wed, 6 Dec 2023 23:02:26 +0100
Cc: Conor Dooley <conor@kernel.org>,
 Frank Binns <frank.binns@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Adam Ford <aford173@gmail.com>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>,
 Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 linux-omap@vger.kernel.org,
 linux-mips@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <65992757-0A28-48AE-89D1-212E115265B8@goldelico.com>
References: <20231204182245.33683-1-afd@ti.com>
 <20231204182245.33683-2-afd@ti.com>
 <CFF198DA-5C42-425E-86F4-759629489ECB@goldelico.com>
 <cb590a13-e0ff-49d9-8583-be613ad50dc5@ti.com>
 <FE0DBA5E-95A5-4C27-9F69-D1D8BDF56EC3@goldelico.com>
 <20231206-wolverine-paprika-0674ca01e1f2@spud>
 <8328bec9-a963-4f8a-ae03-a531749a30db@ti.com>
To: Andrew Davis <afd@ti.com>
X-Mailer: Apple Mail (2.3774.200.91.1.1)

(non-html)

> Am 06.12.2023 um 17:15 schrieb Andrew Davis <afd@ti.com>:
>=20
> On 12/6/23 10:02 AM, Conor Dooley wrote:
>> On Tue, Dec 05, 2023 at 07:04:05PM +0100, H. Nikolaus Schaller wrote:
>>>> Am 05.12.2023 um 18:33 schrieb Andrew Davis <afd@ti.com>:
>>>>=20
>>>> On 12/5/23 2:17 AM, H. Nikolaus Schaller wrote:
>>>>>> +          - enum:
>>>>>> +              - ti,omap3430-gpu # Rev 121
>>>>>> +              - ti,omap3630-gpu # Rev 125
>>>>> Is the "Rev 121" and "Rev 125" a property of the SoC integration =
(clock/reset/power
>>>>> hookup etc.) or of the integrated SGX core?
>>>>=20
>>>> The Rev is a property of the SGX core, not the SoC integration.
>>>=20
>>> Then, it should belong there and not be a comment of the =
ti,omap*-gpu record.
>>> In this way it does not seem to be a proper hardware description.
>>>=20
>>> BTW: there are examples where the revision is part of the compatible =
string, even
>>> if the (Linux) driver makes no use of it:
>>>=20
>>> drivers/net/ethernet/xilinx/xilinx_emaclite.c
>> AFAICT these Xilinx devices that put the revisions in the compatible =
are
>> a different case - they're "soft" IP intended for use in the fabric =
of
>> an FPGA, and assigning a device specific compatible there does not =
make
>> sense.
>> In this case it appears that the revision is completely known once =
you
>> see "ti,omap3630-gpu", so encoding the extra "121" into the =
compatible
>> string is not required.
>>>=20
>>>> But it seems that
>>>> compatible string is being used to define both (as we see being =
debated in the other
>>>> thread on this series).
>>>>=20
>>>>> In my understanding the Revs are different variants of the SGX =
core (errata
>>>>> fixes, instruction set, pipeline size etc.). And therefore the =
current driver code
>>>>> has to be configured by some macros to handle such cases.
>>>>> So the Rev should IMHO be part of the next line:
>>>>>> +          - const: img,powervr-sgx530
>>>>> +          - enum:
>>>>> +              - img,powervr-sgx530-121
>>>>> +              - img,powervr-sgx530-125
>>>>> We have a similar definition in the openpvrsgx code.
>>>>> Example: compatible =3D "ti,omap3-sgx530-121", "img,sgx530-121", =
"img,sgx530";
>>>>> (I don't mind about the powervr- prefix).
>>>>> This would allow a generic and universal sgx driver (loaded =
through just matching
>>>>> "img,sgx530") to handle the errata and revision specifics at =
runtime based on the
>>>>> compatible entry ("img,sgx530-121") and know about SoC integration =
("ti,omap3-sgx530-121").
>> The "raw" sgx530 compatible does not seem helpful if the sgx530-121 =
or
>> sgx530-125 compatibles are also required to be present for the driver =
to
>> actually function. The revision specific compatibles I would not =
object
>> to, but everything in here has different revisions anyway - does the
>> same revision actually appear in multiple devices? If it doesn't then =
I
>> don't see any value in the suffixed compatibles either.
>=20
> Everything here has different revisions because any device that uses
> the same revision can also use the same base compatible string. For
> instance AM335x SoCs use the SGX530 revision 125, same as OMAP3630,
> so I simply reuse that compatible in their DT as you can see in
> patch [5/10]. I didn't see the need for a new compatible string
> for identical (i.e. "compatible") IP and integration.

Ok, this is a point. As long as there is no SoC which can come with =
different
SGX revisions the SoC compatible is enough for everything.

I never looked it that way.

>=20
> The first device to use that IP/revision combo gets the named
> compatible, all others re-use the same compatible where possible.

Hm. If we take this rule, we can even completely leave out all

+          - const: img,powervr-sgx530
+          - const: img,powervr-sgx540
+          - const: img,powervr-sgx544

and just have a list of allsgx compatible SoC:

+      - items:
+          - enum:
+              - ti,am62-gpu # IMG AXE GPU model/revision is fully =
discoverable
+              - ti,omap3430-gpu # sgx530 Rev 121
+              - ti,omap3630-gpu # sgx530 Rev 125
+              - ingenic,jz4780-gpu # sgx540 Rev 130
+              - ti,omap4430-gpu # sgx540 Rev 120
+              - allwinner,sun6i-a31-gpu # sgx544 MP2 Rev 115
+              - ti,omap4470-gpu # sgx544 MP1 Rev 112
+              - ti,omap5432-gpu # sgx544 MP2 Rev 105
+              - ti,am5728-gpu # sgx544 MP2 Rev 116
+              - ti,am6548-gpu # sgx544 MP1 Rev 117
+              - more to come

>=20
> Andrew
>=20
>>>>> And user-space can be made to load the right firmware variant =
based on "img,sgx530-121"
>>>>> I don't know if there is some register which allows to discover =
the revision long
>>>>> before the SGX subsystem is initialized and the firmware is up and =
running.
>>>>> What I know is that it is possible to read out the revision after =
starting the firmware
>>>>> but it may just echo the version number of the firmware binary =
provided from user-space.
>>>>=20
>>>> We should be able to read out the revision (register =
EUR_CR_CORE_REVISION), the problem is
>>>> today the driver is built for a given revision at compile time.
>>>=20
>>> Yes, that is something we had planned to get rid of for a long time =
by using different compatible
>>> strings and some variant specific struct like many others drivers =
are doing it.
>>> But it was a to big task so nobody did start with it.
>>>=20
>>>> That is a software issue,
>>>> not something that we need to encode in DT. While the core ID =
(SGX5xx) can be also detected
>>>> (EUR_CR_CORE_ID), the location of that register changes, and so it =
does need encoded in
>>>> DT compatible.
>>>=20
>>> Ok, I didn't know about such registers as there is not much public =
information available.
>>> Fair enough, there are some error reports about in different forums.
>>>=20
>>> On the other hand we then must read out this register in more or =
less early initialization
>>> stages. Even if we know this information to be static and it could =
be as simple as a list
>>> of compatible strings in the driver.
>>>=20
>>>> The string "ti,omap3430-gpu" tells us the revision if we cannot =
detect it (as in the current
>>>> driver), and the SoC integration is generic anyway (just a reg and =
interrupt).
>>>=20
>>> It of course tells, but may need a translation table that needs to =
be maintained in a
>>> different format. Basically the same what the comments show in a =
non-machine readable
>>> format.
>>>=20
>>> I just wonder why the specific version can or should not become =
simply part of the DTS
>>> and needs this indirection.
>>>=20
>>> Basically it is a matter of openness for future (driver) development =
and why it needs
>>> careful decisions.
>>>=20
>>> So in other words: I would prefer to see the comments about versions =
encoded in the device
>>> tree binary to make it machine readable.
>> It's already machine readable if it is invariant on an SoC given the
>> patch had SoC-specific compatibles.
>=20


