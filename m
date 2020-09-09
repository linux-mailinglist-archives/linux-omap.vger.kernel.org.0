Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 220A72626D1
	for <lists+linux-omap@lfdr.de>; Wed,  9 Sep 2020 07:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725807AbgIIFnI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Sep 2020 01:43:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:57214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725772AbgIIFnI (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 9 Sep 2020 01:43:08 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2C8BB21582;
        Wed,  9 Sep 2020 05:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599630188;
        bh=iXTO+A9PjdGm/jgigERlLbE44/kLcZMsRTLmZAzQigs=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Z0YICAnc0x3EqMg1qsEH6VCLUn0VLs12mGrREwonX6FyWwXKjoQ39rwQPhBYztv9W
         Fq8ec90eKeEWBuRBxOk5fhDJiZHsOKxo3CnCnt5hv/eIAxYpfFmmvvpUCrNsIYjZQ+
         fQeAF62LiJwD3ISXyHsEytykFHnEnlkv0CBkojuU=
From:   Felipe Balbi <balbi@kernel.org>
To:     kernel test robot <lkp@intel.com>,
        Amelie Delaunay <amelie.delaunay@st.com>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [balbi-usb:testing/next 32/38] drd.c:undefined reference to
 `usb_role_switch_get_drvdata'
In-Reply-To: <202009090044.0oZdDUmk%lkp@intel.com>
References: <202009090044.0oZdDUmk%lkp@intel.com>
Date:   Wed, 09 Sep 2020 08:42:56 +0300
Message-ID: <87eenbld3z.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

kernel test robot <lkp@intel.com> writes:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tes=
ting/next
> head:   3c9722514c3fb74bbe0af87c20bc6b4c47121287
> commit: a0f0bc95705446b8b1476338056bf869271ba36a [32/38] usb: dwc2: overr=
ide PHY input signals with usb role switch support
> config: arc-randconfig-r016-20200908 (attached as .config)
> compiler: arceb-elf-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout a0f0bc95705446b8b1476338056bf869271ba36a
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Darc=20
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    arceb-elf-ld: lib/stackdepot.o: in function `filter_irq_stacks':
>    stackdepot.c:(.text+0x5a): undefined reference to `__irqentry_text_sta=
rt'
>    arceb-elf-ld: stackdepot.c:(.text+0x5a): undefined reference to `__irq=
entry_text_start'
>    arceb-elf-ld: stackdepot.c:(.text+0x62): undefined reference to `__irq=
entry_text_end'
>    arceb-elf-ld: stackdepot.c:(.text+0x62): undefined reference to `__irq=
entry_text_end'
>    arceb-elf-ld: stackdepot.c:(.text+0x6a): undefined reference to `__sof=
tirqentry_text_start'
>    arceb-elf-ld: stackdepot.c:(.text+0x6a): undefined reference to `__sof=
tirqentry_text_start'
>    arceb-elf-ld: stackdepot.c:(.text+0x72): undefined reference to `__sof=
tirqentry_text_end'
>    arceb-elf-ld: stackdepot.c:(.text+0x72): undefined reference to `__sof=
tirqentry_text_end'
>    arceb-elf-ld: drivers/usb/dwc2/drd.o: in function `dwc2_drd_role_sw_se=
t':
>>> drd.c:(.text+0x82): undefined reference to `usb_role_switch_get_drvdata'
>>> arceb-elf-ld: drd.c:(.text+0x82): undefined reference to `usb_role_swit=
ch_get_drvdata'
>    arceb-elf-ld: drivers/usb/dwc2/drd.o: in function `dwc2_drd_init':
>>> drd.c:(.text+0x1c0): undefined reference to `usb_role_switch_register'
>>> arceb-elf-ld: drd.c:(.text+0x1c0): undefined reference to `usb_role_swi=
tch_register'
>    arceb-elf-ld: drivers/usb/dwc2/drd.o: in function `dwc2_drd_exit':
>>> drd.c:(.text+0x2c4): undefined reference to `usb_role_switch_unregister'
>>> arceb-elf-ld: drd.c:(.text+0x2c4): undefined reference to `usb_role_swi=
tch_unregister'

Amelie? Have you seen this? Is it ARC-specific?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9Ya2ARHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQbUORAAks35Ew10yGI3AgEdGslrg/Tt8SDRzEhz
B3Ytpbl3OS4uIE/t0VG6OjN4wHUYGmK7lmUcvBfKs7rfF8yV3yz6aG0AhctRYG9H
fDn8YaUJTlDF42i4EszJQbll+kOflZYbOx8LNXxKaY6tQqh6COHMbh5IttQNZysA
GnS3c5CAyaU9Q5N+4gtFWszjH13vifrxwDCrCOkZb44KtAFoxgWL6aFO8juUXdHP
SWypfNcV9Rl6kqw2RT7SLuGTJ+tszphzwHTs8klwFjElVJWTpR1UOOaUT0JmOdzw
GfpdHVoXpYQyJleaH1jY0nSkxSG/Jx8yypPl9ZBWG3YtmA6QcZAgQm9lN8lB2krG
osrN5O5QBPe8FPpOYPLHacnbpCFEVwW2MA6PqMtW181NVZUpa5goY+p8c4ekfWsq
ukn2cHdODK38KF5Osg96KNzh8Yc3qJ1sTeD2/yvN81bDQsdqNzoQhZOFE93mNZNO
6VZFQXDdDZZUfwl0C0IJIQQBhxYfiJCYB+pPjabSGIH6nQre1RjePvVbx85iEnNe
wr5EJvpEXHNcFEBBd0l7vQtP47ONaVsckkUT8w1yVH0DpcoqduHfrJSSay7ux6x9
MZQU+H2dnszuJlte93/5WMaWOQmzX6JznK0YXEdtOvyBss7R0GoAPNQe+AjWeUPx
xxMwLOs7VC8=
=gaVA
-----END PGP SIGNATURE-----
--=-=-=--
