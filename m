Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86E901B85AE
	for <lists+linux-omap@lfdr.de>; Sat, 25 Apr 2020 12:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgDYK3f (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 25 Apr 2020 06:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726050AbgDYK3f (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Sat, 25 Apr 2020 06:29:35 -0400
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 054ADC09B04A;
        Sat, 25 Apr 2020 03:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587810571;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=/FOD/93/eYGrVTNiC/q4Xei2qHzqH9yqTTrJJvn0i3Y=;
        b=N5zuGBG6voYMVN0YASuOB4WRHXCMue35swEyf9PefLYqHHVtdMuMplKgTxXRHsgk1a
        k5a8BArdLt1Fd6BX/0AczpxW7PJqUP8ar2ZiRZD2TM+Mrs9y56wG+sFe+6Yf0ou105ox
        p9JOHHIhyAv36neSXsqeH9iKwNEh+Perqyyiv3fWnDYWeXwY8W+D0ZpWI995Bj8LT40u
        LwoKnfqKEQDBMntUvPTZ3I4UJYXjcw80SthTw72TCv6GA6YuBBnZsxzHxx2wyTdEw+Bo
        O+zu66cE6c1N3Yb9x0v93oeduopLXoU1U2SpqGLLVPeTzjKDwq2vmXn8JpC4ZiAMWoNh
        9GSQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAiw4yA"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id R0acebw3PATIFPD
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sat, 25 Apr 2020 12:29:18 +0200 (CEST)
Subject: Re: [PATCHv3] w1: omap-hdq: Simplify driver with PM runtime autosuspend
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <A2AC3E81-49B2-4CF2-A7CF-6075AEB1B72D@goldelico.com>
Date:   Sat, 25 Apr 2020 12:29:16 +0200
Cc:     Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>, Vignesh R <vigneshr@ti.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <44AD9673-AE02-498F-A5CC-48499DF226E3@goldelico.com>
References: <3197C3F0-DEB9-4221-AFBD-4F2A08C84C4C@goldelico.com> <20200417164340.3d9043d1@aktux> <6430AF54-849E-456B-8DB0-B4478BBDB78D@goldelico.com> <20200417150721.GL37466@atomide.com> <8E062482-5D5D-4837-9980-D6C708DD24D4@goldelico.com> <20200420150802.GR37466@atomide.com> <D1A77603-11FB-407F-B480-82C57E742C51@goldelico.com> <20200421085336.32cf8ffe@aktux> <20200421180220.GB37466@atomide.com> <70F19A6E-7B36-4873-9364-F284A14EE3A0@goldelico.com> <20200421182017.GC37466@atomide.com> <D3E40A6A-39B8-4F3F-9ABC-28EAE8D623A6@goldelico.com> <20200422120418.49a40c75@aktux> <6E3A50D9-0F15-4A56-8C5E-7CDC63E8AF9F@goldelico.com> <A2AC3E81-49B2-4CF2-A7CF-6075AEB1B72D@goldelico.com>
To:     Andreas Kemnade <andreas@kemnade.info>,
        Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

> Am 24.04.2020 um 18:52 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> Hi Tony and Andreas,
>=20
>> Am 22.04.2020 um 18:06 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>>=20
>> Hi,
>>=20
>>> Am 22.04.2020 um 12:04 schrieb Andreas Kemnade =
<andreas@kemnade.info>:
>>>=20
>>> On Tue, 21 Apr 2020 22:40:39 +0200
>>> "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
>>>=20
>>>> Hi Tony,
>>>>=20
>>>>=20
>>>> I have added that and there might be a slightly different pattern
>>>> (unless that is just by luck): the first two or three attempts to
>>>> read the bq27xx/uevent did still time out. But then the next ones
>>>> worked fine (with a response time of ca. 65 .. 230 ms).
>=20
> Now I have focussed on the hdq_read_byte() timeout and enabled more
> driver debugging.
>=20
> Yes, there are a lot of "timeout waiting for RXCOMPLETE" reports.
> Sometimes with ",0" and sometimes with ",1" (hdq_data->hdq_irqstatus).
>=20
...

> So I have no idea why it sometimes fails. A race?
> Something not locked? Interrupt not delivered in time?
>=20
> The only thing I noticed in code is that hdq_write_byte() doesn't
> use the hdq_mutex although they share the hdq_irqstatus.
>=20
> But hdq_write_byte() doesn't seem to be used for booting and
> reading the bq27xxx.

It is. I had a bug in my printk.

>=20
> Another idea: there may occur two interrupts between call
> to wait_event_timeout(hdq_data->hdq_irqstatus) and
> status =3D hdq_data->hdq_irqstatus; and calling hdq_reset_irqstatus().
>=20
> These changes hdq_irqstatus. And at the end of the read
> process hdq_irqstatus is set to 0 potentially wiping
> out interrupt flags.
>=20
> Just two ideas where we may have missing some locking.
>=20
> There is one more observation: the hdq_read_byte()
> code now also calls hdq_reset_irqstatus(hdq_data);
> in the success case which the old code didn't. So
> there may be an additional risk of loosing interrupts.

After enabling more debugging I got this interesting snapshot:

[ 1659.330627] omap_hdq 480b2000.1w: hdq_write_byte
[ 1659.349914] omap_hdq 480b2000.1w: hdq_isr: 0
[ 1659.563903] omap_hdq 480b2000.1w: TX wait elapsed
[ 1659.568939] omap_hdq 480b2000.1w: TX failure:Ctrl status 0
[ 1659.583831] omap_hdq 480b2000.1w: hdq_read_byte
[ 1659.588684] omap_hdq 480b2000.1w: hdq_isr: 0
[ 1659.793945] omap_hdq 480b2000.1w: timeout waiting for RXCOMPLETE, 0
[ 1659.800659] omap_hdq 480b2000.1w: hdq_write_byte
[ 1659.813812] omap_hdq 480b2000.1w: hdq_isr: 0
[ 1660.023956] omap_hdq 480b2000.1w: TX wait elapsed
[ 1660.028961] omap_hdq 480b2000.1w: TX failure:Ctrl status 0
[ 1660.043823] omap_hdq 480b2000.1w: hdq_read_byte
[ 1660.048675] omap_hdq 480b2000.1w: hdq_isr: 6
[ 1660.053253] omap_hdq 480b2000.1w: hdq_write_byte
[ 1660.074371] omap_hdq 480b2000.1w: hdq_isr: 2
[ 1660.078948] omap_hdq 480b2000.1w: timeout waiting for =
TXCOMPLETE/RXCOMPLETE, 2
[ 1660.103851] omap_hdq 480b2000.1w: TX failure:Ctrl status 2
[ 1660.109710] omap_hdq 480b2000.1w: hdq_read_byte
[ 1660.124267] omap_hdq 480b2000.1w: hdq_isr: 1
[ 1660.333953] omap_hdq 480b2000.1w: timeout waiting for RXCOMPLETE, 1
[ 1660.340637] omap_hdq 480b2000.1w: hdq_write_byte
[ 1660.355957] omap_hdq 480b2000.1w: hdq_isr: 4
[ 1660.360565] omap_hdq 480b2000.1w: hdq_read_byte
[ 1660.373809] omap_hdq 480b2000.1w: hdq_isr: 2
[ 1660.378356] omap_hdq 480b2000.1w: hdq_write_byte
[ 1660.385345] omap_hdq 480b2000.1w: hdq_isr: 4
[ 1660.394287] omap_hdq 480b2000.1w: hdq_read_byte
[ 1660.399078] omap_hdq 480b2000.1w: hdq_isr: 2
[ 1660.413787] omap_hdq 480b2000.1w: hdq_write_byte
[ 1660.420776] omap_hdq 480b2000.1w: hdq_isr: 4
[ 1660.425537] omap_hdq 480b2000.1w: hdq_read_byte
[ 1660.430297] omap_hdq 480b2000.1w: hdq_isr: 2

It looks as if the hdq_write_byte commands fail!
Then, there is of course no response from the bq27xxx
and a hdq_read_byte will also fail.

The things start to get "fixed" when the hdq_isr
jumps to 6 indicating

OMAP_HDQ_INT_STATUS_RXCOMPLETE | OMAP_HDQ_INT_STATUS_TXCOMPLETE

So I am getting more inclined to believe that it is
not a power management issue but some piggybacked
change to how interrupts are handled.
Especially hdq_reset_irqstatus.

So I will add a printk to hdq_reset_irqstatus
to see what value it had before being reset.

And I wonder what the spinlock around setting
hdq_reset_irqstatus =3D 0 is good for. This should
be an atomic operation anyways.

One more code observation: the goto out_err
in omap_w1_write_byte is not needed.

BR,
Nikolaus

