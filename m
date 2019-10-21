Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC71DF4D9
	for <lists+linux-omap@lfdr.de>; Mon, 21 Oct 2019 20:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729994AbfJUSIF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Oct 2019 14:08:05 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:35936 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729878AbfJUSIE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 21 Oct 2019 14:08:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1571681282;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=qQ6zV65O4QTCFnYrPW5AcyzqoTnREY7XPbgJ3s1IDW8=;
        b=OH+QEsF7qliA4AI9mvrnicGWFLMcpuY9MqzuAT7wW1sa+9GRkIx1vaVlSIbfhMBMv0
        NS3/R2t97sq1iP1MJmGf20rkY9S3BMwUYAhsDKNxMD55NNt4f5tsm6CGOhBeoDqiVWqg
        vXZfuPoPYF7Uhl21FK6i9d/73TExoANaC6RynmClpWDpadd66hjnX9OrioTdY7rfNio4
        aLr4Tg3urEHez4D9kZV8rV9GXCzW42jtu5ahFuRjmuqhhf4rOaqbzNuUecCpFtGCJhnn
        tfsNdV/WtxciK7Y+MifqSv+y+m/5RANFDMSQGaP32r6aM09ILJAuizAGWeFEPffg3KxA
        5yUQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDVCbXA4Ewxc="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.28.1 DYNA|AUTH)
        with ESMTPSA id R0b2a8v9LI7xM5P
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 21 Oct 2019 20:07:59 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 1/7] dt-bindings: gpu: pvrsgx: add initial bindings
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191021172557.GB5610@atomide.com>
Date:   Mon, 21 Oct 2019 20:07:59 +0200
Cc:     Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <C6CD5A50-7F0A-4F56-ABB9-CAEDF7E47A5D@goldelico.com>
References: <cover.1571424390.git.hns@goldelico.com> <f0fb68dc7bc027e5e911721852f6bc6fa2d77a63.1571424390.git.hns@goldelico.com> <CAL_Jsq+obsTSU3iP1wm_3-FsAJ4Mxiz0NbMY1_h5NeFn67Sj+A@mail.gmail.com> <CEA29A3B-4116-4FE3-8E18-0C97353688DC@goldelico.com> <20191021172557.GB5610@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 21.10.2019 um 19:25 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * H. Nikolaus Schaller <hns@goldelico.com> [191021 15:46]:
>>> Am 21.10.2019 um 17:07 schrieb Rob Herring <robh+dt@kernel.org>:
>>> On Fri, Oct 18, 2019 at 1:46 PM H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>>>> +Optional properties:
>>>> +- timer:       the timer to be used by the driver.
>>>=20
>>> Needs a better description and vendor prefix at least.
>>=20
>> I am not yet sure if it is vendor specific or if all
>> SGX implementations need some timer.
>>=20
>>>=20
>>> Why is this needed rather than using the OS's timers?
>>=20
>> Because nobody understands the current (out of tree and
>> planned for staging) driver well enough what the timer
>> is doing. It is currently hard coded that some omap refer
>> to timer7 and others use timer11.
>=20
> Just configure it in the driver based on the compatible
> value to keep it out of the dts. It's best to stick to
> standard bindings.

IMHO leads to ugly code... Since the timer is not part of
the SGX IPR module but one of the OMAP timers it is sort
of hardware connection that can be chosen a little arbitrarily.

This is the main reason why I think adding it to a device tree
source so that a board that really requires to use a timer
for a different purpose, can reassign it. This is not possible
if we hard-code that into the driver by scanning for
compatible. In that case the driver must check board compatible
names...

But if we gain a better understanding of its role in the driver
(does it really need a dedicated timer and for what and which
properties the timer must have) we can probably replace it.

>=20
>>>> +- img,cores:   number of cores. Defaults to <1>.
>>>=20
>>> Not discoverable?
>>=20
>> Not sure if it is. This is probably available in undocumented
>> registers of the sgx.
>=20
> This too, and whatever non-standrd other properities
> you might have.

Here it is a feature of the SGX IPR of the SoC, i.e.
describes that the hardware has one or two cores.

BR,
NIkolaus

