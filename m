Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88B111ADEC4
	for <lists+linux-omap@lfdr.de>; Fri, 17 Apr 2020 15:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730601AbgDQNyA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Apr 2020 09:54:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730563AbgDQNx7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Fri, 17 Apr 2020 09:53:59 -0400
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19DB1C061A0C;
        Fri, 17 Apr 2020 06:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587131636;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=X+miR8R8fyz7mYCdQoU4qb119uC9KuI5sxxMzCuMnyo=;
        b=ikMxvwwfwzAyEOdEehH3moi/I5CpWs7yZ+IXUYtMUIU7SHktgLGkmxlaFhCkkaHQzn
        Ih2/udypt3gqE1Seblsc9FdyOOIHm3Aci5vMmW0nCA5UjFDTfu0YFPAqpvpu0F+9j0rL
        1YK6GxF+k5NLOgRJhu7Zq7tB6mBz6PXrYq+N3P27PhCATN63JhMR8LjEtOcrGNxvNS+f
        NuV+vmmslu8bSyMMWcnY1DaJUwc2C7lA3dkIjiGGYvllVS2gTk77pyGtVTTx2DG7TA6J
        nkOxrqjA0YHeO/1s2PoSuE9a3W1doteDotnMvp+MJYeMBxm6Bg13q3EgCHGe8vzfrigA
        E5lA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PgwDWjbQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.5.0 DYNA|AUTH)
        with ESMTPSA id g06d2dw3HDrk22z
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 17 Apr 2020 15:53:46 +0200 (CEST)
Subject: Re: [drm:simple_bridge_attach [simple_bridge]] *ERROR* Fix bridge driver to make connector optional!
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200417125840.GB4748@pendragon.ideasonboard.com>
Date:   Fri, 17 Apr 2020 15:53:46 +0200
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <401F61D0-B88C-4BF7-8CB1-907B0C5F7223@goldelico.com>
References: <CB5A5B81-F06C-4CBE-95DE-96C8723D2AC5@goldelico.com> <20200417124422.fl35igitvd7thpr5@gilmour.lan> <20200417125840.GB4748@pendragon.ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Laurent,

> Am 17.04.2020 um 14:58 schrieb Laurent Pinchart =
<laurent.pinchart@ideasonboard.com>:
>=20
> Hello,
>=20
> On Fri, Apr 17, 2020 at 02:44:22PM +0200, Maxime Ripard wrote:
>> On Fri, Apr 17, 2020 at 02:18:11PM +0200, H. Nikolaus Schaller wrote:
>>> Hi Maxime,
>>> I have started to test v5.7-rc1 and can't fully boot the GTA04
>>> device any more.
>>>=20
>>> What I see in the log is:
>>>=20
>>> [   28.567840] [drm:simple_bridge_attach [simple_bridge]] *ERROR* =
Fix bridge driver to make connector optional!
>>> [   28.567871] omapdrm omapdrm.0: unable to attach bridge =
/ocp@68000000/dss@48050000/encoder@48050c00
>>> [   28.786529] omapdrm omapdrm.0: omap_modeset_init failed: ret=3D-22
>>> [   28.841552] omapdrm: probe of omapdrm.0 failed with error -22
>>>=20
>>> This device uses the ti,opa362 chip which did have a dedicated
>>> omapdss driver before (which is removed now) and which seems to
>>> be supported by the simple_bridge now.
>>>=20
>>> The opa362 is sitting in the video out path from
>>>=20
>>> 	omapdrm -> venc -> opa362 -> video-out-connector.
>>>=20
>>> What does this error mean? How can it be fixed?
>>=20
>> -22 is usually EINVAL, which can be pretty much anything. A good =
thing to do
>> would be to bisect to see which actual commit broke it, but if I was =
to bet on
>> something I guess it would be
>>=20
>> =
https://lore.kernel.org/dri-devel/20200226112514.12455-1-laurent.pinchart@=
ideasonboard.com/
>=20
> Would "[PATCH 0/2] drm: bridge: simple-bridge: Enable usage with DRM
> bridge connector helper" solve it ?

Yes, seems to magically solve the boot issue!

I'll confirm later if the opa362 is still (or again) working.

BR and thanks,
Nikolaus Schaller

