Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EDDD41EA40
	for <lists+linux-omap@lfdr.de>; Fri,  1 Oct 2021 11:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353121AbhJAKBP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Oct 2021 06:01:15 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:33787 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353069AbhJAKBO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 Oct 2021 06:01:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633082355;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=w7sUq6VJrsloj/8hoAJ9FcuFqQDBPa68Sv7hZ9Jm3Og=;
    b=ZQMWyINswwhaTtSbMHYTg3UI8KdfyyD8BuZWtHm92xE981aY1vxh5nV4jiNDMMynZe
    BevYiwpa0IAFdVYYV4u4eHd7dakjfUxl6XOeH68IqC+brxaNPuYKhH2KEMaFm3BX8YV+
    +auHcHEqFtYH2hWcfYcPpD+qWR8aOCCsDXwz/qSwxqNHvI0YwctWoX+lt60YZLDAAyvy
    PF7Q3N2CZKjO6kMhD/QK2W1UohjD/3C+uKmxZY+VMMd2mObCZ7rlP8yo421yh4r2eWhT
    FoP/kRKXnFe4FMBhLTrpv61ahYCPzVEBGX62/X7QPIafN1b7EMUQIaNNGqxp1CsW/lV6
    jReQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3iMMVxw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id I01f74x919xEruR
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Fri, 1 Oct 2021 11:59:14 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH V2] ARM: dts: omap36xx: Remove turbo mode for 1GHz
 variants
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20211001095404.41f73d88@aktux>
Date:   Fri, 1 Oct 2021 11:59:14 +0200
Cc:     Adam Ford <aford173@gmail.com>, linux-omap@vger.kernel.org,
        aford@beaconembedded.com,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C0A84970-0AAC-42E7-8E0F-4D165F0C9551@goldelico.com>
References: <20210109170103.1249838-1-aford173@gmail.com>
 <20211001095404.41f73d88@aktux>
To:     Andreas Kemnade <andreas@kemnade.info>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



> Am 01.10.2021 um 09:54 schrieb Andreas Kemnade <andreas@kemnade.info>:
>=20
> On Sat,  9 Jan 2021 11:01:03 -0600
> Adam Ford <aford173@gmail.com> wrote:
>=20
>> Previously, the 1GHz variants were marked as a turbo,
>> because that variant has reduced thermal operating range.
>>=20
>> Now that the thermal throttling is in place, it should be
>> safe to remove the turbo-mode from the 1GHz variants, because
>> the CPU will automatically slow if the thermal limit is reached.
>>=20
>> Signed-off-by: Adam Ford <aford173@gmail.com>
>> ---
>> V2:  The orignal patch had the wrong file added. Add the =
omap36xx.dtsi
>>=20
> hmm, I somehow expected that there is a revert of this thing going
> through. But now, the turbo-mode is still missing

tagging by turbo-mode means the OPP is *disabled* by default and
needs to be enabled actively.

> and I understood the
> revert is only in Nikolaus' trees.

It is just a revert for the gta04a5 because I think it is the only board
which is affected (maybe it would need SmartReflex in operation to
fine tune the OPPs compared to the generic table). Therefore I have
a patch which adds turbo-mode to the gta04a5.dts

> The 1Ghz mode was working for some
> time but does not anymore. Is it just me or do others also have the
> same problems?

That would be interesting to know.

BR,
NIkolaus

>=20
>=20
>> diff --git a/arch/arm/boot/dts/omap36xx.dtsi =
b/arch/arm/boot/dts/omap36xx.dtsi
>> index 05fe5ed127b0..20844dbc002e 100644
>> --- a/arch/arm/boot/dts/omap36xx.dtsi
>> +++ b/arch/arm/boot/dts/omap36xx.dtsi
>> @@ -72,7 +72,6 @@ opp1g-1000000000 {
>> 					 <1375000 1375000 1375000>;
>> 			/* only on am/dm37x with speed-binned bit set */
>> 			opp-supported-hw =3D <0xffffffff 2>;
>> -			turbo-mode;
>> 		};
>> 	};
>>=20
>=20

