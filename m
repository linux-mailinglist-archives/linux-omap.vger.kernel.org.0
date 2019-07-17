Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 532FA6BB10
	for <lists+linux-omap@lfdr.de>; Wed, 17 Jul 2019 13:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbfGQLIY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 Jul 2019 07:08:24 -0400
Received: from nala.villavu.com ([188.165.243.101]:42632 "EHLO
        nala.villavu.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbfGQLIY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 Jul 2019 07:08:24 -0400
X-Greylist: delayed 1282 seconds by postgrey-1.27 at vger.kernel.org; Wed, 17 Jul 2019 07:08:23 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
         s=mail; h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:
        References:Cc:To:Subject:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
        :List-Post:List-Owner:List-Archive;
        bh=a+g0WmEJX63OCNnWyS5QA+OCkCiRdWdTIG2RqRVpgPU=; b=UfVBv2jBr7Ad/flxHEXzEf9S2w
        ych3fH2BxeS2AaKeFkQJen8nQt9DFdQ/MfljYA7xUkKOAwF4nPnpQTH0RIA5DZyKsJ0/d6VdNkhq3
        sfzycacogppszxU4TqWeqc/Ux2Q9ppSba0lX0zA8Sy7LR/FLGtJglF/uIOj1IQhBHB+aLpAZQ0Otz
        bjWmBLjO5HVvUNr8K2V0iOfULrxZ1vHzPdN73poPTnn7EKSASAhiVP9KxyxJJoCIVXOMWyVVY2107
        NWpADf2Ahoy3ZNWo5HLjO74ENf130aSEQ4wYjgrDNBYzPSzD/GhCkwPQJ8F3mur3qBKEqJevJjjdH
        rkWixb7Q==;
Received: from a82-161-36-93.adsl.xs4all.nl ([82.161.36.93] helo=[0.0.0.0])
        by nala.villavu.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <merlijn@wizzup.org>)
        id 1hnhST-0007pE-9W; Wed, 17 Jul 2019 12:46:50 +0200
Subject: Re: Lay common foundation to make PVR/SGX work without hacks on
 OMAP34xx, OMAP36xx, AM335x and potentially OMAP4, OMAP5
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Philipp Rossak <embed3d@gmail.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        =?UTF-8?Q?Filip_Matijevi=c4=87?= <filip.matijevic.pz@gmail.com>,
        kernel@pyra-handheld.com,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, Adam Ford <aford173@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        maemo-leste@lists.dyne.org
References: <20180108214032.GW3872@atomide.com>
 <4d99c1ae-7752-949b-7e88-bc8f1dc594a2@wizzup.org>
 <0C51EC59-9CDC-4196-ACF9-24596C9E61B6@goldelico.com>
 <FA4520D5-62CB-446D-975C-A1C7B9251517@goldelico.com>
 <20190212205132.GO5720@atomide.com>
 <0b00ce0a-969f-e638-8247-c2da96cf7ce6@gmail.com>
 <20190213004143.GP5720@atomide.com>
 <480AB632-A544-41E7-95A4-DC354AEBB71A@goldelico.com>
 <CAKpie0SigGGsQxSU+X-Mz5boy-Xx=3wRNOcrf+F=ehFr3RBi7Q@mail.gmail.com>
 <092210C3-05DE-4AFB-986F-81BD8F990B67@goldelico.com>
 <CAKpie0RXM1UC33YFeFy-kAxfGhYGNkw4vUgNTThf-ZCAhPTVXw@mail.gmail.com>
 <BE23C1E4-2877-49FA-B230-F9C10691B805@goldelico.com>
 <CAKpie0TSo-8gmDm9_Zw4Sd+kjVVEomp8yA9Vu8qY2U2AcrQc=w@mail.gmail.com>
 <8A069D96-C65F-43F5-8F54-20019CFB1A8D@goldelico.com>
 <d0cbfaaf-813e-8803-f90b-931a38396750@wizzup.org>
 <3A03FF16-C203-43ED-AEEF-0260F6B3331A@goldelico.com>
 <3b0a5e78-c4c2-1963-bac7-b49496a1e9b9@wizzup.org>
 <1F942AAB-1648-46C0-ADD5-90F6898778BE@goldelico.com>
From:   Merlijn Wajer <merlijn@wizzup.org>
Openpgp: preference=signencrypt
Message-ID: <84cac9b8-0eff-33f8-464d-4f8045d7db19@wizzup.org>
Date:   Wed, 17 Jul 2019 12:51:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.2
MIME-Version: 1.0
In-Reply-To: <1F942AAB-1648-46C0-ADD5-90F6898778BE@goldelico.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FWKuak9PlNcUfM2Bslt0wrkIrfndwVriY"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FWKuak9PlNcUfM2Bslt0wrkIrfndwVriY
Content-Type: multipart/mixed; boundary="XQz9IsGkPyjwVUzsbDEGcZZ8FQUcCTs0z";
 protected-headers="v1"
From: Merlijn Wajer <merlijn@wizzup.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
 Tony Lindgren <tony@atomide.com>, Philipp Rossak <embed3d@gmail.com>,
 linux-omap <linux-omap@vger.kernel.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, moaz korena
 <moaz@korena.xyz>, =?UTF-8?Q?Filip_Matijevi=c4=87?=
 <filip.matijevic.pz@gmail.com>, kernel@pyra-handheld.com,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Adam Ford <aford173@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 maemo-leste@lists.dyne.org
Message-ID: <84cac9b8-0eff-33f8-464d-4f8045d7db19@wizzup.org>
Subject: Re: Lay common foundation to make PVR/SGX work without hacks on
 OMAP34xx, OMAP36xx, AM335x and potentially OMAP4, OMAP5
References: <20180108214032.GW3872@atomide.com>
 <CAHCN7xJFK3XXjJ+qHqU4h7Hcdq2eCj5wu3-P=1mykzPSAagfqQ@mail.gmail.com>
 <8BCD0335-D116-464F-849D-F8C74C314907@goldelico.com>
 <4d99c1ae-7752-949b-7e88-bc8f1dc594a2@wizzup.org>
 <0C51EC59-9CDC-4196-ACF9-24596C9E61B6@goldelico.com>
 <FA4520D5-62CB-446D-975C-A1C7B9251517@goldelico.com>
 <20190212205132.GO5720@atomide.com>
 <0b00ce0a-969f-e638-8247-c2da96cf7ce6@gmail.com>
 <20190213004143.GP5720@atomide.com>
 <480AB632-A544-41E7-95A4-DC354AEBB71A@goldelico.com>
 <CAKpie0SigGGsQxSU+X-Mz5boy-Xx=3wRNOcrf+F=ehFr3RBi7Q@mail.gmail.com>
 <092210C3-05DE-4AFB-986F-81BD8F990B67@goldelico.com>
 <CAKpie0RXM1UC33YFeFy-kAxfGhYGNkw4vUgNTThf-ZCAhPTVXw@mail.gmail.com>
 <BE23C1E4-2877-49FA-B230-F9C10691B805@goldelico.com>
 <CAKpie0TSo-8gmDm9_Zw4Sd+kjVVEomp8yA9Vu8qY2U2AcrQc=w@mail.gmail.com>
 <8A069D96-C65F-43F5-8F54-20019CFB1A8D@goldelico.com>
 <d0cbfaaf-813e-8803-f90b-931a38396750@wizzup.org>
 <3A03FF16-C203-43ED-AEEF-0260F6B3331A@goldelico.com>
 <3b0a5e78-c4c2-1963-bac7-b49496a1e9b9@wizzup.org>
 <1F942AAB-1648-46C0-ADD5-90F6898778BE@goldelico.com>
In-Reply-To: <1F942AAB-1648-46C0-ADD5-90F6898778BE@goldelico.com>

--XQz9IsGkPyjwVUzsbDEGcZZ8FQUcCTs0z
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Hi,

On 10/03/2019 08:07, H. Nikolaus Schaller wrote:
>=20
>> Am 10.03.2019 um 00:14 schrieb Merlijn Wajer <merlijn@wizzup.org>:
>>
>> Hi,
>>
>> On 15/02/2019 14:09, H. Nikolaus Schaller wrote:
>>
>>>>> At least I can download and start firmware. I just have to find a w=
ay to fix the omaplfb so that it works
>>>>> with our omapdrm based panels to runs the CLipBlit test [1] on mode=
rn kernels...
>>>>
>>>> Maybe you can compare with what we have here:
>>>> https://github.com/maemo-leste/n9xx-linux/tree/pvr-wip-4.15.7/driver=
s/gpu/pvr
>>>
>>> I'll take a look into it especially how omaplfb is done.
>>>
>>> First observation is that there is a "flat" tree while I am working o=
n a structured one...
>>> But that is just a marginal difference (mainly significant for Makefi=
le writers).
>>
>> I've ported the Maemo Leste kernel + pvr to 5.0 and it seems to work:
>> https://github.com/maemo-leste/n9xx-linux/commits/pvr-wip-5.0.y
>>
>> Should I add this as maemo-leste-n900-5.0 branch (or something) to
>> https://github.com/openpvrsgx-devgroup/linux_openpvrsgx ?
>=20
> Yes, that would be nice to be able to easily compare stuff.

I've just pushed the Maemo Leste v5.1 branch + patches here:

	https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/tree/n900/v5.1-p=
atch

This works on N900 with X, but it doesn't use DRM yet. I'm wondering
what a next logical step would be: to try and modules to load/probe on
another device (I have a droid4 or a Pandaboard ES rev B1), or to try
and get DRM PowerVR to work on the N900, with omapdrmfb and dri3wsegl.

For either path, I'll probably need some help. Any updates from anyone
else? Maybe we should list things people can work - perhaps document
progress in github issues. (Mailing list is also fine, BTW)

Cheers,
Merlijn


--XQz9IsGkPyjwVUzsbDEGcZZ8FQUcCTs0z--

--FWKuak9PlNcUfM2Bslt0wrkIrfndwVriY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRM5LT7NbLF9yb6a/UGN09rynK8WgUCXS79mQAKCRAGN09rynK8
Wv31AQCzqIHa+/NE+Mz+8Qu/8rhkM2KWJ1y/gZZFkQZ339KdagD/eJlvPcej64Bl
TtsqQTz3ggNXgm4n0y7UCve9HZBSFA0=
=kcNJ
-----END PGP SIGNATURE-----

--FWKuak9PlNcUfM2Bslt0wrkIrfndwVriY--
