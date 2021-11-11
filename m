Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08A2A44D790
	for <lists+linux-omap@lfdr.de>; Thu, 11 Nov 2021 14:50:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233381AbhKKNx1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 11 Nov 2021 08:53:27 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:35136 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233287AbhKKNx0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 11 Nov 2021 08:53:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636638623;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=h3YpVYm0Yx05FKg1KHDAwPt+7+LoLY6Hpn054cHH5AM=;
    b=PZXQl4G0sRAZxOkOcfcaceMAP+3VJwVh6jp/4cFkAqQplX5KrewZWDlkoZSZ2Z3mKm
    kPOQtXFlASXuAjI/AG/LJ65JFbzcaAfmZmsxnh0lA1cU2Poit9GKB9KItaEwV3VPWbdy
    tKSH9Eib/ZE26ZFXy9d26pq22TQKPQtSpE4O4TZxEB/qyxhZ+saJLzOieqsf34Jtippb
    jLVxvc9mHaMHOJQXcz4PZvhiSZv1FX8rqY9UMqnu3P0EIc+mZBd4zJYuGraU9YZg2l8I
    u/sxCn4iZ6uOklp8T0BrtIcDLgZSh58IGOYCfNmkzGX4bP/awwkga0DFK5ILJStqQMmY
    Irbw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw43roAE="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.34.5 DYNA|AUTH)
    with ESMTPSA id Y02aa4xABDoM9LQ
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Thu, 11 Nov 2021 14:50:22 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v2 0/6] mmc: core: extend mmc_fixup_device and transplant
 ti,wl1251 quirks from to be retired omap_hsmmc
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAPDyKFruL-b7VgkuTL+TH5apY_bgjUTBwinYeqM0Xk4cKWP0rg@mail.gmail.com>
Date:   Thu, 11 Nov 2021 14:50:21 +0100
Cc:     =?utf-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <Jerome.Pouiller@silabs.com>,
        Avri Altman <avri.altman@wdc.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Bean Huo <beanhuo@micron.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Yang Li <abaci-bugfix@linux.alibaba.com>, notasas@gmail.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        linux-omap@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <59B1A46D-58CA-414A-B640-FFCD42241C9A@goldelico.com>
References: <cover.1636564631.git.hns@goldelico.com>
 <CAPDyKFruL-b7VgkuTL+TH5apY_bgjUTBwinYeqM0Xk4cKWP0rg@mail.gmail.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



> Am 11.11.2021 um 13:10 schrieb Ulf Hansson <ulf.hansson@linaro.org>:
>=20
> On Wed, 10 Nov 2021 at 18:17, H. Nikolaus Schaller <hns@goldelico.com> =
wrote:
>>=20
>>=20
>> drivers/mmc/core/card.h       | 36 ++++++++++++++++++++
>> drivers/mmc/core/quirks.h     | 64 =
+++++++++++++++++++++++++----------
>> drivers/mmc/core/sdio.c       |  5 ++-
>> drivers/mmc/host/omap_hsmmc.c | 36 --------------------
>> 4 files changed, 87 insertions(+), 54 deletions(-)
>>=20
>=20
> This looks good to me, I will queue it up as soon as rc1 is out, =
thanks!

Thanks!

Best regards,
Nikolaus

