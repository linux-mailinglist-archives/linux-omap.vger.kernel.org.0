Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06EAD10210D
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2019 10:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbfKSJnC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Nov 2019 04:43:02 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.167]:27917 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbfKSJnB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 Nov 2019 04:43:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574156580;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=E9S56X5IWwYtL9QKYPNY8mvQJ4aCOIKX44C5DnIVBtc=;
        b=k+KO2XnZ5ceOmssi8RsUNuzLFIX91PoGFHeRKTqnmytyPUIH/v8fNQgkojRJPRjef0
        9TMwlToTF9UGgE7Wg0fk6Mr7/dzDaMZGbhHxce4kovDiN8D0l2kmSRhfl4pj7IX54UPo
        NrgPI8WXY/OYbeo6R0GGKup5TmR6miWNyAN8ok0X3pmmpJIS8zj6TXwUETNrvgknM/KB
        PUyy4jOsQW5m6H45+JUzZRMk/NBOMV0q3DBR5fBb91ouZpzNSh59onMmR3pilz+elshK
        fh+1W18RzbuwJyBEb8dVMPLRiWT0ZtzINgXPt7UDwE0Go0VQ81WnXAwNZYFtpPvYYLXv
        lJKA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAvw43tJe0="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
        with ESMTPSA id L09db3vAJ9guWgh
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Tue, 19 Nov 2019 10:42:56 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [RFCv1 32/42] drm/omap: dsi: convert to drm_panel
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <9681B365-9174-43CE-BCAE-ED986F182935@goldelico.com>
Date:   Tue, 19 Nov 2019 10:42:55 +0100
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com
Content-Transfer-Encoding: 7bit
Message-Id: <469800BA-25F8-4E0A-8194-50C197BC4BF5@goldelico.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com> <20191117024028.2233-33-sebastian.reichel@collabora.com> <D109D867-1C8E-44F6-9C91-AF55BCB3FDD3@goldelico.com> <20191118144558.abix5y555jk63szb@earth.universe> <9681B365-9174-43CE-BCAE-ED986F182935@goldelico.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sebastian,

> Am 18.11.2019 um 15:51 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> 
>> Ok, I tried not to break video mode support, but I do not have any
>> hardware. Make sure to set the MIPI_DSI_MODE_VIDEO flag in the panel
>> driver.
> 
> Indeed, this may be missing (can't look into the code at the moment)...
> Or I did something wrong when refactoring the driver.
> We will find out.

Yes, MIPI_DSI_MODE_VIDEO was indeed missing/wrongly applied and some
more bugs. But I still wasn't able to make it work.

I also tried to fake the panel-orisetech-otm8009a.c DSI driver into
my setup. It should not properly program the panel by DCS command
but it should try to.

Result is the same: I can see it being probed and calling get_modes
but then:

[drm] Cannot find any crtc or sizes

And I don't see calls to .enable or .prepare where DCS commands would
be sent.

BR and thanks,
Nikolaus

