Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51CC9957E1
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2019 09:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728898AbfHTHJO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Aug 2019 03:09:14 -0400
Received: from nala.villavu.com ([188.165.243.101]:43586 "EHLO
        nala.villavu.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbfHTHJO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Aug 2019 03:09:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
         s=mail; h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:
        References:Cc:To:Subject:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
        :List-Post:List-Owner:List-Archive;
        bh=IHLdQw2lyWMtk2QPVw9dMAyYXXCRb0XSjO3zLqVKeWY=; b=C2vhCqgZuoDriIjR9njF/+Gz5l
        fwPwzwMzTCM6gVP4Ovizz+nUoZlI+RZWEJqrNW9uttThsr+HvTJO8tqFeoZjaLhJDD1scpTVWkztQ
        s2621c8AB9OYSbyWlAOqRHgqoVGgXNjKjqXZ2095b3fjKMCwLLTwxRv/n8jMro/RRsCVZvvefT4N5
        Pauek9t6H6XoxW46WKW7Bh0abqRujE2OdUi77qNj85i0yDKnNEIeSYLwasl4Qp2dxaUK864vtTgpO
        iTn4M5LTEU8RIVjNGCzmpxTfM7+YbYbyaEiwAv2Wp5AzVaoxw4qLfo8U9s58Isnes0LffGwdDlFFm
        RHLxTKCw==;
Received: from a82-161-36-93.adsl.xs4all.nl ([82.161.36.93] helo=[0.0.0.0])
        by nala.villavu.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <merlijn@wizzup.org>)
        id 1hzyGQ-0001pm-UW; Tue, 20 Aug 2019 09:09:07 +0200
Subject: Re: Lay common foundation to make PVR/SGX work without hacks on
 OMAP34xx, OMAP36xx, AM335x and potentially OMAP4, OMAP5
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Adam Ford <aford173@gmail.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        =?UTF-8?Q?Filip_Matijevi=c4=87?= <filip.matijevic.pz@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        kernel@pyra-handheld.com,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, maemo-leste@lists.dyne.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20180108214032.GW3872@atomide.com>
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
 <84cac9b8-0eff-33f8-464d-4f8045d7db19@wizzup.org>
 <BFAA7FA6-A352-476A-99F9-02EA663A6AAD@goldelico.com>
 <CAHCN7x+87xTsA3MeHy7kUWU0SU3X8HmSc2wbk5gKvYm1dRNe6A@mail.gmail.com>
 <04809E3E-A690-4931-B949-1CFDAF407C14@goldelico.com>
From:   Merlijn Wajer <merlijn@wizzup.org>
Openpgp: preference=signencrypt
Message-ID: <ebb50954-b456-4dab-0765-9dfa06c67075@wizzup.org>
Date:   Tue, 20 Aug 2019 09:09:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.2
MIME-Version: 1.0
In-Reply-To: <04809E3E-A690-4931-B949-1CFDAF407C14@goldelico.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="jtGyfkLCCVCpHa0CRw28H4yJodhADJ6QS"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jtGyfkLCCVCpHa0CRw28H4yJodhADJ6QS
Content-Type: multipart/mixed; boundary="XMWJxZweNWQ51obQd6sIXuWNdA7y9N8gm";
 protected-headers="v1"
From: Merlijn Wajer <merlijn@wizzup.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>, Adam Ford <aford173@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>,
 =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
 Philipp Rossak <embed3d@gmail.com>, moaz korena <moaz@korena.xyz>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 =?UTF-8?Q?Filip_Matijevi=c4=87?= <filip.matijevic.pz@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-omap <linux-omap@vger.kernel.org>, kernel@pyra-handheld.com,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 maemo-leste@lists.dyne.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-ID: <ebb50954-b456-4dab-0765-9dfa06c67075@wizzup.org>
Subject: Re: Lay common foundation to make PVR/SGX work without hacks on
 OMAP34xx, OMAP36xx, AM335x and potentially OMAP4, OMAP5
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
 <84cac9b8-0eff-33f8-464d-4f8045d7db19@wizzup.org>
 <BFAA7FA6-A352-476A-99F9-02EA663A6AAD@goldelico.com>
 <CAHCN7x+87xTsA3MeHy7kUWU0SU3X8HmSc2wbk5gKvYm1dRNe6A@mail.gmail.com>
 <04809E3E-A690-4931-B949-1CFDAF407C14@goldelico.com>
In-Reply-To: <04809E3E-A690-4931-B949-1CFDAF407C14@goldelico.com>

--XMWJxZweNWQ51obQd6sIXuWNdA7y9N8gm
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Hi,

On 20/08/2019 08:48, H. Nikolaus Schaller wrote:
>=20
>> Am 19.08.2019 um 21:43 schrieb Adam Ford <aford173@gmail.com>:
>>
>>> Thanks to the help from the Pyra community, I was able to get a (bina=
ry) reference
>>> implementation using DRM that works on Pyra/OMAP5. At least the gles1=
test1.
>>
>> just a question,
>>
>> If DRM is working, does that mean it works without needing the overhea=
d of X?
>=20
> Yes, we have to kill X11 to successfully run the gles1test1. An interes=
ting question
> will be how to mix both... E.g. have a 3D rendering in a window control=
led by some
> window manager.
>=20

This is probably what you want to look at / start with:
https://github.com/TexasInstruments/dri3wsegl

Cheers,
Merlijn


--XMWJxZweNWQ51obQd6sIXuWNdA7y9N8gm--

--jtGyfkLCCVCpHa0CRw28H4yJodhADJ6QS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRM5LT7NbLF9yb6a/UGN09rynK8WgUCXVucjwAKCRAGN09rynK8
WmPbAQDdulrAiF+QGYfkiYQoh0UpqMR/qVCcl6BjbVm3WBTfaQD7BFd9qGivO+lm
cAI3kCSaiHUxD8NzVg3xv5jde9HR6As=
=22xx
-----END PGP SIGNATURE-----

--jtGyfkLCCVCpHa0CRw28H4yJodhADJ6QS--
