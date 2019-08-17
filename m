Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9473690FA7
	for <lists+linux-omap@lfdr.de>; Sat, 17 Aug 2019 11:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725908AbfHQJZF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 17 Aug 2019 05:25:05 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:20068 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbfHQJZF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 17 Aug 2019 05:25:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1566033903;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=ijs/kURws359Us4T+k669A+WG1ftqk/SV6cjRML2p+8=;
        b=t2AhWV8hGWVn0BHgsfiO5jwXvi1mRw1IUTcS9jIdyparuHZ+PEpx+YZ12p60zYc2u4
        podz5l64QWqPZenitbVCX8yDz6RgE0k1wL7hA2IkFGvmZKwmX3svaUxmW7KXSp/z68Je
        2yln+iDkZFDRJGdcs6/9ryaZHelTFaTL7+8W8hYv398cVo93YenbM/1LZ4XKg9N6XMlf
        FNAlQmHoPjt1damGs9Lt37c2X0fSiUXCu+WdHs8cBi/ZWNvtMrmI5Q0k6hybVClW0SLy
        bKx8SpZzUB2osHZT6v8SSitUFx5DgK+9NIU7SanRLC3H7vm2UTXumB2WAS6FoMIdu7OT
        EBWg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBi5wp38sDGQBQKV9qb"
X-RZG-CLASS-ID: mo00
Received: from [192.168.2.7]
        by smtp.strato.de (RZmta 44.26.1 DYNA|AUTH)
        with ESMTPSA id V074e8v7H9OuJeh
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Sat, 17 Aug 2019 11:24:56 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [RFC PATCH 0/3] Enable 1GHz support on omap36xx
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAHCN7x+Ye6sB_YqO0sAX1OJDw64B-qGS3pL545v3Xk5z914cwQ@mail.gmail.com>
Date:   Sat, 17 Aug 2019 11:24:59 +0200
Cc:     =?utf-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0C1EF64E-B33C-4BFA-A7D3-471DD1B9EE86@goldelico.com>
References: <20190801012823.28730-1-neolynx@gmail.com> <CAHCN7x+nD0J6KZYtfH+0ApQTPO5byO2obMkUwc9Uf4WubyRbTw@mail.gmail.com> <C04F49BA-1229-4E96-9FCF-4FC662D1DB11@goldelico.com> <CAHCN7x+Ye6sB_YqO0sAX1OJDw64B-qGS3pL545v3Xk5z914cwQ@mail.gmail.com>
To:     Adam Ford <aford173@gmail.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 16.08.2019 um 14:25 schrieb Adam Ford <aford173@gmail.com>:
>>=20
>> I tried to get such code into drivers/cpufreq/ti-cpufreq.c but
>> gave up when I found that this is not used for the omap36xx.
>>=20
>>=20
>> To me it looks as if this opp-v2-ti table is what we need for =
omap36xx.dtsi
>> as well to manage the speed-binned bit of DM3730. To me it looks =
sufficiently
>> similar to an "eFuse" bit. But I didn't look into the details of the
>> opp-v2-ti format, because all that is a second step after getting =
1GHz stable
>> on 1GHz capable chips.
>=20
> I looked into this once, but I couldn't figure out how to interpret
> the "opp-supported-hw" entries.

Translating the OPP values isn't difficult and I have started a sketch =
for it.
"opp-supported-hw" is indeed difficult to understand. I just have a =
working
hypothesis that it seems to be possible to have major chip variants and =
minor
variants. Major variants get their own 32 bit value in each record. =
Minor variants
are described by bit positions.

Since we only have to care about one major variant of omap36xx (unless =
we want
a single OPP value list for omap34xx and omap36xx) and there are only =
800MHz
and 1GHz rated chips a single entry array with only one or two bits in =
each value
should suffice to handle it.

What I am missing in the big picture is how to specify the register =
address to
be inspected and how the bits in the eFuse / "speed-binned" register =
match
the bits in the "opp-supported-hw" entries. Maybe it is done by driver =
code
or needs a separate DT entry somewhere.

For the records, we have to read the Control Device Status Register 15:0
(Address 0x4800 244C) BIT(9).

I'll look into that as soon as I find time for further study.

>  If you keep me in the, loop, I'm more
> than happen to help where I can and/or test when possible.

Sure!

BR,
Nikolaus

