Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35B36214DB1
	for <lists+linux-omap@lfdr.de>; Sun,  5 Jul 2020 17:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbgGEPkW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 5 Jul 2020 11:40:22 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.20]:33680 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726975AbgGEPkV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 5 Jul 2020 11:40:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1593963619;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=vSVVc59vCmbpMVDpRe0ZmsPUtypVOTeiw6DLQQriGnY=;
        b=MqXRpNia/oP1YjpFAQSU/250/UHd6Kav9axzbTfmBAnhIchWmUMqdyOlpiRrXfc9aH
        U9xCqvK1CmbZjwvCZ0CnJaJ6oKb6zoJ66eVCO30vyAYogcDM+yNzpHf0qzou1+8vhUcE
        WATzwNgzzBPFXtYZDFZDmDTi0d2slAmjTcuDKOOgGGYRfYf+68M+dwY9fYeVtrNlz4nW
        oBvNjsWqJijmJ7r8y7aurBpvQ3nT2U57FPwUldH/UV4g0gQU+Ix9qdpJOsjx6f/xH+EM
        QsQm0OZFeFUXibJK5dcsDK1qAnHgSwcwa8q+LwHpxeUXMowLUY1vGfmazJ7yUQvGPrJA
        IlCg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGHPrqwDCpBMA="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id V07054w65FeHmlK
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sun, 5 Jul 2020 17:40:17 +0200 (CEST)
Subject: Re: OMAP5: inconsistency between target-module and dsi_of_data_omap5
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200705143614.GR37466@atomide.com>
Date:   Sun, 5 Jul 2020 17:40:17 +0200
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jyri Sarha <jsarha@ti.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E200E98D-A4F8-4270-B192-33733F4C7235@goldelico.com>
References: <F5C04FAF-0029-48F3-B0A6-5327CD911EA2@goldelico.com> <49725F81-E615-4101-81B3-0850F201D9E8@goldelico.com> <5F4C23B0-A82B-4F94-BD74-D04F6D798FC0@goldelico.com> <20200705142653.GQ37466@atomide.com> <20200705143614.GR37466@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

> Am 05.07.2020 um 16:36 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * Tony Lindgren <tony@atomide.com> [200705 14:27]:
>> * H. Nikolaus Schaller <hns@goldelico.com> [200705 13:48]:
>>>> This patch makes the DSI error go away and omapdrm initialized:
>>>>=20
>>>> diff --git a/arch/arm/boot/dts/omap5.dtsi =
b/arch/arm/boot/dts/omap5.dtsi
>>>> index e147121513e644..b9f54f62163879 100644
>>>> --- a/arch/arm/boot/dts/omap5.dtsi
>>>> +++ b/arch/arm/boot/dts/omap5.dtsi
>>>> @@ -474,7 +474,7 @@ rfbi: encoder@0  {
>>>>                                       };
>>>>                               };
>>>>=20
>>>> -                               target-module@5000 {
>>>> +                               target-module@4000 {
>>>>                                       compatible =3D =
"ti,sysc-omap2", "ti,sysc";
>>>>                                       reg =3D <0x5000 0x4>,
>>>>                                             <0x5010 0x4>,
>=20
> Looks like you need to also change the reg offsets above
> from 0x5000 something to 0x4000 something.

I think I had tried that as well, but then it seems to hang
in drm_setup_crtcs_fb (or shortly after).

>=20
>> Do you have loaded display-connector? That is needed starting
>> with v5.7-rc1.
>=20
> Where the display-connector is a new kernel module to load.

Ah, ok. Never heard of but it seems to be selected automatically:

CONFIG_CONNECTOR=3Dy
CONFIG_DRM_DISPLAY_CONNECTOR=3Dm

and

root@letux:~# lsmod | fgrep dss
omapdss               163840  3
omapdss_base           16384  2 omapdrm,omapdss
drm_kms_helper        143360  3 omapdss_base,omapdrm,omapdss
drm                   380928  10 =
ti_tpd12s015,omapdss_base,pvrsrvkm_omap5_sgx544_116,display_connector,etna=
viv,omapdrm,gpu_sched,omapdss,drm_kms_helper
cec                    45056  1 omapdss
root@letux:~#=20

Does the panel driver also need some modification? It is no longer =
loaded.

BR and thanks,
Nikolaus

