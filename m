Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 858E41B498D
	for <lists+linux-omap@lfdr.de>; Wed, 22 Apr 2020 18:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbgDVQGd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 Apr 2020 12:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbgDVQGd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 22 Apr 2020 12:06:33 -0400
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9499CC03C1A9;
        Wed, 22 Apr 2020 09:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587571589;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=qf5WeCKhWRVkBqrtB4YnhK5c0ibFNbTbM6Y2qPPZD5I=;
        b=YUPfdBOUCdPOhx2TuIUEJyeRiH33sl2G9EAZgfJB/XLat9rWE+DtR+mvecQQdL5JUZ
        RPni/GKxVhYM3Mf0X3P28Mxe9OE91LE9+5jwduoAf+eYQEO1sW1uT5rkp2JxXha5N4cr
        xULnnRljkBqKCcEWMCDwFEtKy0eBXfU835+pczSd6eqYGDmEvZHZZv56Gs75FWNPwS2Y
        nJF0pri6/i7GGKEi8Ugg1V20tjHwlSIhIyoqA6eJMBnkge3KsDWQJxiuEwUmfe+OqXvG
        PY/4asNzMa59GTW4SniHaZU3IQOIOQvXx/LULQFGXGXRRm+WNBH0lpJAYCp6F/QOGvJ6
        y2SA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMiw43tskc="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id R0acebw3MG6G3Mi
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 22 Apr 2020 18:06:16 +0200 (CEST)
Subject: Re: [PATCHv3] w1: omap-hdq: Simplify driver with PM runtime autosuspend
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200422120418.49a40c75@aktux>
Date:   Wed, 22 Apr 2020 18:06:15 +0200
Cc:     Tony Lindgren <tony@atomide.com>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>, Vignesh R <vigneshr@ti.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <6E3A50D9-0F15-4A56-8C5E-7CDC63E8AF9F@goldelico.com>
References: <3197C3F0-DEB9-4221-AFBD-4F2A08C84C4C@goldelico.com> <20200417164340.3d9043d1@aktux> <6430AF54-849E-456B-8DB0-B4478BBDB78D@goldelico.com> <20200417150721.GL37466@atomide.com> <8E062482-5D5D-4837-9980-D6C708DD24D4@goldelico.com> <20200420150802.GR37466@atomide.com> <D1A77603-11FB-407F-B480-82C57E742C51@goldelico.com> <20200421085336.32cf8ffe@aktux> <20200421180220.GB37466@atomide.com> <70F19A6E-7B36-4873-9364-F284A14EE3A0@goldelico.com> <20200421182017.GC37466@atomide.com> <D3E40A6A-39B8-4F3F-9ABC-28EAE8D623A6@goldelico.com> <20200422120418.49a40c75@aktux>
To:     Andreas Kemnade <andreas@kemnade.info>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

> Am 22.04.2020 um 12:04 schrieb Andreas Kemnade <andreas@kemnade.info>:
>=20
> On Tue, 21 Apr 2020 22:40:39 +0200
> "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
>=20
>> Hi Tony,
>>=20
>>> Am 21.04.2020 um 20:20 schrieb Tony Lindgren <tony@atomide.com>:
>>>=20
>>>> Well, what helps is reverting the patch and using the old driver
>>>> (which did work for several years). So I would not assume that
>>>> there is a hardware influence. It seems to be something the new
>>>> driver is doing differently. =20
>>>=20
>>> Well earlier hdq1w.c did not idle, now it does. =20
>>=20
>> Ah, I see!
>>=20
>>> If you just want to keep it enabled like earlier, you can just add =
something like: =20
>>=20
>> Well, I don't want it enabled, it just should work as before.
>> Ideally including all improvements :)
>>=20
>>>=20
>>> &hdqw1w {
>>> 	ti,no-idle;
>>> }; =20
>>=20
>> I have added that and there might be a slightly different pattern
>> (unless that is just by luck): the first two or three attempts to
>> read the bq27xx/uevent did still time out. But then the next ones
>> worked fine (with a response time of ca. 65 .. 230 ms).
>>=20
>> So as if something needs to be shaken into the right position after
>> boot until it works.
>>=20
>=20
> What about reading battery with just omap_hdq loaded and then continue
> booting as usual, e.g. something like:
>=20
> have script init-bat.sh
> #!/bin/sh
> modprobe omap_hdq
> cat /sys/class/power_supply/bq27000_battery/uevent
> exec /sbin/init "$@"
>=20
> and then append to kernel parameters init=3D/init-bat.sh

Interesting idea. But how would it help to identify the
issue?

I can confirm that after a while of attempting to read
the uevent it suddenly starts to work.

Then I can even swap the battery (and verify by looking
at the cycle count which changes).

I have some unconfirmed impression that it helps to run
two cat /sys/class/power_supply/bq27000_battery/uevent
in quick enough succession to get it out of the hickup mode.
This needs more test.

It would indicate that if a new omap_hdq_runtime_resume()
is called by the second open+read+close sequence before
the autosuspend (300ms) of the previous omap_hdq_runtime_suspend()
happens, something gets back in place for the second
omap_hdq_runtime_suspend().

BR and thanks,
Nikolaus



