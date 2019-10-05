Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D132ACC972
	for <lists+linux-omap@lfdr.de>; Sat,  5 Oct 2019 12:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbfJEKvF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 5 Oct 2019 06:51:05 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.23]:35690 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727930AbfJEKvF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 5 Oct 2019 06:51:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570272660;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=KEG+jqNQygCDaE4Yi2bJFMrWBErgNOEsINx5knzy92M=;
        b=daRczfbfu/tf+oM5094AW21/2aDpPnNoAOa1WyFrGUJPhyzUcxishOfoTf96Hfmn5f
        6+skXplE+arvfyBe+gybJGOT3ly1IUkNNZEL21i+wLZLY+Oy4mCVwDM+HJs6ioIOpIWp
        8LhWEPUrnkeTdCRkF0w5GliO3kwpZk2ykwbosBmLAI6sfZdbUktRzJMXV75CD4diYS8o
        5VUIhHDfnTqdAJ6hfzo4tE+L3p1QgI00530HGlEM1xLNgRQ0o9kj5diqHg5FZgJgb7Nd
        J1oZhsrktmVbaF2bVK3uNHkhHg4xrY892xsUKZb4j4F5Zlx2ubtWBE6ezOGzN3ovD//9
        UlJw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAlw47tvfA="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.28.0 DYNA|AUTH)
        with ESMTPSA id v00409v95AocjVF
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Sat, 5 Oct 2019 12:50:38 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH] ARM: omap2plus_defconfig: Fix selected panels after generic panel changes
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <03ca02c1-2816-17cd-03fd-5b72e5d0ec96@ti.com>
Date:   Sat, 5 Oct 2019 12:50:37 +0200
Cc:     Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Jyri Sarha <jsarha@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <39E48EC6-65FE-419B-BBE8-E72CB44B517D@goldelico.com>
References: <20191003165539.50318-1-tony@atomide.com> <03ca02c1-2816-17cd-03fd-5b72e5d0ec96@ti.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi,

> Am 04.10.2019 um 10:41 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
>=20
> On 03/10/2019 19:55, Tony Lindgren wrote:
>> The old omapdrm panels got removed for v5.4 in favor of generic =
panels,
>> and the Kconfig options changed. Let's update omap2plus_defconfig
>> accordingly so the same panels are still enabled.
>> Cc: Jyri Sarha <jsarha@ti.com>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> Signed-off-by: Tony Lindgren <tony@atomide.com>
>> ---
>>  arch/arm/configs/omap2plus_defconfig | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>> diff --git a/arch/arm/configs/omap2plus_defconfig =
b/arch/arm/configs/omap2plus_defconfig
>> --- a/arch/arm/configs/omap2plus_defconfig
>> +++ b/arch/arm/configs/omap2plus_defconfig
>> @@ -356,14 +356,14 @@ CONFIG_DRM_OMAP_CONNECTOR_HDMI=3Dm
>>  CONFIG_DRM_OMAP_CONNECTOR_ANALOG_TV=3Dm
>>  CONFIG_DRM_OMAP_PANEL_DPI=3Dm
>>  CONFIG_DRM_OMAP_PANEL_DSI_CM=3Dm
>> -CONFIG_DRM_OMAP_PANEL_SONY_ACX565AKM=3Dm
>> -CONFIG_DRM_OMAP_PANEL_LGPHILIPS_LB035Q02=3Dm
>> -CONFIG_DRM_OMAP_PANEL_SHARP_LS037V7DW01=3Dm
>> -CONFIG_DRM_OMAP_PANEL_TPO_TD028TTEC1=3Dm
>> -CONFIG_DRM_OMAP_PANEL_TPO_TD043MTEA1=3Dm
>> -CONFIG_DRM_OMAP_PANEL_NEC_NL8048HL11=3Dm
>>  CONFIG_DRM_TILCDC=3Dm
>>  CONFIG_DRM_PANEL_SIMPLE=3Dm
>> +CONFIG_DRM_PANEL_LG_LB035Q02=3Dm
>> +CONFIG_DRM_PANEL_NEC_NL8048HL11=3Dm
>> +CONFIG_DRM_PANEL_SHARP_LS037V7DW01=3Dm
>> +CONFIG_DRM_PANEL_SONY_ACX565AKM=3Dm
>> +CONFIG_DRM_PANEL_TPO_TD028TTEC1=3Dm
>> +CONFIG_DRM_PANEL_TPO_TD043MTEA1=3Dm
>>  CONFIG_FB=3Dy
>>  CONFIG_FIRMWARE_EDID=3Dy
>>  CONFIG_FB_MODE_HELPERS=3Dy
>=20
> Sorry, I didn't remember to update these. Some additions:
>=20
> These can be dropped, they no longer exist:
>=20
> CONFIG_DRM_OMAP_ENCODER_TFP410=3Dm
> CONFIG_DRM_OMAP_CONNECTOR_DVI=3Dm
> CONFIG_DRM_OMAP_PANEL_DPI=3Dm

After being hit by the __always_inline issue [1] I am now
back with being able to test v5.4-rc1.

Now this patch fixes the build problem, but we still have
one: panel drivers are no longer automatically loaded at
boot. We now need to manually modprobe them.

This has been observed with GTA04 (TD028TTEC1) and OpenPandora
(TD043MTEA1). So moving the drivers seems to have changed/broken
something with DT based driver matching.

BR and thanks,
Nikolaus


[1]: https://lkml.org/lkml/2019/10/2/201=
