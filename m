Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 864791C9E2B
	for <lists+linux-omap@lfdr.de>; Fri,  8 May 2020 00:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgEGWFW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 May 2020 18:05:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbgEGWFQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 May 2020 18:05:16 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 499B2C05BD0D
        for <linux-omap@vger.kernel.org>; Thu,  7 May 2020 15:05:16 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id w20so8069242ljj.0
        for <linux-omap@vger.kernel.org>; Thu, 07 May 2020 15:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nPPvWhYSDBZH/W9ZzOHKWz2UFG4yFEnZgxOOVnctufk=;
        b=kOcLODoKztByz0UBmzjXeqlmhusevIjl+c2HbLw3k5rPnNKk0UOKclN/cgZBe7f2BE
         KEqsud4Rf5RdhjLb6rTlhUM5ds3Xzk7FnKfAsKFuTOitseFo/B4W7DCsQHn6MIDZOtdM
         XpjV+SB82Z1h1ka5YTJZ7+6LcnBoSsPmQiuy7w3g1RSKnALtjhnggH/JTqnX8Bs27TGN
         ood1tyTML/spLGCWlwrocHp6j+kCbFQp1TxUGnP/5eZHSKTDWrjMVOJMV0mMmz5OWK8f
         xD7VPnGMNREiVpMw0n8DDrvcOIkqDBd0J/2WjILG0vEpGGnV+iSSQP4JFsm6KT8nJ2Q/
         xEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nPPvWhYSDBZH/W9ZzOHKWz2UFG4yFEnZgxOOVnctufk=;
        b=Via5/1e/6mDMXPG1T4x2f0A7tT0EW4fuTM+K4l7mk+dvTQ8YBPbyI2B4EZt3Op4Zdy
         CbeLOSLxWwUZRxHb3uYFUxcgvJt8t3/Ii2QBpgiPltMpGpTCW21QXr2S5wND6NDSN5Lw
         vFRM4scCxl/Cr0yTW9VPqj0Oltvf+8mBj2opiaIECUDM+lMHNsnBtEbyVHEmgbQ7k8jW
         GLBgWxXS/QKHdlUOY9KKEhLC4Og+NCamwa3IAW69IbdygBSgKW9nsTC9Srec0m28gK1j
         mHcq+rf0cj1vEIt05KUbKiFyH104k5ZGdCCVX/iNa3AqNYeTS4JgWRgLM74it2gGHhRZ
         xgHg==
X-Gm-Message-State: AGi0PuYepAMkKCm0Y/b1nOJSCUAPUZ+GTSaWYLrhPYiJAQ9WQx8uOoND
        JR7dBwK+A5+T01TB/3vZDNCXwtE2JGbrPzNpRkr41Q==
X-Google-Smtp-Source: APiQypKNdCY3OtiIkeJWX0PcE2nxNIMwzLCH+DsayspwmtDmIkVB8t6LffEY5ZO8WubCZPRo18ZG04Dd+peMVypsg08=
X-Received: by 2002:a2e:2e16:: with SMTP id u22mr10215821lju.243.1588889114309;
 Thu, 07 May 2020 15:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <1480357509-28074-1-git-send-email-johan@kernel.org>
 <1480357509-28074-12-git-send-email-johan@kernel.org> <CA+G9fYvBjUVkVhtRHVm6xXcKe2+tZN4rGdB9FzmpcfpaLhY1+g@mail.gmail.com>
 <20200507064412.GL2042@localhost> <20200507064734.GA798308@kroah.com> <20200507111312.GA1497799@kroah.com>
In-Reply-To: <20200507111312.GA1497799@kroah.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 8 May 2020 03:35:02 +0530
Message-ID: <CA+G9fYu2SrkEHyAzF57xJz5WjgHv361qdL2wPqON_pGS4Vtxmw@mail.gmail.com>
Subject: Re: [PATCH net 11/16] net: ethernet: marvell: mvneta: fix fixed-link
 phydev leaks
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Cc:     linux- stable <stable@vger.kernel.org>,
        Sasha Levin <sashal@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Fugang Duan <fugang.duan@nxp.com>,
        Pantelis Antoniou <pantelis.antoniou@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Lars Persson <lars.persson@axis.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>, Netdev <netdev@vger.kernel.org>,
        nios2-dev@lists.rocketboards.org,
        open list <linux-kernel@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 7 May 2020 at 16:43, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
<trim>
> > >
> > > Greg, 3f65047c853a ("of_mdio: add helper to deregister fixed-link
> > > PHYs") needs to be backported as well for these.
> > >
> > > Original series can be found here:
> > >
> > >     https://lkml.kernel.org/r/1480357509-28074-1-git-send-email-johan=
@kernel.org
> >
> > Ah, thanks for that, I thought I dropped all of the ones that caused
> > build errors, but missed the above one.  I'll go take the whole series
> > instead.
>
> This should now all be fixed up, thanks.

While building kernel Image for arm architecture on stable-rc 4.4 branch
the following build error found.

of_mdio: add helper to deregister fixed-link PHYs
commit 3f65047c853a2a5abcd8ac1984af3452b5df4ada upstream.

Add helper to deregister fixed-link PHYs registered using
of_phy_register_fixed_link().

Convert the two drivers that care to deregister their fixed-link PHYs to
use the new helper, but note that most drivers currently fail to do so.

Signed-off-by: Johan Hovold <johan@kernel.org>
Signed-off-by: David S. Miller <davem@davemloft.net>
[only take helper function for 4.4.y - gregkh]

 # make -sk KBUILD_BUILD_USER=3DTuxBuild -C/linux -j16 ARCH=3Darm
CROSS_COMPILE=3Darm-linux-gnueabihf- HOSTCC=3Dgcc CC=3D"sccache
arm-linux-gnueabihf-gcc" O=3Dbuild zImage
70 #
71 ../drivers/of/of_mdio.c: In function =E2=80=98of_phy_deregister_fixed_li=
nk=E2=80=99:
72 ../drivers/of/of_mdio.c:379:2: error: implicit declaration of
function =E2=80=98fixed_phy_unregister=E2=80=99; did you mean =E2=80=98fixe=
d_phy_register=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
73  379 | fixed_phy_unregister(phydev);
74  | ^~~~~~~~~~~~~~~~~~~~
75  | fixed_phy_register
76 ../drivers/of/of_mdio.c:381:22: error: =E2=80=98struct phy_device=E2=80=
=99 has no
member named =E2=80=98mdio=E2=80=99; did you mean =E2=80=98mdix=E2=80=99?
77  381 | put_device(&phydev->mdio.dev); /* of_phy_find_device() */
78  | ^~~~
79  | mdix

>
> greg k-h
