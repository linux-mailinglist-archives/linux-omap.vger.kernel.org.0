Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87E751B315C
	for <lists+linux-omap@lfdr.de>; Tue, 21 Apr 2020 22:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgDUUkx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Apr 2020 16:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725850AbgDUUkx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Apr 2020 16:40:53 -0400
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E57DDC0610D5;
        Tue, 21 Apr 2020 13:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587501650;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=u5+Cv1m2XkwSu40O47T40Ao/U3ZyngrdU3k85lJ7sDQ=;
        b=elOL975H4YOVlGzoHK5CrZAXYbYwTpxwWAp/iIRlRIfFPyHad4qVYH2++xd0ONRF2m
        0M2j+4TGsC1H1QdPyRTTHYYAV/qbr3Gmm1cF1jfJREvnkChZ9O2+KV3s0DW2UJ3nTwWo
        BN0CdpRXLXl3aMsr/jeMdTHcuUeGLhYi6G/1HmrYUd1k7O0K9XRSlJ4EsTpor7PheQZp
        kfS/c2xCQ9bZscCyY+gtaZP3ug410mJMlhmmgF7JflXhPEl/hi3ClgWbokEMyTx5U69G
        rWBj9obwJK+PTh6BsYxHyqLPpyoR4g73D54ziWjYPfCWSvIqqXw3SmSBi1Lr2l6463XQ
        mjuQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAiw43oXkQ="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.5.0 DYNA|AUTH)
        with ESMTPSA id g06d2dw3LKeeK0u
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 21 Apr 2020 22:40:40 +0200 (CEST)
Subject: Re: [PATCHv3] w1: omap-hdq: Simplify driver with PM runtime autosuspend
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200421182017.GC37466@atomide.com>
Date:   Tue, 21 Apr 2020 22:40:39 +0200
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>, Vignesh R <vigneshr@ti.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D3E40A6A-39B8-4F3F-9ABC-28EAE8D623A6@goldelico.com>
References: <3197C3F0-DEB9-4221-AFBD-4F2A08C84C4C@goldelico.com> <20200417164340.3d9043d1@aktux> <6430AF54-849E-456B-8DB0-B4478BBDB78D@goldelico.com> <20200417150721.GL37466@atomide.com> <8E062482-5D5D-4837-9980-D6C708DD24D4@goldelico.com> <20200420150802.GR37466@atomide.com> <D1A77603-11FB-407F-B480-82C57E742C51@goldelico.com> <20200421085336.32cf8ffe@aktux> <20200421180220.GB37466@atomide.com> <70F19A6E-7B36-4873-9364-F284A14EE3A0@goldelico.com> <20200421182017.GC37466@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

> Am 21.04.2020 um 20:20 schrieb Tony Lindgren <tony@atomide.com>:
>=20
>> Well, what helps is reverting the patch and using the old driver
>> (which did work for several years). So I would not assume that
>> there is a hardware influence. It seems to be something the new
>> driver is doing differently.
>=20
> Well earlier hdq1w.c did not idle, now it does.

Ah, I see!

> If you just want to keep it enabled like earlier, you can just add =
something like:

Well, I don't want it enabled, it just should work as before.
Ideally including all improvements :)

>=20
> &hdqw1w {
> 	ti,no-idle;
> };

I have added that and there might be a slightly different pattern
(unless that is just by luck): the first two or three attempts to
read the bq27xx/uevent did still time out. But then the next ones
worked fine (with a response time of ca. 65 .. 230 ms).

So as if something needs to be shaken into the right position after
boot until it works.

Interestingly, after reinstalling the version without ti,no-idle;
it did work well on the first boot but not afterwards. Like there
is some memory surviving powerdown and battery removal... But again,
it started to work after 6 or 7 failed attempts.

If only it weren't so time-consuming to perform such tests...

>> I need more time to understand and trace this issue on what it
>> depends... It may depend on the sequence some other modules are
>> loaded and what the user-space (udevd) is doing in the meantime.
>=20
> Yes would be good to understand what goes wrong here before we
> apply the ti,no-idle as that will block SoC deeper idle states.
>=20
> Regards,
>=20
> Tony

BR and thanks,
Nikolaus

