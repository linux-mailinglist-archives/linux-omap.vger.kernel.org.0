Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ABB91AE039
	for <lists+linux-omap@lfdr.de>; Fri, 17 Apr 2020 16:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728278AbgDQOwV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Apr 2020 10:52:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728087AbgDQOwV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 17 Apr 2020 10:52:21 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C82CFC061A0C;
        Fri, 17 Apr 2020 07:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587135139;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=N2id5dDn08U6TAh/6+DD8aJi6egipg3kzd6Oo3+NmT8=;
        b=gTCksAoZVXuZoUbEI2VMOJI4ZzJUM/YFWbtRJFKkhdWyKZUaxraLSaUqdRHPERC9nN
        AIkAMqme+ivK+KZLEqaMKwfhlskmHhIwyuC0Nwy6rLallb1ISUB2XEua9qy5H8yjvP/a
        j/aNkDXHGkJugR+P4SIgAvQBzH5mkYrOdv7akY9Y03hKucPHwzfzwunLaOYAw5KWoue8
        ly8r6dMNot09b/kFDK9Iiu4ve5jxy+h/hFVxGwZ91tc+wImThozT0IwvIVHrCNGf0Qed
        mVBL3OxIcZ4bRK85Z2Y9+0eerR6IGm5LIs5v7Ysj3BuNO60/+wIuQe3Noh0Q61q98gOS
        Fnuw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PgwDWjbQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.5.0 DYNA|AUTH)
        with ESMTPSA id g06d2dw3HEqF2G9
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 17 Apr 2020 16:52:15 +0200 (CEST)
Subject: Re: [PATCHv3] w1: omap-hdq: Simplify driver with PM runtime autosuspend
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200417164340.3d9043d1@aktux>
Date:   Fri, 17 Apr 2020 16:52:15 +0200
Cc:     Tony Lindgren <tony@atomide.com>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>, Vignesh R <vigneshr@ti.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <6430AF54-849E-456B-8DB0-B4478BBDB78D@goldelico.com>
References: <20191217004048.46298-1-tony@atomide.com> <7B8C7DD9-095B-48FC-9642-695D07B79E97@goldelico.com> <20200416184638.GI37466@atomide.com> <3197C3F0-DEB9-4221-AFBD-4F2A08C84C4C@goldelico.com> <20200417164340.3d9043d1@aktux>
To:     Andreas Kemnade <andreas@kemnade.info>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 17.04.2020 um 16:43 schrieb Andreas Kemnade <andreas@kemnade.info>:
>=20
> On Fri, 17 Apr 2020 16:22:47 +0200
> "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
>=20
>>> Am 16.04.2020 um 20:46 schrieb Tony Lindgren <tony@atomide.com>:
>>>=20
>>> * H. Nikolaus Schaller <hns@goldelico.com> [200416 15:04]: =20
>>>> Hi Tony,
>>>> it looks as if something with this patch is broken on GTA04. For =
v5.6 and v5.7-rc1.
>>>>=20
>>>> HDQ battery access times out after ca. 15 seconds and I get =
temperature of -273.1=C2=B0C...
>>>>=20
>>>> Reverting this patch and everything is ok again. =20
>>>=20
>>> Hmm OK interesting.
>>>=20
>>>> What is "ti,mode" about? Do we have that (indirectly) in =
gta04.dtsi?
>>>> Or does this patch need some CONFIGs we do not happen to have? =20
>>>=20
>>> Sounds like you have things working though so there should be no
>>> need for having ti,mode =3D "1w" in the dts.
>>>=20
>>>>> 	pm_runtime_enable(&pdev->dev);
>>>>> +	pm_runtime_use_autosuspend(&pdev->dev);
>>>>> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 300); =20
>>>=20
>>> Care to check if changing pm_runtime_set_autosuspend_delay value
>>> to -1 in probe makes the issue go away? Or change it manually
>>> to -1 via sysfs.
>>>=20
>>> If that helps, likely we have a missing pm_runtime_get_sync()
>>> somewhere in the driver. =20
>>=20
>> Yes, it does! It suffices to set it to -1 for one readout.
>> Aything else I can test?
>>=20
> How does it depend on loaded drivers?
> Is it really mainline kernel + config + devicetree or something else?

Well, I can revert the patch on the same
kernel (5.6 or 5.7-rc1) + config + devicetree + user-space
and the problem is gone.

This means that something is different between the old and the new
version which makes the hdq access delayed and failing. Of course I
don't know the reason for it and what does influence it.

>=20
> Can you reproduce the problem with init=3D/bin/bash
> and then mount sysfs and modprobe omap_hdq?

I am not sure how quickly I can test such a setup.

> Regarding pm_runtime stuff I thought I have the worst case scenario.

What may make a difference is the sequence in which drivers are loaded.

BR,
Nikolaus

