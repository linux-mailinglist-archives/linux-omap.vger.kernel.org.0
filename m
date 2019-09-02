Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19FF5A5ABF
	for <lists+linux-omap@lfdr.de>; Mon,  2 Sep 2019 17:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbfIBPqq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 2 Sep 2019 11:46:46 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.21]:10365 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfIBPqq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 2 Sep 2019 11:46:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1567439204;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=O3uZV26JOmOXLWXc9dYGBArU49H1uP7ic/HncqqxsJA=;
        b=hdsuqG1/ABeMniUHlFtOO6C9nZ76vF0JEYwyWRXMEiENupXkVd4SsmAfmGXUuwIRV6
        gDc6WFrPOy0s4TYnS8zdqXA7pQgcX3aaGxIDu+YcAlBEJ/HLlz10xiEg/n10BqfizTuU
        Hy0Wd45XQdRRuZnBHZcub5qgVvFnjWb15Z20ylEQqyCk6+erg5/NfcK9a43EmsinKZ1R
        nwbZYV6waDOViHE3jLKNRAeU4Eu8zoP/PGYXDGOn+iih7aU0l0+JKEYvjNpKSUEeLzsh
        iSpQityL6L3CEOdHLW5DJLbiiCEqtFMVOh/VV9a+ZxEtmZEsU9OR4OlF2uUB0TjI19xN
        tBBQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDVCaXA4ImYQ="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.27.0 DYNA|AUTH)
        with ESMTPSA id u036f9v82FkYRcA
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 2 Sep 2019 17:46:34 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [Letux-kernel] [RFC PATCH 0/3] Enable 1GHz support on omap36xx
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAHCN7xLPCX9rZ0+7KVBiA_bgZ6tg6VeCXqD-UXu+6iwpFMPVrA@mail.gmail.com>
Date:   Mon, 2 Sep 2019 17:46:33 +0200
Cc:     =?utf-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Andreas Kemnade <andreas@kemnade.info>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7B3D1D77-3E8C-444F-90B9-6DF2641178B8@goldelico.com>
References: <20190801012823.28730-1-neolynx@gmail.com> <CAHCN7x+nD0J6KZYtfH+0ApQTPO5byO2obMkUwc9Uf4WubyRbTw@mail.gmail.com> <C04F49BA-1229-4E96-9FCF-4FC662D1DB11@goldelico.com> <CAHCN7x+Ye6sB_YqO0sAX1OJDw64B-qGS3pL545v3Xk5z914cwQ@mail.gmail.com> <0C1EF64E-B33C-4BFA-A7D3-471DD1B9EE86@goldelico.com> <515048DE-138D-4400-8168-F2B7D61F1005@goldelico.com> <CAHCN7xLPCX9rZ0+7KVBiA_bgZ6tg6VeCXqD-UXu+6iwpFMPVrA@mail.gmail.com>
To:     Adam Ford <aford173@gmail.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Adam,

> Am 02.09.2019 um 13:37 schrieb Adam Ford <aford173@gmail.com>:
>=20
>> We have to define opp-v2 tables and add some config and code to the =
ti-cpufreq
>> driver which reads out the silicon revision and eFuse registers. And =
we have
>> to blacklist the chips in the cpufreq-dt-platdev driver.
>>=20
>> Reading the eFuse registers in the ti-cpufreq code is tricky since =
they are not part
>> of the syscon register block like on am33xx or dra7. I have added =
some ioremap()
>> and readl(). It works, but it can be improved in future work if =
someone has
>> a better idea. For the moment I would consider it as a simple and =
good enough
>> solution.
>=20
> I looked into this once, but I struggled with understanding how the
> driver worked.

Yes, It did take me quite some trial and error and trying to find what =
is
common in the different data sheets and TRMs and how to make sense out =
of
the masks and bit shifts...

But my tests show that decoding works now. So you already might give it =
a try.

>> I have also tried to add the same approach for the 600/720MHz speed =
grades of
>> the omap3430 but have not found a BeagleBoard C4 which should have =
the 720MHz
>> grade. The C2 I have tested with has 600MHz only.
>>=20
>> Note that omap3430 and omap3630 have different OPPs so we can not =
share
>> tables.
>>=20
>> Another complication is that the DTS have no uniform compatible=3D =
records for
>> the 34xx. I have found e.g.:
>>=20
>> omap3-beagle.dts:       compatible =3D "ti,omap3-beagle", "ti,omap3";
>> omap3-cm-t3530.dts:     compatible =3D "compulab,omap3-cm-t3530", =
"ti,omap34xx", "ti,omap3";
>> omap3-evm.dts:          compatible =3D "ti,omap3-evm", "ti,omap3430", =
"ti,omap3";
>> omap3-sbc-t3517.dts:    compatible =3D "compulab,omap3-sbc-t3517", =
"compulab,omap3-cm-t3517", "ti,am3517", "ti,omap3";
>=20
> Based on my screening of the device trees, it seems like 34xx is
> appropriate for most OMAP3's which are not am3517 and not omap36xx.

Fine!

> The AM3517 includes omap3.dtsi, but not all 34xx devices.  I think if
> that was the case, they would have merged them.  The omap36xx have
> some different register addresses from 34xx which I think why both
> 34xx and 36xx (and am3517) all include what they can from the
> omap3.dtsi stuff.  Even the clocks vary between 34xx, AM35 and omap36.

Yes, the am3517/3503 is a Sitara processor and seems to be derived
from omap35xx, some time before the am33xx was designed. So it appears
to be a mix of everything.

>>=20
>> But all ti,omap36xx also have ti,omap3.
>>=20
>> So there is "omap3430", "omap34xx" or no definition (or even =
"ti,am3517").
>=20
> I don't believe AM3517 have different OPPs.  I looked through the
> datasheet and didn't find any.

Yes, according to the data sheet it has constant core operation voltage
of 1.2V (1.152 .. 1.20 .. 1.248). So there seem to be no explicit =
operation
points depending on core frequency. External clock/xtal is fixed 26 MHz.
There seems to be no definition of ARM clock except max. 600 MHz and
a hint of 500 MHz clock for device operation POH.

> At one time I tried to run the AM3517
> at various frequencies based on the 3430 frequency points, but the
> operating voltage appears to be fixed.

So this means we have to make sure the there is no opp table for
the am3517. And no cpufreq driver being loaded. Which makes me think
that it is simply running at the clock rate defined by SPL/U-boot.

Or a table with different clock frequency points but constant voltage
of 1200mV could be added.

> To me, it seems like it would make sense to standardize on the naming
> convention. (ie, make omap34xx boards and omap35xx boards, explictly
> state omap34xx, excluding the am35xx unless we want add extra stuff
> for it)

Yes, seems to be reasonable and a scheme could be:

omap3.dtsi	"ti,omap3430", "ti,omap3"			no opp =
table
omap34xx.dtsi	inherited					opp =
table for omap34xx	#includes omap3.dtsi
omap36xx.dtsi	inherited					opp =
table for omap36xx	#includes omap3.dtsi

am3517 board	"boardname", "ti,am3517", "ti,omap3"		no opp =
table		#includes omap3.dtsi
omap34xx board	"boardname", "ti,omap34xx", "ti,omap3"		opp =
table for omap34xx	#includes omap34xx.dtsi
omap36xx board	"boardname", "ti,omap36xx", "ti,omap3"		opp =
table for omap34xx	#includes omap36xx.dtsi

So this means that only boards define either "ti,omap34xx" or =
"ti,omap36xx" (or neither)
which makes the ti-cpufreq driver match.

>> This makes matching the ti-cpufreq driver for either omap34xx or =
omap36xx difficult...
>=20
> If we add omap34xx to all non-36xx boards and non-am35xx boads, the
> the check for the compatible flag in the ti-cpufreq driver be based on
> looking for "ti,34xx" and "ti,36xx" .

That is what I also would prefer :)

So I'll add more patches like the one for omap3-beagle.dts for all =
boards I can
find and try to verify that it does not interfere with the am3517.

>>=20
>> Finally, I am not exactly sure about if omap3430 and omap3530 are =
really the
>> same for the eFuses and silicon revision registers and values...
>=20
> =46rom what I can tell they are, but hopefully someone from TI can =
confirm.

BR,
Nikolaus

