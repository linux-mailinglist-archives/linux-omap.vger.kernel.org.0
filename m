Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2C7260A59
	for <lists+linux-omap@lfdr.de>; Tue,  8 Sep 2020 07:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbgIHFv5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Sep 2020 01:51:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:46488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728531AbgIHFv5 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 8 Sep 2020 01:51:57 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B07162137B;
        Tue,  8 Sep 2020 05:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599544316;
        bh=JYmSZ1zIDlJnFgh7nnmcxj7L1Oxc7MUFrHLtYpDj18k=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=2mJLQgbX96ImFcWwVPTUEG6joshS0RTyxy/fkL02/Tp9DddemPu+JoQ8klv7T7PoT
         Ayji4RaOisRDKeeCGoambTvIkaU+MRk9agZpYS05oa2MC5mGdz0GXJ+8llerk7R13G
         5r3nD/TYioAehzm9nfZ3CLxffT9s2P9/QIbE8ZVw=
From:   Felipe Balbi <balbi@kernel.org>
To:     Amelie DELAUNAY <amelie.delaunay@st.com>,
        kernel test robot <lkp@intel.com>
Cc:     "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Re: [balbi-usb:testing/next 29/33] drivers/usb/dwc2/drd.c:83:37:
 error: 'struct dwc2_hsotg' has no member named 'test_mode'
In-Reply-To: <8ede307b-ccd1-21eb-fcab-826f8939c695@st.com>
References: <202009072101.xr4ImAoy%lkp@intel.com>
 <877dt5ofhf.fsf@kernel.org> <8ede307b-ccd1-21eb-fcab-826f8939c695@st.com>
Date:   Tue, 08 Sep 2020 08:51:38 +0300
Message-ID: <87y2lkn7dh.fsf@kernel.org>
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

Amelie DELAUNAY <amelie.delaunay@st.com> writes:
> Hi Felipe,
>
> On 9/7/20 3:58 PM, Felipe Balbi wrote:
>> kernel test robot <lkp@intel.com> writes:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git t=
esting/next
>>> head:   c9bb389c50ce07f0e4e105eb84f5541916bea8e8
>>> commit: 0e9bd6770c25a3dbd9cb1c9fc132b9e4a65da7cd [29/33] usb: dwc2: ove=
rride PHY input signals with usb role switch support
>>> config: arm64-randconfig-s031-20200907 (attached as .config)
>>> compiler: aarch64-linux-gcc (GCC) 9.3.0
>>> reproduce:
>>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/=
sbin/make.cross -O ~/bin/make.cross
>>>          chmod +x ~/bin/make.cross
>>>          # apt-get install sparse
>>>          # sparse version: v0.6.2-191-g10164920-dirty
>>>          git checkout 0e9bd6770c25a3dbd9cb1c9fc132b9e4a65da7cd
>>>          # save the attached .config to linux build tree
>>>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.c=
ross C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Darm64
>>>
>>> If you fix the issue, kindly add following tag as appropriate
>>> Reported-by: kernel test robot <lkp@intel.com>
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>     drivers/usb/dwc2/drd.c: In function 'dwc2_drd_role_sw_set':
>>>>> drivers/usb/dwc2/drd.c:83:37: error: 'struct dwc2_hsotg' has no membe=
r named 'test_mode'
>>>        83 |   if (role =3D=3D USB_ROLE_NONE && hsotg->test_mode) {
>>>           |                                     ^~
>>=20
>> patch dropped now. Amelie, can you send a fixed up version?
>>=20
>
> This issue is already fixed in v5:=20
> https://lore.kernel.org/patchwork/project/lkml/list/?series=3D455508
>
> Could you apply this version of the patchset ?

Will do, thanks

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9XG+oRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZcQA//ekr1wY3dOCS4fBdG7zUyvboUZL5M4TGr
QIw33irGOGLgYM4G8V0l6X/CA/+0ev/eK4k9t1q8NgRyEf4+SRc/ZqKnmko9ZxpK
56ZbG2CzXH53NKf8W5vsCtlpIzC4Y0Ov4MWl2FfRvCMapBZ1XSqVIOn9OI8QM3oz
TZCfwQ6X9qOOOqUdPQ4ogg09fYP83JWwrBIn0CPPM6vpGMFw5pv1OQv4MfkasnSY
I4le8ldxM7WcF8E9zSxLpcYWhsVMQKvewtjP72sxDaDox65BOJXMxUqogrIW8kQt
QNUwYeqM7agJgNmkJq9RDli5G49rWvwz6YFFZA9+gCpn5q9WbLJTcPgQMvN2ClIg
T5klR7vJ74LEK1klobUimQh7pk/lJrRrwKaJv4Ubt9FMKZdKSdmA1dhVaITWmRgL
lPZ7amv43Zc4vaFp6paXTkQNfPLthIeJzxomzJQc2LKrC2dhTwtWYeVm9mPlWZlq
PXJgdKUuECDzky2ynpd+Y/H1D0yOZbyH5jcOLVwXXqdfGgPWasSTmyQuFIBZkPKh
u6U+5DIQfaeQOUIxkLYXRd2Wf3kjnKiEdj0QxhMrBFStZ3+GxdKqy0y/+DCHx5Nw
CTRR3NTv1/KsD/mHplueGJ/QxREJRz+2EktOoAm1QNfOlOqbKELUGH9mNG0L7fIc
khD//89zvyM=
=Co9l
-----END PGP SIGNATURE-----
--=-=-=--
