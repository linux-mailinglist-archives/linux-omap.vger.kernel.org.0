Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C6B5B02D9
	for <lists+linux-omap@lfdr.de>; Wed, 11 Sep 2019 19:43:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729517AbfIKRnZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Sep 2019 13:43:25 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.20]:31312 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729483AbfIKRnZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Sep 2019 13:43:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1568223799;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=I5N0mIKioyErN8ieKWZ34hwP3cp6hVAp8pMtpw+iaIU=;
        b=p997Yrb4h0KhQl1eH5uTi+i+OjN+jrab+fNCORvMd+WvEhzUhqGl34Fg8Uh+aboecQ
        pVgb6FZr6jmFosZVMBfCQ+o/17VMkYUES+ar3ppq1MqLjcdih6GkHNZMWnicsyUgf3tF
        Yu8IX2VzA2C6dhO/ZtK6EF37H4XYal6FPXXM9912c/gGmJ2tL/hhnDvS4zgxxIhpJYgz
        uzzweMaw3D9A8um51shwrF+I7OYRXzM/i7B+acA+ef5/qiGjn1tAbyVOihw0HMX3YJXu
        rsA/Hc2kReljX5sMaURPt13+PD0ym4fC4Q2AWMG3LeMFTWybQ/uf/qF3S88DjctnANKh
        hsKw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PgwDCvjo0="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.27.0 DYNA|AUTH)
        with ESMTPSA id u036f9v8BHhG8nG
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Wed, 11 Sep 2019 19:43:16 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [Letux-kernel] [RFC PATCH 0/3] Enable 1GHz support on omap36xx
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <BF829797-492C-4120-AC69-F8B83572FD38@goldelico.com>
Date:   Wed, 11 Sep 2019 19:43:16 +0200
Cc:     Nishanth Menon <nm@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        =?utf-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D3E8B5DC-AB53-4F46-8ABB-F839A11EB31C@goldelico.com>
References: <C04F49BA-1229-4E96-9FCF-4FC662D1DB11@goldelico.com> <CAHCN7x+Ye6sB_YqO0sAX1OJDw64B-qGS3pL545v3Xk5z914cwQ@mail.gmail.com> <0C1EF64E-B33C-4BFA-A7D3-471DD1B9EE86@goldelico.com> <515048DE-138D-4400-8168-F2B7D61F1005@goldelico.com> <CAHCN7xLPCX9rZ0+7KVBiA_bgZ6tg6VeCXqD-UXu+6iwpFMPVrA@mail.gmail.com> <7B3D1D77-3E8C-444F-90B9-6DF2641178B8@goldelico.com> <CAHCN7xLW58ggx3CpVL=HdCVHWo6D-MCTB91A_9rtSRoZQ+xJuQ@mail.gmail.com> <FA2920FE-B76A-4D44-A264-862A1CCBF7FC@goldelico.com> <CAHCN7xJsPa0i+Z+qpCkWcdAh9+udmGT0RPNchdDsfB=8ptd3Nw@mail.gmail.com> <87420DBD-770F-4C32-9499-A3AEA5876E8A@goldelico.com> <20190909163236.GP52127@atomide.com> <E001F74D-724E-4C50-9265-CBD33C4F2918@goldelico.com> <F8F08882-8011-441C-9581-ECCE9772EC21@goldelico.com> <CAHCN7x+fgtMHMNYU2W7BRQwd-d2g_Tb8-L5QNcnZjCF=VzRXJg@mail.gmail.com> <3663B13C-1AAB-4BE3-8CAD-F821B70393FA@goldelico.com> <CAHCN7x+mLCNq4evwGZfk6Ka=3o6EzhL=s38aNdukyLwKB1xO7A@mail.gmail.com> <56482888-DBD3-4658-8DB9-FB57653B5AA8@goldelico.com> <CAHC N7x++uBzYx0cK4K6CY6aveofti5TVXnqEeNKnGBy_fzm5GQ@mail.gmail.com> <CAHCN7xLPZisrNk==eF-+V8hD+sceQq25qw+sK7vVZAYdd8=Q2Q@mail.gmail.com> <CAHCN7xL59cXgbe1YTbNvTjptO9bMnuxprCP7ok5kRuc8UO9Fcw@mail.gmail.com> <D7B54A39-D8A3-4EDF-8B47-66D59319B3F4@goldelico.com> <F65E947E-784A-4540-B926-BF3ECB0C01EC@goldelico.com> <285FED38-2B2B-4813-9FD2-396C53E9B1B2@goldelico.com> <CAHCN7xKyTnNojwRqsXcE1AsDKtJikBpXoUo8ED=89ZR9-ko9hA@mail.gmail.com> <65A23326-70B4-46E3-992D-74256B056900@goldelico.com> <CAHCN7xLGx0S3xyd0q-N8pgY8VdBbUUaJdgoxkKxakR59sH+zXQ@mail.gmail.com> <BF829797-492C-4120-AC69-F8B83572FD38@goldelico.com>
To:     Adam Ford <aford173@gmail.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Adam,

> Am 11.09.2019 um 18:01 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
>>=20
>> Am 11.09.2019 um 17:56 schrieb Adam Ford <aford173@gmail.com>:
>>=20
>>> There are some subtleties for testing.
>>>=20
>>> * I have added turbo-mode; to OPP6 / OPP1G
>>> * which means they are available but not used by the ondemand =
govenor
>>> * to enable them one has to echo 1 =
>/sys/devices/system/cpu/cpufreq/boost
>>=20
>> Will that be documented somewhere? If not, can we put a comment in =
the
>> device tree so people know how to enable it?
>=20
> It seems to be pretty standard on i86 systems if you google for "turbo =
mode".
> I have added it to the commit message which adds the vbb regulator.

And, I am not sure if DT maintainers will accept comments about the
Linux /sys implementation in device tree files or bindings. Those
should be independent of Linux.

Basically the turbo-mode property is a hint to the OPP system (which
may or may not use of it).

So I think it is indeed better to have it in the commit message and
not the code.

One more thought: as long as we do not have junction temperature =
monitoring
we should keep it off by default... We may even remove the turbo-mode
designator if we have the 90=C2=B0C limit and smart reflex working.

BR,
Nikolaus

