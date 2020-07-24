Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8A8222C02A
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 09:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbgGXHvz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 03:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbgGXHvz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Jul 2020 03:51:55 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFF33C0619D3;
        Fri, 24 Jul 2020 00:51:54 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id q4so9067573lji.2;
        Fri, 24 Jul 2020 00:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=7xHsDIbPEWyTXMIhiJIbbGWZOWOwEadlbVNuSeDqT58=;
        b=UefAGxSzVvcQrMqw7JsZpBhJqtcsDHapnhWVNEftPEqP5UPXQ18vnlyLFyBaIrenvW
         i6hWJK3mNrZwoaNqrqWGnuHyU1TCuvgMEDgKMbggnZH1hTltVhzI+tJGYy52WxCtaYqr
         vdhz6P0STkYV1Gepr+FERUgor/ZvvMDCUs7kxuJKtkCITQIWDFSrXW5AKVd4+j3EA/Dy
         GURZNvdQRooh4/MM+xlyzOpROuvYArXx3c6mX+CfTwyy9lXUFmohWrzf/seZvd7opgTE
         QcPlYl5+vDEyXst/zuAo1guKPUggdrXNaaM2SNvPDJ3TBo1GnrTgTX/hmHNVJFq0xX71
         nHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=7xHsDIbPEWyTXMIhiJIbbGWZOWOwEadlbVNuSeDqT58=;
        b=BgboqLdvMULjtNQB1er2KmfkFv4oxaDoR6sSCPFH23WfnAloY8GFd+rp9YWzzfjjy9
         pGn02pEykeSXkMkcWive9oC5ztM5ovPEiOX+I+jOUxfrFDowA5IrcBhqTPkIifD0YDXS
         3rXfLIe0xJxmfjP8XCZNop7lUp9FbpM15UHOIOD+4hhXCC+M/6Mzq0bJMn3gXIc124Md
         DDjU5PfEOK4KZ6tCdOkJMCS4R5csZAjgJ1WH4SrC8gA3Agry6rSUfszsuQNPZQjT/Rxv
         ISgDMmHTZbP/3fbWe+Zp5hLF9/ZrX9vY4CETrhQ7fd6Cn8mkDSF/cNPmfaStSk5Vygve
         bF3g==
X-Gm-Message-State: AOAM531MQz+GBph/aRlz2zIboI7D7LjkrWl5O5RSoqWnpGzYqE8FfF9n
        Srt7WNFmOUjlzpB4Zygx4PPsm7o/csRv2g==
X-Google-Smtp-Source: ABdhPJwDksuWJ4I428kZ+PeDJ/DiIx8CWOYUN20JuMGvHI+quZ2MsKaGwhMOYMe8qvm8M+1rfIQWPg==
X-Received: by 2002:a2e:9611:: with SMTP id v17mr3948747ljh.110.1595577112901;
        Fri, 24 Jul 2020 00:51:52 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id e69sm48528lfd.21.2020.07.24.00.51.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jul 2020 00:51:51 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     kernel test robot <lkp@intel.com>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        Minas Harutyunyan <hminas@synopsys.com>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [balbi-usb:testing/next 1/39] drivers/usb/dwc2/drd.c:80:36: error: 'struct dwc2_hsotg' has no member named 'test_mode'
In-Reply-To: <202007241311.MMbsxewn%lkp@intel.com>
References: <202007241311.MMbsxewn%lkp@intel.com>
Date:   Fri, 24 Jul 2020 10:51:47 +0300
Message-ID: <875zadnyek.fsf@kernel.org>
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
> head:   74dbc49b08d37ed9d4fd440d8896626733f80564
> commit: bc0f0d4a5853e32ba97a0318f774570428fc5634 [1/39] usb: dwc2: overri=
de PHY input signals with usb role switch support
> config: nios2-randconfig-r002-20200724 (attached as .config)
> compiler: nios2-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout bc0f0d4a5853e32ba97a0318f774570428fc5634
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dnios2=20
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    drivers/usb/dwc2/drd.c: In function 'dwc2_drd_role_sw_set':
>>> drivers/usb/dwc2/drd.c:80:36: error: 'struct dwc2_hsotg' has no member =
named 'test_mode'
>       80 |  if (role =3D=3D USB_ROLE_NONE && hsotg->test_mode) {

weird, this compiled just fine here with allmodconfig on AArch64.

/me goes check. Oh, I see what's happening, hsotg->test_mode is only
compiled on Peripheral-only and Dual-role builds. I'm assuming this was
a Host-only build. Then the problem triggers because drd.o is
unconditionally added to the binary.

dwc2-y					:=3D core.o core_intr.o platform.o drd.o

Is this an old problem or was it triggered by $subject?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8akxMACgkQzL64meEa
mQYLERAA4NGQKN1b//bX2GFWUNcsbRLDKdPh3Mm7RbamvsvoUnoiu5L+jpGLYpM3
guveY/9YviP1J/0Twv/vsRROird9lI+sgEy19jUkQynsABb+baXBa4vvn0aORz+p
w39zdlIktqzLMmdkT4JQb9A1IFzhtePilebQI/tcuFKCthlZkm+XQnMcQil6NAVy
3+JVCQ+7oap9oiZ2t4uljxVI0DwhBDC/emICwNi8mVIVwKxewjxxESnqe4N8ZCtu
BXMkxxZlMo0tpPWTICrTgWrr4DR0B9WUDd5f0X6lP9ZBiiyb5bSz/vkVUMGPfNdc
fy9I8QmiEU4YPR1sw01ciD9iRKUVh8V4kcZn6iv84VohdhSqWNulxY96Ibd+slUR
C9ZLh9GSq5b1vDpfN3rhOgmz8yFMy0Vswk7O2jd/ZpPntQGbDCBFvcKKgPGS0B3V
3RJGS/yKVPpQg4QhpQh7zNk9LqBtp8FmtGU9gwd3Xo4tXQWYyxHrew3gCdGaVw1N
969ezc+ipEV+WhOWYRh4NU/ETVax0HVOg3okfdu9TyDRKbDyTuxlTclbePr4ZoTv
pVxO/cdTDQQag2XxGBEcWq3xAS3C+igT9G9SKI+Tnnywf9E3b6/FRCqsms9l8jek
I1Z3dNTUlTVYGAp/pZscdENdRrNvgXa1GzzJUfQQTnQhNEnM44g=
=48da
-----END PGP SIGNATURE-----
--=-=-=--
