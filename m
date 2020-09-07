Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7517225FBC8
	for <lists+linux-omap@lfdr.de>; Mon,  7 Sep 2020 16:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729713AbgIGOGG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Sep 2020 10:06:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:45740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729762AbgIGOFo (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 7 Sep 2020 10:05:44 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BA01521473;
        Mon,  7 Sep 2020 13:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599487139;
        bh=at+9rNRCYJkEIFh6GvwBTj8WRxmaKB3Ezs9RAcM85fs=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=TB3IBsjvh5rp5//bXTUwrlWTR/Kd2iGE4QEcWK7s/sM1TTZs75SEKmJGirz4pmVeB
         Wc39DPBVRseLsvmlDTX0LaozkEHYUgCytS/qNlj56blbSb/WDYveRCollQhdul/sUM
         6c7lyC9e57RVTBeW41RTb+gPxupvM4twc8mEOa7I=
From:   Felipe Balbi <balbi@kernel.org>
To:     kernel test robot <lkp@intel.com>,
        Amelie Delaunay <amelie.delaunay@st.com>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [balbi-usb:testing/next 29/33] drivers/usb/dwc2/drd.c:83:37:
 error: 'struct dwc2_hsotg' has no member named 'test_mode'
In-Reply-To: <202009072101.xr4ImAoy%lkp@intel.com>
References: <202009072101.xr4ImAoy%lkp@intel.com>
Date:   Mon, 07 Sep 2020 16:58:52 +0300
Message-ID: <877dt5ofhf.fsf@kernel.org>
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

kernel test robot <lkp@intel.com> writes:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tes=
ting/next
> head:   c9bb389c50ce07f0e4e105eb84f5541916bea8e8
> commit: 0e9bd6770c25a3dbd9cb1c9fc132b9e4a65da7cd [29/33] usb: dwc2: overr=
ide PHY input signals with usb role switch support
> config: arm64-randconfig-s031-20200907 (attached as .config)
> compiler: aarch64-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.2-191-g10164920-dirty
>         git checkout 0e9bd6770c25a3dbd9cb1c9fc132b9e4a65da7cd
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Darm64=20
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    drivers/usb/dwc2/drd.c: In function 'dwc2_drd_role_sw_set':
>>> drivers/usb/dwc2/drd.c:83:37: error: 'struct dwc2_hsotg' has no member =
named 'test_mode'
>       83 |   if (role =3D=3D USB_ROLE_NONE && hsotg->test_mode) {
>          |                                     ^~

patch dropped now. Amelie, can you send a fixed up version?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9WPJwRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZ5ahAAk+a7/q+E4f0pg5lKW17KBD62EvoHQVgB
1h5B6HsQNrC5hBs99jDRDwHNfA29kooINvrm07YhK+BasL7eBGTi1IuXbDdgU2eR
LjTe7QCGRE+nwbKuF/kUtp2nCLJWWWaU81ynS7HBEYCBz+vpoIXYbu2GSpglGW4t
dPoIxBNnO7LmonVJKmFqRD+drt6f+9P8EDKH8xR1xnYmhm8ECyFyMzqyYghUF866
3BOojlqu+oC/YWoAgAIif/4EmLpSRyxqP+6BwKrR4OTB0yYAo/CXyPu3OJyp0OV7
ozGH7OXmQptzbuqvjkggmX3wv+HEatP4e9t3nnbdu0dTVNEcCThw0xnUEvD2sEXN
NfsquHSkupx0EyiAFLBN9SYYvCzCPtQnEtO6bi4eFc2xMDl9xfPU1MlQ9+no3WW1
jblY+3e3mHouuofLE+O3dDU3HTsvOCOQoNMu58fSDrBeDB8zWKJGJC8SIE3dsK5z
Us/+U1gv8WJlSXZIK3cW0lN9TSRgTTzYeI43XzDY5vwq5MMPkzXRLIwgZ+l39BYz
wMg5oQCzPm+So+u8ajD7dcfE8/xUmdC7foYqwtEXlp4mTYs5SfT/OE8zF3w1mr7Y
Fz3y1bhyO4OaDs9FHY2BgDG2F3IdNVo6o8Q8fdvCwN1jACyTttgu5X2bneYjFElz
mNupexbGHbY=
=gnGQ
-----END PGP SIGNATURE-----
--=-=-=--
