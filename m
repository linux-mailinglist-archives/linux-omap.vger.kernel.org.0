Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 665EF2181E5
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jul 2020 09:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgGHHz0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 8 Jul 2020 03:55:26 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:26254 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbgGHHz0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 8 Jul 2020 03:55:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1594194923;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=JRCk12NmZPFZESJ1uogxI4JtqbrTpjAQcQz4oexmLF0=;
        b=MMWDtouLzj82N0K+kzkCK/veJE3VxCEJ9GS0IFP4MHfS5UdqKRCVJT5Q+dDfTu2iYs
        Ok/nZOTOB6ukFQyxk1jQGYDLB5gq0FsPGvSXoDzAUbGg/DN52wXQB6+5H/KZiwPLSEhC
        +cLSnwvfQzHhdOY3xUQo/BZP6pOhXg9R+lsxPpGjlZsA0MhodLyAkKmIGum5Xf59VN4u
        HuB7HBVoUU7rFjr9zWs61JArUVP/2msDrG12MOUVSxAhUqf6SiisJ17sGHIF6qtdFWDf
        zY51ThJylc9NI0fVIF5sreuPIVF0J9mhgIZJp1h/EKcWKQU/BkxIBNpryAWGL56X+fa7
        9jng==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/zrwDOv05g="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id V07054w687qIxIX
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 8 Jul 2020 09:52:18 +0200 (CEST)
Subject: Re: OMAP5: inconsistency between target-module and dsi_of_data_omap5 / module_mipi_dsi_driver panel with omapdrm
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <ECE29C41-DFE5-4A50-9206-6FB3183824C3@goldelico.com>
Date:   Wed, 8 Jul 2020 09:52:17 +0200
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jyri Sarha <jsarha@ti.com>, kernel@pyra-handheld.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <6E0A9415-9AB5-48D9-9E61-12D20655D04D@goldelico.com>
References: <F5C04FAF-0029-48F3-B0A6-5327CD911EA2@goldelico.com> <49725F81-E615-4101-81B3-0850F201D9E8@goldelico.com> <5F4C23B0-A82B-4F94-BD74-D04F6D798FC0@goldelico.com> <20200705142653.GQ37466@atomide.com> <20200705143614.GR37466@atomide.com> <E200E98D-A4F8-4270-B192-33733F4C7235@goldelico.com> <20200706143613.GS37466@atomide.com> <E4616E3C-2519-4421-BC75-87A5CA2BB9EF@goldelico.com> <20200707180115.GB5849@atomide.com> <ECE29C41-DFE5-4A50-9206-6FB3183824C3@goldelico.com>
To:     Tony Lindgren <tony@atomide.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi again,

> Am 07.07.2020 um 21:04 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> Hi Tony and Tomi,
>=20
>> Am 07.07.2020 um 20:01 schrieb Tony Lindgren <tony@atomide.com>:
>>=20
>> * H. Nikolaus Schaller <hns@goldelico.com> [200706 16:11]:
>>>> Am 06.07.2020 um 16:36 schrieb Tony Lindgren <tony@atomide.com>:
>>>> I think you should now be using just the generic panel with
>>>> drivers/gpu/drm/panel/panel-simple or some panel specific
>>>> driver for dsi.
>>>=20
>>> None of them supports the vendor specific MIPI commands of
>>> this panel.
>>>=20
>>> Therefore we have our own panel driver for years and try to
>>> keep pace with upstream changes.
>>=20
>> OK yeah would be good to have it upstream. It might see use
>> on some other platforms while waiting for the pyra dts files.
>=20
> So if you think we can get the panel driver upstream without the
> pyra dts files I am happy to submit something for review.
>=20
> But I have to fix it first.
>=20
> Maybe Tomi can comment about ideas what structural changes have
> been done so that it got broken since v5.7-rc1. Then it becomes
> easier to fix for me. Maybe there was some rework in omapdrm/dss
> which needs some change in the driver.
>=20
> And what I would need to know before I start to write new code is
> if is possible to operate a video mipi dsi panel with driver from
> gpu/drm/panel together with omapdrm (v5.7 and later).
>=20
> If this is possible it should be quite easy to mix the
> old omapdrm/display driver code with e.g.:
>=20
> drivers/gpu/drm/panel/panel-orisetech-otm8009a.c

I did a quick test on a 5.7.6 kernel with the sysc fixes as
suggested by Tony.

Then I overwrote the compatible entry of our display to be
orisetech,otm8009a and configured to build the otm8009a panel driver.

The panel driver is loaded, but not probed (no call to otm8009a_probe).
It is shown in /sys/bus/mipi-dsi/drivers (and lsmod) but not =
/sys/bus/mipi-dsi/devices.

So what should I try next?

BR and thanks,
Nikolaus=
