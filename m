Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE7DD20DD
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 08:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbfJJGl6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Oct 2019 02:41:58 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:10144 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbfJJGl5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Oct 2019 02:41:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570689713;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=c8LGZ3SWH8Ig6IAVk204LkW/1lH3AvFRp09E9DFnbac=;
        b=efszSh488wOI9KtQVmw/WwXDATD5bEc2Lga+kZHVwVRdzNrEZP6Du8qyZp7ap02VR/
        oazhr+7kpZX6EM7jpBmcE9jvYWUrW0sHYExgdBhKN8PlGgyqt06gH5Po7ZEs5SN1BkSY
        N9yoEwmf6Xtx1YqFWAKFtd0ZimTTujf6/hzI5bhv4bXNPeHWJ3A+vQChGpbIPcZywVk0
        23p6yu904iFe1IGMKRRxS1xMnxRw5UQ2iYOkO3q9yfV4TlD1ngE1qorgAsetYZmPwB1L
        ZEBaz20oQkqoBIHNfiDgKFH6gct2FBVF7KtqsdVBXeDfoTciJ2+OxQB8IhKF9ztYH+Dw
        tFSw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/zowDCp46Q="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.28.0 DYNA|AUTH)
        with ESMTPSA id v00409v9A6fi2FU
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Thu, 10 Oct 2019 08:41:44 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: omapdrm: dsi panels
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191010062540.GA4756@pendragon.ideasonboard.com>
Date:   Thu, 10 Oct 2019 08:41:43 +0200
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Sebastian Reichel <sre@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B5784A6E-1EC1-471C-BE38-F7165002F659@goldelico.com>
References: <3C538A9E-BCE9-4ECF-97C2-52E823266296@goldelico.com> <a84c175e-3d78-6d51-2018-179d828fc7c7@ti.com> <20191010062540.GA4756@pendragon.ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 10.10.2019 um 08:25 schrieb Laurent Pinchart =
<laurent.pinchart@ideasonboard.com>:
>=20
> On Thu, Oct 10, 2019 at 09:07:27AM +0300, Tomi Valkeinen wrote:
>> On 10/10/2019 09:02, H. Nikolaus Schaller wrote:
>>> Hi Tomi,
>>> now as DPI panels have been moved to drm/panel are there plans to
>>> support DSI panels sitting there as well?
>>>=20
>>> I have looked to move our boe-w677l driver for the omap5/Pyra =
handheld
>>> but it seems there are still some omapdrm dependencies.
>>=20
>> No, OMAPDSS DSI support has not been moved to DRM model yet. I =
believe=20
>> Sebastian has been looking at that.
>=20
> That's my understanding too, if I recall correctly Sebastian told me =
he
> had a working implementation, but I'm not sure if it can be upstreamed
> as-is. It would be amazing to get it in mainline, as we'll be able to
> drop lots of code from omapdrm.

Ok, fine. I just wonder if a new driver for omapdrm/displays can then
be accepted for upstreaming or how long we should have to wait.

BR and thanks,
Nikolaus

