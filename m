Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 955481D2F24
	for <lists+linux-omap@lfdr.de>; Thu, 14 May 2020 14:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbgENMIH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 May 2020 08:08:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726160AbgENMIH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Thu, 14 May 2020 08:08:07 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B37E4C061A0C;
        Thu, 14 May 2020 05:08:06 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id o14so3235629ljp.4;
        Thu, 14 May 2020 05:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=HphVN9u3TV6BviQzt/umkwQtzpxi5UcU1Mf0gllp8Vk=;
        b=o3ZR5G2s4nxIjCabyx+JSkZjADm79QtGz023z4SJRJAUZKAJvF/MJX9dwBQqxSNd4G
         iC0tzqEGuZhqlRAzm6i1pjYAZvEib78WOJExF6bxZXc03nuHBiZrAlj2KCsh2uegun1d
         NH+he/6AIAJuUcVo3URuLJDjzM1CvZkdI1l4CADv4pyWTkCWIvI0weGTfXuDiToUJjNq
         YWH/T1SLG3iPCOl4Xv34lkoss0net2ae9qkEkT62C5kKOskbA4Vl4tP2L5LHmf7BQMal
         37azLP4OCOoIBIdwVTvbrfG9ECZMEcgVhu0efPuxcDQljefTb7P5lPO/HyVfCxHfDTXc
         HgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=HphVN9u3TV6BviQzt/umkwQtzpxi5UcU1Mf0gllp8Vk=;
        b=bWeoF6TOenZPkzOfTL+r2YHtRJcr1u8GncUq1E+cykQi5lSaImq/ViQTpU5cyo8RUV
         x2Vp1MWHRTxryeI6Z4TyHTYpzU30r993OwFnzLzRS6RkZgUrREJGmNNMdZxEGsqmf/vI
         MnvvzwTN0j3ulluABD+5tnSwaWDA+K3wFpdiN0/273jzbCdmyrmsWSsRPd6ItcC8Umd4
         RB9o24KiiM6E141yAEf5MDNDNH/6cErbzVlDlnzP/x4gDj8qXFdxyyObdmZrqDuwkCCO
         yKJwCvitRl5QvJoMeLASoK3Ce5O+POVMoQ5n9UHhQGpsYSivqS+J8+lR7u2E1l/2Gnh2
         9L2Q==
X-Gm-Message-State: AOAM531AGq2xJ+pTpvOwZxSEVQKWTMhwrIY7PPxK7xPPmpOKnvL1OtVv
        AKBFiXrl61tss6XWZnLwFo3+JR8heZFcDA==
X-Google-Smtp-Source: ABdhPJxtTXACcgqGhgi1Jn8nqYlYioaIyVOPdS6I10pw9pjBPcxH6bViadvuQnT/elD69/S0YpDGIw==
X-Received: by 2002:a2e:958b:: with SMTP id w11mr2501963ljh.262.1589458084964;
        Thu, 14 May 2020 05:08:04 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id x11sm1722890lfe.6.2020.05.14.05.08.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 May 2020 05:08:04 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     kbuild test robot <lkp@intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [balbi-usb:testing/next 78/89] drivers/usb/dwc3/gadget.c:2842:7: error: implicit declaration of function 'DWC3_VER_IS_WITHIN'
In-Reply-To: <202005141935.h1fCzDvE%lkp@intel.com>
References: <202005141935.h1fCzDvE%lkp@intel.com>
Date:   Thu, 14 May 2020 15:08:00 +0300
Message-ID: <871rnm4t3z.fsf@kernel.org>
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

kbuild test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tes=
ting/next
> head:   405a813dbc9e261f9a025386c04f0d133996995e
> commit: 1a31a103ce6e5a49c4c04e0709a0da431bcbadd4 [78/89] usb: dwc3: gadge=
t: Use SET_EP_PRIME for NoStream
> config: parisc-allyesconfig (attached as .config)
> compiler: hppa-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 1a31a103ce6e5a49c4c04e0709a0da431bcbadd4
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross=
 ARCH=3Dparisc=20
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> Note: the balbi-usb/testing/next HEAD 405a813dbc9e261f9a025386c04f0d13399=
6995e builds fine.
>       It only hurts bisectibility.
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):

Thanks, I've reordered the commits to avoid this problem.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl69NKAACgkQzL64meEa
mQbmWhAAtQj2BGqs+9OA/oi+YI3arHjJfVjnbAiP7QAnlwvSVbDHRFkRjXgOWOZL
GcgQhFWl1AvVu2sslFP2nRgzE8l+phHmASr/yzclC69Xu7gDEeTPUZ/nvuIB46CL
FinMCOLmI1PeZpaZRhO63ynkzO3PCjGa5z4xWytc81PIZpe+kWeKLwpnadA+k0Yq
p5AIKFsYmdRB+Oxh3bqV75xn2aeKJOQprhpop5doqsxQCyp4LH748Gn+sv1u3iPp
M/6/p7sM1IWdzKyvHZSQRx/1veNhioY2418mRat/kbmu31alEoc16toDm3K6dJmE
hUN/ZepeSbyrMlkSbixUsP3t97vdMk9qVuQJqm47s8EgXcexMj3SITrrYSygtl/l
TANMTD2lKiedFzOdsBJn5yxH3kz8w71ydLuIR4ab55TTGs1kCs0sbodJXU+rqbEH
fU+15kxlBGAYdyjVLe2OIZbCY72eItrcNPuwIRSVKId7JCNnbkQaOiklTvQ5TlKw
zYVHjCMSQopqSJlDbqalr1vn8vkhsGUfM5t2H10+HWuJwSF8fzcDdjP7BJpAxOzG
kbDXWXf/ihw9/tpZwioHxVboPbO4YRUUFDSnRmgN37Kkr3SmTNOW4CzNPGQvtm17
QWp83SIpXuUxVIUVeZgLWCTBmXYq90IlNQnynTV0br52vk9Oed0=
=qM5W
-----END PGP SIGNATURE-----
--=-=-=--
