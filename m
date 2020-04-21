Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D47B1B2ED0
	for <lists+linux-omap@lfdr.de>; Tue, 21 Apr 2020 20:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbgDUSNt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Apr 2020 14:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbgDUSNs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Apr 2020 14:13:48 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E651AC0610D5;
        Tue, 21 Apr 2020 11:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587492826;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=k1WX4cUqtiApT75DRAINIjIc6nKu2ha9Txwb3LzKu4k=;
        b=M2eFPR91fHIYUBEZaW2RUIQ1xy3IvUva7gc39isg9NcwT9CrPfpMV2m8wjCAV2+xyP
        mlmMklGiMkqOgtUwSCQmYg9nZtO20wY9XeCEkC8w9k52sFdqt9dWxOo6QGrLEdL2OMg5
        I8SBZtCxrnX/dR8Wnz1yfBIdHlH2+p20QY3qgLGG575MH0vQvcVjjz6twtF5PnXKFqiF
        wiIn5OBgmjGmCGKpWDM5JzQovc+uY3oygswy9K4/hcIkaRIyigbd7kjDQSqjsbJuBGkh
        7JeKB2t13TLyCRJ2p2TriT0fM+y+h90p3BlR7X5jHLXmADu2oWYArnNGv77ZjFoF+jUG
        97yg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAiw43oXkQ="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.5.0 DYNA|AUTH)
        with ESMTPSA id g06d2dw3LIDdJlX
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 21 Apr 2020 20:13:39 +0200 (CEST)
Subject: Re: [PATCHv3] w1: omap-hdq: Simplify driver with PM runtime autosuspend
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200421180220.GB37466@atomide.com>
Date:   Tue, 21 Apr 2020 20:13:39 +0200
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>, Vignesh R <vigneshr@ti.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <70F19A6E-7B36-4873-9364-F284A14EE3A0@goldelico.com>
References: <7B8C7DD9-095B-48FC-9642-695D07B79E97@goldelico.com> <20200416184638.GI37466@atomide.com> <3197C3F0-DEB9-4221-AFBD-4F2A08C84C4C@goldelico.com> <20200417164340.3d9043d1@aktux> <6430AF54-849E-456B-8DB0-B4478BBDB78D@goldelico.com> <20200417150721.GL37466@atomide.com> <8E062482-5D5D-4837-9980-D6C708DD24D4@goldelico.com> <20200420150802.GR37466@atomide.com> <D1A77603-11FB-407F-B480-82C57E742C51@goldelico.com> <20200421085336.32cf8ffe@aktux> <20200421180220.GB37466@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

> Am 21.04.2020 um 20:02 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * Andreas Kemnade <andreas@kemnade.info> [200421 06:54]:
>> On Mon, 20 Apr 2020 23:11:18 +0200
>> "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
>>> The only maybe important observation was when I disabled all
>>> kernel modules except *hdq*.ko and *bq27*.ko. Then I did only
>>> get an emergency shell so that it is quite similar to the
>>> scenario Andreas has tested. With this setup it did work.
>>>=20
>> So I guess without idling uarts?
>>=20
>>> I then tried to reenable other kernel modules but the result
>>> wasn't convincing that it gives a reliable result.
>>>=20
>>> So I have still no clear indication when the problem occurs and
>>> when not.
>>>=20
>> Hmm, last summer I had problems even without that patch reading
>> temperature while doing umts transfers. Maybe there are some
>> connections,
>> maybe not. For that scenario we might have emc issues, thermal =
problems
>> or a real kernel problem.
>=20
> I have confimed here that logicpd torpedo devkit with battery
> works just fine while entering off mode during idle. I can see
> the temperature just fine with:
>=20
> # cat /sys/class/power_supply/bq27000-battery/uevent
> POWER_SUPPLY_NAME=3Dbq27000-battery
> POWER_SUPPLY_STATUS=3DCharging
> POWER_SUPPLY_PRESENT=3D1
> POWER_SUPPLY_VOLTAGE_NOW=3D3829000
> POWER_SUPPLY_CURRENT_NOW=3D-592084
> POWER_SUPPLY_CAPACITY_LEVEL=3DNormal
> POWER_SUPPLY_TEMP=3D306
> POWER_SUPPLY_TECHNOLOGY=3DLi-ion
> POWER_SUPPLY_CHARGE_FULL_DESIGN=3D2056320
> POWER_SUPPLY_CYCLE_COUNT=3D0
> POWER_SUPPLY_POWER_AVG=3D0
> POWER_SUPPLY_MANUFACTURER=3DTexas Instruments
>=20
> This is 37xx though, maybe you have 35xx and there's some errata
> that we're not handling?

No, it is dm3730 on three different units I have tried.

> I'm only seeing "2.7. HDQTM/1-Wire=C2=AE Communication Constraints"
> for external pull-up resitor in 34xx errata at [0].
>=20
> I wonder if wrong external pull could cause flakyeness after
> enabling the hdq module?

I have checked and we have 10 kOhm pullup to 1.8 V and a 470 Ohm
series resistor.

>=20
> If nothing else helps, you could try to block idle for hdq
> module, but I have a feeling that's a workaround for something
> else.

Well, what helps is reverting the patch and using the old driver
(which did work for several years). So I would not assume that
there is a hardware influence. It seems to be something the new
driver is doing differently.

I need more time to understand and trace this issue on what it
depends... It may depend on the sequence some other modules are
loaded and what the user-space (udevd) is doing in the meantime.

>=20
> Regards,
>=20
> Tony
>=20
> [0] =
https://www.ti.com/pdfs/wtbu/SWPZ009A_OMAP4430_Errata_Public_vA.pdf
>=20

BR and thanks,
Nikolaus

