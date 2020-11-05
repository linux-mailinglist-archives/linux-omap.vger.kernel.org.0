Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 963C52A8680
	for <lists+linux-omap@lfdr.de>; Thu,  5 Nov 2020 19:56:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731788AbgKES4S (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Nov 2020 13:56:18 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:36678 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727017AbgKES4S (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Nov 2020 13:56:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1604602576;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=QF9/07bKJVwikm1msKuGv8fTcsBd1U+6AnyYpgnIpZU=;
        b=gjIyz+JpZiR02ips4rdjU+L/Xdsj9e486Z3+mtm7SrNwU4X7Kr0QJ2nEkxmj4JECqW
        EqKWTbcS4AXzeMUurSq3M76haQBNCUhqG7PLyQ+9pz1WRqWZdje/lL1lyIbCDBwepxbj
        RpVcZW03dyeLiWHFKpffJOAbeCGkJoKvpq7sC8YBbPN7KKF2/i2rMshY7Tz/Jy2gDSvG
        aag4Lor/8okCOYhnRg/ZXNirZRVUCze0ghjKAnTU2DzbiO5+Tm/J1aCU9vT/pcbGPayQ
        bSGjLXFcupyNPAtIKgxYc7xkb+RhRLA+jS0k3LWcQ/7SJKe8hSpmm0/fc6a8/+AC54Zj
        LZ0Q==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSfXA0MwM0="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 47.3.2 DYNA|AUTH)
        with ESMTPSA id L07f74wA5Iu10lV
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 5 Nov 2020 19:56:01 +0100 (CET)
Subject: Re: [PATCH v3 00/56] Convert DSI code to use drm_mipi_dsi and drm_panel
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <ab33baff-dd8c-2ee0-6f89-35aa4df7b9cf@ti.com>
Date:   Thu, 5 Nov 2020 19:56:00 +0100
Cc:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <837EA533-9946-43B3-B058-69060EC43981@goldelico.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com> <61C04176-4654-4D2D-A55B-31FBB6D2E5AA@goldelico.com> <fcbc8488-5861-8e51-0f86-1ed6498083f7@ti.com> <579243AA-014A-411B-9014-F5846C9B8137@goldelico.com> <ab33baff-dd8c-2ee0-6f89-35aa4df7b9cf@ti.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailer: Apple Mail (2.3124)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 05.11.2020 um 19:28 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
>=20
> On 05/11/2020 20:14, H. Nikolaus Schaller wrote:
>>=20
>>> Am 05.11.2020 um 18:36 schrieb Tomi Valkeinen =
<tomi.valkeinen@ti.com>:
>>>=20
>>> Hi,
>>>=20
>>> On 05/11/2020 19:15, H. Nikolaus Schaller wrote:
>>>=20
>>>> Next, I migrated my long waiting mipi_dsi/drm_panel driver =
conversion for
>>>> the panel of the Pyra handheld (omap 5 based) to compile on =
5.10-rc2. And
>>>> I followed the latest existing panel-orisetech-otm8009a.c which =
uses a
>>>> similar video mode controller and mipi-dsi.
>>>>=20
>>>> That one seems to be used by arch/arm/boot/dts/stm32f469-disco.dts.
>>>>=20
>>>> Unfortunately my panel driver is not even loaded by drm/omap so I =
can't
>>>> debug. Does this set of drm/omap drivers need a modification of the =
device
>>>> tree? If yes, which one?
>>>=20
>>> omapdrm doesn't load the panel drivers. If not even your panel's =
probe is called, then it hints at
>>> DT and/or driver's compatible string issue. The panel's probe should =
get called even if omapdrm is
>>> not loaded at all.
>>=20
>> Well, I use the same device tree that loads the old driver...
>=20
> Yeah, I was mistaken above. With DSI the panel (may be) a child of the =
DSI host, so it will affect.
>=20
> Can you give pointers to the panel driver source and relevant dts =
files? BOE BTL507212-W677L?

Yes. It is (now)=20

drivers/gpu/drm/panel/panel-boe-btl507212-w677l.c

and

arch/arm/boot/dts/omap5-letux-cortex15-common.dtsi (for the basic dsi =
definitions)
arch/arm/boot/dts/pyra-display.dtsi (for the specific display)

All this is merged by some =
arch/arm/boot/dts/omap5-letux-cortex15-v5.3+pyra-v5.2.dts

(I know there are quite a lot of variants but it is a modular system =
potentially able to
accomodate a non-omap processor but the same display).

BR,
Nikolaus

