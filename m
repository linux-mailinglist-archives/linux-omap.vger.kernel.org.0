Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 040258F6E0
	for <lists+linux-omap@lfdr.de>; Fri, 16 Aug 2019 00:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbfHOWQn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 15 Aug 2019 18:16:43 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.163]:25474 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726347AbfHOWQn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 15 Aug 2019 18:16:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1565907397;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=NiPwNDpqs4gSKSHxcechEq8BqWv9lM7zq2qUgcNDuMk=;
        b=J4WNPSCJpy1sGfM5AuWIUYlx1yVmnYrZ81NZR2+UsKgsN+8VQKk2Tupg5pHTP2esQr
        vxHgEnURbeTzsHHv8GZ7GhHqapk/U8P6EOdFetJjpAB/DkVvLFGBjJbveOBC0TbxCE/s
        GqxIbGKXey7uJACn3bpflRu3CEYLfFQxHjC+hGUiHuXpcf5Kh+TlvKZpeI3x8mHm5uRA
        Xs5Cbdk0BxKBn3eyvC6PXcmY496aDqm75IC6COJ9eEbChI5WcduuqdWybXIdi+ykV8oF
        3z/2blPcahuB7k49ZeYgHhpbRH396M7YEpLSz1OvoENZAoP4fOr5ZBkm1+CfNcrd48mI
        EWyw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBi5wp38sDGQBQKV9qb"
X-RZG-CLASS-ID: mo00
Received: from [192.168.2.7]
        by smtp.strato.de (RZmta 44.26.1 DYNA|AUTH)
        with ESMTPSA id V074e8v7FMGbE6m
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 16 Aug 2019 00:16:37 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [RFC PATCH 0/3] Enable 1GHz support on omap36xx
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAHCN7x+nD0J6KZYtfH+0ApQTPO5byO2obMkUwc9Uf4WubyRbTw@mail.gmail.com>
Date:   Fri, 16 Aug 2019 00:16:37 +0200
Cc:     =?utf-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C04F49BA-1229-4E96-9FCF-4FC662D1DB11@goldelico.com>
References: <20190801012823.28730-1-neolynx@gmail.com> <CAHCN7x+nD0J6KZYtfH+0ApQTPO5byO2obMkUwc9Uf4WubyRbTw@mail.gmail.com>
To:     Adam Ford <aford173@gmail.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

> Am 15.08.2019 um 17:41 schrieb Adam Ford <aford173@gmail.com>:
>=20
> On Wed, Jul 31, 2019 at 8:42 PM Andr=C3=A9 Roth <neolynx@gmail.com> =
wrote:
>>=20
>> Hi all,
>>=20
>> the current mainline kernel does not provide support for running
>> omap36xx based boards at 1GHz for chips like DM3730 where this would =
be
>> supported. It has been discussed many times, I hope you do not mind =
me
>> bringing this up again ;)
>>=20
>> I found some proposed patches by Nishanth Menon from TI [1] and a
>> statement [2] that drivers for the Voltage processor and controllers =
are
>> needed to properly run those chips at 1GHz using Adaptive Voltage
>> Scaling (AVS) and SmartReflex (SR).
>>=20
>> As there are drivers for VP and VC in the kernel, I tried to figure =
out
>> how to enable them and found a PATCH 1/3 which enables SR in the TWL
>> driver. However, the order in which PM, SR and TWL are initialized or
>> probed did not match, which I was able to fix with PATCH 2/3. In the =
end
>> calling omap_sr_enable in PATCH 3/3 finally enables SR and my board
>> seems to run fine at 1GHz (not battery powered, full performance
>> required).
>>=20
>=20
> Question:
>=20
> Not all 36xx SoC's can do 1GHz.  I know there is a register that we
> can read on the OMAP36 to determine its max speed, but I wasn't sure
> how that would play into cpufreq or whatever is going to be driving
> the dynamic voltage and frequency scaling.  Are going to have to
> expect people who have the 1GHz version to use a custom device tree?

I had discussed off-list with Andr=C3=A9 the idea that omap36xx.dtsi =
gets
an additional 1GHz OPP.

But there is some driver code that checks if the "speed binned bit"
is not set for 1GHz and eliminates all OPPs above 800MHz by code.

I tried to get such code into drivers/cpufreq/ti-cpufreq.c but
gave up when I found that this is not used for the omap36xx.

> AFAICT, there is an updated opp-v2-ti table which has a 'supported'
> entry which appears to read registers to determine which opp's are
> available for the am33xx, but I don't think this applies to the
> omap36.  Do we need something that like for this?

Yes. I also noticed that there is an old style OPP format and a new
style which allows to make the OPP list depend on conditions like =
am33xx.
All described in =
Documentation/devicetree/bindings/cpufreq/ti-cpufreq.txt.

To me it looks as if this opp-v2-ti table is what we need for =
omap36xx.dtsi
as well to manage the speed-binned bit of DM3730. To me it looks =
sufficiently
similar to an "eFuse" bit. But I didn't look into the details of the
opp-v2-ti format, because all that is a second step after getting 1GHz =
stable
on 1GHz capable chips.

So:
step 1: get 1GHz stable
step 2: turn it off on 800MHz rated chips

BR,
Nikolaus

