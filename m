Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7FA323CC82
	for <lists+linux-omap@lfdr.de>; Wed,  5 Aug 2020 18:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728132AbgHEQtj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Aug 2020 12:49:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728068AbgHEQsi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Aug 2020 12:48:38 -0400
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A362C03460B
        for <linux-omap@vger.kernel.org>; Wed,  5 Aug 2020 04:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1596628154;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=K1WhgLO1pSeMHiri8IQnTyKoIuG72wohOqsypQRghNU=;
        b=EFGMPVgvBABU5ywZzLUrjtrsXtqs2Yqt8LExH/dcd8RqawJTMdc6P0V69XmBPWmrDe
        +C3l+N9ydmh8+T7DHpn538WLriV4H1xv/+FtsrjP6xrqlGCZkRl+/FrM9NIrRm+uojQo
        2oArVdycTpFibR+3q12pUl+lOOJPLSu8jxhbJik9XuwkWY9xOwQQBohqrhLUZrG1uHIs
        GiEaa1AtcWd760EXSbKATwBlaJbFvQiXvl3z0SnZU0xgnHD8uG7ETz90ks9HnvWUmJaf
        BW7riiOZLj1DoMSN3b19QjeS6ffctEObOnC79ZwZew6gyvb1lQfytgih1t+mrLfOJx3u
        Hdrw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBi5wp08moGlQ9pzBAS"
X-RZG-CLASS-ID: mo00
Received: from mbp-13-nikolaus.fritz.box
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id V07054w75Bn8bga
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 5 Aug 2020 13:49:08 +0200 (CEST)
Subject: Re: module_mipi_dsi_driver panel with omapdrm?
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200805112831.akufm5wxkwqehiff@earth.universe>
Date:   Wed, 5 Aug 2020 13:49:07 +0200
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Jyri Sarha <jsarha@ti.com>, kernel@pyra-handheld.com,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, David Shah <dave@ds0.me>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0DDD1D3E-4F63-44B4-91CA-1B5B853837BC@goldelico.com>
References: <20200706143613.GS37466@atomide.com> <E4616E3C-2519-4421-BC75-87A5CA2BB9EF@goldelico.com> <20200707180115.GB5849@atomide.com> <ECE29C41-DFE5-4A50-9206-6FB3183824C3@goldelico.com> <6E0A9415-9AB5-48D9-9E61-12D20655D04D@goldelico.com> <EE54FB82-C18E-4B81-AB38-E9453A32406B@goldelico.com> <20200724012411.GJ21353@pendragon.ideasonboard.com> <7023EB05-DC29-4D42-84C8-F0D14B50467D@goldelico.com> <20200801232259.hitcfosiq6f2i57y@earth.universe> <4F1BD997-B791-4570-92B9-552C9BFF1350@goldelico.com> <20200805112831.akufm5wxkwqehiff@earth.universe>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

> Am 05.08.2020 um 13:28 schrieb Sebastian Reichel =
<sebastian.reichel@collabora.com>:
>=20
> Hi,
>=20
> On Wed, Aug 05, 2020 at 11:19:20AM +0200, H. Nikolaus Schaller wrote:
>> What I do not yet understand is how Laurent's patch should be able
>> to break it.
>=20
> omapdrm will not probe successfully if any DT enabled component
> does not probe correctly. Since the patch you identified touched
> HDMI and VENC and you are probably using HDMI, I suggest looking
> there first.

Yes, that is a very good explanation.

Maybe there is a subtle change in how the HDMI connector has to be =
defined
which is missing in our (private) DTB. Maybe the OMAP5-uEVM DTS gives a =
hint.

A quick check shows last hdmi specific change for omap5-board-common or =
uevm
was in 2017 but I may have missed something.

There are 715a5a978733f0 and 671ab615bd507f which arrived in v5.7-rc1 as =
well
and are related to hdmi clocks. So this may be (or not) and influencing =
factor.

BR and thanks,
Nikolaus

