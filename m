Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C420B100781
	for <lists+linux-omap@lfdr.de>; Mon, 18 Nov 2019 15:37:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727171AbfKROhO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Nov 2019 09:37:14 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:29872 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726739AbfKROhO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 Nov 2019 09:37:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574087832;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=NccyzmP1agUOJi6AkNkNhwRgnV6m5woxZkl+LYAkrB8=;
        b=FNaWCycELKGjiX5RhGldY1VvGAmZ6vVrmIKGbAzxNQ3oNZUaTevM84a/LZxy0/i3aa
        cnc4ykt+BUEijkvVBL50fxuCakbm3s1zeG8cXjLAImVMPCIHZhbqkoMfLcauSKd2ACvS
        b6voCcyzWiY5p9cN+9OW7LaV0+/SG7Jd1vUaupSnHGs/wXLbVlwGkXxNEYLe9MJAuqH9
        xbsxGdHUav4+IQaSpa53dKsxU9VxHA7wFs/YYem6veY4NrcZNH6lWGgrxSIjf+uTFwho
        9FMC6QlhzRELd6mhn0OrwX9vnRIJ/i5d/4GCN1dqHB1XPi0d9hhg9QiVqdNTU1PqfHJu
        mY7g==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMlw43pqoI="
X-RZG-CLASS-ID: mo00
Received: from mbp-13-nikolaus.fritz.box
        by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
        with ESMTPSA id L09db3vAIEb8TUi
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 18 Nov 2019 15:37:08 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [RFCv1 11/42] ARM: dts: omap: add channel to DSI panels
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191118143332.nyyr6hb4b5c34xew@earth.universe>
Date:   Mon, 18 Nov 2019 15:37:12 +0100
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <7CBD93FA-60AB-4313-BF9C-230BDE2DAE7D@goldelico.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com> <20191117024028.2233-12-sebastian.reichel@collabora.com> <2db2d505-2f92-621c-ba7c-552b89255594@ti.com> <20191118143332.nyyr6hb4b5c34xew@earth.universe>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 18.11.2019 um 15:33 schrieb Sebastian Reichel =
<sebastian.reichel@collabora.com>:
>=20
> Hi,
>=20
> On Mon, Nov 18, 2019 at 03:05:07PM +0200, Tomi Valkeinen wrote:
>> On 17/11/2019 04:39, Sebastian Reichel wrote:
>>> The standard binding for DSI requires, that the channel number
>>> of the panel is encoded in DT. This adds the channel number in
>>> all OMAP3-5 boards, in preparation for using common infrastructure.
>>>=20
>>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>>> ---
>>>  .../devicetree/bindings/display/panel/panel-dsi-cm.txt      | 4 =
+++-
>>>  arch/arm/boot/dts/omap3-n950.dts                            | 3 ++-
>>>  arch/arm/boot/dts/omap3.dtsi                                | 3 +++
>>>  arch/arm/boot/dts/omap4-droid4-xt894.dts                    | 3 ++-
>>>  arch/arm/boot/dts/omap4-sdp.dts                             | 6 =
++++--
>>>  arch/arm/boot/dts/omap4.dtsi                                | 6 =
++++++
>>>  arch/arm/boot/dts/omap5.dtsi                                | 6 =
++++++
>>>  7 files changed, 26 insertions(+), 5 deletions(-)
>>=20
>> Is this required only in the .txt, or also by the driver? This does =
break
>> backward compatibility with the dtbs, and there's always someone who =
won't
>> like it.
>=20
> I add a compatible string for the Droid 4 panel in addition to the
> generic one, which is not really required and just a precaution in
> case we need some quirks in the future.
>=20
> But I had to add the DSI channel to DT, which is required to follow
> the standard DSI bindings. We cannot use the generic infrastructure
> without this change. Technically it should have been there all the
> time, it is only working because it is currently hardcoded to 0 in
> the panel driver.

Is it possible to change it to default to channel <0> if reg is not
specified?

>=20
> TLDR: Yes, it is required by the driver and it does break backward
> compatibility for N950 (panel does not yet work on mainline, since
> the OMAP3 quirks are missing in the omapdrm DSI code), omap4-sdp (
> untested, I do not know if its working) and Droid 4 (known to be
> working with current mainline code, most likely people update their
> DT anyways).
>=20
> -- Sebastian

BR,
Nikolaus

