Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 391E61AD0C8
	for <lists+linux-omap@lfdr.de>; Thu, 16 Apr 2020 22:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbgDPUFa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Apr 2020 16:05:30 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:52006 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731039AbgDPUFE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 16 Apr 2020 16:05:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=WPcxZfskR9kje2uaZAuiIJWgpilMt31fAbM7WDX99nk=; b=JA1Fobiyan2L1x5gFZ35udquH4
        FuuotpbvLruO73P+vRN3KxQ6gFAFhtmV8yMk1csiDVtkAG51rJEFRkpZmKI24Ijuch/ILS2ZmMQuX
        h6pvs9U9e25QZwS895ejKjMikVaeQnOlWMSQSlpavlifAgV/UqwSzGmCW+95Q1nWiZv4=;
Received: from p200300ccff0965001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff09:6500:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1jPAkk-0002Em-IT; Thu, 16 Apr 2020 22:04:51 +0200
Date:   Thu, 16 Apr 2020 22:04:49 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Tony Lindgren <tony@atomide.com>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>, Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCHv3] w1: omap-hdq: Simplify driver with PM runtime
 autosuspend
Message-ID: <20200416220449.17068b21@aktux>
In-Reply-To: <20200416184638.GI37466@atomide.com>
References: <20191217004048.46298-1-tony@atomide.com>
        <7B8C7DD9-095B-48FC-9642-695D07B79E97@goldelico.com>
        <20200416184638.GI37466@atomide.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Score: -1.0 (-)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 16 Apr 2020 11:46:38 -0700
Tony Lindgren <tony@atomide.com> wrote:

> * H. Nikolaus Schaller <hns@goldelico.com> [200416 15:04]:
> > Hi Tony,
> > it looks as if something with this patch is broken on GTA04. For v5.6 a=
nd v5.7-rc1.
> >=20
> > HDQ battery access times out after ca. 15 seconds and I get temperature=
 of -273.1=C2=B0C...
> >=20
> > Reverting this patch and everything is ok again. =20
>=20
> Hmm OK interesting.
>=20
> > What is "ti,mode" about? Do we have that (indirectly) in gta04.dtsi?
> > Or does this patch need some CONFIGs we do not happen to have? =20
>=20
> Sounds like you have things working though so there should be no
> need for having ti,mode =3D "1w" in the dts.
>=20
> > > 	pm_runtime_enable(&pdev->dev);
> > > +	pm_runtime_use_autosuspend(&pdev->dev);
> > > +	pm_runtime_set_autosuspend_delay(&pdev->dev, 300); =20
>=20
> Care to check if changing pm_runtime_set_autosuspend_delay value
> to -1 in probe makes the issue go away? Or change it manually
> to -1 via sysfs.
>=20
> If that helps, likely we have a missing pm_runtime_get_sync()
> somewhere in the driver.
>=20
I have not tested yet with v5.7-rc1 (it is compiling right now),
but I have not seen any problems with init=3D/bin/bash on v5.6
and only a minimal set of modules loaded on gta04. I have seen that
42 for IDLEST

So might be something a bit more weird.

Regards,
Andreas
