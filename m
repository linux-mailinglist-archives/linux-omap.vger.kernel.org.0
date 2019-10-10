Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6EFD21DF
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 09:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733111AbfJJHiJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Oct 2019 03:38:09 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:24224 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732928AbfJJH2E (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Oct 2019 03:28:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570692482;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=TCkNcAGat33DBiTCAsdKOS3sMlOy+udGStlz8996KZE=;
        b=FC4F31jGt/Ur8ECRoRMqbqsBcU5FYbBch2/2sa3bxulfEuZ9DLPm/vesZQq5xbevCr
        EyoDXCs/Sd9/Sd4o1DVu3+CgQhFrQbSAyKewlfAfBvkI/hKBhg0vEzp+PdHoCyocMHYT
        moeq110jAYPRwuh7Z7f0q7byxwvoxTy6fS1n7Ogfk1rFweSG+8MNhrrfURmm/FONnfT6
        v3n/eXZDq5ecl4UqRyigeoZmQjjkFpOt3UJqtTJtxYPabVlUl1Q02fCR6MufuzSrV6Of
        N105gZc6xF45sLDpNHBHXhMo/9ffdb2Xz4u0uJlCrvgIWAllShrBkq5et93dts/NOVC3
        vJkg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/zowDCp46Q="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.28.0 DYNA|AUTH)
        with ESMTPSA id v00409v9A7Rr2Wr
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Thu, 10 Oct 2019 09:27:53 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: omapdrm: dsi panels
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191010071633.GC4756@pendragon.ideasonboard.com>
Date:   Thu, 10 Oct 2019 09:27:52 +0200
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <01479203-47C8-4C68-9A03-653C151B89E1@goldelico.com>
References: <3C538A9E-BCE9-4ECF-97C2-52E823266296@goldelico.com> <a84c175e-3d78-6d51-2018-179d828fc7c7@ti.com> <20191010062540.GA4756@pendragon.ideasonboard.com> <B5784A6E-1EC1-471C-BE38-F7165002F659@goldelico.com> <20191010071633.GC4756@pendragon.ideasonboard.com>
To:     Sebastian Reichel <sre@kernel.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sebastian,

> Am 10.10.2019 um 09:16 schrieb Laurent Pinchart =
<laurent.pinchart@ideasonboard.com>:
>=20
> Hi Nikolaus,
>=20
> On Thu, Oct 10, 2019 at 08:41:43AM +0200, H. Nikolaus Schaller wrote:
>> Am 10.10.2019 um 08:25 schrieb Laurent Pinchart:
>>> On Thu, Oct 10, 2019 at 09:07:27AM +0300, Tomi Valkeinen wrote:
>>>> On 10/10/2019 09:02, H. Nikolaus Schaller wrote:
>>>>> Hi Tomi,
>>>>> now as DPI panels have been moved to drm/panel are there plans to
>>>>> support DSI panels sitting there as well?
>>>>>=20
>>>>> I have looked to move our boe-w677l driver for the omap5/Pyra =
handheld
>>>>> but it seems there are still some omapdrm dependencies.
>>>>=20
>>>> No, OMAPDSS DSI support has not been moved to DRM model yet. I =
believe=20
>>>> Sebastian has been looking at that.
>>>=20
>>> That's my understanding too, if I recall correctly Sebastian told me =
he
>>> had a working implementation, but I'm not sure if it can be =
upstreamed
>>> as-is. It would be amazing to get it in mainline, as we'll be able =
to
>>> drop lots of code from omapdrm.
>>=20
>> Ok, fine. I just wonder if a new driver for omapdrm/displays can then
>> be accepted for upstreaming or how long we should have to wait.
>=20
> I would prefer avoiding new drivers in omapdrm/displays. If you could
> collaborate with Sebastian that would be best :-)

if you have a patch series to share, I could base my driver on it for
testing.

BR,
NIkolaus

