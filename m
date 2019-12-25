Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C861512A89B
	for <lists+linux-omap@lfdr.de>; Wed, 25 Dec 2019 18:01:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbfLYRBt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 25 Dec 2019 12:01:49 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.165]:15639 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbfLYRBs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 25 Dec 2019 12:01:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1577293304;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=OoOmW3Xk0QeJPZM69nPutxxHH8KJBgrsbAwySS3OQwQ=;
        b=WSYuWWjHWbJ0/KGAEK9MEcRC8qI/XkpT3hGVTwL0lku6iRq0PYQeF9ltLLpKD6Y5vs
        hs1l0IMJ1J2xB9kfEU6BK/U19HfMrb3u++vzqIbO2U0l6nuMEvAyKVT0nbcndz9mNb6t
        IFq/2FhfjfTvgkC3/2GahV+xouua/fxef8xjffRk2d9me4VmxgzrIsx1r7mG887EI8kG
        wJm8iXp5vJbJ+n8VjAEZOA/tNjWXMJLug8GRpjmwkjc5FaTdG/zTWeda64B/2TkT+oCn
        uHU5PXx/4MenuvEZA7+wjxN/XRVailQVvSTCJ+wAe4VpRtWIgwz+8NJXwPFs7CJz/o3k
        +DKg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBi5wp385lpdu3KwbY="
X-RZG-CLASS-ID: mo00
Received: from [192.168.2.8]
        by smtp.strato.de (RZmta 46.1.3 DYNA|AUTH)
        with ESMTPSA id a09dafvBPH1T4hq
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 25 Dec 2019 18:01:29 +0100 (CET)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH] ARM: dts: Add omap3-echo
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191224184503.GK35479@atomide.com>
Date:   Wed, 25 Dec 2019 18:01:33 +0100
Cc:     =?utf-8?Q?Andr=C3=A9_Hentschel?= <nerv@dawncrow.de>,
        webmaster@dawncrow.de, linux@arm.linux.org.uk, robh+dt@kernel.org,
        mark.rutland@arm.com, bcousson@baylibre.com,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <60412339-53BF-4DC1-8AF6-4FB0E75D429C@goldelico.com>
References: <20191224161005.28083-1-nerv@dawncrow.de> <20191224184503.GK35479@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

> Am 24.12.2019 um 19:45 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * Andr=C3=A9 Hentschel <nerv@dawncrow.de> [191224 16:11]:
>> This is the first generation Amazon Echo from 2016.
>> Audio support is not yet implemented.
>=20
> OK looks good to me, just worried about one part:
>=20
>> +&sgx_module {
>> +	status =3D "disabled";
>> +};
>=20
> We should have a separate am3703.dtsi or whatever the SoC model
> disabling sgx if not there on the SoC.

I think the am3703 is a dm3730 (omap3630) where the SGX and the
DSP have not passed production test and are "disabled" by eFuses.
This is a common procedure in silicon production to increase yield.

Therefore, there is a register which allows to dynamically determine
what components (SGX and DSP) are available on a specific SoC chip.
See "Table 1-6. Chip Identification" in the common
"AM/DM37x Multimedia Device TRM".

Such bits exists for omap34xx and for omap36xx (aka am37xx/dm37xx).

That way there is no need to disable/enable sgx through device tree
variations and introducing more complexity by introducing more and more
DTS for variants (am3703.dtsi, am3715.dtsi, dm3720.dtsi, dm3730.dtsi?).

BTW: what about a board that is/was produced in either am3703 or dm3730
variants? Can they still share an omap36xx.dtsi based DTB?

So IMHO if there is an issue with sgx enabled on am3703 but no SGX
hardware available on a specific SoC, the sysc setup should somehow read
the bits and effectively disable all SGX related setup if it is not
available on the SoC. If I remember correctly, some older hwmods did
such things by checking SoC variant bits.

BR and thanks,
Nikolaus

