Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B122BB9463
	for <lists+linux-omap@lfdr.de>; Fri, 20 Sep 2019 17:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404100AbfITPuM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 20 Sep 2019 11:50:12 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.84]:26533 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403812AbfITPuM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 20 Sep 2019 11:50:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1568994608;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=MnCEgfHZvgWsZRec/fRQjSxgJ/Izm/Pc0S5ceTXJhwY=;
        b=PZeYjfQ5mmhG74JwVgMg2pc5DX+8oTIjCPFqCi/T9rZR/7U69JiLvvkge8WpL2yUbr
        Kd24OSvrgqaLsg5scsbUjldf9l1OhnvKryMoHS+sBLMLLO7hFQ2Xme1FuaicCVt3+FV7
        YQLziMfzf7z0pMvciW/Lh523MmNZoFwlG8A1w6if6vRVb6KSo5550fzMWtO8cGY8+51f
        L2gbkFljGJxIm3AW1/yWAOzF1KkP4E7tlCUsvPplDHNsrdDszNfWjf26z4UzN05C8L8t
        IrNHEWl7IYlQ9CBRaGBEaBUCe9wPwMKQwFeSbMd5wgeIqzAQAywyVeqtBjYm006oGLYx
        lV4w==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGHPrpwDCpeWQ="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.27.0 DYNA|AUTH)
        with ESMTPSA id u036f9v8KFo7pDC
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 20 Sep 2019 17:50:07 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [Letux-kernel] [PATCH 2/2] DTS: ARM: gta04: introduce legacy spi-cs-high to make display work again
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20190920172947.51c1fdec@aktux>
Date:   Fri, 20 Sep 2019 17:50:06 +0200
Cc:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        Tony Lindgren <tony@atomide.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        stable <stable@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <96E62EC2-2A3E-4722-A9DE-3F320B0A98B0@goldelico.com>
References: <20190724194259.GA25847@bogus> <2EA06398-E45B-481B-9A26-4DD2E043BF9C@goldelico.com> <CAL_JsqLe_Y9Z6MRt7ojgSVKAb9n95S8j=eGidSVNz2T83j-zPQ@mail.gmail.com> <CACRpkdY0AVnkRa8sV_Z54qfX9SYufvaYYhU0k2+LitXo0sLx2w@mail.gmail.com> <20190831084852.5e726cfa@aktux> <ED6A6797-D1F9-473B-ABFF-B6951A924BC1@goldelico.com> <CACRpkdZQgPVvB=78vOFsHe5n45Vwe4N6JJOcm1_vz5FbAw9CYA@mail.gmail.com> <1624298A-C51B-418A-96C3-EA09367A010D@goldelico.com> <CACRpkdZvpPOM1Ug-=GHf7Z-2VEbJz3Cuo7+0yDFuNm5ShXK8=Q@mail.gmail.com> <7DF102BC-C818-4D27-988F-150C7527E6CC@goldelico.com> <20190920142059.GO5610@atomide.com> <633E7AD9-A909-4619-BBD7-8CFD965FDFF7@goldelico.com> <20190920172947.51c1fdec@aktux>
To:     Andreas Kemnade <andreas@kemnade.info>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 20.09.2019 um 17:29 schrieb Andreas Kemnade <andreas@kemnade.info>:
>=20
> On Fri, 20 Sep 2019 16:54:18 +0200
> "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
>=20
>>> Am 20.09.2019 um 16:20 schrieb Tony Lindgren <tony@atomide.com>:
>>>=20
>>> * H. Nikolaus Schaller <hns@goldelico.com> [190920 09:19]: =20
>>>>> Am 20.09.2019 um 10:55 schrieb Linus Walleij =
<linus.walleij@linaro.org>:
>>>>> I suggest to go both way:
>>>>> apply this oneliner and tag for stable so that GTA04 works
>>>>> again.
>>>>>=20
>>>>> Then for the next kernel think about a possible more abitious
>>>>> whitelist solution and after adding that remove *all* =
"spi-cs-high"
>>>>> flags from all device trees in the kernel after fixing them
>>>>> all up. =20
>>>>=20
>>>> Ok, that looks like a viable path. =20
>>>=20
>>> Please repost the oneline so people can ack easily. At least
>>> I've already lost track of this thread. =20
>>=20
>> It is all here:
>>=20
>> https://patchwork.kernel.org/patch/11035253/
>>=20
> It is the full one (incl. documentation), not the oneline and does not
> apply.

Looks as if it was sitting too long in the queue and linux-next has =
changed
the basis in the meantime, while v5.3 has not yet.

Documentation/devicetree/bindings/spi/spi-bus.txt -> spi-controller.yaml

So it should still apply for v5.3.1 and earlier and we need both =
versions.
One for stable and one for linux-next. I don't know how to handle such =
cases.

BR,
Nikolaus

